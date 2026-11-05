"use client";

import React, { useState, useTransition } from "react";
import { useRouter } from "next/navigation";
import { AssessmentWithQuestions, ClientQuestion, UserSubmittedAnswer } from "@/types/assessment.types";
import { submitAssessmentAction } from "@/actions/assessment.actions";
import { Button } from "@/components/ui/Button";
import { Badge } from "@/components/ui/Badge";
import { Card, CardHeader, CardTitle, CardContent } from "@/components/ui/Card";
import { Progress } from "@/components/ui/Progress";
import {
  HelpCircle,
  ArrowRight,
  ArrowLeft,
  CheckCircle2,
  AlertCircle,
  Loader2,
  ChevronUp,
  ChevronDown,
  BookOpen,
  Award,
} from "lucide-react";

interface AssessmentRunnerProps {
  assessment: AssessmentWithQuestions;
  backHref?: string;
}

export function AssessmentRunner({ assessment, backHref = "/dashboard" }: AssessmentRunnerProps) {
  const router = useRouter();
  const questions = assessment.questions || [];
  const totalQuestions = questions.length;

  const [currentIndex, setCurrentIndex] = useState(0);
  const [answers, setAnswers] = useState<Record<string, UserSubmittedAnswer>>({});
  const [isPending, startTransition] = useTransition();
  const [errorMessage, setErrorMessage] = useState<string | null>(null);

  const currentQuestion = questions[currentIndex];

  // Helper para actualizar respuesta
  const handleSelectOption = (questionId: string, optionId: string) => {
    setAnswers((prev) => ({
      ...prev,
      [questionId]: {
        questionId,
        selectedOptionId: optionId,
      },
    }));
  };

  const handleFillBlankChange = (questionId: string, text: string) => {
    setAnswers((prev) => ({
      ...prev,
      [questionId]: {
        questionId,
        textResponse: text,
      },
    }));
  };

  const handleMoveOrder = (questionId: string, fromIndex: number, toIndex: number) => {
    const currentOrder = answers[questionId]?.orderResponse ||
      currentQuestion.options.map((o) => o.id);

    const updated = [...currentOrder];
    const [moved] = updated.splice(fromIndex, 1);
    updated.splice(toIndex, 0, moved);

    setAnswers((prev) => ({
      ...prev,
      [questionId]: {
        questionId,
        orderResponse: updated,
      },
    }));
  };

  // Inicializar orden en ejercicios de tipo order_events si aún no está
  React.useEffect(() => {
    if (currentQuestion && currentQuestion.question_type === "order_events") {
      if (!answers[currentQuestion.id]?.orderResponse) {
        setAnswers((prev) => ({
          ...prev,
          [currentQuestion.id]: {
            questionId: currentQuestion.id,
            orderResponse: currentQuestion.options.map((o) => o.id),
          },
        }));
      }
    }
  }, [currentIndex, currentQuestion]);

  const handleSubmit = () => {
    setErrorMessage(null);
    const answersArray: UserSubmittedAnswer[] = questions.map((q) => {
      const recorded = answers[q.id];
      return {
        questionId: q.id,
        selectedOptionId: recorded?.selectedOptionId || null,
        textResponse: recorded?.textResponse || null,
        orderResponse: recorded?.orderResponse || null,
      };
    });

    startTransition(async () => {
      const res = await submitAssessmentAction({
        assessmentId: assessment.id,
        answers: answersArray,
      });

      if (res.success && res.attemptId) {
        router.push(`/resultados/${res.attemptId}`);
      } else {
        setErrorMessage(res.error || "Ocurrió un error al enviar la evaluación.");
      }
    });
  };

  if (totalQuestions === 0) {
    return (
      <div className="max-w-2xl mx-auto py-12 text-center space-y-4">
        <AlertCircle className="w-12 h-12 text-amber-500 mx-auto" />
        <h2 className="text-xl font-bold">Esta evaluación aún no tiene preguntas publicadas.</h2>
        <Button onClick={() => router.push(backHref)}>Volver</Button>
      </div>
    );
  }

  const currentAnswer = answers[currentQuestion.id];
  const isAnswered =
    currentQuestion.question_type === "fill_blank"
      ? Boolean(currentAnswer?.textResponse && currentAnswer.textResponse.trim().length > 0)
      : currentQuestion.question_type === "order_events"
      ? true
      : Boolean(currentAnswer?.selectedOptionId);

  const progressPercentage = Math.round(((currentIndex + 1) / totalQuestions) * 100);

  return (
    <div className="max-w-3xl mx-auto space-y-6 pb-12">
      {/* Barra superior de progreso */}
      <div className="space-y-2">
        <div className="flex items-center justify-between text-xs font-semibold text-stone-500">
          <span className="flex items-center gap-1.5 text-stone-800 dark:text-stone-200">
            <Award className="w-4 h-4 text-amber-600" />
            {assessment.title}
          </span>
          <span>
            Pregunta {currentIndex + 1} de {totalQuestions}
          </span>
        </div>
        <Progress value={progressPercentage} />
      </div>

      {errorMessage && (
        <div className="rounded-xl bg-rose-50 dark:bg-rose-950/40 border border-rose-200 dark:border-rose-900/60 p-4 flex items-center gap-3 text-rose-700 dark:text-rose-300 text-sm">
          <AlertCircle className="w-5 h-5 flex-shrink-0 text-rose-500" />
          <span>{errorMessage}</span>
        </div>
      )}

      {/* Tarjeta de la Pregunta Actual */}
      <Card className="shadow-md border-stone-200 dark:border-stone-800">
        <CardHeader className="space-y-2 pb-4">
          <div className="flex items-center justify-between gap-2">
            <Badge variant="outline" className="text-xs">
              {currentQuestion.question_type === "multiple_choice" && "Selección Múltiple"}
              {currentQuestion.question_type === "fill_blank" && "Memoria Bíblica • Completar"}
              {currentQuestion.question_type === "reference_identification" && "Identificación de Referencia"}
              {currentQuestion.question_type === "true_false" && "Verdadero o Falso"}
              {currentQuestion.question_type === "order_events" && "Ordenar Conceptos"}
            </Badge>

            <span className="text-xs font-semibold text-amber-700 dark:text-amber-400 bg-amber-50 dark:bg-amber-950/50 px-2 py-0.5 rounded">
              Ref: {currentQuestion.verse_reference}
            </span>
          </div>

          <h2 className="text-lg sm:text-xl font-bold text-stone-900 dark:text-stone-100 leading-snug pt-1">
            {currentQuestion.prompt}
          </h2>
        </CardHeader>

        <CardContent className="pt-2 pb-6">
          {/* TIPO: Opción Múltiple / Referencias / Verdadero o Falso */}
          {(currentQuestion.question_type === "multiple_choice" ||
            currentQuestion.question_type === "reference_identification" ||
            currentQuestion.question_type === "true_false") && (
            <div className="space-y-3">
              {currentQuestion.options.map((opt, optIndex) => {
                const isSelected = currentAnswer?.selectedOptionId === opt.id;
                const letter = String.fromCharCode(65 + optIndex);

                return (
                  <button
                    key={opt.id}
                    type="button"
                    onClick={() => handleSelectOption(currentQuestion.id, opt.id)}
                    className={`w-full text-left p-4 rounded-xl border transition-all flex items-start gap-3.5 cursor-pointer ${
                      isSelected
                        ? "border-amber-500 bg-amber-50/70 dark:bg-amber-950/50 shadow-sm ring-1 ring-amber-500 text-stone-900 dark:text-stone-100"
                        : "border-stone-200 dark:border-stone-800 bg-white dark:bg-stone-900 hover:bg-stone-50 dark:hover:bg-stone-850 text-stone-700 dark:text-stone-300"
                    }`}
                  >
                    <div
                      className={`w-7 h-7 rounded-lg flex items-center justify-center font-bold text-xs flex-shrink-0 mt-0.5 transition-colors ${
                        isSelected
                          ? "bg-amber-600 text-white"
                          : "bg-stone-100 dark:bg-stone-800 text-stone-600 dark:text-stone-400"
                      }`}
                    >
                      {letter}
                    </div>
                    <span className="text-sm font-medium leading-relaxed pt-0.5">
                      {opt.option_text}
                    </span>
                  </button>
                );
              })}
            </div>
          )}

          {/* TIPO: Completar versículo */}
          {currentQuestion.question_type === "fill_blank" && (
            <div className="space-y-4 pt-2">
              <label
                htmlFor="fill-blank-input"
                className="block text-xs font-semibold uppercase tracking-wider text-stone-500"
              >
                Escribe la palabra o frase que falta (según RVR1960):
              </label>
              <input
                id="fill-blank-input"
                type="text"
                autoComplete="off"
                value={currentAnswer?.textResponse || ""}
                onChange={(e) => handleFillBlankChange(currentQuestion.id, e.target.value)}
                placeholder="Escribe tu respuesta aquí..."
                className="w-full p-3.5 text-base rounded-xl border border-stone-300 dark:border-stone-700 bg-stone-50 dark:bg-stone-850 text-stone-900 dark:text-stone-100 focus:outline-none focus:ring-2 focus:ring-amber-500 transition-all font-medium"
              />
              <p className="text-xs text-stone-400">
                Nota: No te preocupes por mayúsculas o tildes; la corrección reconoce la respuesta correcta.
              </p>
            </div>
          )}

          {/* TIPO: Ordenar acontecimientos */}
          {currentQuestion.question_type === "order_events" && (
            <div className="space-y-3 pt-2">
              <p className="text-xs text-stone-500 font-medium mb-2">
                Utiliza las flechas para ordenar los elementos según el pasaje bíblico:
              </p>
              {(() => {
                const orderIds =
                  currentAnswer?.orderResponse || currentQuestion.options.map((o) => o.id);
                return orderIds.map((optId, idx) => {
                  const opt = currentQuestion.options.find((o) => o.id === optId);
                  if (!opt) return null;

                  return (
                    <div
                      key={opt.id}
                      className="p-3.5 rounded-xl border border-stone-200 dark:border-stone-800 bg-white dark:bg-stone-900 flex items-center justify-between gap-3 shadow-sm"
                    >
                      <div className="flex items-center gap-3">
                        <span className="w-6 h-6 rounded-full bg-stone-100 dark:bg-stone-800 text-stone-600 dark:text-stone-300 text-xs font-bold flex items-center justify-center">
                          {idx + 1}
                        </span>
                        <span className="text-sm font-medium text-stone-800 dark:text-stone-200">
                          {opt.option_text}
                        </span>
                      </div>

                      <div className="flex items-center gap-1">
                        <button
                          type="button"
                          disabled={idx === 0}
                          onClick={() => handleMoveOrder(currentQuestion.id, idx, idx - 1)}
                          className="p-1.5 rounded hover:bg-stone-100 dark:hover:bg-stone-800 text-stone-500 disabled:opacity-30 cursor-pointer"
                        >
                          <ChevronUp className="w-4 h-4" />
                        </button>
                        <button
                          type="button"
                          disabled={idx === orderIds.length - 1}
                          onClick={() => handleMoveOrder(currentQuestion.id, idx, idx + 1)}
                          className="p-1.5 rounded hover:bg-stone-100 dark:hover:bg-stone-800 text-stone-500 disabled:opacity-30 cursor-pointer"
                        >
                          <ChevronDown className="w-4 h-4" />
                        </button>
                      </div>
                    </div>
                  );
                });
              })()}
            </div>
          )}
        </CardContent>
      </Card>

      {/* Botones de Navegación del Examen */}
      <div className="flex items-center justify-between gap-4 pt-2">
        <Button
          type="button"
          variant="outline"
          size="md"
          disabled={currentIndex === 0 || isPending}
          onClick={() => setCurrentIndex((prev) => prev - 1)}
          className="gap-1.5"
        >
          <ArrowLeft className="w-4 h-4" /> Anterior
        </Button>

        {currentIndex < totalQuestions - 1 ? (
          <Button
            type="button"
            variant="primary"
            size="md"
            onClick={() => setCurrentIndex((prev) => prev + 1)}
            className="gap-1.5"
          >
            Siguiente <ArrowRight className="w-4 h-4" />
          </Button>
        ) : (
          <Button
            type="button"
            variant="primary"
            size="md"
            disabled={isPending}
            onClick={handleSubmit}
            className="gap-1.5 font-bold shadow-md shadow-amber-600/30"
          >
            {isPending ? (
              <>
                <Loader2 className="w-4 h-4 animate-spin" />
                <span>Evaluando en servidor...</span>
              </>
            ) : (
              <>
                <CheckCircle2 className="w-4 h-4" />
                <span>Finalizar y Evaluar</span>
              </>
            )}
          </Button>
        )}
      </div>
    </div>
  );
}

