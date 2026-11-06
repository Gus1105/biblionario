"use client";

import React, { useState, useTransition, Suspense } from "react";
import Link from "next/link";
import { useSearchParams } from "next/navigation";
import { loginAction, resendConfirmationEmailAction } from "@/actions/auth.actions";
import { Mail, Lock, LogIn, AlertCircle, CheckCircle2, Loader2, Send } from "lucide-react";

function LoginForm() {
  const searchParams = useSearchParams();
  const urlError = searchParams.get("error");
  const isConfirmed = searchParams.get("confirmed") === "true";

  const [isPending, startTransition] = useTransition();
  const [errorMessage, setErrorMessage] = useState<string | null>(() => {
    if (urlError === "auth_callback_failed") {
      return "El enlace de verificación ha expirado o ya fue utilizado. Por favor, intenta iniciar sesión o solicita reenviar el correo de confirmación.";
    }
    return null;
  });
  const [infoMessage, setInfoMessage] = useState<string | null>(() => {
    if (isConfirmed) {
      return "¡Tu correo electrónico ha sido verificado correctamente! Ya puedes iniciar sesión.";
    }
    return null;
  });

  const [enteredEmail, setEnteredEmail] = useState("");
  const [isUnconfirmed, setIsUnconfirmed] = useState(false);
  const [isResending, setIsResending] = useState(false);
  const [resendStatus, setResendStatus] = useState<string | null>(null);

  const handleSubmit = (e: React.FormEvent<HTMLFormElement>) => {
    e.preventDefault();
    setErrorMessage(null);
    setInfoMessage(null);
    setResendStatus(null);
    const formData = new FormData(e.currentTarget);

    startTransition(async () => {
      const result = await loginAction(formData);
      if (result && !result.success && result.error) {
        setErrorMessage(result.error);
        if (result.isUnconfirmedEmail) {
          setIsUnconfirmed(true);
        }
      }
    });
  };

  const handleResendConfirmation = async () => {
    if (!enteredEmail) {
      setErrorMessage("Por favor escribe tu correo electrónico en el campo superior para reenviar la confirmación.");
      return;
    }

    setIsResending(true);
    setResendStatus(null);

    const res = await resendConfirmationEmailAction(enteredEmail);
    setIsResending(false);

    if (res.success) {
      setResendStatus("¡Correo de confirmación enviado! Revisa tu bandeja de entrada o la carpeta de spam.");
    } else {
      setErrorMessage(res.error || "No se pudo reenviar el correo de confirmación.");
    }
  };

  return (
    <div>
      <div className="mb-6 text-center">
        <h2 className="text-xl font-bold text-stone-900 dark:text-stone-100">
          Iniciar Sesión
        </h2>
        <p className="text-sm text-stone-600 dark:text-stone-400 mt-1">
          Ingresa a tu cuenta para continuar con tu estudio bíblico
        </p>
      </div>

      {/* Mensaje de éxito / información */}
      {infoMessage && (
        <div className="mb-5 rounded-xl bg-emerald-50 dark:bg-emerald-950/40 border border-emerald-200 dark:border-emerald-900/60 p-3.5 flex items-start gap-3 text-emerald-800 dark:text-emerald-300 text-sm">
          <CheckCircle2 className="w-5 h-5 flex-shrink-0 mt-0.5 text-emerald-600" />
          <span>{infoMessage}</span>
        </div>
      )}

      {/* Mensaje de error en español */}
      {errorMessage && (
        <div className="mb-5 rounded-xl bg-rose-50 dark:bg-rose-950/40 border border-rose-200 dark:border-rose-900/60 p-3.5 space-y-2 text-rose-800 dark:text-rose-300 text-sm">
          <div className="flex items-start gap-3">
            <AlertCircle className="w-5 h-5 flex-shrink-0 mt-0.5 text-rose-500" />
            <span className="leading-relaxed">{errorMessage}</span>
          </div>

          {/* Botón para reenviar correo si no está confirmado */}
          {isUnconfirmed && (
            <div className="pt-2 pl-8 border-t border-rose-200/60 dark:border-rose-900/60">
              <button
                type="button"
                onClick={handleResendConfirmation}
                disabled={isResending}
                className="inline-flex items-center gap-1.5 text-xs font-bold text-amber-700 dark:text-amber-300 hover:underline cursor-pointer"
              >
                {isResending ? (
                  <>
                    <Loader2 className="w-3.5 h-3.5 animate-spin" />
                    <span>Reenviando correo...</span>
                  </>
                ) : (
                  <>
                    <Send className="w-3.5 h-3.5" />
                    <span>¿No te llegó el correo? Reenviar confirmación</span>
                  </>
                )}
              </button>
            </div>
          )}
        </div>
      )}

      {/* Confirmación de reenvío */}
      {resendStatus && (
        <div className="mb-5 rounded-xl bg-sky-50 dark:bg-sky-950/40 border border-sky-200 dark:border-sky-900/60 p-3 flex items-start gap-3 text-sky-800 dark:text-sky-300 text-sm">
          <CheckCircle2 className="w-5 h-5 flex-shrink-0 mt-0.5 text-sky-600" />
          <span>{resendStatus}</span>
        </div>
      )}

      <form onSubmit={handleSubmit} className="space-y-4">
        <div>
          <label
            htmlFor="email"
            className="block text-xs font-semibold uppercase tracking-wider text-stone-700 dark:text-stone-300 mb-1"
          >
            Correo Electrónico
          </label>
          <div className="relative rounded-lg shadow-sm">
            <div className="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none text-stone-400">
              <Mail className="h-4 w-4" />
            </div>
            <input
              id="email"
              name="email"
              type="email"
              autoComplete="email"
              required
              value={enteredEmail}
              onChange={(e) => setEnteredEmail(e.target.value)}
              placeholder="tu@correo.com"
              className="block w-full pl-9 pr-3 py-2 text-sm rounded-lg border border-stone-300 dark:border-stone-700 bg-white dark:bg-stone-800 text-stone-900 dark:text-stone-100 placeholder-stone-400 focus:outline-none focus:ring-2 focus:ring-amber-500 focus:border-transparent transition-colors"
            />
          </div>
        </div>

        <div>
          <label
            htmlFor="password"
            className="block text-xs font-semibold uppercase tracking-wider text-stone-700 dark:text-stone-300 mb-1"
          >
            Contraseña
          </label>
          <div className="relative rounded-lg shadow-sm">
            <div className="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none text-stone-400">
              <Lock className="h-4 w-4" />
            </div>
            <input
              id="password"
              name="password"
              type="password"
              autoComplete="current-password"
              required
              placeholder="••••••••"
              className="block w-full pl-9 pr-3 py-2 text-sm rounded-lg border border-stone-300 dark:border-stone-700 bg-white dark:bg-stone-800 text-stone-900 dark:text-stone-100 placeholder-stone-400 focus:outline-none focus:ring-2 focus:ring-amber-500 focus:border-transparent transition-colors"
            />
          </div>
        </div>

        <button
          type="submit"
          disabled={isPending}
          className="w-full mt-2 flex items-center justify-center gap-2 py-2.5 px-4 rounded-lg bg-amber-600 hover:bg-amber-700 active:bg-amber-800 text-white font-semibold text-sm shadow-md shadow-amber-600/20 disabled:opacity-60 disabled:cursor-not-allowed transition-all duration-150 cursor-pointer"
        >
          {isPending ? (
            <>
              <Loader2 className="w-4 h-4 animate-spin" />
              <span>Verificando...</span>
            </>
          ) : (
            <>
              <LogIn className="w-4 h-4" />
              <span>Ingresar</span>
            </>
          )}
        </button>
      </form>

      <div className="mt-6 pt-6 border-t border-stone-200 dark:border-stone-800 text-center text-sm text-stone-600 dark:text-stone-400">
        ¿Aún no tienes cuenta?{" "}
        <Link
          href="/register"
          className="font-semibold text-amber-600 hover:text-amber-500 dark:text-amber-400"
        >
          Regístrate gratis
        </Link>
      </div>
    </div>
  );
}

export default function LoginPage() {
  return (
    <Suspense fallback={<div className="py-12 text-center text-stone-400 text-sm">Cargando...</div>}>
      <LoginForm />
    </Suspense>
  );
}
