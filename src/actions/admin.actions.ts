"use server";

import { createAdminClient } from "@/lib/supabase/admin";
import { getCurrentUser } from "@/actions/auth.actions";
import { revalidatePath } from "next/cache";

async function ensureAdmin() {
  const auth = await getCurrentUser();
  if (!auth || !auth.isAdmin) {
    throw new Error("No tienes permisos administrativos para realizar esta acción.");
  }
  return auth;
}

export async function toggleQuestionStatusAction(questionId: string, currentStatus: boolean) {
  await ensureAdmin();
  const adminSupabase = createAdminClient();

  const { error } = await (adminSupabase.from("questions") as any)
    .update({ is_active: !currentStatus })
    .eq("id", questionId);

  if (error) {
    return { success: false, error: error.message };
  }

  revalidatePath("/admin/preguntas");
  return { success: true };
}

export async function deleteQuestionAction(questionId: string) {
  await ensureAdmin();
  const adminSupabase = createAdminClient();

  const { error } = await adminSupabase
    .from("questions")
    .delete()
    .eq("id", questionId);

  if (error) {
    return { success: false, error: error.message };
  }

  revalidatePath("/admin/preguntas");
  return { success: true };
}

export async function createQuestionAction(data: {
  blockId?: string;
  chapterId?: string;
  prompt: string;
  verseReference: string;
  questionType: "multiple_choice" | "fill_blank" | "reference_identification" | "true_false" | "order_events";
  explanation: string;
  points: number;
  difficulty: "easy" | "medium" | "hard";
  options: Array<{
    optionText: string;
    isCorrect: boolean;
    orderIndex: number;
    correctOrderPosition?: number | null;
  }>;
}) {
  await ensureAdmin();
  const adminSupabase = createAdminClient();

  // 1. Crear la pregunta
  const { data: question, error: qError } = await adminSupabase
    .from("questions")
    .insert({
      block_id: data.blockId || null,
      chapter_id: data.chapterId || null,
      prompt: data.prompt,
      verse_reference: data.verseReference,
      question_type: data.questionType,
      explanation: data.explanation,
      points: data.points,
      difficulty: data.difficulty,
      is_active: true,
      order_index: 99,
    } as any)
    .select("id")
    .single<{ id: string }>();

  if (qError || !question) {
    return { success: false, error: qError?.message || "Error al crear la pregunta." };
  }

  // 2. Crear las opciones
  if (data.options && data.options.length > 0) {
    const formattedOptions = data.options.map((opt, idx) => ({
      question_id: question.id,
      option_text: opt.optionText,
      is_correct: opt.isCorrect,
      order_index: opt.orderIndex || idx + 1,
      correct_order_position: opt.correctOrderPosition || null,
    }));

    const { error: optError } = await adminSupabase
      .from("question_options")
      .insert(formattedOptions as any);

    if (optError) {
      return { success: false, error: optError.message };
    }
  }

  revalidatePath("/admin/preguntas");
  return { success: true, questionId: question.id };
}
