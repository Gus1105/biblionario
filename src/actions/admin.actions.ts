"use server";

import { createAdminClient } from "@/lib/supabase/admin";
import { getCurrentUser } from "@/actions/auth.actions";
import { revalidatePath } from "next/cache";
import { mapAuthError } from "@/lib/auth-errors";

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

/**
 * Actualizar información del participante (Nombre, Correo, Rol)
 */
export async function updateParticipantAction(data: {
  userId: string;
  fullName: string;
  email: string;
  role: "admin" | "participant";
}): Promise<{ success: boolean; error?: string }> {
  try {
    await ensureAdmin();
    const adminSupabase = createAdminClient();

    const trimmedName = data.fullName.trim();
    const trimmedEmail = data.email.trim().toLowerCase();

    if (!trimmedEmail) {
      return { success: false, error: "El correo electrónico es obligatorio." };
    }

    // 1. Actualizar en auth.users
    const { error: authError } = await adminSupabase.auth.admin.updateUserById(data.userId, {
      email: trimmedEmail,
      user_metadata: {
        full_name: trimmedName,
      },
    });

    if (authError) {
      return {
        success: false,
        error: `Error al actualizar autenticación: ${authError.message}`,
      };
    }

    // 2. Actualizar en tabla profiles
    const { error: profileError } = await (adminSupabase.from("profiles") as any)
      .update({
        full_name: trimmedName,
        email: trimmedEmail,
        updated_at: new Date().toISOString(),
      })
      .eq("id", data.userId);

    if (profileError) {
      return {
        success: false,
        error: `Error al actualizar perfil: ${profileError.message}`,
      };
    }

    // 3. Actualizar o insertar rol en user_roles
    const { data: existingRoles } = await adminSupabase
      .from("user_roles")
      .select("id")
      .eq("user_id", data.userId);

    if (existingRoles && existingRoles.length > 0) {
      await (adminSupabase.from("user_roles") as any)
        .update({ role: data.role })
        .eq("user_id", data.userId);
    } else {
      await (adminSupabase.from("user_roles") as any)
        .insert({ user_id: data.userId, role: data.role });
    }

    revalidatePath("/admin/participantes");
    revalidatePath(`/admin/participantes/${data.userId}`);

    return { success: true };
  } catch (err: any) {
    return {
      success: false,
      error: err.message || "Error al actualizar la información del participante.",
    };
  }
}

/**
 * Restablecer contraseña directamente por un administrador
 */
export async function resetParticipantPasswordAction(data: {
  userId: string;
  newPassword: string;
}): Promise<{ success: boolean; error?: string; message?: string }> {
  try {
    await ensureAdmin();
    const adminSupabase = createAdminClient();

    if (!data.newPassword || data.newPassword.length < 6) {
      return {
        success: false,
        error: "La contraseña debe tener al menos 6 caracteres.",
      };
    }

    const { error } = await adminSupabase.auth.admin.updateUserById(data.userId, {
      password: data.newPassword,
    });

    if (error) {
      return { success: false, error: error.message };
    }

    return {
      success: true,
      message: "La contraseña ha sido actualizada con éxito.",
    };
  } catch (err: any) {
    return {
      success: false,
      error: err.message || "Error al restablecer la contraseña.",
    };
  }
}

/**
 * Generar enlace de recuperación de contraseña y opcionalmente enviar correo
 */
export async function generatePasswordRecoveryAction(
  email: string
): Promise<{ success: boolean; recoveryLink?: string; error?: string; message?: string }> {
  try {
    await ensureAdmin();
    const adminSupabase = createAdminClient();

    const trimmedEmail = email.trim().toLowerCase();

    // Generar enlace directo de recuperación
    const { data: linkData, error: linkError } = await adminSupabase.auth.admin.generateLink({
      type: "recovery",
      email: trimmedEmail,
    });

    if (linkError) {
      return { success: false, error: linkError.message };
    }

    // Intentar también disparar el correo de recuperación habitual de Supabase
    try {
      await adminSupabase.auth.resetPasswordForEmail(trimmedEmail);
    } catch {
      // Ignorar si el proveedor de correos tiene límites o no está configurado
    }

    const recoveryLink = linkData?.properties?.action_link || undefined;

    return {
      success: true,
      recoveryLink,
      message:
        "Se ha generado el enlace de recuperación y se ha enviado la solicitud por correo.",
    };
  } catch (err: any) {
    return {
      success: false,
      error: err.message || "Error al generar enlace de recuperación.",
    };
  }
}

/**
 * Eliminar un participante por completo (Auth, Perfil, Roles, Historial y Progreso)
 */
export async function deleteParticipantAction(
  userId: string
): Promise<{ success: boolean; error?: string }> {
  try {
    const auth = await ensureAdmin();
    const adminSupabase = createAdminClient();

    // Seguridad: Impedir que el administrador se borre a sí mismo
    if (auth.user.id === userId) {
      return {
        success: false,
        error: "No puedes eliminar tu propia cuenta de administrador.",
      };
    }

    // 1. Eliminar perfil en BD pública (por si CASCADE estuviera deshabilitado)
    await adminSupabase.from("profiles").delete().eq("id", userId);

    // 2. Eliminar usuario en Supabase Auth (dispara CASCADE en toda la base de datos)
    const { error: authError } = await adminSupabase.auth.admin.deleteUser(userId);

    if (authError) {
      return {
        success: false,
        error: `Error al eliminar en autenticación: ${authError.message}`,
      };
    }

    revalidatePath("/admin/participantes");
    revalidatePath("/admin");

    return { success: true };
  } catch (err: any) {
    return {
      success: false,
      error: err.message || "Error al eliminar el participante.",
    };
  }
}

/**
 * Crear un participante directamente como administrador (sin límites de tasa de correo)
 */
export async function createParticipantAction(data: {
  fullName: string;
  email: string;
  password: string;
  role: "admin" | "participant";
}): Promise<{ success: boolean; error?: string }> {
  try {
    await ensureAdmin();
    const adminSupabase = createAdminClient();

    const trimmedName = data.fullName.trim();
    const trimmedEmail = data.email.trim().toLowerCase();

    if (!trimmedEmail) {
      return { success: false, error: "El correo electrónico es obligatorio." };
    }
    if (!data.password || data.password.length < 6) {
      return { success: false, error: "La contraseña debe tener al menos 6 caracteres." };
    }

    // 1. Crear el usuario en auth.users con correo confirmado (omite el envío de correo y el rate limit)
    const { data: userData, error: authError } = await adminSupabase.auth.admin.createUser({
      email: trimmedEmail,
      password: data.password,
      email_confirm: true,
      user_metadata: {
        full_name: trimmedName,
      },
    });

    if (authError || !userData?.user) {
      return {
        success: false,
        error: mapAuthError(authError?.message || "Error al crear el usuario."),
      };
    }

    const userId = userData.user.id;

    // 2. Asegurar que el perfil exista en profiles
    await (adminSupabase.from("profiles") as any).upsert({
      id: userId,
      email: trimmedEmail,
      full_name: trimmedName,
      updated_at: new Date().toISOString(),
    });

    // 3. Si el rol es admin, actualizarlo en user_roles
    if (data.role === "admin") {
      await (adminSupabase.from("user_roles") as any)
        .update({ role: "admin" })
        .eq("user_id", userId);
    }

    revalidatePath("/admin/participantes");
    revalidatePath("/admin");

    return { success: true };
  } catch (err: any) {
    return {
      success: false,
      error: err.message || "Error inesperado al crear el participante.",
    };
  }
}
