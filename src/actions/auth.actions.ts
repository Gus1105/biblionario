"use server";

import { createClient } from "@/lib/supabase/server";
import { createAdminClient } from "@/lib/supabase/admin";
import { loginSchema, registerSchema } from "@/lib/validations/auth";
import { redirect } from "next/navigation";
import { headers } from "next/headers";
import { mapAuthError } from "@/lib/auth-errors";

export interface AuthActionResult {
  success: boolean;
  error?: string;
  isUnconfirmedEmail?: boolean;
}

export async function loginAction(formData: FormData): Promise<AuthActionResult> {
  const rawData = {
    email: formData.get("email"),
    password: formData.get("password"),
  };

  const parsed = loginSchema.safeParse(rawData);
  if (!parsed.success) {
    return {
      success: false,
      error: parsed.error.issues[0]?.message || "Datos inválidos",
    };
  }

  const { email, password } = parsed.data;
  const supabase = await createClient();

  const { error } = await supabase.auth.signInWithPassword({
    email,
    password,
  });

  if (error) {
    const isUnconfirmed =
      error.message.toLowerCase().includes("email not confirmed") ||
      error.message.toLowerCase().includes("not confirmed");

    return {
      success: false,
      error: mapAuthError(error.message),
      isUnconfirmedEmail: isUnconfirmed,
    };
  }

  redirect("/dashboard");
}

export async function registerAction(formData: FormData): Promise<AuthActionResult> {
  const rawData = {
    fullName: formData.get("fullName"),
    email: formData.get("email"),
    password: formData.get("password"),
    confirmPassword: formData.get("confirmPassword"),
  };

  const parsed = registerSchema.safeParse(rawData);
  if (!parsed.success) {
    return {
      success: false,
      error: parsed.error.issues[0]?.message || "Datos inválidos",
    };
  }

  const { fullName, email, password } = parsed.data;
  const supabase = await createClient();

  // Obtener la URL base para configurar la redirección del correo de confirmación
  const headersList = await headers();
  const host = headersList.get("x-forwarded-host") || headersList.get("host");
  const protocol = headersList.get("x-forwarded-proto") || "http";
  const origin =
    headersList.get("origin") ||
    (host ? `${protocol}://${host}` : process.env.NEXT_PUBLIC_SITE_URL || "http://localhost:3000");

  const emailRedirectTo = `${origin}/api/auth/callback?next=/dashboard`;

  const { data, error } = await supabase.auth.signUp({
    email,
    password,
    options: {
      data: {
        full_name: fullName,
      },
      emailRedirectTo,
    },
  });

  if (error) {
    return {
      success: false,
      error: mapAuthError(error.message),
    };
  }

  // Si Supabase no requiere confirmación por correo para iniciar sesión
  if (data.session) {
    redirect("/dashboard");
  }

  return {
    success: true,
  };
}

export async function resendConfirmationEmailAction(
  email: string
): Promise<AuthActionResult> {
  const trimmed = email.trim().toLowerCase();
  if (!trimmed) {
    return {
      success: false,
      error: "Por favor, ingresa tu correo electrónico para reenviar la confirmación.",
    };
  }

  const headersList = await headers();
  const host = headersList.get("x-forwarded-host") || headersList.get("host");
  const protocol = headersList.get("x-forwarded-proto") || "http";
  const origin =
    headersList.get("origin") ||
    (host ? `${protocol}://${host}` : process.env.NEXT_PUBLIC_SITE_URL || "http://localhost:3000");

  const emailRedirectTo = `${origin}/api/auth/callback?next=/dashboard`;
  const supabase = await createClient();

  const { error } = await supabase.auth.resend({
    type: "signup",
    email: trimmed,
    options: {
      emailRedirectTo,
    },
  });

  if (error) {
    return {
      success: false,
      error: mapAuthError(error.message),
    };
  }

  return {
    success: true,
  };
}

export async function logoutAction(): Promise<void> {
  const supabase = await createClient();
  await supabase.auth.signOut();
  redirect("/login");
}

export async function getCurrentUser() {
  const supabase = await createClient();
  const {
    data: { user },
  } = await supabase.auth.getUser();

  if (!user) return null;

  // Obtener perfil y rol
  const { data: profile } = await supabase
    .from("profiles")
    .select("*")
    .eq("id", user.id)
    .single();

  const { data: userRoles } = await supabase
    .from("user_roles")
    .select("role")
    .eq("user_id", user.id);

  const roles = (userRoles || []) as { role: string }[];
  const isAdmin = roles.some((r) => r.role === "admin");
  const role: "admin" | "participant" = isAdmin ? "admin" : "participant";

  return {
    user,
    profile: profile || {
      id: user.id,
      email: user.email || "",
      full_name: user.user_metadata?.full_name || null,
      avatar_url: null,
      created_at: new Date().toISOString(),
      updated_at: new Date().toISOString(),
    },
    role,
    isAdmin: role === "admin",
  };
}
