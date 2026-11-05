"use client";

import React, { useState, useTransition } from "react";
import {
  createQuestionAction,
  toggleQuestionStatusAction,
  deleteQuestionAction,
} from "@/actions/admin.actions";
import { Button } from "@/components/ui/Button";
import { Badge } from "@/components/ui/Badge";
import { Card, CardHeader, CardTitle, CardContent } from "@/components/ui/Card";
import {
  PlusCircle,
  Trash2,
  CheckCircle2,
  XCircle,
  HelpCircle,
  Loader2,
  X,
  Sparkles,
} from "lucide-react";

interface QuestionOptionItem {
  id: string;
  option_text: string;
  is_correct: boolean;
  order_index: number;
}

interface AdminQuestionItem {
  id: string;
  prompt: string;
  question_type: string;
  verse_reference: string;
  points: number;
  difficulty: string;
  is_active: boolean;
  chapter_id: string | null;
  block_id: string | null;
  options: QuestionOptionItem[];
}

interface ChapterOption {
  id: string;
  chapter_number: number;
  title: string;
  study_blocks: Array<{
    id: string;
    block_number: number;
    title: string;
    verse_range: string;
  }>;
}

interface QuestionsManagerProps {
  initialQuestions: AdminQuestionItem[];
  chapters: ChapterOption[];
}

export function QuestionsManager({ initialQuestions, chapters }: QuestionsManagerProps) {
  const [questions, setQuestions] = useState<AdminQuestionItem[]>(initialQuestions);
  const [selectedChapter, setSelectedChapter] = useState<string>("all");
  const [isModalOpen, setIsModalOpen] = useState(false);
  const [isPending, startTransition] = useTransition();

  // Form state
  const [newPrompt, setNewPrompt] = useState("");
  const [newVerseRef, setNewVerseRef] = useState("");
  const [newType, setNewType] = useState<
    "multiple_choice" | "fill_blank" | "reference_identification" | "true_false" | "order_events"
  >("multiple_choice");
  const [newPoints, setNewPoints] = useState(10);
  const [newDifficulty, setNewDifficulty] = useState<"easy" | "medium" | "hard">("medium");
  const [newExplanation, setNewExplanation] = useState("");
  const [selectedBlockId, setSelectedBlockId] = useState("");

  const [options, setOptions] = useState<Array<{ text: string; isCorrect: boolean }>>([
    { text: "", isCorrect: true },
    { text: "", isCorrect: false },
    { text: "", isCorrect: false },
    { text: "", isCorrect: false },
  ]);

  const filteredQuestions =
    selectedChapter === "all"
      ? questions
      : questions.filter((q) => q.chapter_id === selectedChapter);

  const handleToggleStatus = (questionId: string, currentStatus: boolean) => {
    startTransition(async () => {
      const res = await toggleQuestionStatusAction(questionId, currentStatus);
      if (res.success) {
        setQuestions((prev) =>
          prev.map((q) =>
            q.id === questionId ? { ...q, is_active: !currentStatus } : q
          )
        );
      }
    });
  };

  const handleDelete = (questionId: string) => {
    if (!confirm("¿Seguro que deseas eliminar esta pregunta?")) return;

    startTransition(async () => {
      const res = await deleteQuestionAction(questionId);
      if (res.success) {
        setQuestions((prev) => prev.filter((q) => q.id !== questionId));
      }
    });
  };

  const handleCreateQuestion = (e: React.FormEvent) => {
    e.preventDefault();
    if (!newPrompt || !newVerseRef || !newExplanation) {
      alert("Por favor completa los campos obligatorios.");
      return;
    }

    startTransition(async () => {
      const formattedOptions = options
        .filter((o) => o.text.trim().length > 0)
        .map((o, idx) => ({
          optionText: o.text,
          isCorrect: o.isCorrect,
          orderIndex: idx + 1,
          correctOrderPosition: idx + 1,
        }));

      const res = await createQuestionAction({
        blockId: selectedBlockId || undefined,
        prompt: newPrompt,
        verseReference: newVerseRef,
        questionType: newType,
        explanation: newExplanation,
        points: newPoints,
        difficulty: newDifficulty,
        options: formattedOptions,
      });

      if (res.success && res.questionId) {
        const newQ: AdminQuestionItem = {
          id: res.questionId,
          prompt: newPrompt,
          question_type: newType,
          verse_reference: newVerseRef,
          points: newPoints,
          difficulty: newDifficulty,
          is_active: true,
          chapter_id: null,
          block_id: selectedBlockId || null,
          options: formattedOptions.map((o, idx) => ({
            id: `opt-${idx}`,
            option_text: o.optionText,
            is_correct: o.isCorrect,
            order_index: o.orderIndex,
          })),
        };

        setQuestions((prev) => [newQ, ...prev]);
        setIsModalOpen(false);
        // Reset form
        setNewPrompt("");
        setNewVerseRef("");
        setNewExplanation("");
      } else {
        alert(res.error || "Error al crear la pregunta");
      }
    });
  };

  return (
    <div className="space-y-6">
      {/* Controles de Filtro y Botón de Creación */}
      <div className="flex flex-col sm:flex-row sm:items-center justify-between gap-4 p-4 rounded-2xl bg-white dark:bg-stone-900 border border-stone-200 dark:border-stone-800 shadow-sm">
        <div className="flex items-center gap-3">
          <label htmlFor="chapter-filter" className="text-xs font-semibold text-stone-600 dark:text-stone-400">
            Filtrar por Capítulo:
          </label>
          <select
            id="chapter-filter"
            value={selectedChapter}
            onChange={(e) => setSelectedChapter(e.target.value)}
            className="text-xs font-medium rounded-lg border border-stone-300 dark:border-stone-700 bg-stone-50 dark:bg-stone-800 p-2 text-stone-900 dark:text-stone-100"
          >
            <option value="all">Todos los Capítulos ({questions.length})</option>
            {chapters.map((ch) => (
              <option key={ch.id} value={ch.id}>
                Efesios {ch.chapter_number} – {ch.title}
              </option>
            ))}
          </select>
        </div>

        <Button
          onClick={() => setIsModalOpen(true)}
          variant="primary"
          size="sm"
          className="gap-1.5"
        >
          <PlusCircle className="w-4 h-4" /> Agregar Nueva Pregunta
        </Button>
      </div>

      {/* Lista de Preguntas */}
      <div className="space-y-3">
        {filteredQuestions.length === 0 ? (
          <Card className="p-12 text-center text-stone-500">
            No se encontraron preguntas para el filtro seleccionado.
          </Card>
        ) : (
          filteredQuestions.map((q) => (
            <Card
              key={q.id}
              className={`transition-all ${
                !q.is_active ? "opacity-60 bg-stone-50/50 dark:bg-stone-950/50" : ""
              }`}
            >
              <div className="p-4 sm:p-5 flex flex-col md:flex-row md:items-center justify-between gap-4">
                <div className="space-y-1.5 max-w-3xl">
                  <div className="flex flex-wrap items-center gap-2">
                    <Badge variant="outline" className="text-[11px]">
                      {q.question_type}
                    </Badge>
                    <span className="text-xs font-bold text-amber-700 dark:text-amber-400 bg-amber-50 dark:bg-amber-950/60 px-2 py-0.5 rounded">
                      {q.verse_reference}
                    </span>
                    <span className="text-xs text-stone-400">
                      {q.points} pts • {q.difficulty}
                    </span>
                    <Badge variant={q.is_active ? "success" : "danger"} className="text-[10px]">
                      {q.is_active ? "Activa" : "Desactivada"}
                    </Badge>
                  </div>

                  <h3 className="text-sm sm:text-base font-bold text-stone-900 dark:text-stone-100">
                    {q.prompt}
                  </h3>

                  {/* Opciones */}
                  {q.options && q.options.length > 0 && (
                    <div className="pt-2 flex flex-wrap gap-2 text-xs">
                      {q.options.map((opt) => (
                        <span
                          key={opt.id}
                          className={`px-2.5 py-1 rounded-md border ${
                            opt.is_correct
                              ? "bg-emerald-50 dark:bg-emerald-950/60 border-emerald-300 dark:border-emerald-800 text-emerald-800 dark:text-emerald-200 font-semibold"
                              : "bg-stone-50 dark:bg-stone-850 border-stone-200 dark:border-stone-800 text-stone-600 dark:text-stone-400"
                          }`}
                        >
                          {opt.option_text} {opt.is_correct && "✓"}
                        </span>
                      ))}
                    </div>
                  )}
                </div>

                <div className="flex items-center gap-2 md:flex-shrink-0 pt-2 md:pt-0 border-t md:border-t-0 border-stone-100 dark:border-stone-800">
                  <Button
                    onClick={() => handleToggleStatus(q.id, q.is_active)}
                    disabled={isPending}
                    variant="outline"
                    size="sm"
                    className="text-xs"
                  >
                    {q.is_active ? "Desactivar" : "Activar"}
                  </Button>
                  <Button
                    onClick={() => handleDelete(q.id)}
                    disabled={isPending}
                    variant="danger"
                    size="sm"
                    className="p-2"
                    title="Eliminar Pregunta"
                  >
                    <Trash2 className="w-4 h-4" />
                  </Button>
                </div>
              </div>
            </Card>
          ))
        )}
      </div>

      {/* Modal de Creación de Pregunta */}
      {isModalOpen && (
        <div className="fixed inset-0 z-50 flex items-center justify-center p-4 bg-black/60 backdrop-blur-xs overflow-y-auto">
          <div className="bg-white dark:bg-stone-900 rounded-2xl max-w-2xl w-full p-6 shadow-2xl border border-stone-200 dark:border-stone-800 my-8">
            <div className="flex items-center justify-between pb-4 border-b border-stone-200 dark:border-stone-800">
              <h2 className="text-lg font-bold text-stone-900 dark:text-stone-100 flex items-center gap-2">
                <Sparkles className="w-5 h-5 text-amber-500" /> Crear Nueva Pregunta
              </h2>
              <button
                onClick={() => setIsModalOpen(false)}
                className="p-1 rounded-lg text-stone-400 hover:text-stone-600 dark:hover:text-stone-200"
              >
                <X className="w-5 h-5" />
              </button>
            </div>

            <form onSubmit={handleCreateQuestion} className="space-y-4 pt-4">
              <div>
                <label className="block text-xs font-semibold text-stone-700 dark:text-stone-300 mb-1">
                  Enunciado de la Pregunta *
                </label>
                <textarea
                  required
                  rows={2}
                  value={newPrompt}
                  onChange={(e) => setNewPrompt(e.target.value)}
                  placeholder="Ej: Según Efesios 2:8, ¿por qué medio somos salvos por gracia?"
                  className="w-full p-2.5 text-sm rounded-lg border border-stone-300 dark:border-stone-700 bg-stone-50 dark:bg-stone-800 text-stone-900 dark:text-stone-100"
                />
              </div>

              <div className="grid grid-cols-1 sm:grid-cols-2 gap-4">
                <div>
                  <label className="block text-xs font-semibold text-stone-700 dark:text-stone-300 mb-1">
                    Referencia Bíblica (RVR1960) *
                  </label>
                  <input
                    required
                    type="text"
                    value={newVerseRef}
                    onChange={(e) => setNewVerseRef(e.target.value)}
                    placeholder="Ej: Efesios 2:8"
                    className="w-full p-2 text-sm rounded-lg border border-stone-300 dark:border-stone-700 bg-stone-50 dark:bg-stone-800 text-stone-900 dark:text-stone-100"
                  />
                </div>

                <div>
                  <label className="block text-xs font-semibold text-stone-700 dark:text-stone-300 mb-1">
                    Tipo de Pregunta
                  </label>
                  <select
                    value={newType}
                    onChange={(e: any) => setNewType(e.target.value)}
                    className="w-full p-2 text-sm rounded-lg border border-stone-300 dark:border-stone-700 bg-stone-50 dark:bg-stone-800 text-stone-900 dark:text-stone-100"
                  >
                    <option value="multiple_choice">Selección Múltiple</option>
                    <option value="fill_blank">Completar Versículo</option>
                    <option value="reference_identification">Identificación de Referencia</option>
                    <option value="true_false">Verdadero o Falso</option>
                    <option value="order_events">Ordenar Conceptos</option>
                  </select>
                </div>
              </div>

              {/* Opciones y marcación de respuesta correcta */}
              <div className="space-y-2 pt-2">
                <label className="block text-xs font-semibold text-stone-700 dark:text-stone-300">
                  Opciones de Respuesta (Marca la casilla de la respuesta correcta)
                </label>
                {options.map((opt, index) => (
                  <div key={index} className="flex items-center gap-2">
                    <input
                      type="checkbox"
                      checked={opt.isCorrect}
                      onChange={(e) => {
                        const updated = [...options];
                        // Para selección simple, si se marca esta, desmarcar las demás
                        if (newType !== "order_events") {
                          updated.forEach((o, i) => (o.isCorrect = i === index));
                        } else {
                          updated[index].isCorrect = e.target.checked;
                        }
                        setOptions(updated);
                      }}
                      className="w-4 h-4 rounded text-amber-600 focus:ring-amber-500"
                    />
                    <input
                      type="text"
                      value={opt.text}
                      onChange={(e) => {
                        const updated = [...options];
                        updated[index].text = e.target.value;
                        setOptions(updated);
                      }}
                      placeholder={`Opción ${String.fromCharCode(65 + index)}`}
                      className="flex-1 p-2 text-sm rounded-lg border border-stone-300 dark:border-stone-700 bg-stone-50 dark:bg-stone-800 text-stone-900 dark:text-stone-100"
                    />
                  </div>
                ))}
              </div>

              <div>
                <label className="block text-xs font-semibold text-stone-700 dark:text-stone-300 mb-1">
                  Explicación y Retroalimentación Didáctica *
                </label>
                <textarea
                  required
                  rows={2}
                  value={newExplanation}
                  onChange={(e) => setNewExplanation(e.target.value)}
                  placeholder="Explica brevemente por qué es la respuesta correcta según el contexto bíblico."
                  className="w-full p-2.5 text-sm rounded-lg border border-stone-300 dark:border-stone-700 bg-stone-50 dark:bg-stone-800 text-stone-900 dark:text-stone-100"
                />
              </div>

              <div className="flex items-center justify-end gap-3 pt-4 border-t border-stone-200 dark:border-stone-800">
                <Button
                  type="button"
                  variant="outline"
                  onClick={() => setIsModalOpen(false)}
                >
                  Cancelar
                </Button>
                <Button type="submit" variant="primary" disabled={isPending}>
                  {isPending ? "Guardando..." : "Guardar Pregunta"}
                </Button>
              </div>
            </form>
          </div>
        </div>
      )}
    </div>
  );
}

