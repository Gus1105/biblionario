import { notFound, redirect } from "next/navigation";
import Link from "next/link";
import { getCurrentUser } from "@/actions/auth.actions";
import { getAttemptResult } from "@/services/assessment.service";
import { Card, CardHeader, CardTitle, CardContent } from "@/components/ui/Card";
import { Badge } from "@/components/ui/Badge";
import { Button } from "@/components/ui/Button";
import { Progress } from "@/components/ui/Progress";
import {
  CheckCircle2,
  XCircle,
  Award,
  ArrowRight,
  RotateCcw,
  BookOpen,
  HelpCircle,
  Layers,
} from "lucide-react";

interface ResultPageProps {
  params: Promise<{
    attemptId: string;
  }>;
}

export const dynamic = "force-dynamic";

export default async function ResultPage({ params }: ResultPageProps) {
  const { attemptId } = await params;
  const authData = await getCurrentUser();

  if (!authData) {
    redirect("/login");
  }

  const result = await getAttemptResult(attemptId, authData.user.id);

  if (!result) {
    notFound();
  }

  const isPassed = result.passed;

  return (
    <div className="max-w-4xl mx-auto space-y-8 pb-16">
      {/* Tarjeta de Resumen del Resultado */}
      <div
        className={`rounded-3xl p-6 sm:p-10 text-white shadow-xl relative overflow-hidden ${
          isPassed
            ? "bg-gradient-to-br from-emerald-600 via-teal-700 to-stone-900"
            : "bg-gradient-to-br from-amber-700 via-rose-800 to-stone-900"
        }`}
      >
        <div className="relative z-10 flex flex-col md:flex-row md:items-center justify-between gap-6">
          <div className="space-y-2">
            <div className="inline-flex items-center gap-1.5 px-3 py-1 rounded-full bg-white/20 backdrop-blur-sm text-xs font-bold uppercase tracking-wider">
              {isPassed ? (
                <>
                  <CheckCircle2 className="w-3.5 h-3.5 text-emerald-200" /> ¡Evaluación Aprobada!
                </>
              ) : (
                <>
                  <XCircle className="w-3.5 h-3.5 text-amber-200" /> Requiere Repaso
                </>
              )}
            </div>

            <h1 className="text-2xl sm:text-3xl font-extrabold tracking-tight">
              {result.assessmentTitle}
            </h1>

            <p className="text-white/80 text-sm max-w-xl">
              {isPassed
                ? "Has demostrado un excelente dominio del contenido estudiado. Tu progreso ha sido registrado exitosamente."
                : `Se requiere un mínimo de ${result.passingScorePercentage}% para aprobar. Revisa los errores y vuelve a intentarlo.`}
            </p>
          </div>

          <div className="bg-white/10 backdrop-blur-md p-5 rounded-2xl border border-white/20 text-center min-w-[200px]">
            <span className="text-xs uppercase font-bold tracking-wider text-white/80">
              Puntuación Final
            </span>
            <div className="text-4xl font-black mt-1">
              {result.score} / {result.maxScore}
            </div>
            <div className="text-lg font-bold text-amber-300 mt-0.5">
              {result.percentage}%
            </div>
            <div className="mt-2 text-xs text-white/70">
              {result.correctCount} correctas • {result.incorrectCount} incorrectas
            </div>
          </div>
        </div>
      </div>

      {/* Botones de Acción Inmediata */}
      <div className="flex flex-wrap items-center justify-between gap-4 p-4 rounded-2xl bg-white dark:bg-stone-900 border border-stone-200 dark:border-stone-800 shadow-sm">
        <Link href={`/evaluaciones/${result.assessmentId}`}>
          <Button variant="outline" size="md" className="gap-2">
            <RotateCcw className="w-4 h-4" /> Volver a Intentar
          </Button>
        </Link>

        <div className="flex flex-wrap items-center gap-3">
          <Link href="/libros/efesios">
            <Button variant="secondary" size="md">
              Volver a Efesios
            </Button>
          </Link>

          {result.nextStep ? (
            <Link href={result.nextStep.href}>
              <Button variant="primary" size="md" className="font-bold shadow-md shadow-amber-600/20 gap-1.5">
                {result.nextStep.label} <ArrowRight className="w-4 h-4 ml-1.5" />
              </Button>
            </Link>
          ) : (
            <Link href="/dashboard">
              <Button variant="primary" size="md">
                Ir al Dashboard <ArrowRight className="w-4 h-4 ml-1.5" />
              </Button>
            </Link>
          )}
        </div>
      </div>

      {/* Desglose y Corrección Pregunta por Pregunta */}
      <div className="space-y-4">
        <div>
          <h2 className="text-xl font-bold text-stone-900 dark:text-stone-100">
            Corrección Detallada de Preguntas
          </h2>
          <p className="text-xs text-stone-500">
            Examina cada respuesta, comprende la clave bíblica y repasa las explicaciones.
          </p>
        </div>

        <div className="space-y-4">
          {result.results.map((item, index) => (
            <Card
              key={item.questionId}
              className={`border-l-4 ${
                item.isCorrect
                  ? "border-l-emerald-500"
                  : "border-l-rose-500"
              }`}
            >
              <CardHeader className="pb-3">
                <div className="flex items-start justify-between gap-2">
                  <span className="text-xs font-bold text-stone-400">
                    Pregunta {index + 1}
                  </span>
                  <div className="flex items-center gap-2">
                    <span className="text-xs font-semibold text-amber-700 dark:text-amber-400 bg-amber-50 dark:bg-amber-950/60 px-2 py-0.5 rounded">
                      {item.verseReference}
                    </span>
                    {item.isCorrect ? (
                      <Badge variant="success" className="gap-1">
                        <CheckCircle2 className="w-3 h-3" /> Correcta (+{item.pointsAwarded} pts)
                      </Badge>
                    ) : (
                      <Badge variant="danger" className="gap-1">
                        <XCircle className="w-3 h-3" /> Incorrecta (0/{item.maxPoints} pts)
                      </Badge>
                    )}
                  </div>
                </div>

                <CardTitle className="text-base font-bold text-stone-900 dark:text-stone-100 pt-1">
                  {item.prompt}
                </CardTitle>
              </CardHeader>

              <CardContent className="space-y-3 pt-0">
                <div className="grid grid-cols-1 sm:grid-cols-2 gap-3 text-xs">
                  <div className="p-3 rounded-xl bg-stone-50 dark:bg-stone-850 border border-stone-200/60 dark:border-stone-800">
                    <span className="block font-semibold uppercase tracking-wider text-stone-500 mb-1">
                      Tu respuesta:
                    </span>
                    <span
                      className={`font-medium ${
                        item.isCorrect
                          ? "text-emerald-700 dark:text-emerald-300"
                          : "text-rose-700 dark:text-rose-300"
                      }`}
                    >
                      {item.userAnswerText}
                    </span>
                  </div>

                  <div className="p-3 rounded-xl bg-emerald-50/50 dark:bg-emerald-950/30 border border-emerald-200/60 dark:border-emerald-900/40">
                    <span className="block font-semibold uppercase tracking-wider text-emerald-800 dark:text-emerald-300 mb-1">
                      Respuesta correcta (RVR1960):
                    </span>
                    <span className="font-medium text-emerald-900 dark:text-emerald-100">
                      {item.correctAnswerText}
                    </span>
                  </div>
                </div>

                {/* Explicación didáctica */}
                {item.explanation && (
                  <div className="p-3.5 rounded-xl bg-amber-50/60 dark:bg-amber-950/20 border border-amber-200/60 dark:border-amber-900/30 text-xs leading-relaxed text-stone-700 dark:text-stone-300">
                    <span className="font-bold text-amber-800 dark:text-amber-300 block mb-0.5">
                      Explicación bíblica:
                    </span>
                    {item.explanation}
                  </div>
                )}
              </CardContent>
            </Card>
          ))}
        </div>
      </div>
    </div>
  );
}

