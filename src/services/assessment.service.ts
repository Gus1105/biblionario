import { createClient } from "@/lib/supabase/server";
import { createAdminClient } from "@/lib/supabase/admin";
import {
  AssessmentWithQuestions,
  ClientQuestion,
  AssessmentResultSummary,
} from "@/types/assessment.types";
import { AssessmentType } from "@/types/database.types";

interface AssessmentMetaRecord {
  id: string;
  title: string;
  type: AssessmentType;
  passing_score_percentage: number;
  questions_count: number;
  time_limit_minutes: number | null;
  block_id: string | null;
  chapter_id: string | null;
  book_id: string | null;
}

function shuffleArray<T>(array: T[]): T[] {
  const result = [...array];
  for (let i = result.length - 1; i > 0; i--) {
    const j = Math.floor(Math.random() * (i + 1));
    [result[i], result[j]] = [result[j], result[i]];
  }
  return result;
}

function randomizeOptionsForStudent(
  options: Array<{ id: string; option_text: string; order_index: number }>,
  questionType: string
) {
  if (!options || options.length <= 1) return options || [];

  // Para selección múltiple e identificación de referencia: barajar completamente las opciones
  if (
    questionType === "multiple_choice" ||
    questionType === "reference_identification"
  ) {
    return shuffleArray(options);
  }

  // Para ordenar acontecimientos: barajar asegurando que no empiece ya en el orden correcto
  if (questionType === "order_events") {
    const sorted = [...options].sort((a, b) => a.order_index - b.order_index);
    let shuffled = shuffleArray(sorted);
    let attempts = 0;
    while (
      attempts < 10 &&
      shuffled.every((opt, idx) => opt.id === sorted[idx]?.id)
    ) {
      shuffled = shuffleArray(sorted);
      attempts++;
    }
    return shuffled;
  }

  // Para verdadero/falso u otros tipos: mantener el orden predeterminado (Verdadero primero, Falso segundo)
  return [...options].sort((a, b) => a.order_index - b.order_index);
}

export async function getAssessmentForStudent(
  assessmentId: string
): Promise<AssessmentWithQuestions | null> {
  const supabase = await createClient();

  const { data: assessment } = await supabase
    .from("assessments")
    .select("id, title, type, passing_score_percentage, questions_count, time_limit_minutes, block_id, chapter_id, book_id")
    .eq("id", assessmentId)
    .single<AssessmentMetaRecord>();

  if (!assessment) return null;

  const adminSupabase = createAdminClient();

  const { data: assessmentQuestions } = await adminSupabase
    .from("assessment_questions")
    .select(`
      order_index,
      question:questions!inner(
        id,
        question_type,
        prompt,
        verse_reference,
        points,
        difficulty,
        order_index,
        is_active,
        options:question_options(
          id,
          option_text,
          order_index
        )
      )
    `)
    .eq("assessment_id", assessmentId)
    .order("order_index", { ascending: true })
    .returns<any[]>();

  let questions: ClientQuestion[] = [];

  if (assessmentQuestions && assessmentQuestions.length > 0) {
    questions = assessmentQuestions
      .filter((aq: any) => aq.question && aq.question.is_active)
      .map((aq: any) => {
        const q = aq.question;
        const mappedOptions = (q.options || []).map((opt: any) => ({
          id: opt.id,
          option_text: opt.option_text,
          order_index: opt.order_index,
        }));

        return {
          id: q.id,
          question_type: q.question_type,
          prompt: q.prompt,
          verse_reference: "", // Oculto durante la prueba para no revelar la respuesta
          points: q.points,
          difficulty: q.difficulty,
          order_index: aq.order_index,
          options: randomizeOptionsForStudent(mappedOptions, q.question_type),
        };
      });
  } else if (assessment.block_id) {
    const { data: blockQuestions } = await adminSupabase
      .from("questions")
      .select(`
        id,
        question_type,
        prompt,
        verse_reference,
        points,
        difficulty,
        order_index,
        options:question_options(
          id,
          option_text,
          order_index
        )
      `)
      .eq("block_id", assessment.block_id)
      .eq("is_active", true)
      .order("order_index", { ascending: true })
      .returns<any[]>();

    if (blockQuestions) {
      questions = blockQuestions.map((q: any) => {
        const mappedOptions = (q.options || []).map((opt: any) => ({
          id: opt.id,
          option_text: opt.option_text,
          order_index: opt.order_index,
        }));

        return {
          id: q.id,
          question_type: q.question_type,
          prompt: q.prompt,
          verse_reference: "", // Oculto durante la prueba para no revelar la respuesta
          points: q.points,
          difficulty: q.difficulty,
          order_index: q.order_index,
          options: randomizeOptionsForStudent(mappedOptions, q.question_type),
        };
      });
    }
  }

  return {
    ...assessment,
    questions,
  };
}

interface AttemptWithAssessmentRelation {
  id: string;
  user_id: string;
  score: number;
  max_score: number;
  percentage: number;
  passed: boolean;
  status: string;
  started_at: string;
  completed_at: string | null;
  assessment: {
    id: string;
    title: string;
    type: string;
    passing_score_percentage: number;
    block_id: string | null;
    chapter_id: string | null;
    book_id: string | null;
  };
}

export async function getAttemptResult(attemptId: string, userId: string) {
  const adminSupabase = createAdminClient();

  // 1. Obtener intento y respuestas en paralelo
  const [attemptRes, answersRes] = await Promise.all([
    adminSupabase
      .from("assessment_attempts")
      .select(`
        id,
        user_id,
        score,
        max_score,
        percentage,
        passed,
        status,
        started_at,
        completed_at,
        assessment:assessments!inner(
          id,
          title,
          type,
          passing_score_percentage,
          block_id,
          chapter_id,
          book_id
        )
      `)
      .eq("id", attemptId)
      .eq("user_id", userId)
      .maybeSingle<AttemptWithAssessmentRelation>(),
    adminSupabase
      .from("assessment_answers")
      .select(`
        id,
        question_id,
        selected_option_id,
        text_response,
        order_response,
        is_correct,
        points_awarded,
        feedback,
        question:questions!inner(
          id,
          prompt,
          question_type,
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
        )
      `)
      .eq("attempt_id", attemptId)
      .returns<any[]>(),
  ]);

  const attempt = attemptRes.data;
  const answers = answersRes.data;

  if (!attempt) return null;

  const rawAssessment = attempt.assessment;

  const results = (answers || []).map((ans: any) => {
    const q = ans.question;
    const options = q.options || [];

    let correctAnswerText = "";
    let userAnswerText = "";

    if (
      q.question_type === "multiple_choice" ||
      q.question_type === "reference_identification" ||
      q.question_type === "true_false"
    ) {
      const correctOpt = options.find((o: any) => o.is_correct);
      correctAnswerText = correctOpt ? correctOpt.option_text : "";

      const userOpt = options.find((o: any) => o.id === ans.selected_option_id);
      userAnswerText = userOpt ? userOpt.option_text : "(Sin respuesta)";
    } else if (q.question_type === "fill_blank") {
      const correctOpt = options.find((o: any) => o.is_correct);
      correctAnswerText = correctOpt ? correctOpt.option_text : "";
      userAnswerText = ans.text_response || "(Sin respuesta)";
    } else if (q.question_type === "order_events") {
      const sortedByCorrect = [...options].sort(
        (a: any, b: any) => (a.correct_order_position || 0) - (b.correct_order_position || 0)
      );
      correctAnswerText = sortedByCorrect.map((o: any) => o.option_text).join(" → ");

      if (Array.isArray(ans.order_response)) {
        const userOrdered = ans.order_response
          .map((optId: string) => options.find((o: any) => o.id === optId)?.option_text)
          .filter(Boolean);
        userAnswerText = userOrdered.join(" → ");
      } else {
        userAnswerText = "(Sin respuesta)";
      }
    }

    return {
      questionId: q.id,
      prompt: q.prompt,
      questionType: q.question_type,
      verseReference: q.verse_reference,
      isCorrect: ans.is_correct,
      pointsAwarded: Number(ans.points_awarded),
      maxPoints: Number(q.points),
      correctAnswerText,
      userAnswerText,
      explanation: q.explanation,
    };
  });

  // Calcular la secuencia del siguiente paso de estudio
  let nextStep: AssessmentResultSummary["nextStep"] = undefined;
  let chapterExamInfo: AssessmentResultSummary["chapterExamInfo"] = null;

  try {
    if (rawAssessment.type === "block_quiz" && rawAssessment.block_id) {
      const { data: currentBlock } = await adminSupabase
        .from("study_blocks")
        .select(`
          id,
          block_number,
          order_index,
          chapter_id,
          chapter:chapters!inner(
            id,
            chapter_number,
            title,
            book_id,
            book:books!inner(
              id,
              name,
              slug
            )
          )
        `)
        .eq("id", rawAssessment.block_id)
        .single<any>();

      if (currentBlock) {
        const bookSlug = currentBlock.chapter.book.slug;
        const chapterNumber = currentBlock.chapter.chapter_number;

        // 1. Buscar simultáneamente el siguiente bloque y el examen del capítulo
        const [nextBlockRes, chapterExamRes] = await Promise.all([
          adminSupabase
            .from("study_blocks")
            .select("id, block_number, title")
            .eq("chapter_id", currentBlock.chapter_id)
            .gt("order_index", currentBlock.order_index)
            .order("order_index", { ascending: true })
            .limit(1)
            .maybeSingle<{ id: string; block_number: number; title: string }>(),
          adminSupabase
            .from("assessments")
            .select("id, title")
            .eq("chapter_id", currentBlock.chapter_id)
            .eq("type", "chapter_exam")
            .maybeSingle<{ id: string; title: string }>(),
        ]);

        const nextBlock = nextBlockRes.data;
        const chapterExam = chapterExamRes.data;

        if (nextBlock) {
          nextStep = {
            type: "next_block",
            label: "Continuar al Siguiente Bloque",
            href: `/libros/${bookSlug}/capitulos/${chapterNumber}/bloques/${nextBlock.id}`,
          };
        } else if (chapterExam) {
          nextStep = {
            type: "chapter_exam",
            label: `Continuar al Examen del Capítulo ${chapterNumber}`,
            href: `/evaluaciones/${chapterExam.id}`,
          };
        } else {
          // Si no existiera examen de capítulo, avanzar al siguiente capítulo
          const { data: nextChapter } = await adminSupabase
            .from("chapters")
            .select("id, chapter_number, title")
            .eq("book_id", currentBlock.chapter.book.id || currentBlock.chapter.book_id)
            .gt("chapter_number", chapterNumber)
            .order("chapter_number", { ascending: true })
            .limit(1)
            .maybeSingle<{ id: string; chapter_number: number; title: string }>();

          if (nextChapter) {
            nextStep = {
              type: "next_chapter",
              label: `Continuar al Capítulo ${nextChapter.chapter_number}`,
              href: `/libros/${bookSlug}/capitulos/${nextChapter.chapter_number}`,
            };
          } else {
            nextStep = {
              type: "dashboard",
              label: "Ir al Dashboard",
              href: "/dashboard",
            };
          }
        }
      }
    } else if (rawAssessment.type === "chapter_exam" && rawAssessment.chapter_id) {
      // Examen general del capítulo completado
      const { data: currentChapter } = await adminSupabase
        .from("chapters")
        .select(`
          id,
          chapter_number,
          title,
          book_id,
          book:books!inner(
            id,
            name,
            slug
          )
        `)
        .eq("id", rawAssessment.chapter_id)
        .single<any>();

      if (currentChapter) {
        const bookSlug = currentChapter.book.slug;
        const chapterNumber = currentChapter.chapter_number;

        // Si aprobó el examen, avanza en secuencia al siguiente capítulo nuevo desbloqueado
        if (attempt.passed) {
          const { data: nextChapter } = await adminSupabase
            .from("chapters")
            .select("id, chapter_number, title")
            .eq("book_id", currentChapter.book.id || currentChapter.book_id)
            .gt("chapter_number", chapterNumber)
            .order("chapter_number", { ascending: true })
            .limit(1)
            .maybeSingle<{ id: string; chapter_number: number; title: string }>();

          if (nextChapter) {
            nextStep = {
              type: "next_chapter",
              label: `Continuar al Capítulo ${nextChapter.chapter_number}`,
              href: `/libros/${bookSlug}/capitulos/${nextChapter.chapter_number}`,
            };
          } else {
            // Último capítulo (Efesios 6) -> continuar al Examen Final del Libro
            const { data: finalExam } = await adminSupabase
              .from("assessments")
              .select("id, title")
              .eq("book_id", currentChapter.book.id || currentChapter.book_id)
              .eq("type", "book_final")
              .maybeSingle<{ id: string; title: string }>();

            if (finalExam) {
              nextStep = {
                type: "book_final",
                label: "Continuar al Examen Final de Efesios",
                href: `/evaluaciones/${finalExam.id}`,
              };
            } else {
              nextStep = {
                type: "dashboard",
                label: "Ir al Dashboard",
                href: "/dashboard",
              };
            }
          }
        } else {
          // Si no aprobó el examen de este capítulo, debe repetirlo para desbloquear el siguiente
          nextStep = {
            type: "chapter_exam",
            label: `Repasar y Reintentar Examen del Capítulo ${chapterNumber}`,
            href: `/evaluaciones/${rawAssessment.id}`,
          };
        }
      }
    } else if (rawAssessment.type === "book_final") {
      nextStep = {
        type: "dashboard",
        label: "Ir al Dashboard",
        href: "/dashboard",
      };
    }
  } catch (error) {
    console.error("Error calculating next step in getAttemptResult:", error);
  }

  if (!nextStep) {
    nextStep = {
      type: "dashboard",
      label: "Ir al Dashboard",
      href: "/dashboard",
    };
  }

  return {
    attemptId: attempt.id,
    assessmentId: rawAssessment.id,
    assessmentTitle: rawAssessment.title,
    assessmentType: rawAssessment.type,
    score: Number(attempt.score),
    maxScore: Number(attempt.max_score),
    percentage: Number(attempt.percentage),
    passed: attempt.passed,
    passingScorePercentage: rawAssessment.passing_score_percentage,
    totalQuestions: results.length,
    correctCount: results.filter((r) => r.isCorrect).length,
    incorrectCount: results.filter((r) => !r.isCorrect).length,
    completedAt: attempt.completed_at || "",
    results,
    blockId: rawAssessment.block_id,
    chapterId: rawAssessment.chapter_id,
    chapterExamInfo,
    nextStep,
  };
}
