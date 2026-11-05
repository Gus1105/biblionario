import React from "react";
import Link from "next/link";
import { BookOpen } from "lucide-react";

export function Footer() {
  return (
    <footer className="border-t border-stone-200 dark:border-stone-800 bg-stone-50 dark:bg-stone-950 py-10 mt-auto">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="flex flex-col md:flex-row items-center justify-between gap-6">
          <div className="flex items-center gap-2">
            <div className="w-8 h-8 rounded-lg bg-amber-600 text-white flex items-center justify-center">
              <BookOpen className="w-4 h-4" />
            </div>
            <div>
              <span className="font-bold text-stone-900 dark:text-stone-100">Biblionario</span>
              <p className="text-xs text-stone-500 dark:text-stone-400">
                Plataforma de estudio y aprendizaje progresivo de las Sagradas Escrituras
              </p>
            </div>
          </div>

          <div className="text-center md:text-right">
            <p className="text-xs text-stone-600 dark:text-stone-400">
              Texto de referencia: <span className="font-semibold text-stone-800 dark:text-stone-200">Reina-Valera 1960 (RVR1960)</span>
            </p>
            <p className="text-[11px] text-stone-400 dark:text-stone-500 mt-1">
              &copy; {new Date().getFullYear()} Biblionario. Diseñado para edificación y crecimiento espiritual.
            </p>
          </div>
        </div>
      </div>
    </footer>
  );
}

