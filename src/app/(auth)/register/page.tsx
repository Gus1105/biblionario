"use client";

import React, { useState, useTransition } from "react";
import Link from "next/link";
import { registerAction } from "@/actions/auth.actions";
import { Mail, Lock, User, UserPlus, AlertCircle, CheckCircle2, Loader2 } from "lucide-react";

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
            "¡Registro completado con éxito! Por favor revisa tu correo electrónico para confirmar tu cuenta si es necesario, o inicia sesión."
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
        <div className="mb-5 rounded-lg bg-red-50 dark:bg-red-950/40 border border-red-200 dark:border-red-900/60 p-3 flex items-start gap-3 text-red-700 dark:text-red-400 text-sm">
          <AlertCircle className="w-5 h-5 flex-shrink-0 mt-0.5 text-red-500" />
          <span>{errorMessage}</span>
        </div>
      )}

      {successMessage && (
        <div className="mb-5 rounded-lg bg-emerald-50 dark:bg-emerald-950/40 border border-emerald-200 dark:border-emerald-900/60 p-3 flex items-start gap-3 text-emerald-700 dark:text-emerald-400 text-sm">
          <CheckCircle2 className="w-5 h-5 flex-shrink-0 mt-0.5 text-emerald-500" />
          <div>
            <span>{successMessage}</span>
            <div className="mt-2">
              <Link
                href="/login"
                className="font-bold underline hover:text-emerald-800 dark:hover:text-emerald-300"
              >
                Ir a Iniciar Sesión →
              </Link>
            </div>
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

