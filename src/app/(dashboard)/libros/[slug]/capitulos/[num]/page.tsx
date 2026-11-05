import { notFound } from "next/navigation";
import Link from "next/link";
import { getCurrentUser } from "@/actions/auth.actions";
import { getChapterDetail } from "@/services/study.service";
import { Card, CardHeader, CardTitle, CardDescription, CardContent } from "@/components/ui/Card";
import { Badge } from "@/components/ui/Badge";
import { Button } from "@/components/ui/Button";
import { Progress } from "@/components/ui/Progress";
import {
  BookOpen,
  CheckCircle2,
  Lock,
  ArrowRight,
  ArrowLeft,
  Clock,
  Award,
  Layers,
  Sparkles,
  Check,
} from "lucide-react";

interface ChapterPageProps {
  params: Promise<{
    slug: string;
    num: string;
  }>;
}

export const dynamic = "force-dynamic";

export default async function ChapterPage({ params }: ChapterPageProps) {
  const { slug, num } = await params;
  const chapterNumber = parseInt(num, 10);

  if (isNaN(chapterNumber)) {
    notFound();
  }

  const authData = await getCurrentUser();
  const userId = authData?.user.id;

  const data = await getChapterDetail(slug, chapterNumber, userId);

  if (!data) {
    notFound();
  }

  const { book, chapter } = data as {
    book: { id: string; name: string; slug: string };
    chapter: any;
  };
  const blocks = chapter.blocks || [];
  const assessment = chapter.assessment;
  const chapterProgress = chapter.userProgress;

  const totalBlocks = blocks.length;
  const completedBlocks = blocks.filter(
    (b: any) => b.userProgress?.reading_completed && b.userProgress?.quiz_passed
  ).length;

  const isExamUnlocked =
    chapterProgress?.exam_unlocked || completedBlocks === totalBlocks;
  const isExamPassed = chapterProgress?.exam_passed || false;
  const bestScore = chapterProgress?.best_score;

  return (
    <div className="space-y-8">
      {/* Botón de volver a la vista del libro */}
      <div>
        <Link
          href={`/libros/${slug}`}
          className="inline-flex items-center gap-1.5 text-xs font-semibold text-stone-500 hover:text-stone-900 dark:hover:text-stone-100 transition-colors"
        >
          <ArrowLeft className="w-3.5 h-3.5" /> Volver a {book.name}
        </Link>
      </div>

      {/* Encabezado del Capítulo */}
      <div className="bg-white dark:bg-stone-900 border border-stone-200 dark:border-stone-800 rounded-3xl p-6 sm:p-8 shadow-sm">
        <div className="flex flex-col md:flex-row md:items-center justify-between gap-6">
          <div className="space-y-2">
            <div className="flex items-center gap-2">
              <Badge variant="default">
                {book.name} • Capítulo {chapter.chapter_number}
              </Badge>
              <Badge variant="outline">
                {completedBlocks} / {totalBlocks} Bloques listos
              </Badge>
            </div>
            <h1 className="text-2xl sm:text-3xl font-extrabold text-stone-900 dark:text-stone-100 tracking-tight">
              {chapter.title}
            </h1>
            <p className="text-sm text-stone-600 dark:text-stone-400 max-w-3xl leading-relaxed">
              {chapter.summary ||
                "Estudia cada uno de los bloques en orden, lee el pasaje bíblico en tu Biblia RVR1960 y supera las evaluaciones para desbloquear el examen general."}
            </p>
          </div>

          <div className="min-w-[180px] bg-stone-50 dark:bg-stone-850 p-4 rounded-2xl border border-stone-200/60 dark:border-stone-800 text-center">
            <span className="text-[11px] font-bold uppercase tracking-wider text-stone-500">
              Progreso del Capítulo
            </span>
            <div className="text-2xl font-black text-amber-600 dark:text-amber-400 mt-0.5">
              {totalBlocks > 0 ? Math.round((completedBlocks / totalBlocks) * 100) : 0}%
            </div>
            <Progress
              value={totalBlocks > 0 ? (completedBlocks / totalBlocks) * 100 : 0}
              className="mt-2"
            />
          </div>
        </div>
      </div>

      {/* Lista de Bloques de Estudio */}
      <div className="space-y-4">
        <div>
          <h2 className="text-lg font-bold text-stone-900 dark:text-stone-100">
            Bloques Temáticos de Estudio (Nivel 1 & 2)
          </h2>
          <p className="text-xs text-stone-500">
            Cada bloque contiene explicación, conceptos clave, instrucción de lectura y evaluación obligatoria.
          </p>
        </div>

        <div className="grid grid-cols-1 gap-4">
          {blocks.map((block: any, index: number) => {
            const prog = block.userProgress;
            const isRead = prog?.reading_completed;
            const isQuizPassed = prog?.quiz_passed;

            return (
              <Card
                key={block.id}
                className={`transition-all hover:border-amber-400 dark:hover:border-amber-600 ${
                  isQuizPassed
                    ? "border-emerald-200 dark:border-emerald-950/60 bg-emerald-50/10"
                    : ""
                }`}
              >
                <div className="p-5 sm:p-6 flex flex-col sm:flex-row sm:items-center justify-between gap-4">
                  <div className="space-y-1.5">
                    <div className="flex items-center gap-2">
                      <span className="text-xs font-bold text-amber-700 dark:text-amber-400 uppercase tracking-wider">
                        Bloque {chapter.chapter_number}.{block.block_number}
                      </span>
                      <span className="text-xs font-semibold px-2 py-0.5 rounded bg-stone-100 dark:bg-stone-800 text-stone-700 dark:text-stone-300">
                        {book.name} {block.verse_range}
                      </span>
                      {isQuizPassed && (
                        <Badge variant="success" className="gap-1">
                          <Check className="w-3 h-3" /> Aprobado ({prog.best_score}%)
                        </Badge>
                      )}
                      {isRead && !isQuizPassed && (
                        <Badge variant="info">Leído • Quiz pendiente</Badge>
                      )}
                    </div>

                    <h3 className="text-base sm:text-lg font-bold text-stone-900 dark:text-stone-100">
                      {block.title}
                    </h3>

                    <div className="flex items-center gap-4 text-xs text-stone-500">
                      <span className="flex items-center gap-1">
                        <Clock className="w-3.5 h-3.5" /> ~{block.estimated_minutes} min
                      </span>
                      <span className="flex items-center gap-1">
                        <BookOpen className="w-3.5 h-3.5" /> Lectura RVR1960
                      </span>
                    </div>
                  </div>

                  <div className="flex items-center gap-3 sm:flex-shrink-0">
                    <Link
                      href={`/libros/${slug}/capitulos/${chapter.chapter_number}/bloques/${block.id}`}
                    >
                      <Button
                        variant={isQuizPassed ? "outline" : "primary"}
                        size="md"
                        className="w-full sm:w-auto font-semibold"
                      >
                        {isQuizPassed ? "Repasar Bloque" : "Estudiar Bloque"}
                        <ArrowRight className="w-4 h-4 ml-1.5" />
                      </Button>
                    </Link>
                  </div>
                </div>
              </Card>
            );
          })}
        </div>
      </div>

      {/* Nivel 3: Examen General del Capítulo */}
      <div className="pt-4">
        <Card
          className={`border-2 ${
            isExamPassed
              ? "border-emerald-500 bg-emerald-50/20 dark:bg-emerald-950/20"
              : isExamUnlocked
              ? "border-amber-500 bg-amber-50/20 dark:bg-amber-950/20"
              : "border-stone-200 dark:border-stone-800 opacity-90"
          }`}
        >
          <div className="p-6 sm:p-8 flex flex-col md:flex-row md:items-center justify-between gap-6">
            <div className="space-y-3">
              <div className="flex items-center gap-2">
                <Badge
                  variant={isExamPassed ? "success" : isExamUnlocked ? "warning" : "outline"}
                >
                  Nivel 3 • Examen General
                </Badge>
                <span className="text-xs text-stone-500">25 Preguntas Multitemáticas</span>
              </div>

              <div>
                <h3 className="text-xl font-bold text-stone-900 dark:text-stone-100 flex items-center gap-2">
                  <Award className="w-5 h-5 text-amber-500" />
                  Examen General de {book.name} {chapter.chapter_number}
                </h3>
                <p className="text-sm text-stone-600 dark:text-stone-400 mt-1 max-w-2xl leading-relaxed">
                  Evalúa todo el capítulo combinando selección múltiple, memoria bíblica textual, identificación de referencias y verdadero/falso de los {totalBlocks} bloques.
                </p>
              </div>

              {isExamPassed && bestScore && (
                <div className="flex items-center gap-2 text-xs font-semibold text-emerald-600 dark:text-emerald-400">
                  <CheckCircle2 className="w-4 h-4" />
                  Capítulo aprobado con {bestScore}% de acierto.
                </div>
              )}

              {!isExamUnlocked && (
                <div className="flex items-center gap-2 text-xs text-stone-500 font-medium">
                  <Lock className="w-3.5 h-3.5" />
                  <span>
                    Completa la lectura y evaluaciones de todos los bloques ({completedBlocks}/{totalBlocks}) para desbloquear este examen.
                  </span>
                </div>
              )}
            </div>

            <div className="flex-shrink-0">
              {assessment && (isExamUnlocked || isExamPassed) ? (
                <Link href={`/evaluaciones/${assessment.id}`}>
                  <Button variant="primary" size="lg" className="w-full sm:w-auto font-bold shadow-md">
                    {isExamPassed ? "Repetir Examen General" : "Comenzar Examen General"}
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
