import React from "react";
import Link from "next/link";
import { BookOpen, Sparkles } from "lucide-react";

export default function AuthLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  return (
    <div className="min-h-screen bg-gradient-to-br from-amber-50 via-stone-50 to-emerald-50 dark:from-stone-950 dark:via-stone-900 dark:to-zinc-950 flex flex-col justify-center py-12 sm:px-6 lg:px-8">
      <div className="sm:mx-auto sm:w-full sm:max-w-md text-center">
        <Link href="/" className="inline-flex items-center gap-2 group">
          <div className="w-12 h-12 rounded-xl bg-gradient-to-tr from-amber-600 to-amber-500 text-white flex items-center justify-center shadow-lg shadow-amber-600/20 group-hover:scale-105 transition-transform duration-200">
            <BookOpen className="w-6 h-6" />
          </div>
          <div className="text-left">
            <span className="text-2xl font-bold tracking-tight text-stone-900 dark:text-stone-100 flex items-center gap-1.5">
              Biblionario
              <Sparkles className="w-4 h-4 text-amber-500" />
            </span>
            <span className="text-xs text-stone-500 dark:text-stone-400 block -mt-1 font-medium">
              Aprendizaje Bíblico Progresivo
            </span>
          </div>
        </Link>
      </div>

      <div className="mt-8 sm:mx-auto sm:w-full sm:max-w-md">
        <div className="bg-white/80 dark:bg-stone-900/80 backdrop-blur-md py-8 px-6 shadow-xl shadow-stone-200/50 dark:shadow-stone-950/50 sm:rounded-2xl border border-stone-200/70 dark:border-stone-800">
          {children}
        </div>

        <p className="mt-6 text-center text-xs text-stone-500 dark:text-stone-400">
          &ldquo;La exposición de tus palabras alumbra; hace entender a los simples.&rdquo;
          <br />
          <span className="font-semibold text-stone-600 dark:text-stone-300">Salmos 119:130 (RVR1960)</span>
        </p>
      </div>
    </div>
  );
}

