"use client";

import React, { useState, useTransition } from "react";
import Link from "next/link";
import { markBlockAsReadAction } from "@/actions/study.actions";
import { Button } from "@/components/ui/Button";
import { Badge } from "@/components/ui/Badge";
import { Card, CardHeader, CardTitle, CardContent } from "@/components/ui/Card";
import {
  BookOpen,
  CheckCircle2,
  Clock,
  ArrowRight,
  ArrowLeft,
  Sparkles,
  BookMarked,
  HelpCircle,
  Lightbulb,
  Quote,
  Check,
  Award,
} from "lucide-react";
import { KeyConcept, KeyPhrase } from "@/types/study.types";

interface BlockStudyViewProps {
  block: {
    id: string;
    block_number: number;
    title: string;
    verse_range: string;
    estimated_minutes: number;
  };
  chapter: {
    chapter_number: number;
    title: string;
    book: {
      name: string;
      slug: string;
    };
  };
  explanation: {
    introduction: string;
    biblical_passage_rvr1960: string;
    passage_explanation: string;
    key_concepts: KeyConcept[];
    central_ideas: string[];
    key_phrases: KeyPhrase[];
    reading_instruction: string;
  };
  assessment?: {
    id: string;
    title: string;
    passing_score_percentage: number;
    questions_count: number;
  } | null;
  navigation: {
    prev: { id: string; block_number: number; title: string; verse_range: string } | null;
    next: { id: string; block_number: number; title: string; verse_range: string } | null;
    totalInChapter: number;
    currentPosition: number;
  };
  initialProgress?: {
    reading_completed: boolean;
    quiz_passed: boolean;
    best_score: number;
  } | null;
}

export function BlockStudyView({
  block,
  chapter,
  explanation,
  assessment,
  navigation,
  initialProgress,
}: BlockStudyViewProps) {
  const [isRead, setIsRead] = useState<boolean>(
    initialProgress?.reading_completed || false
  );
  const [isPending, startTransition] = useTransition();

  const handleMarkAsRead = () => {
    startTransition(async () => {
      const res = await markBlockAsReadAction(block.id);
      if (res.success) {
        setIsRead(true);
      }
    });
  };

  const isQuizPassed = initialProgress?.quiz_passed || false;
  const bestScore = initialProgress?.best_score;

  return (
    <div className="max-w-4xl mx-auto space-y-8 pb-16">
      {/* Top Breadcrumb & Navigation Bar */}
      <div className="flex items-center justify-between text-xs font-semibold text-stone-500 border-b border-stone-200 dark:border-stone-800 pb-3">
        <Link
          href={`/libros/${chapter.book.slug}/capitulos/${chapter.chapter_number}`}
          className="inline-flex items-center gap-1.5 hover:text-stone-900 dark:hover:text-stone-100 transition-colors"
        >
          <ArrowLeft className="w-3.5 h-3.5" />
          Volver a Efesios {chapter.chapter_number}
        </Link>

        <span>
          Bloque {navigation.currentPosition} de {navigation.totalInChapter}
        </span>
      </div>

      {/* Block Header */}
      <div className="space-y-3">
        <div className="flex flex-wrap items-center gap-2">
          <Badge variant="default">
            {chapter.book.name} {chapter.chapter_number}:{block.verse_range}
          </Badge>
          <span className="flex items-center gap-1 text-xs text-stone-500 font-medium px-2 py-0.5 rounded bg-stone-100 dark:bg-stone-800">
            <Clock className="w-3 h-3" /> ~{block.estimated_minutes} min de estudio
          </span>
          {isQuizPassed && (
            <Badge variant="success" className="gap-1">
              <Check className="w-3 h-3" /> Evaluación Aprobada ({bestScore}%)
            </Badge>
          )}
        </div>

        <h1 className="text-2xl sm:text-3xl lg:text-4xl font-extrabold text-stone-900 dark:text-stone-100 tracking-tight leading-tight">
          {block.title}
        </h1>
      </div>

      {/* Sección 1: Introducción */}
      <Card className="bg-amber-50/40 dark:bg-amber-950/20 border-amber-200/80 dark:border-amber-900/40">
        <CardHeader className="pb-2">
          <div className="flex items-center gap-2 text-xs font-bold uppercase tracking-wider text-amber-800 dark:text-amber-300">
            <Lightbulb className="w-4 h-4" /> Introducción al Tema
          </div>
        </CardHeader>
        <CardContent>
          <p className="text-stone-700 dark:text-stone-300 leading-relaxed text-sm sm:text-base">
            {explanation.introduction}
          </p>
        </CardContent>
      </Card>

      {/* Sección 2: Explicación Detallada del Pasaje */}
      <div className="space-y-4">
        <div className="flex items-center gap-2 border-b border-stone-200 dark:border-stone-800 pb-2">
          <BookOpen className="w-5 h-5 text-amber-600 dark:text-amber-400" />
          <h2 className="text-xl font-bold text-stone-900 dark:text-stone-100">
            Explicación del Pasaje ({chapter.book.name} {block.verse_range})
          </h2>
        </div>

        <div className="prose prose-stone dark:prose-invert max-w-none text-stone-800 dark:text-stone-200 leading-relaxed text-sm sm:text-base whitespace-pre-line space-y-4">
          {explanation.passage_explanation}
        </div>
      </div>

      {/* Sección 3: Conceptos y Palabras Importantes */}
      {explanation.key_concepts && explanation.key_concepts.length > 0 && (
        <div className="space-y-4 pt-4">
          <div className="flex items-center gap-2 border-b border-stone-200 dark:border-stone-800 pb-2">
            <HelpCircle className="w-5 h-5 text-indigo-600 dark:text-indigo-400" />
            <h2 className="text-xl font-bold text-stone-900 dark:text-stone-100">
              Conceptos y Términos Clave
            </h2>
          </div>

          <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
            {explanation.key_concepts.map((kc, idx) => (
              <div
                key={idx}
                className="bg-white dark:bg-stone-900 p-4 rounded-xl border border-stone-200 dark:border-stone-800 shadow-sm space-y-1.5"
              >
                <div className="font-bold text-stone-900 dark:text-stone-100 text-sm flex items-center justify-between">
                  <span>{kc.concept}</span>
                  {kc.context && (
                    <span className="text-[10px] font-normal text-stone-400">
                      {kc.context}
                    </span>
                  )}
                </div>
                <p className="text-xs text-stone-600 dark:text-stone-400 leading-relaxed">
                  {kc.definition}
                </p>
              </div>
            ))}
          </div>
        </div>
      )}

      {/* Sección 4: Ideas Centrales */}
      {explanation.central_ideas && explanation.central_ideas.length > 0 && (
        <div className="space-y-4 pt-4">
          <div className="flex items-center gap-2 border-b border-stone-200 dark:border-stone-800 pb-2">
            <Sparkles className="w-5 h-5 text-amber-500" />
            <h2 className="text-xl font-bold text-stone-900 dark:text-stone-100">
              Ideas Centrales para Recordar
            </h2>
          </div>

          <div className="bg-stone-50 dark:bg-stone-900/60 rounded-2xl p-4 sm:p-6 border border-stone-200 dark:border-stone-800 space-y-3">
            {explanation.central_ideas.map((idea, idx) => (
              <div key={idx} className="flex items-start gap-3">
                <CheckCircle2 className="w-4 h-4 text-emerald-600 dark:text-emerald-400 flex-shrink-0 mt-0.5" />
                <span className="text-xs sm:text-sm text-stone-700 dark:text-stone-300 leading-relaxed font-medium">
                  {idea}
                </span>
              </div>
            ))}
          </div>
        </div>
      )}

      {/* Sección 5: Frases Bíblicas Clave para Memorizar */}
      {explanation.key_phrases && explanation.key_phrases.length > 0 && (
        <div className="space-y-4 pt-4">
          <div className="flex items-center gap-2 border-b border-stone-200 dark:border-stone-800 pb-2">
            <Quote className="w-5 h-5 text-stone-500" />
            <h2 className="text-xl font-bold text-stone-900 dark:text-stone-100">
              Frases y Expresiones Bíblicas (RVR1960)
            </h2>
          </div>

          <div className="space-y-3">
            {explanation.key_phrases.map((phraseObj, idx) => (
              <div
                key={idx}
                className="bg-white dark:bg-stone-900 p-4 rounded-xl border-l-4 border-l-amber-500 border border-stone-200 dark:border-stone-800 flex flex-col sm:flex-row sm:items-center justify-between gap-2 shadow-sm"
              >
                <span className="text-sm font-semibold text-stone-900 dark:text-stone-100 italic">
                  &ldquo;{phraseObj.phrase}&rdquo;
                </span>
                <span className="text-xs font-bold text-amber-700 dark:text-amber-400 flex-shrink-0 bg-amber-50 dark:bg-amber-950/60 px-2 py-0.5 rounded">
                  {phraseObj.reference}
                </span>
              </div>
            ))}
          </div>
        </div>
      )}

      {/* Sección 6: Instrucción de Lectura en la Biblia y Habilitación de Evaluación */}
      <div className="pt-6">
        <Card
          className={`border-2 transition-all shadow-md ${
            isRead
              ? "border-emerald-500 bg-emerald-50/20 dark:bg-emerald-950/20"
              : "border-amber-400 bg-amber-50/20 dark:bg-amber-950/20"
          }`}
        >
          <div className="p-6 sm:p-8 space-y-6">
            <div className="flex items-start gap-4">
              <div
                className={`w-12 h-12 rounded-xl flex items-center justify-center flex-shrink-0 ${
                  isRead
                    ? "bg-emerald-600 text-white"
                    : "bg-amber-600 text-white shadow-md shadow-amber-600/30"
                }`}
              >
                <BookMarked className="w-6 h-6" />
              </div>
              <div className="space-y-1">
                <h3 className="text-lg font-bold text-stone-900 dark:text-stone-100">
                  Lectura Bíblica Directa (Reina-Valera 1960)
                </h3>
                <p className="text-sm text-stone-600 dark:text-stone-400 leading-relaxed">
                  {explanation.reading_instruction ||
                    "Lee los versículos correspondientes directamente en tu Biblia Reina-Valera 1960. Cuando termines, marca el bloque como leído para comenzar la evaluación."}
                </p>
              </div>
            </div>

            <div className="pt-4 border-t border-stone-200 dark:border-stone-800 flex flex-col sm:flex-row sm:items-center justify-between gap-4">
              <div className="flex items-center gap-2">
                {isRead ? (
                  <span className="inline-flex items-center gap-1.5 text-xs font-bold text-emerald-700 dark:text-emerald-400">
                    <CheckCircle2 className="w-4 h-4 text-emerald-600" />
                    Lectura completada y verificada
                  </span>
                ) : (
                  <Button
                    onClick={handleMarkAsRead}
                    disabled={isPending}
                    variant="outline"
                    size="md"
                    className="font-semibold text-xs border-amber-500 text-amber-700 hover:bg-amber-50"
                  >
                    <Check className="w-4 h-4 mr-1.5" />
                    {isPending ? "Registrando..." : "He leído estos versículos en mi Biblia"}
                  </Button>
                )}
              </div>

              {/* Botón de la Evaluación */}
              {assessment && (
                <div>
                  {isRead ? (
                    <Link href={`/evaluaciones/${assessment.id}`}>
                      <Button
                        variant="primary"
                        size="md"
                        className="w-full sm:w-auto font-bold shadow-md shadow-amber-600/20"
                      >
                        <Award className="w-4 h-4 mr-1.5" />
                        {isQuizPassed ? "Repetir Evaluación" : "Comenzar Evaluación del Bloque"}
                        <ArrowRight className="w-4 h-4 ml-1.5" />
                      </Button>
                    </Link>
                  ) : (
                    <Button variant="secondary" size="md" disabled className="w-full sm:w-auto text-xs">
                      Marca como leído para habilitar la evaluación
                    </Button>
                  )}
                </div>
              )}
            </div>
          </div>
        </Card>
      </div>

      {/* Navegación entre bloques (Anterior / Siguiente) */}
      <div className="pt-8 flex items-center justify-between gap-4 border-t border-stone-200 dark:border-stone-800">
        {navigation.prev ? (
          <Link
            href={`/libros/${chapter.book.slug}/capitulos/${chapter.chapter_number}/bloques/${navigation.prev.id}`}
          >
            <Button variant="outline" size="sm" className="gap-1.5">
              <ArrowLeft className="w-3.5 h-3.5" />
              <span>
                Bloque {navigation.prev.block_number}: {navigation.prev.verse_range}
              </span>
            </Button>
          </Link>
        ) : (
          <div />
        )}

        {navigation.next && (
          <Link
            href={`/libros/${chapter.book.slug}/capitulos/${chapter.chapter_number}/bloques/${navigation.next.id}`}
          >
            <Button variant="outline" size="sm" className="gap-1.5">
              <span>
                Bloque {navigation.next.block_number}: {navigation.next.verse_range}
              </span>
              <ArrowRight className="w-3.5 h-3.5" />
            </Button>
          </Link>
        )}
      </div>
    </div>
  );
}

