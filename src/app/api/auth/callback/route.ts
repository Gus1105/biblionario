import { createClient } from "@/lib/supabase/server";
import { type EmailOtpType } from "@supabase/supabase-js";
import { NextResponse } from "next/server";

export const dynamic = "force-dynamic";

export async function GET(request: Request) {
  const { searchParams, origin } = new URL(request.url);
  const code = searchParams.get("code");
  const token_hash = searchParams.get("token_hash");
  const type = searchParams.get("type") as EmailOtpType | null;
  const next = searchParams.get("next") ?? "/dashboard";
  const urlError = searchParams.get("error");
  const errorDescription = searchParams.get("error_description");

  // Si Supabase ya viene con un error en el query string (ej. token expirado)
  if (urlError || errorDescription) {
    return NextResponse.redirect(`${origin}/login?error=auth_callback_failed`);
  }

  const supabase = await createClient();

  // 1. Intercambio de código PKCE por sesión
  if (code) {
    const { error } = await supabase.auth.exchangeCodeForSession(code);
    if (!error) {
      return NextResponse.redirect(`${origin}${next}`);
    }
  }

  // 2. Verificación de token_hash y type (flujo de verificación de OTP)
  if (token_hash && type) {
    const { error } = await supabase.auth.verifyOtp({
      type,
      token_hash,
    });
    if (!error) {
      return NextResponse.redirect(`${origin}${next}`);
    }
  }

  // 3. Si el usuario ya está autenticado, enviarlo directo al destino
  const {
    data: { user },
  } = await supabase.auth.getUser();

  if (user) {
    return NextResponse.redirect(`${origin}${next}`);
  }

  // Si falló el código o el enlace, redirigir al login con mensaje explicativo
  return NextResponse.redirect(`${origin}/login?error=auth_callback_failed`);
}
