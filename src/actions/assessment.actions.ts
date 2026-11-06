"use server";

import { createClient } from "@/lib/supabase/server";
import { createAdminClient } from "@/lib/supabase/admin";
import { SubmitAssessmentPayload } from "@/types/assessment.types";
import { AssessmentType } from "@/types/database.types";
import { revalidatePath } from "next/cache";

function normalizeText(text: string): string {
  return text
    .trim()
    .toLowerCase()
    .normalize("NFD")
    .replace(/[\u0300-\u036f]/g, "") // remover tildes para comparación flexible
    .replace(/[.,;:¿?¡!]/g, ""); // remover puntuación
}

interface AssessmentRecord {
  id: string;
  title: string;
  type: AssessmentType;
  passing_score_percentage: number;
  block_id: string | null;
  chapter_id: string | null;
  book_id: string | null;
}

export async function submitAssessmentAction(payload: SubmitAssessmentPayload): Promise<{
  success: boolean;
  attemptId?: string;
  error?: string;
}> {
  const supabase = await createClient();
  const {
    data: { user },
  } = await supabase.auth.getUser();

  if (!user) {
    return { success: false, error: "Debes iniciar sesión para realizar la evaluación." };
  }

  const adminSupabase = createAdminClient();

  // 1. Obtener la evaluación con sus reglas
  const { data: assessment } = await adminSupabase
    .from("assessments")
    .select("id, title, type, passing_score_percentage, block_id, chapter_id, book_id")
    .eq("id", payload.assessmentId)
    .single<AssessmentRecord>();

  if (!assessment) {
    return { success: false, error: "Evaluación no encontrada." };
  }

  // 2. Obtener todas las preguntas y opciones correctas de esta evaluación
  const questionIds = payload.answers.map((a) => a.questionId);

  const { data: questions } = await adminSupabase
    .from("questions")
    .select(`
      id,
      question_type,
      prompt,
      verse_reference,
      explanation,
      points,
      options:question_options(
        id,
        option_text,
        is_correct,
        order_index,
        correct_order_position
      )
    `)
    .in("id", questionIds)
    .returns<any[]>();

  if (!questions || questions.length === 0) {
    return { success: false, error: "No se pudieron cargar las preguntas para evaluar." };
  }

  const questionMap = new Map<string, any>();
  questions.forEach((q) => questionMap.set(q.id, q));

  let totalScore = 0;
  let maxScore = 0;

  const answersToInsert: Array<{
    question_id: string;
    selected_option_id: string | null;
    text_response: string | null;
    order_response: any;
    is_correct: boolean;
    points_awarded: number;
    feedback: string | null;
  }> = [];

  // 3. Evaluar cada respuesta del participante de forma estricta en el servidor
  for (const submitted of payload.answers) {
    const question = questionMap.get(submitted.questionId);
    if (!question) continue;

    const points = Number(question.points) || 10;
    maxScore += points;

    let isCorrect = false;
    const options = question.options || [];

    if (
      question.question_type === "multiple_choice" ||
      question.question_type === "reference_identification" ||
      question.question_type === "true_false"
    ) {
      const correctOption = options.find((opt: any) => opt.is_correct);
      if (correctOption && submitted.selectedOptionId === correctOption.id) {
        isCorrect = true;
      }
    } else if (question.question_type === "fill_blank") {
      const correctOption = options.find((opt: any) => opt.is_correct);
      if (correctOption && submitted.textResponse) {
        const normalizedUser = normalizeText(submitted.textResponse);
        const normalizedCorrect = normalizeText(correctOption.option_text);
        if (normalizedUser === normalizedCorrect) {
          isCorrect = true;
        }
      }
    } else if (question.question_type === "order_events") {
      if (Array.isArray(submitted.orderResponse) && submitted.orderResponse.length === options.length) {
        const sortedOptions = [...options].sort(
          (a: any, b: any) => (a.correct_order_position || 0) - (b.correct_order_position || 0)
        );
        const correctIds = sortedOptions.map((o: any) => o.id);
        const userIds = submitted.orderResponse;

        isCorrect = correctIds.every((id: string, index: number) => id === userIds[index]);
      }
    }

    const pointsAwarded = isCorrect ? points : 0;
    totalScore += pointsAwarded;

    answersToInsert.push({
      question_id: question.id,
      selected_option_id: submitted.selectedOptionId || null,
      text_response: submitted.textResponse || null,
      order_response: submitted.orderResponse || null,
      is_correct: isCorrect,
      points_awarded: pointsAwarded,
      feedback: question.explanation,
    });
  }

  const percentage = maxScore > 0 ? Math.round((totalScore / maxScore) * 100) : 0;
  const passed = percentage >= assessment.passing_score_percentage;

  // 4. Guardar el intento histórico en assessment_attempts
  const { data: attempt, error: attemptError } = await adminSupabase
    .from("assessment_attempts")
    .insert({
      user_id: user.id,
      assessment_id: assessment.id,
      score: totalScore,
      max_score: maxScore,
      percentage: percentage,
      passed: passed,
      status: "completed",
      completed_at: new Date().toISOString(),
    } as any)
    .select("id")
    .single<{ id: string }>();

  if (attemptError || !attempt) {
    return { success: false, error: "Error al guardar el intento de la evaluación." };
  }

  // 5. Guardar cada respuesta evaluada y actualizar el progreso del usuario simultáneamente en paralelo
  const formattedAnswers = answersToInsert.map((ans) => ({
    ...ans,
    attempt_id: attempt.id,
  }));

  const saveAnswersPromise = adminSupabase
    .from("assessment_answers")
    .insert(formattedAnswers as any);

  const updateProgressPromise = (async () => {
    if (assessment.type === "block_quiz" && assessment.block_id) {
      const { data: existingProg } = await adminSupabase
        .from("user_block_progress")
        .select("best_score, attempts_count, quiz_passed")
        .eq("user_id", user.id)
        .eq("block_id", assessment.block_id)
        .maybeSingle<{ best_score: number; attempts_count: number; quiz_passed: boolean }>();

      const attemptsCount = (existingProg?.attempts_count || 0) + 1;
      const bestScore = Math.max(existingProg?.best_score || 0, percentage);
      const quizPassed = (existingProg?.quiz_passed || false) || passed;

      await adminSupabase.from("user_block_progress").upsert(
        {
          user_id: user.id,
          block_id: assessment.block_id,
          reading_completed: true,
          quiz_passed: quizPassed,
          best_score: bestScore,
          attempts_count: attemptsCount,
          last_studied_at: new Date().toISOString(),
        } as any,
        { onConflict: "user_id, block_id" }
      );

      if (quizPassed) {
        const { data: block } = await adminSupabase
          .from("study_blocks")
          .select("chapter_id")
          .eq("id", assessment.block_id)
          .single<{ chapter_id: string }>();

        if (block?.chapter_id) {
          await (adminSupabase.rpc as any)("check_and_unlock_chapter_exam", {
            p_user_id: user.id,
            p_chapter_id: block.chapter_id,
          });
        }
      }
    } else if (assessment.type === "chapter_exam" && assessment.chapter_id) {
      const { data: existingChapProg } = await adminSupabase
        .from("user_chapter_progress")
        .select("best_score, exam_passed")
        .eq("user_id", user.id)
        .eq("chapter_id", assessment.chapter_id)
        .maybeSingle<{ best_score: number; exam_passed: boolean }>();

      const bestScore = Math.max(existingChapProg?.best_score || 0, percentage);
      const examPassed = (existingChapProg?.exam_passed || false) || passed;

      await adminSupabase.from("user_chapter_progress").upsert(
        {
          user_id: user.id,
          chapter_id: assessment.chapter_id,
          all_blocks_completed: true,
          exam_unlocked: true,
          exam_passed: examPassed,
          best_score: bestScore,
          completed_at: examPassed ? new Date().toISOString() : null,
        } as any,
        { onConflict: "user_id, chapter_id" }
      );

      if (examPassed) {
        const { data: chap } = await adminSupabase
          .from("chapters")
          .select("book_id")
          .eq("id", assessment.chapter_id)
          .single<{ book_id: string }>();

        if (chap?.book_id) {
          await (adminSupabase.rpc as any)("check_and_unlock_book_final", {
            p_user_id: user.id,
            p_book_id: chap.book_id,
          });
        }
      }
    } else if (assessment.type === "book_final" && assessment.book_id) {
      const { data: existingBookProg } = await adminSupabase
        .from("user_book_progress")
        .select("final_exam_passed, overall_percentage")
        .eq("user_id", user.id)
        .eq("book_id", assessment.book_id)
        .maybeSingle<{ final_exam_passed: boolean; overall_percentage: number }>();

      await adminSupabase.from("user_book_progress").upsert(
        {
          user_id: user.id,
          book_id: assessment.book_id,
          final_exam_unlocked: true,
          final_exam_passed: (existingBookProg?.final_exam_passed || false) || passed,
          overall_percentage: Math.max(existingBookProg?.overall_percentage || 0, percentage),
          updated_at: new Date().toISOString(),
        } as any,
        { onConflict: "user_id, book_id" }
      );
    }
  })();

  await Promise.all([saveAnswersPromise, updateProgressPromise]);

  revalidatePath("/dashboard");
  revalidatePath("/libros/efesios");
  revalidatePath("/historial");

  return {
    success: true,
    attemptId: attempt.id,
  };
}
