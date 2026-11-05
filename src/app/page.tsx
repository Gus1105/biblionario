import Link from "next/link";
import { getCurrentUser } from "@/actions/auth.actions";
import {
  BookOpen,
  Sparkles,
  Award,
  Layers,
  CheckCircle2,
  BrainCircuit,
  ArrowRight,
  BookmarkCheck,
} from "lucide-react";
import { Button } from "@/components/ui/Button";

export default async function HomePage() {
  const authData = await getCurrentUser();

  return (
    <div className="min-h-screen bg-stone-50 dark:bg-stone-950 text-stone-900 dark:text-stone-100 flex flex-col">
      {/* Navigation Header */}
      <header className="border-b border-stone-200/80 dark:border-stone-800 bg-white/80 dark:bg-stone-900/80 backdrop-blur-md sticky top-0 z-50">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 h-16 flex items-center justify-between">
          <div className="flex items-center gap-2.5">
            <div className="w-10 h-10 rounded-xl bg-gradient-to-tr from-amber-600 to-amber-500 text-white flex items-center justify-center shadow-md shadow-amber-600/20">
              <BookOpen className="w-5 h-5" />
            </div>
            <div>
              <span className="text-xl font-bold tracking-tight flex items-center gap-1">
                Biblionario
                <Sparkles className="w-4 h-4 text-amber-500" />
              </span>
              <span className="text-[10px] text-stone-500 block -mt-1 font-semibold uppercase tracking-wider">
                Aprendizaje Bíblico Progresivo
              </span>
            </div>
          </div>

          <div className="flex items-center gap-3">
            {authData ? (
              <Link href="/dashboard">
                <Button variant="primary" size="md">
                  Ir a mi Dashboard
                  <ArrowRight className="w-4 h-4 ml-1" />
                </Button>
              </Link>
            ) : (
              <>
                <Link href="/login">
                  <Button variant="outline" size="sm">
                    Iniciar Sesión
                  </Button>
                </Link>
                <Link href="/register">
                  <Button variant="primary" size="sm">
                    Comenzar Gratis
                  </Button>
                </Link>
              </>
            )}
          </div>
        </div>
      </header>

      {/* Hero Section */}
      <section className="relative overflow-hidden pt-16 pb-20 lg:pt-24 lg:pb-28">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 relative z-10 text-center">
          <div className="inline-flex items-center gap-2 px-3 py-1.5 rounded-full bg-amber-100 dark:bg-amber-950/60 text-amber-900 dark:text-amber-200 text-xs font-semibold uppercase tracking-wider mb-8 border border-amber-200 dark:border-amber-900/60 shadow-sm">
            <Sparkles className="w-3.5 h-3.5" />
            Metodología Educativa Integral de 4 Niveles
          </div>

          <h1 className="text-4xl sm:text-5xl lg:text-6xl font-extrabold tracking-tight max-w-4xl mx-auto leading-tight">
            Aprende, comprende y memoriza la Palabra de Dios con profundidad
          </h1>

          <p className="mt-6 text-lg sm:text-xl text-stone-600 dark:text-stone-300 max-w-2xl mx-auto leading-relaxed">
            Biblionario no es un juego de trivia superficial. Es una plataforma pedagógica diseñada para que estudies por tu cuenta, avances progresivamente y evalúes con rigor tu conocimiento bíblico en base a la traducción <strong>Reina-Valera 1960</strong>.
          </p>

          <div className="mt-10 flex flex-col sm:flex-row items-center justify-center gap-4">
            <Link href={authData ? "/dashboard" : "/register"}>
              <Button size="lg" className="w-full sm:w-auto text-base px-8 py-3.5 shadow-lg shadow-amber-600/30">
                {authData ? "Continuar con Efesios" : "Comenzar con Efesios 1"}
                <ArrowRight className="w-5 h-5 ml-2" />
              </Button>
            </Link>
            <Link href="/libros/efesios">
              <Button variant="outline" size="lg" className="w-full sm:w-auto text-base px-6 py-3.5">
                Ver Contenido del Libro
              </Button>
            </Link>
          </div>

          <div className="mt-12 flex items-center justify-center gap-8 text-xs font-medium text-stone-500 dark:text-stone-400">
            <span className="flex items-center gap-1.5">
              <CheckCircle2 className="w-4 h-4 text-emerald-500" /> Efesios Completo (6 Capítulos)
            </span>
            <span className="flex items-center gap-1.5">
              <CheckCircle2 className="w-4 h-4 text-emerald-500" /> 22 Bloques de Estudio
            </span>
            <span className="flex items-center gap-1.5">
              <CheckCircle2 className="w-4 h-4 text-emerald-500" /> Sin vidas artificiales ni trucos
            </span>
          </div>
        </div>
      </section>

      {/* 4 Levels Methodology Section */}
      <section className="py-20 bg-stone-100/60 dark:bg-stone-900/50 border-y border-stone-200 dark:border-stone-800">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <div className="text-center max-w-3xl mx-auto mb-16">
            <h2 className="text-xs font-bold text-amber-600 dark:text-amber-400 uppercase tracking-widest">
              El Sistema de Aprendizaje
            </h2>
            <h3 className="text-3xl font-extrabold tracking-tight mt-2 text-stone-900 dark:text-stone-100">
              Una Metodología Progresiva en 4 Niveles
            </h3>
            <p className="mt-3 text-stone-600 dark:text-stone-400">
              Diseñado para construir conocimiento sólido y duradero paso a paso.
            </p>
          </div>

          <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6">
            {/* Nivel 1 */}
            <div className="bg-white dark:bg-stone-900 p-6 rounded-2xl border border-stone-200 dark:border-stone-800 shadow-sm relative overflow-hidden flex flex-col justify-between">
              <div>
                <div className="w-12 h-12 rounded-xl bg-amber-100 dark:bg-amber-950/60 text-amber-700 dark:text-amber-300 flex items-center justify-center font-bold mb-4">
                  <BookOpen className="w-6 h-6" />
                </div>
                <span className="text-xs font-bold uppercase tracking-wider text-amber-600">Nivel 1</span>
                <h4 className="text-lg font-bold text-stone-900 dark:text-stone-100 mt-1 mb-2">
                  Estudio & Comprensión
                </h4>
                <p className="text-sm text-stone-600 dark:text-stone-400 leading-relaxed">
                  Bloques temáticos con introducción, explicación versículo por versículo, conceptos clave, ideas centrales y lectura directa en tu Biblia RVR1960.
                </p>
              </div>
              <div className="mt-6 pt-4 border-t border-stone-100 dark:border-stone-800 text-xs font-semibold text-stone-500">
                Lectura obligatoria verificada
              </div>
            </div>

            {/* Nivel 2 */}
            <div className="bg-white dark:bg-stone-900 p-6 rounded-2xl border border-stone-200 dark:border-stone-800 shadow-sm relative overflow-hidden flex flex-col justify-between">
              <div>
                <div className="w-12 h-12 rounded-xl bg-sky-100 dark:bg-sky-950/60 text-sky-700 dark:text-sky-300 flex items-center justify-center font-bold mb-4">
                  <BrainCircuit className="w-6 h-6" />
                </div>
                <span className="text-xs font-bold uppercase tracking-wider text-sky-600">Nivel 2</span>
                <h4 className="text-lg font-bold text-stone-900 dark:text-stone-100 mt-1 mb-2">
                  Evaluación del Bloque
                </h4>
                <p className="text-sm text-stone-600 dark:text-stone-400 leading-relaxed">
                  Evaluaciones con 5 tipos de preguntas: comprensión, memoria bíblica, identificación de referencias textuales, verdadero/falso y ordenación.
                </p>
              </div>
              <div className="mt-6 pt-4 border-t border-stone-100 dark:border-stone-800 text-xs font-semibold text-stone-500">
                Retroalimentación inmediata
              </div>
            </div>

            {/* Nivel 3 */}
            <div className="bg-white dark:bg-stone-900 p-6 rounded-2xl border border-stone-200 dark:border-stone-800 shadow-sm relative overflow-hidden flex flex-col justify-between">
              <div>
                <div className="w-12 h-12 rounded-xl bg-indigo-100 dark:bg-indigo-950/60 text-indigo-700 dark:text-indigo-300 flex items-center justify-center font-bold mb-4">
                  <Layers className="w-6 h-6" />
                </div>
                <span className="text-xs font-bold uppercase tracking-wider text-indigo-600">Nivel 3</span>
                <h4 className="text-lg font-bold text-stone-900 dark:text-stone-100 mt-1 mb-2">
                  Examen de Capítulo
                </h4>
                <p className="text-sm text-stone-600 dark:text-stone-400 leading-relaxed">
                  Se desbloquea al completar todos los bloques. Examen de 25 preguntas que integra temas, referencias y doctrinas de todo el capítulo.
                </p>
              </div>
              <div className="mt-6 pt-4 border-t border-stone-100 dark:border-stone-800 text-xs font-semibold text-stone-500">
                Historial de intentos guardado
              </div>
            </div>

            {/* Nivel 4 */}
            <div className="bg-white dark:bg-stone-900 p-6 rounded-2xl border border-stone-200 dark:border-stone-800 shadow-sm relative overflow-hidden flex flex-col justify-between">
              <div>
                <div className="w-12 h-12 rounded-xl bg-emerald-100 dark:bg-emerald-950/60 text-emerald-700 dark:text-emerald-300 flex items-center justify-center font-bold mb-4">
                  <Award className="w-6 h-6" />
                </div>
                <span className="text-xs font-bold uppercase tracking-wider text-emerald-600">Nivel 4</span>
                <h4 className="text-lg font-bold text-stone-900 dark:text-stone-100 mt-1 mb-2">
                  Examen Final del Libro
                </h4>
                <p className="text-sm text-stone-600 dark:text-stone-400 leading-relaxed">
                  Evaluación final de 50 preguntas integradoras de Efesios 1 al 6. Conoce tu puntuación global y tu dominio específico por cada capítulo.
                </p>
              </div>
              <div className="mt-6 pt-4 border-t border-stone-100 dark:border-stone-800 text-xs font-semibold text-stone-500">
                Certificación del libro
              </div>
            </div>
          </div>
        </div>
      </section>

      {/* Book of Ephesians Showcase */}
      <section className="py-20">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <div className="bg-gradient-to-br from-amber-700 via-amber-800 to-stone-900 rounded-3xl p-8 sm:p-12 text-white shadow-2xl relative overflow-hidden">
            <div className="max-w-2xl relative z-10">
              <span className="inline-flex items-center gap-1.5 px-3 py-1 rounded-full bg-amber-500/30 text-amber-200 text-xs font-bold tracking-wider uppercase mb-4 border border-amber-400/30">
                <BookmarkCheck className="w-4 h-4" /> Primer Contenido Disponible
              </span>
              <h2 className="text-3xl sm:text-4xl font-extrabold tracking-tight">
                El Libro de Efesios Completo
              </h2>
              <p className="mt-4 text-amber-100/90 leading-relaxed">
                Descubre las riquezas insondables de la gracia de Dios, el misterio de la Iglesia como un solo cuerpo en Cristo y las pautas prácticas para la vida cristiana, el matrimonio y la armadura espiritual.
              </p>

              <div className="mt-8 flex flex-wrap gap-4">
                <Link href={authData ? "/libros/efesios" : "/register"}>
                  <Button variant="secondary" size="lg" className="font-bold text-amber-950 bg-white hover:bg-amber-50">
                    Comenzar Estudio de Efesios
                    <ArrowRight className="w-4 h-4 ml-2" />
                  </Button>
                </Link>
              </div>
            </div>
          </div>
        </div>
      </section>

      {/* Footer */}
      <footer className="mt-auto border-t border-stone-200 dark:border-stone-800 bg-white dark:bg-stone-900 py-8 text-center text-xs text-stone-500 dark:text-stone-400">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <p>
            Biblionario – Plataforma Interactiva de Aprendizaje Bíblico Progresivo
          </p>
          <p className="mt-1">
            Basado en la traducción Reina-Valera 1960 (RVR1960). Todos los derechos reservados.
          </p>
        </div>
      </footer>
    </div>
  );
}
