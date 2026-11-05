import { redirect } from "next/navigation";
import Link from "next/link";
import { getCurrentUser } from "@/actions/auth.actions";
import { createClient } from "@/lib/supabase/server";
import { Card, CardHeader, CardTitle, CardContent } from "@/components/ui/Card";
import { Badge } from "@/components/ui/Badge";
import { Button } from "@/components/ui/Button";
import { Progress } from "@/components/ui/Progress";
import {
  History,
  CheckCircle2,
  XCircle,
  Award,
  ArrowRight,
  Calendar,
  Layers,
  BookOpen,
  TrendingUp,
} from "lucide-react";

export const dynamic = "force-dynamic";

interface AttemptItem {
  id: string;
  score: number;
  max_score: number;
  percentage: number;
  passed: boolean;
  completed_at: string;
  assessment: {
    id: string;
    title: string;
    type: string;
    passing_score_percentage: number;
  };
}

export default async function HistoryPage() {
  const authData = await getCurrentUser();

  if (!authData) {
    redirect("/login");
  }

  const supabase = await createClient();

  // Obtener historial completo de intentos del usuario
  const { data: attempts } = await supabase
    .from("assessment_attempts")
    .select(`
      id,
      score,
      max_score,
      percentage,
      passed,
      completed_at,
      assessment:assessments!inner(
        id,
        title,
        type,
        passing_score_percentage
      )
    `)
    .eq("user_id", authData.user.id)
    .eq("status", "completed")
    .order("completed_at", { ascending: false })
    .returns<AttemptItem[]>();

  const history = attempts || [];
  const totalAttempts = history.length;
  const passedAttempts = history.filter((a) => a.passed).length;
  const avgScore =
    totalAttempts > 0
      ? Math.round(
          history.reduce((acc, curr) => acc + Number(curr.percentage), 0) / totalAttempts
        )
      : 0;

  return (
    <div className="space-y-8 pb-16">
      {/* Header */}
      <div className="flex flex-col sm:flex-row sm:items-center justify-between gap-4 pb-4 border-b border-stone-200 dark:border-stone-800">
        <div>
          <span className="text-xs font-bold uppercase tracking-wider text-amber-600 dark:text-amber-400">
            Registro Histórico
          </span>
          <h1 className="text-2xl sm:text-3xl font-extrabold text-stone-900 dark:text-stone-100 tracking-tight mt-0.5">
            Historial de Evaluaciones y Progreso
          </h1>
          <p className="text-sm text-stone-500 dark:text-stone-400 mt-1">
            Revisa todos tus intentos realizados, puntuaciones obtenidas y evolución de aprendizaje.
          </p>
        </div>

        <Link href="/dashboard">
          <Button variant="outline" size="sm">
            Volver al Dashboard
          </Button>
        </Link>
      </div>

      {/* Tarjetas de Resumen General */}
      <div className="grid grid-cols-1 sm:grid-cols-3 gap-5">
        <Card>
          <CardHeader className="flex flex-row items-center justify-between pb-2">
            <CardTitle className="text-xs font-bold uppercase tracking-wider text-stone-500">
              Evaluaciones Realizadas
            </CardTitle>
            <History className="w-4 h-4 text-amber-600" />
          </CardHeader>
          <CardContent>
            <div className="text-3xl font-black text-stone-900 dark:text-stone-100">
              {totalAttempts}
            </div>
            <p className="text-xs text-stone-500 mt-1">Intentos registrados en total</p>
          </CardContent>
        </Card>

        <Card>
          <CardHeader className="flex flex-row items-center justify-between pb-2">
            <CardTitle className="text-xs font-bold uppercase tracking-wider text-stone-500">
              Evaluaciones Aprobadas
            </CardTitle>
            <CheckCircle2 className="w-4 h-4 text-emerald-600" />
          </CardHeader>
          <CardContent>
            <div className="text-3xl font-black text-emerald-600 dark:text-emerald-400">
              {passedAttempts}
            </div>
            <p className="text-xs text-stone-500 mt-1">
              {totalAttempts > 0
                ? `${Math.round((passedAttempts / totalAttempts) * 100)}% de efectividad`
                : "Sin evaluaciones"}
            </p>
          </CardContent>
        </Card>

        <Card>
          <CardHeader className="flex flex-row items-center justify-between pb-2">
            <CardTitle className="text-xs font-bold uppercase tracking-wider text-stone-500">
              Puntuación Promedio
            </CardTitle>
            <TrendingUp className="w-4 h-4 text-indigo-600" />
          </CardHeader>
          <CardContent>
            <div className="text-3xl font-black text-stone-900 dark:text-stone-100">
              {avgScore}%
            </div>
            <p className="text-xs text-stone-500 mt-1">Nivel general de acierto</p>
          </CardContent>
        </Card>
      </div>

      {/* Lista Histórica de Intentos */}
      <div className="space-y-4">
        <h2 className="text-lg font-bold text-stone-900 dark:text-stone-100">
          Detalle Cronológico de Intentos
        </h2>

        {history.length === 0 ? (
          <Card className="p-12 text-center space-y-4">
            <History className="w-12 h-12 text-stone-300 dark:text-stone-700 mx-auto" />
            <h3 className="text-base font-bold text-stone-700 dark:text-stone-300">
              Aún no has realizado ninguna evaluación
            </h3>
            <p className="text-xs text-stone-500 max-w-sm mx-auto">
              Comienza a estudiar los bloques de Efesios y realiza tu primera evaluación para que aparezca aquí tu historial.
            </p>
            <Link href="/libros/efesios">
              <Button variant="primary" size="md">
                Ir a Efesios
              </Button>
            </Link>
          </Card>
        ) : (
          <div className="space-y-3">
            {history.map((attempt) => {
              const formattedDate = attempt.completed_at
                ? new Date(attempt.completed_at).toLocaleDateString("es-ES", {
                    year: "numeric",
                    month: "long",
                    day: "numeric",
                    hour: "2-digit",
                    minute: "2-digit",
                  })
                : "Fecha no disponible";

              return (
                <Card
                  key={attempt.id}
                  className="hover:border-amber-300 dark:hover:border-amber-700 transition-colors"
                >
                  <div className="p-4 sm:p-5 flex flex-col sm:flex-row sm:items-center justify-between gap-4">
                    <div className="space-y-1">
                      <div className="flex items-center gap-2">
                        <Badge
                          variant={
                            attempt.assessment.type === "book_final"
                              ? "default"
                              : attempt.assessment.type === "chapter_exam"
                              ? "info"
                              : "outline"
                          }
                          className="text-[11px]"
                        >
                          {attempt.assessment.type === "block_quiz" && "Quiz de Bloque"}
                          {attempt.assessment.type === "chapter_exam" && "Examen de Capítulo"}
                          {attempt.assessment.type === "book_final" && "Examen Final"}
                        </Badge>
                        <span className="text-xs text-stone-400 flex items-center gap-1">
                          <Calendar className="w-3 h-3" />
                          {formattedDate}
                        </span>
                      </div>

                      <h3 className="text-base font-bold text-stone-900 dark:text-stone-100">
                        {attempt.assessment.title}
                      </h3>
                    </div>

                    <div className="flex items-center justify-between sm:justify-end gap-6 sm:flex-shrink-0">
                      <div className="text-right">
                        <div className="flex items-center gap-2">
                          <span className="text-lg font-black text-stone-900 dark:text-stone-100">
                            {attempt.score}/{attempt.max_score}
                          </span>
                          <Badge variant={attempt.passed ? "success" : "danger"}>
                            {attempt.percentage}%
                          </Badge>
                        </div>
                        <span className="text-[11px] text-stone-400 block mt-0.5">
                          {attempt.passed ? "Aprobado" : "Reprobado"} (Mínimo {attempt.assessment.passing_score_percentage}%)
                        </span>
                      </div>

                      <Link href={`/resultados/${attempt.id}`}>
                        <Button variant="outline" size="sm" className="gap-1 text-xs">
                          Ver Corrección <ArrowRight className="w-3.5 h-3.5" />
                        </Button>
                      </Link>
                    </div>
                  </div>
                </Card>
              );
            })}
          </div>
        )}
      </div>
    </div>
  );
}

