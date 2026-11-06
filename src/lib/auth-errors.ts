/**
 * Traduce y formatea los errores de autenticación de Supabase a un español claro y amigable
 */
export function mapAuthError(errorMessage?: string | null): string {
  if (!errorMessage) {
    return "Ocurrió un error inesperado. Por favor, inténtalo nuevamente.";
  }

  const msg = errorMessage.toLowerCase();

  if (
    msg.includes("email not confirmed") ||
    msg.includes("email unconfirmed") ||
    msg.includes("not confirmed")
  ) {
    return "Debes confirmar tu correo electrónico antes de iniciar sesión. Por favor, revisa tu bandeja de entrada o la carpeta de correo no deseado (spam).";
  }

  if (
    msg.includes("invalid login credentials") ||
    msg.includes("invalid credentials") ||
    msg.includes("invalid_credentials")
  ) {
    return "Credenciales incorrectas. Verifica tu correo electrónico y tu contraseña.";
  }

  if (
    msg.includes("user already registered") ||
    msg.includes("already registered") ||
    msg.includes("user_already_exists")
  ) {
    return "Ya existe una cuenta registrada con este correo electrónico. Por favor, inicia sesión.";
  }

  if (
    msg.includes("password should be at least") ||
    msg.includes("password is too short")
  ) {
    return "La contraseña debe tener al menos 6 caracteres.";
  }

  if (
    msg.includes("signup requires a valid password") ||
    msg.includes("password is required")
  ) {
    return "Debes ingresar una contraseña válida.";
  }

  if (
    msg.includes("rate limit") ||
    msg.includes("over_email_send_rate_limit") ||
    msg.includes("too many requests")
  ) {
    return "Has alcanzado el límite de intentos permitidos. Por favor, espera unos minutos antes de volver a intentar.";
  }

  if (
    msg.includes("invalid email") ||
    msg.includes("unable to validate email")
  ) {
    return "El formato del correo electrónico no es válido.";
  }

  if (
    msg.includes("email link is invalid") ||
    msg.includes("token has expired") ||
    msg.includes("otp expired")
  ) {
    return "El enlace de confirmación ha expirado o no es válido. Por favor, solicita uno nuevo.";
  }

  if (
    msg.includes("user not found") ||
    msg.includes("user is banned")
  ) {
    return "No se encontró esta cuenta o ha sido deshabilitada.";
  }

  return errorMessage;
}

