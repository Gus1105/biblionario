import { notFound } from "next/navigation";
import Link from "next/link";
import { getCurrentUser } from "@/actions/auth.actions";
import { getBookWithChapters } from "@/services/study.service";
import { Card, CardHeader, CardTitle, CardDescription, CardContent } from "@/components/ui/Card";
import { Badge } from "@/components/ui/Badge";
import { Button } from "@/components/ui/Button";
import { Progress } from "@/components/ui/Progress";
import {
  BookOpen,
  CheckCircle2,
  Lock,
  ArrowRight,
  Layers,
  Award,
  Sparkles,
  BookMarked,
} from "lucide-react";

interface BookPageProps {
  params: Promise<{
    slug: string;
  }>;
}

export const dynamic = "force-dynamic";

export default async function BookPage({ params }: BookPageProps) {
  const { slug } = await params;
  const authData = await getCurrentUser();
  const userId = authData?.user.id;

  const bookData = await getBookWithChapters(slug, userId);

  if (!bookData) {
    notFound();
  }

  const chapters = bookData.chapters || [];
  const finalExam = bookData.finalExam;
  const isFinalExamUnlocked = bookData.userProgress?.final_exam_unlocked || false;
  const isFinalExamPassed = bookData.userProgress?.final_exam_passed || false;

  return (
    <div className="space-y-8">
      {/* Encabezado del Libro */}
      <div className="bg-gradient-to-br from-amber-700 via-amber-800 to-stone-900 rounded-3xl p-6 sm:p-10 text-white shadow-xl relative overflow-hidden">
        <div className="relative z-10 max-w-3xl">
          <div className="flex items-center gap-2 mb-3">
            <span className="px-3 py-1 rounded-full bg-white/20 backdrop-blur-sm text-xs font-bold uppercase tracking-wider text-amber-100">
              {bookData.testament === "nuevo" ? "Nuevo Testamento" : "Antiguo Testamento"}
            </span>
            <span className="px-3 py-1 rounded-full bg-amber-500/30 text-xs font-semibold text-amber-200">
              6 Capítulos • 22 Bloques
            </span>
          </div>

          <h1 className="text-3xl sm:text-4xl font-extrabold tracking-tight">
            {bookData.name}
          </h1>

          <p className="mt-3 text-amber-100/90 text-sm sm:text-base leading-relaxed">
            {bookData.description ||
              "Estudio profundo y sistemático de la carta del apóstol Pablo a los efesios. Explora las bendiciones celestiales, la reconciliación por la cruz, la edificación del cuerpo de Cristo y las virtudes del andar cristiano."}
          </p>

          <div className="mt-6 flex items-center gap-4 text-xs font-medium text-amber-200">
            <span className="flex items-center gap-1.5">
              <BookMarked className="w-4 h-4" /> Traducción: Reina-Valera 1960
            </span>
            <span className="flex items-center gap-1.5">
              <Sparkles className="w-4 h-4" /> Metodología de 4 Niveles
            </span>
          </div>
        </div>
      </div>

      {/* Grid de Capítulos */}
      <div>
        <div className="flex items-center justify-between mb-6">
          <div>
            <h2 className="text-xl font-bold text-stone-900 dark:text-stone-100">
              Capítulos de Efesios
            </h2>
            <p className="text-xs text-stone-500 mt-0.5">
              Completa todos los bloques de estudio de cada capítulo para desbloquear su examen general
            </p>
          </div>
        </div>

        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
          {chapters.map((chapter: any) => {
            const progress = chapter.userProgress;
            const isCompleted = progress?.exam_passed;
            const isExamUnlocked = progress?.exam_unlocked;
            const hasStarted = progress !== null;
            const isLocked = chapter.isLocked ?? false;

            return (
              <Card
                key={chapter.id}
                className={`flex flex-col justify-between hover:shadow-md transition-shadow relative overflow-hidden ${
                  isLocked ? "opacity-75 bg-stone-50/50 dark:bg-stone-900/40 border-dashed" : ""
                }`}
              >
                <CardHeader>
                  <div className="flex items-start justify-between gap-2 mb-2">
                    <span className="text-xs font-bold uppercase tracking-wider text-amber-600 dark:text-amber-400">
                      Capítulo {chapter.chapter_number}
                    </span>
                    {isLocked ? (
                      <Badge variant="outline" className="text-stone-400 dark:text-stone-500 gap-1 border-stone-300 dark:border-stone-750">
                        <Lock className="w-3 h-3" /> Bloqueado
                      </Badge>
                    ) : isCompleted ? (
                      <Badge variant="success">Completado</Badge>
                    ) : isExamUnlocked ? (
                      <Badge variant="warning">Examen Listo</Badge>
                    ) : hasStarted ? (
                      <Badge variant="info">En Progreso</Badge>
                    ) : (
                      <Badge variant="outline">No Iniciado</Badge>
                    )}
                  </div>

                  <CardTitle className="text-lg">
                    {chapter.title}
                  </CardTitle>

                  <CardDescription className="line-clamp-2 mt-1.5">
                    {chapter.summary || "Estudio temático versículo a versículo."}
                  </CardDescription>
                </CardHeader>

                <CardContent className="space-y-4">
                  <div className="flex items-center justify-between text-xs text-stone-500 pt-2 border-t border-stone-100 dark:border-stone-800">
                    <span className="flex items-center gap-1">
                      <Layers className="w-3.5 h-3.5" />
                      {chapter.blocksCount} Bloques de estudio
                    </span>
                    {progress?.best_score ? (
                      <span className="font-semibold text-emerald-600 dark:text-emerald-400">
                        Examen: {progress.best_score}%
                      </span>
                    ) : (
                      <span>Examen: Pendiente</span>
                    )}
                  </div>

                  {isLocked ? (
                    <div className="space-y-2">
                      <div className="text-[11px] font-medium text-amber-700/80 dark:text-amber-400/80 bg-amber-50 dark:bg-amber-950/30 p-2 rounded-lg flex items-center gap-1.5">
                        <Lock className="w-3 h-3 flex-shrink-0" />
                        <span>Requiere aprobar el Capítulo {chapter.chapter_number - 1}</span>
                      </div>
                      <Button
                        variant="secondary"
                        disabled
                        className="w-full text-xs opacity-60 cursor-not-allowed gap-1.5"
                      >
                        <Lock className="w-3.5 h-3.5" /> Capítulo Bloqueado
                      </Button>
                    </div>
                  ) : (
                    <Link
                      href={`/libros/${bookData.slug}/capitulos/${chapter.chapter_number}`}
                      className="block"
                    >
                      <Button
                        variant={isCompleted ? "outline" : "primary"}
                        className="w-full text-xs"
                      >
                        {isCompleted
                          ? "Repasar Capítulo"
                          : hasStarted
                          ? "Continuar Capítulo"
                          : "Comenzar Capítulo"}
                        <ArrowRight className="w-3.5 h-3.5 ml-1.5" />
                      </Button>
                    </Link>
                  )}
                </CardContent>
              </Card>
            );
          })}
        </div>
      </div>

      {/* Nivel 4: Tarjeta del Examen Final de Efesios */}
      <div className="pt-4">
        <Card
          className={`border-2 ${
            isFinalExamPassed
              ? "border-emerald-500 bg-emerald-50/20 dark:bg-emerald-950/20"
              : isFinalExamUnlocked
              ? "border-amber-500 bg-amber-50/20 dark:bg-amber-950/20"
              : "border-stone-200 dark:border-stone-800 opacity-90"
          }`}
        >
          <div className="p-6 sm:p-8 flex flex-col md:flex-row md:items-center justify-between gap-6">
            <div className="space-y-3">
              <div className="flex items-center gap-2">
                <Badge
                  variant={
                    isFinalExamPassed
                      ? "success"
                      : isFinalExamUnlocked
                      ? "warning"
                      : "outline"
                  }
                >
                  Nivel 4 • Evaluación Integral
                </Badge>
                <span className="text-xs text-stone-500">50 Preguntas Multitemáticas</span>
              </div>

              <div>
                <h3 className="text-xl font-black text-stone-900 dark:text-stone-100 flex items-center gap-2">
                  <Award className="w-6 h-6 text-amber-500" />
                  Examen Final del Libro de Efesios
                </h3>
                <p className="text-sm text-stone-600 dark:text-stone-400 mt-1 max-w-2xl leading-relaxed">
                  Evalúa de forma integral tu comprensión y memoria de los 6 capítulos: temas centrales, identificación de referencias bíblicas, citas textuales y relaciones teológicas de la carta.
                </p>
              </div>

              {!isFinalExamUnlocked && !isFinalExamPassed && (
                <div className="flex items-center gap-2 text-xs text-stone-500 font-medium">
                  <Lock className="w-3.5 h-3.5" />
                  <span>Requiere haber aprobado los exámenes generales de los 6 capítulos.</span>
                </div>
              )}
            </div>

            <div className="flex-shrink-0">
              {finalExam && (isFinalExamUnlocked || isFinalExamPassed) ? (
                <Link href={`/evaluaciones/${finalExam.id}`}>
                  <Button variant="primary" size="lg" className="w-full sm:w-auto font-bold shadow-md">
                    {isFinalExamPassed ? "Repetir Examen Final" : "Comenzar Examen Final"}
                    <ArrowRight className="w-4 h-4 ml-2" />
                  </Button>
                </Link>
              ) : (
                <Button variant="secondary" size="lg" disabled className="w-full sm:w-auto">
                  <Lock className="w-4 h-4 mr-2" />
                  Bloqueado
                </Button>
              )}
            </div>
          </div>
        </Card>
      </div>
    </div>
  );
}
