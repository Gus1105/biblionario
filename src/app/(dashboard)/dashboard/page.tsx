import Link from "next/link";
import { getCurrentUser } from "@/actions/auth.actions";
import { getUserDashboardStats } from "@/services/study.service";
import { Card, CardHeader, CardTitle, CardDescription, CardContent } from "@/components/ui/Card";
import { Button } from "@/components/ui/Button";
import { Progress } from "@/components/ui/Progress";
import { Badge } from "@/components/ui/Badge";
import {
  BookOpen,
  Award,
  BookMarked,
  Layers,
  ArrowRight,
  TrendingUp,
  Sparkles,
  CheckCircle2,
  Calendar,
} from "lucide-react";

export const dynamic = "force-dynamic";

export default async function DashboardPage() {
  const authData = await getCurrentUser();
  const userId = authData?.user.id;
  const stats = userId
    ? await getUserDashboardStats(userId)
    : {
        totalBlocks: 22,
        completedBlocks: 0,
        totalChapters: 6,
        passedChapters: 0,
        averageScore: 0,
        overallPercentage: 0,
        finalExamPassed: false,
        nextStep: null,
      };

  const userName = authData?.profile.full_name || authData?.profile.email.split("@")[0] || "Estudiante";

  return (
    <div className="space-y-8">
      {/* Saludo & Bienvenida */}
      <div className="flex flex-col md:flex-row md:items-center md:justify-between gap-4 pb-4 border-b border-stone-200 dark:border-stone-800">
        <div>
          <span className="text-xs font-bold uppercase tracking-wider text-amber-600 dark:text-amber-400">
            Plataforma Biblionario
          </span>
          <h1 className="text-2xl sm:text-3xl font-extrabold text-stone-900 dark:text-stone-100 tracking-tight mt-0.5">
            ¡La gracia y paz sean contigo, {userName}!
          </h1>
          <p className="text-sm text-stone-500 dark:text-stone-400 mt-1">
            Continúa avanzando en tu aprendizaje sistemático del libro de Efesios (RVR1960).
          </p>
        </div>

        <div className="flex items-center gap-3">
          <Link href="/libros/efesios">
            <Button variant="primary" size="md">
              <BookOpen className="w-4 h-4 mr-1.5" />
              Ver Efesios
            </Button>
          </Link>
        </div>
      </div>

      {/* Tarjeta de Siguiente Paso / Continuar Estudiando */}
      {stats.nextStep ? (
        <div className="bg-gradient-to-r from-amber-600 via-amber-700 to-stone-800 rounded-2xl p-6 sm:p-8 text-white shadow-lg relative overflow-hidden">
          <div className="max-w-2xl relative z-10">
            <div className="inline-flex items-center gap-1.5 px-3 py-1 rounded-full bg-white/20 backdrop-blur-sm text-amber-100 text-xs font-bold tracking-wider uppercase mb-3">
              <Sparkles className="w-3.5 h-3.5" /> Continuar Estudiando
            </div>
            <h2 className="text-2xl font-bold tracking-tight">{stats.nextStep.title}</h2>
            <p className="mt-2 text-amber-100/90 text-sm leading-relaxed">
              {stats.nextStep.description}
            </p>
            <div className="mt-6">
              <Link href={stats.nextStep.href}>
                <Button
                  size="md"
                  className="bg-white text-stone-900 hover:bg-stone-100 font-bold shadow-md"
                >
                  {stats.nextStep.actionLabel}
                  <ArrowRight className="w-4 h-4 ml-2" />
                </Button>
              </Link>
            </div>
          </div>
        </div>
      ) : (
        <div className="bg-gradient-to-r from-emerald-600 to-teal-800 rounded-2xl p-6 sm:p-8 text-white shadow-lg">
          <h2 className="text-2xl font-bold">¡Bienvenido a Biblionario!</h2>
          <p className="mt-2 text-emerald-100 text-sm">
            Comienza tu recorrido bíblico en Efesios 1:1 estudiando los primeros versículos.
          </p>
          <div className="mt-6">
            <Link href="/libros/efesios">
              <Button size="md" className="bg-white text-emerald-900 hover:bg-emerald-50 font-bold">
                Comenzar Estudio
                <ArrowRight className="w-4 h-4 ml-2" />
              </Button>
            </Link>
          </div>
        </div>
      )}

      {/* Tarjetas de Métricas de Progreso */}
      <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-5">
        <Card>
          <CardHeader className="flex flex-row items-center justify-between pb-2">
            <CardTitle className="text-xs font-bold uppercase tracking-wider text-stone-500">
              Progreso en Efesios
            </CardTitle>
            <div className="w-8 h-8 rounded-lg bg-amber-100 dark:bg-amber-950/60 text-amber-700 dark:text-amber-300 flex items-center justify-center">
              <BookMarked className="w-4 h-4" />
            </div>
          </CardHeader>
          <CardContent>
            <div className="text-2xl font-black text-stone-900 dark:text-stone-100">
              {stats.overallPercentage}%
            </div>
            <p className="text-xs text-stone-500 mt-1 mb-3">
              {stats.completedBlocks} de {stats.totalBlocks} bloques completados
            </p>
            <Progress value={stats.overallPercentage} />
          </CardContent>
        </Card>

        <Card>
          <CardHeader className="flex flex-row items-center justify-between pb-2">
            <CardTitle className="text-xs font-bold uppercase tracking-wider text-stone-500">
              Capítulos Completados
            </CardTitle>
            <div className="w-8 h-8 rounded-lg bg-indigo-100 dark:bg-indigo-950/60 text-indigo-700 dark:text-indigo-300 flex items-center justify-center">
              <Layers className="w-4 h-4" />
            </div>
          </CardHeader>
          <CardContent>
            <div className="text-2xl font-black text-stone-900 dark:text-stone-100">
              {stats.passedChapters} / {stats.totalChapters}
            </div>
            <p className="text-xs text-stone-500 mt-1 mb-3">
              Con exámenes generales aprobados
            </p>
            <Progress
              value={(stats.passedChapters / stats.totalChapters) * 100}
              colorClass="bg-indigo-500"
            />
          </CardContent>
        </Card>

        <Card>
          <CardHeader className="flex flex-row items-center justify-between pb-2">
            <CardTitle className="text-xs font-bold uppercase tracking-wider text-stone-500">
              Puntuación Promedio
            </CardTitle>
            <div className="w-8 h-8 rounded-lg bg-emerald-100 dark:bg-emerald-950/60 text-emerald-700 dark:text-emerald-300 flex items-center justify-center">
              <TrendingUp className="w-4 h-4" />
            </div>
          </CardHeader>
          <CardContent>
            <div className="text-2xl font-black text-stone-900 dark:text-stone-100">
              {stats.averageScore}%
            </div>
            <p className="text-xs text-stone-500 mt-1 mb-3">
              Demostrado en evaluaciones y exámenes
            </p>
            <Progress
              value={stats.averageScore}
              colorClass="bg-emerald-500"
            />
          </CardContent>
        </Card>

        <Card>
          <CardHeader className="flex flex-row items-center justify-between pb-2">
            <CardTitle className="text-xs font-bold uppercase tracking-wider text-stone-500">
              Examen Final del Libro
            </CardTitle>
            <div className="w-8 h-8 rounded-lg bg-purple-100 dark:bg-purple-950/60 text-purple-700 dark:text-purple-300 flex items-center justify-center">
              <Award className="w-4 h-4" />
            </div>
          </CardHeader>
          <CardContent>
            <div className="mt-1">
              {stats.finalExamPassed ? (
                <Badge variant="success">Completado</Badge>
              ) : stats.passedChapters === stats.totalChapters ? (
                <Badge variant="warning">Disponible</Badge>
              ) : (
                <Badge variant="outline">Bloqueado</Badge>
              )}
            </div>
            <p className="text-xs text-stone-500 mt-2">
              Se desbloquea al aprobar los 6 capítulos
            </p>
          </CardContent>
        </Card>
      </div>

      {/* Acceso Rápido al Libro de Efesios */}
      <div className="space-y-4">
        <div className="flex items-center justify-between">
          <h2 className="text-lg font-bold text-stone-900 dark:text-stone-100">
            Libro de Estudio Actual
          </h2>
          <Link
            href="/libros/efesios"
            className="text-xs font-semibold text-amber-600 hover:text-amber-700 dark:text-amber-400 flex items-center gap-1"
          >
            Ver detalle completo <ArrowRight className="w-3.5 h-3.5" />
          </Link>
        </div>

        <Card className="hover:border-amber-300 dark:hover:border-amber-700 transition-colors">
          <div className="p-6 flex flex-col md:flex-row md:items-center justify-between gap-6">
            <div className="space-y-2">
              <div className="flex items-center gap-2">
                <Badge variant="default">Nuevo Testamento</Badge>
                <Badge variant="outline">6 Capítulos</Badge>
                <Badge variant="outline">22 Bloques</Badge>
              </div>
              <h3 className="text-xl font-bold text-stone-900 dark:text-stone-100">
                Epístola a los Efesios
              </h3>
              <p className="text-sm text-stone-600 dark:text-stone-400 max-w-2xl leading-relaxed">
                Estudio versículo por versículo de las bendiciones espirituales, la reconciliación del judío y el gentil en un solo cuerpo, el llamamiento a la santidad, las relaciones familiares y la armadura de Dios.
              </p>
            </div>

            <div className="flex flex-col sm:flex-row items-center gap-3 md:min-w-[200px]">
              <Link href="/libros/efesios" className="w-full">
                <Button variant="primary" className="w-full">
                  Abrir Efesios
                  <ArrowRight className="w-4 h-4 ml-1.5" />
                </Button>
              </Link>
            </div>
          </div>
        </Card>
      </div>
    </div>
  );
}

