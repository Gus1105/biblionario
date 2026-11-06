"use client";

import React, { useState, useTransition } from "react";
import Link from "next/link";
import { registerAction } from "@/actions/auth.actions";
import { Mail, Lock, User, UserPlus, AlertCircle, CheckCircle2, Loader2, Sparkles } from "lucide-react";

export default function RegisterPage() {
  const [isPending, startTransition] = useTransition();
  const [errorMessage, setErrorMessage] = useState<string | null>(null);
  const [successMessage, setSuccessMessage] = useState<string | null>(null);

  const handleSubmit = (e: React.FormEvent<HTMLFormElement>) => {
    e.preventDefault();
    setErrorMessage(null);
    setSuccessMessage(null);
    const formData = new FormData(e.currentTarget);

    startTransition(async () => {
      const result = await registerAction(formData);
      if (result) {
        if (!result.success && result.error) {
          setErrorMessage(result.error);
        } else if (result.success) {
          setSuccessMessage(
            "¡Registro completado con éxito! Hemos enviado un correo de verificación a tu casilla. Al hacer clic en el enlace, tu cuenta quedará activada y serás redirigido directamente a tu Dashboard."
          );
        }
      }
    });
  };

  return (
    <div>
      <div className="mb-6 text-center">
        <h2 className="text-xl font-bold text-stone-900 dark:text-stone-100">
          Crear una Cuenta
        </h2>
        <p className="text-sm text-stone-600 dark:text-stone-400 mt-1">
          Comienza hoy tu recorrido de estudio y aprendizaje bíblico
        </p>
      </div>

      {errorMessage && (
        <div className="mb-5 rounded-xl bg-rose-50 dark:bg-rose-950/40 border border-rose-200 dark:border-rose-900/60 p-3.5 flex items-start gap-3 text-rose-800 dark:text-rose-300 text-sm">
          <AlertCircle className="w-5 h-5 flex-shrink-0 mt-0.5 text-rose-500" />
          <span className="leading-relaxed">{errorMessage}</span>
        </div>
      )}

      {successMessage && (
        <div className="mb-5 rounded-2xl bg-emerald-50 dark:bg-emerald-950/40 border border-emerald-200 dark:border-emerald-900/60 p-4 space-y-3 text-emerald-800 dark:text-emerald-300 text-sm">
          <div className="flex items-start gap-3">
            <CheckCircle2 className="w-5 h-5 flex-shrink-0 mt-0.5 text-emerald-600" />
            <span className="leading-relaxed font-medium">{successMessage}</span>
          </div>

          <div className="p-3 bg-white/80 dark:bg-stone-900/80 rounded-xl border border-emerald-200/60 dark:border-emerald-800/60 text-xs text-stone-600 dark:text-stone-400 space-y-1">
            <p className="font-semibold text-emerald-900 dark:text-emerald-300 flex items-center gap-1.5">
              <Mail className="w-4 h-4 text-emerald-600" /> Revisa tu correo electrónico
            </p>
            <p>
              Busca el mensaje de <strong>Biblionario</strong> en tu bandeja de entrada o en la carpeta de <strong>spam / correo no deseado</strong>.
            </p>
          </div>

          <div className="pt-1">
            <Link
              href="/login"
              className="inline-flex items-center gap-1 font-bold text-amber-700 dark:text-amber-400 hover:underline text-xs"
            >
              ¿Ya confirmaste? Ir a Iniciar Sesión →
            </Link>
          </div>
        </div>
      )}

      <form onSubmit={handleSubmit} className="space-y-4">
        <div>
          <label
            htmlFor="fullName"
            className="block text-xs font-semibold uppercase tracking-wider text-stone-700 dark:text-stone-300 mb-1"
          >
            Nombre Completo
          </label>
          <div className="relative rounded-lg shadow-sm">
            <div className="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none text-stone-400">
              <User className="h-4 w-4" />
            </div>
            <input
              id="fullName"
              name="fullName"
              type="text"
              autoComplete="name"
              required
              placeholder="Juan Pérez"
              className="block w-full pl-9 pr-3 py-2 text-sm rounded-lg border border-stone-300 dark:border-stone-700 bg-white dark:bg-stone-800 text-stone-900 dark:text-stone-100 placeholder-stone-400 focus:outline-none focus:ring-2 focus:ring-amber-500 focus:border-transparent transition-colors"
            />
          </div>
        </div>

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
              autoComplete="new-password"
              required
              placeholder="Mínimo 6 caracteres"
              className="block w-full pl-9 pr-3 py-2 text-sm rounded-lg border border-stone-300 dark:border-stone-700 bg-white dark:bg-stone-800 text-stone-900 dark:text-stone-100 placeholder-stone-400 focus:outline-none focus:ring-2 focus:ring-amber-500 focus:border-transparent transition-colors"
            />
          </div>
        </div>

        <div>
          <label
            htmlFor="confirmPassword"
            className="block text-xs font-semibold uppercase tracking-wider text-stone-700 dark:text-stone-300 mb-1"
          >
            Confirmar Contraseña
          </label>
          <div className="relative rounded-lg shadow-sm">
            <div className="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none text-stone-400">
              <Lock className="h-4 w-4" />
            </div>
            <input
              id="confirmPassword"
              name="confirmPassword"
              type="password"
              autoComplete="new-password"
              required
              placeholder="Repite tu contraseña"
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
              <span>Registrando...</span>
            </>
          ) : (
            <>
              <UserPlus className="w-4 h-4" />
              <span>Crear Cuenta</span>
            </>
          )}
        </button>
      </form>

      <div className="mt-6 pt-6 border-t border-stone-200 dark:border-stone-800 text-center text-sm text-stone-600 dark:text-stone-400">
        ¿Ya tienes una cuenta?{" "}
        <Link
          href="/login"
          className="font-semibold text-amber-600 hover:text-amber-500 dark:text-amber-400"
        >
          Inicia sesión aquí
        </Link>
      </div>
    </div>
  );
}
