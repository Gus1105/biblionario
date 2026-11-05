"use server";

import { createClient } from "@/lib/supabase/server";
import { createAdminClient } from "@/lib/supabase/admin";
import { loginSchema, registerSchema } from "@/lib/validations/auth";
import { redirect } from "next/navigation";

export interface AuthActionResult {
  success: boolean;
  error?: string;
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
    return {
      success: false,
      error:
        error.message === "Invalid login credentials"
          ? "Credenciales incorrectas. Verifica tu correo y contraseña."
          : error.message,
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

  const { data, error } = await supabase.auth.signUp({
    email,
    password,
    options: {
      data: {
        full_name: fullName,
      },
    },
  });

  if (error) {
    return {
      success: false,
      error: error.message,
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

  const { data: userRole } = await supabase
    .from("user_roles")
    .select("role")
    .eq("user_id", user.id)
    .maybeSingle<{ role: "admin" | "participant" }>();

  const role = userRole?.role || "participant";

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
