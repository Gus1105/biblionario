import { createClient } from "@/lib/supabase/server";
import { createAdminClient } from "@/lib/supabase/admin";
import { AssessmentWithQuestions, ClientQuestion } from "@/types/assessment.types";
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
        const sortedOptions = (q.options || [])
          .map((opt: any) => ({
            id: opt.id,
            option_text: opt.option_text,
            order_index: opt.order_index,
          }))
          .sort((a: any, b: any) => a.order_index - b.order_index);

        return {
          id: q.id,
          question_type: q.question_type,
          prompt: q.prompt,
          verse_reference: q.verse_reference,
          points: q.points,
          difficulty: q.difficulty,
          order_index: aq.order_index,
          options: sortedOptions,
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
      questions = blockQuestions.map((q: any) => ({
        id: q.id,
        question_type: q.question_type,
        prompt: q.prompt,
        verse_reference: q.verse_reference,
        points: q.points,
        difficulty: q.difficulty,
        order_index: q.order_index,
        options: (q.options || [])
          .map((opt: any) => ({
            id: opt.id,
            option_text: opt.option_text,
            order_index: opt.order_index,
          }))
          .sort((a: any, b: any) => a.order_index - b.order_index),
      }));
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

  const { data: attempt } = await adminSupabase
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
    .single<AttemptWithAssessmentRelation>();

  if (!attempt || attempt.user_id !== userId) return null;

  const { data: answers } = await adminSupabase
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
    .returns<any[]>();

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
  };
}
