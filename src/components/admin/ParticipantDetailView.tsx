"use client";

import React, { useState } from "react";
import Link from "next/link";
import { useRouter } from "next/navigation";
import {
  ArrowLeft,
  User,
  Mail,
  Shield,
  Calendar,
  Clock,
  BookOpen,
  Award,
  CheckCircle2,
  XCircle,
  HelpCircle,
  Sparkles,
  TrendingUp,
  Layers,
  ChevronDown,
  ChevronUp,
  Edit2,
  KeyRound,
  Trash2,
  Compass,
} from "lucide-react";
import { Card, CardHeader, CardTitle, CardContent } from "@/components/ui/Card";
import { Badge } from "@/components/ui/Badge";
import { Button } from "@/components/ui/Button";
import { ParticipantDetailProgress, ParticipantWithStats } from "@/services/admin.service";
import { EditParticipantModal } from "./EditParticipantModal";
import { ResetPasswordModal } from "./ResetPasswordModal";
import { DeleteParticipantModal } from "./DeleteParticipantModal";
import { cn } from "@/lib/utils";

interface ParticipantDetailViewProps {
  data: ParticipantDetailProgress;
}

export function ParticipantDetailView({ data }: ParticipantDetailViewProps) {
  const router = useRouter();
  const { participant, summary, chapters, finalExam, attemptsHistory } = data;

  const [isEditOpen, setIsEditOpen] = useState(false);
  const [isResetOpen, setIsResetOpen] = useState(false);
  const [isDeleteOpen, setIsDeleteOpen] = useState(false);
  const [expandedChapters, setExpandedChapters] = useState<Record<string, boolean>>(() => {
    // Abrir automáticamente el capítulo en progreso o el primero
    const initial: Record<string, boolean> = {};
    chapters.forEach((ch, idx) => {
      initial[ch.id] = ch.status === "in_progress" || (idx === 0 && chapters.every(c => c.status !== "in_progress"));
    });
    return initial;
  });

  const toggleChapter = (chapterId: string) => {
    setExpandedChapters((prev) => ({
      ...prev,
      [chapterId]: !prev[chapterId],
    }));
  };

  const formatDate = (dateStr: string | null) => {
    if (!dateStr) return "Sin registro";
    try {
      return new Date(dateStr).toLocaleString("es-ES", {
        year: "numeric",
        month: "short",
        day: "numeric",
        hour: "2-digit",
        minute: "2-digit",
      });
    } catch {
      return dateStr;
    }
  };

  // Convertir para los modales
  const participantWithStats: ParticipantWithStats = {
    id: participant.id,
    email: participant.email,
    full_name: participant.full_name,
    created_at: participant.created_at,
    updated_at: participant.updated_at,
    role: participant.role,
    last_sign_in_at: participant.last_sign_in_at,
    email_confirmed: true,
    total_attempts: summary.totalAttempts,
    passed_attempts: summary.passedAttempts,
    completed_blocks: summary.completedBlocks,
    completed_chapters: summary.passedChapters,
    avg_score: summary.averageScore,
    last_activity_at: participant.last_sign_in_at || attemptsHistory[0]?.started_at || null,
  };

  return (
    <div className="space-y-6 sm:space-y-8 pb-16">
      {/* Top Breadcrumb & Return Action */}
      <div className="flex flex-col sm:flex-row sm:items-center justify-between gap-4">
        <div className="flex items-center gap-2 text-xs text-stone-500">
          <Link
            href="/admin/participantes"
            className="hover:text-amber-600 transition-colors flex items-center gap-1 font-semibold"
          >
            <ArrowLeft className="w-3.5 h-3.5" />
            Participantes
          </Link>
          <span>/</span>
          <span className="text-stone-800 dark:text-stone-200 font-bold truncate max-w-[200px]">
            {participant.full_name || participant.email}
          </span>
        </div>

        <div className="flex items-center gap-2 flex-wrap">
          <Button
            variant="outline"
            size="sm"
            onClick={() => setIsEditOpen(true)}
            className="text-xs"
          >
            <Edit2 className="w-3.5 h-3.5 mr-1" />
            Editar Información
          </Button>

          <Button
            variant="secondary"
            size="sm"
            onClick={() => setIsResetOpen(true)}
            className="text-xs text-amber-700 dark:text-amber-300 hover:bg-amber-100 dark:hover:bg-amber-950/60"
          >
            <KeyRound className="w-3.5 h-3.5 mr-1" />
            Recuperar Contraseña
          </Button>

          <Button
            variant="secondary"
            size="sm"
            onClick={() => setIsDeleteOpen(true)}
            className="text-xs text-rose-600 dark:text-rose-400 hover:bg-rose-50 dark:hover:bg-rose-950/50 hover:border-rose-300"
          >
            <Trash2 className="w-3.5 h-3.5 mr-1" />
            Eliminar Usuario
          </Button>
        </div>
      </div>

      {/* Participant Identity Card */}
      <div className="bg-white dark:bg-stone-900 rounded-3xl border border-stone-200 dark:border-stone-800 p-6 sm:p-7 shadow-sm">
        <div className="flex flex-col sm:flex-row sm:items-center justify-between gap-6">
          <div className="flex items-center gap-4">
            <div className="w-16 h-16 rounded-2xl bg-gradient-to-tr from-amber-600 to-amber-500 text-white flex items-center justify-center font-extrabold text-2xl shadow-lg shadow-amber-600/20 flex-shrink-0">
              {participant.full_name ? participant.full_name.charAt(0).toUpperCase() : "U"}
            </div>
            <div>
              <div className="flex items-center gap-2 flex-wrap">
                <h1 className="text-xl sm:text-2xl font-extrabold text-stone-900 dark:text-stone-100">
                  {participant.full_name || "Sin nombre registrado"}
                </h1>
                <Badge
                  variant={participant.role === "admin" ? "default" : "outline"}
                  className="text-xs"
                >
                  {participant.role === "admin" ? "Administrador" : "Estudiante"}
                </Badge>
              </div>
              <p className="text-sm text-stone-500 dark:text-stone-400 mt-0.5">
                {participant.email}
              </p>
              <p className="text-[11px] text-stone-400 font-mono mt-1">
                ID: {participant.id}
              </p>
            </div>
          </div>

          <div className="grid grid-cols-2 sm:flex sm:items-center gap-4 text-xs text-stone-500 border-t sm:border-t-0 sm:border-l border-stone-100 dark:border-stone-800 pt-4 sm:pt-0 sm:pl-6">
            <div>
              <span className="block text-[11px] text-stone-400 uppercase font-semibold">
                Fecha Registro
              </span>
              <span className="font-semibold text-stone-800 dark:text-stone-200">
                {formatDate(participant.created_at)}
              </span>
            </div>
            <div>
              <span className="block text-[11px] text-stone-400 uppercase font-semibold">
                Última Sesión
              </span>
              <span className="font-semibold text-stone-800 dark:text-stone-200">
                {formatDate(participant.last_sign_in_at)}
              </span>
            </div>
          </div>
        </div>
      </div>

      {/* "¿Por dónde va?" (Current Step Callout) */}
      <div className="relative overflow-hidden rounded-2xl bg-gradient-to-r from-amber-700 via-amber-600 to-stone-900 text-white p-6 sm:p-7 shadow-lg">
        <div className="relative z-10 space-y-2">
          <div className="inline-flex items-center gap-1.5 px-3 py-1 rounded-full bg-white/20 backdrop-blur-sm text-amber-100 text-xs font-bold uppercase tracking-wider">
            <Compass className="w-3.5 h-3.5" />
            Estado Actual / ¿Por dónde va?
          </div>
          <h2 className="text-xl sm:text-2xl font-bold tracking-tight">
            {summary.currentStep.blockTitle
              ? `${summary.currentStep.chapterTitle} • ${summary.currentStep.blockTitle}`
              : summary.currentStep.chapterTitle}
          </h2>
          <p className="text-sm text-amber-100/90 leading-relaxed max-w-3xl">
            {summary.currentStep.statusDescription}
          </p>
        </div>
      </div>

      {/* KPI Stats Cards */}
      <div className="grid grid-cols-2 lg:grid-cols-4 gap-3 sm:gap-5">
        <Card className="p-4 sm:p-5">
          <span className="text-xs font-bold text-stone-400 uppercase tracking-wider block">
            Progreso General Efesios
          </span>
          <div className="flex items-baseline gap-2 mt-2">
            <span className="text-2xl sm:text-3xl font-extrabold text-amber-600 dark:text-amber-400">
              {summary.overallPercentage}%
            </span>
            <span className="text-xs text-stone-400">completado</span>
          </div>
          <div className="w-full bg-stone-100 dark:bg-stone-800 h-2 rounded-full overflow-hidden mt-3">
            <div
              className="bg-amber-600 h-full rounded-full transition-all"
              style={{ width: `${summary.overallPercentage}%` }}
            />
          </div>
        </Card>

        <Card className="p-4 sm:p-5">
          <span className="text-xs font-bold text-stone-400 uppercase tracking-wider block">
            Bloques Aprobados
          </span>
          <div className="flex items-baseline gap-2 mt-2">
            <span className="text-2xl sm:text-3xl font-extrabold text-stone-900 dark:text-stone-100">
              {summary.completedBlocks}
            </span>
            <span className="text-xs text-stone-400">de {summary.totalBlocks} bloques</span>
          </div>
          <span className="text-[11px] text-stone-500 mt-2 block">
            Lectura y quiz aprobados
          </span>
        </Card>

        <Card className="p-4 sm:p-5">
          <span className="text-xs font-bold text-stone-400 uppercase tracking-wider block">
            Capítulos Aprobados
          </span>
          <div className="flex items-baseline gap-2 mt-2">
            <span className="text-2xl sm:text-3xl font-extrabold text-emerald-600 dark:text-emerald-400">
              {summary.passedChapters}
            </span>
            <span className="text-xs text-stone-400">de {summary.totalChapters} capítulos</span>
          </div>
          <span className="text-[11px] text-stone-500 mt-2 block">
            Exámenes de capítulo superados
          </span>
        </Card>

        <Card className="p-4 sm:p-5">
          <span className="text-xs font-bold text-stone-400 uppercase tracking-wider block">
            Calificación Promedio
          </span>
          <div className="flex items-baseline gap-2 mt-2">
            <span
              className={cn(
                "text-2xl sm:text-3xl font-extrabold",
                summary.averageScore >= 70
                  ? "text-emerald-600 dark:text-emerald-400"
                  : "text-amber-600 dark:text-amber-400"
              )}
            >
              {summary.averageScore}%
            </span>
            <span className="text-xs text-stone-400">({summary.totalAttempts} evaluaciones)</span>
          </div>
          <span className="text-[11px] text-stone-500 mt-2 block">
            {summary.passedAttempts} aprobadas ({summary.totalAttempts - summary.passedAttempts} reprobadas)
          </span>
        </Card>
      </div>

      {/* Chapters & Blocks Breakdown */}
      <div className="space-y-4">
        <div>
          <h2 className="text-xl font-extrabold text-stone-900 dark:text-stone-100 tracking-tight flex items-center gap-2">
            <BookOpen className="w-5 h-5 text-amber-600" />
            Progreso Detallado por Capítulos y Bloques (Efesios)
          </h2>
          <p className="text-xs text-stone-500 mt-0.5">
            Estado de lectura de cada porción bíblica y resultados de quizzes y exámenes por capítulo.
          </p>
        </div>

        <div className="space-y-3">
          {chapters.map((ch) => {
            const isExpanded = expandedChapters[ch.id];
            const completedCount = ch.blocks.filter((b) => b.quiz_passed).length;
            const totalInChapter = ch.blocks.length;
            const percent = totalInChapter > 0 ? Math.round((completedCount / totalInChapter) * 100) : 0;

            return (
              <div
                key={ch.id}
                className="bg-white dark:bg-stone-900 rounded-2xl border border-stone-200 dark:border-stone-800 overflow-hidden shadow-sm"
              >
                {/* Chapter Accordion Header */}
                <div
                  onClick={() => toggleChapter(ch.id)}
                  className="p-4 sm:p-5 flex items-center justify-between cursor-pointer hover:bg-stone-50/70 dark:hover:bg-stone-850/50 transition-colors select-none"
                >
                  <div className="flex items-center gap-3 sm:gap-4 min-w-0">
                    <div
                      className={cn(
                        "w-10 h-10 rounded-xl flex items-center justify-center font-extrabold text-sm flex-shrink-0 shadow-sm",
                        ch.status === "completed"
                          ? "bg-emerald-600 text-white"
                          : ch.status === "in_progress"
                          ? "bg-amber-600 text-white"
                          : "bg-stone-200 dark:bg-stone-800 text-stone-500"
                      )}
                    >
                      {ch.chapter_number}
                    </div>

                    <div className="min-w-0">
                      <div className="flex items-center gap-2 flex-wrap">
                        <h3 className="font-bold text-sm sm:text-base text-stone-900 dark:text-stone-100 truncate">
                          {ch.title}
                        </h3>
                        <Badge
                          variant={
                            ch.status === "completed"
                              ? "success"
                              : ch.status === "in_progress"
                              ? "default"
                              : "outline"
                          }
                          className="text-[10px]"
                        >
                          {ch.status === "completed"
                            ? "Capítulo Aprobado"
                            : ch.status === "in_progress"
                            ? "En Curso"
                            : "Pendiente"}
                        </Badge>
                      </div>
                      <p className="text-xs text-stone-500 dark:text-stone-400 mt-0.5">
                        {completedCount} de {totalInChapter} bloques completados ({percent}%)
                      </p>
                    </div>
                  </div>

                  <div className="flex items-center gap-3">
                    {/* Examen del capítulo badge */}
                    {ch.exam && (
                      <span
                        className={cn(
                          "hidden sm:inline-flex items-center px-2.5 py-1 rounded-lg text-xs font-semibold",
                          ch.exam.passed
                            ? "bg-emerald-100 text-emerald-800 dark:bg-emerald-950/60 dark:text-emerald-300"
                            : ch.exam.unlocked
                            ? "bg-amber-100 text-amber-800 dark:bg-amber-950/60 dark:text-amber-300"
                            : "bg-stone-100 text-stone-500 dark:bg-stone-800"
                        )}
                      >
                        Examen: {ch.exam.passed ? `Aprobado (${ch.exam.best_score}%)` : ch.exam.unlocked ? "Desbloqueado" : "Bloqueado"}
                      </span>
                    )}

                    <div className="p-1 rounded-lg text-stone-400 hover:text-stone-600">
                      {isExpanded ? <ChevronUp className="w-5 h-5" /> : <ChevronDown className="w-5 h-5" />}
                    </div>
                  </div>
                </div>

                {/* Chapter Blocks Content */}
                {isExpanded && (
                  <div className="border-t border-stone-100 dark:border-stone-800 bg-stone-50/50 dark:bg-stone-950/40 p-4 sm:p-5 space-y-4">
                    {/* Blocks list */}
                    <div className="space-y-2">
                      <p className="text-xs font-bold text-stone-400 uppercase tracking-wider px-1">
                        Bloques de Estudio
                      </p>

                      <div className="divide-y divide-stone-100 dark:divide-stone-800 bg-white dark:bg-stone-900 rounded-xl border border-stone-200/80 dark:border-stone-800 overflow-hidden">
                        {ch.blocks.map((blk) => (
                          <div
                            key={blk.id}
                            className="p-3.5 sm:p-4 flex flex-col sm:flex-row sm:items-center justify-between gap-3 text-xs"
                          >
                            <div className="space-y-0.5">
                              <div className="flex items-center gap-2">
                                <span className="font-bold text-stone-900 dark:text-stone-100 text-sm">
                                  Bloque {blk.block_number}: {blk.title}
                                </span>
                              </div>
                              <p className="text-amber-700 dark:text-amber-400 font-semibold text-xs">
                                Versículos: {blk.verse_range}
                              </p>
                            </div>

                            <div className="flex items-center gap-3 sm:gap-4 flex-wrap">
                              {/* Lectura status */}
                              <div className="flex items-center gap-1.5">
                                {blk.reading_completed ? (
                                  <span className="inline-flex items-center gap-1 text-emerald-700 dark:text-emerald-400 font-medium bg-emerald-50 dark:bg-emerald-950/40 px-2 py-0.5 rounded">
                                    <CheckCircle2 className="w-3.5 h-3.5" /> Lectura completada
                                  </span>
                                ) : (
                                  <span className="inline-flex items-center gap-1 text-stone-400 bg-stone-100 dark:bg-stone-800 px-2 py-0.5 rounded">
                                    <XCircle className="w-3.5 h-3.5" /> Lectura pendiente
                                  </span>
                                )}
                              </div>

                              {/* Quiz status */}
                              <div className="flex items-center gap-1.5">
                                {blk.quiz_passed ? (
                                  <span className="inline-flex items-center gap-1 text-emerald-700 dark:text-emerald-400 font-bold bg-emerald-100 dark:bg-emerald-950/60 px-2.5 py-0.5 rounded-full border border-emerald-200 dark:border-emerald-800">
                                    Quiz: {blk.best_score}% ({blk.attempts_count} {blk.attempts_count === 1 ? "intento" : "intentos"})
                                  </span>
                                ) : blk.attempts_count > 0 ? (
                                  <span className="inline-flex items-center gap-1 text-amber-700 dark:text-amber-400 font-bold bg-amber-50 dark:bg-amber-950/60 px-2.5 py-0.5 rounded-full border border-amber-300">
                                    Quiz no superado ({blk.attempts_count} {blk.attempts_count === 1 ? "intento" : "intentos"})
                                  </span>
                                ) : (
                                  <span className="inline-flex items-center gap-1 text-stone-400 bg-stone-100 dark:bg-stone-800 px-2.5 py-0.5 rounded-full">
                                    Quiz pendiente
                                  </span>
                                )}
                              </div>
                            </div>
                          </div>
                        ))}
                      </div>
                    </div>

                    {/* Examen del capítulo summary card */}
                    {ch.exam && (
                      <div className="p-4 bg-white dark:bg-stone-900 rounded-xl border border-stone-200/80 dark:border-stone-800 flex flex-col sm:flex-row sm:items-center justify-between gap-3">
                        <div className="space-y-0.5">
                          <span className="text-[11px] font-bold text-amber-700 dark:text-amber-400 uppercase tracking-wider">
                            Examen Integral del Capítulo {ch.chapter_number}
                          </span>
                          <p className="font-bold text-sm text-stone-900 dark:text-stone-100">
                            {ch.exam.title}
                          </p>
                        </div>

                        <div className="flex items-center gap-2">
                          <Badge
                            variant={
                              ch.exam.passed
                                ? "success"
                                : ch.exam.unlocked
                                ? "default"
                                : "outline"
                            }
                            className="text-xs"
                          >
                            {ch.exam.passed
                              ? `Aprobado con ${ch.exam.best_score}%`
                              : ch.exam.unlocked
                              ? "Listo para rendir"
                              : "Bloqueado"}
                          </Badge>
                          {ch.exam.completed_at && (
                            <span className="text-[11px] text-stone-400">
                              {formatDate(ch.exam.completed_at)}
                            </span>
                          )}
                        </div>
                      </div>
                    )}
                  </div>
                )}
              </div>
            );
          })}
        </div>
      </div>

      {/* Historial Completo de Evaluaciones ("¿Qué ha hecho?") */}
      <div className="space-y-4">
        <div>
          <h2 className="text-xl font-extrabold text-stone-900 dark:text-stone-100 tracking-tight flex items-center gap-2">
            <Clock className="w-5 h-5 text-amber-600" />
            Historial de Intentos y Evaluaciones ("¿Qué ha hecho?")
          </h2>
          <p className="text-xs text-stone-500 mt-0.5">
            Registro cronológico de todas las pruebas realizadas por el participante en la plataforma.
          </p>
        </div>

        <Card className="overflow-hidden border-stone-200 dark:border-stone-800">
          <div className="overflow-x-auto">
            <table className="w-full text-left text-sm">
              <thead className="bg-stone-50 dark:bg-stone-850 border-b border-stone-200 dark:border-stone-800 text-xs font-bold uppercase tracking-wider text-stone-500">
                <tr>
                  <th className="py-3.5 px-4">Fecha y Hora</th>
                  <th className="py-3.5 px-4">Evaluación</th>
                  <th className="py-3.5 px-4">Tipo</th>
                  <th className="py-3.5 px-4 text-center">Puntaje</th>
                  <th className="py-3.5 px-4 text-center">Calificación</th>
                  <th className="py-3.5 px-4 text-right">Resultado</th>
                </tr>
              </thead>
              <tbody className="divide-y divide-stone-100 dark:divide-stone-800">
                {attemptsHistory.length === 0 ? (
                  <tr>
                    <td colSpan={6} className="py-12 text-center text-stone-400 text-xs">
                      El participante aún no ha realizado ningún intento de evaluación.
                    </td>
                  </tr>
                ) : (
                  attemptsHistory.map((att) => (
                    <tr
                      key={att.id}
                      className="hover:bg-stone-50/60 dark:hover:bg-stone-850/50 transition-colors"
                    >
                      <td className="py-3.5 px-4 text-xs text-stone-500 whitespace-nowrap">
                        {formatDate(att.started_at)}
                      </td>
                      <td className="py-3.5 px-4 font-semibold text-stone-900 dark:text-stone-100 text-xs sm:text-sm">
                        {att.assessmentTitle}
                      </td>
                      <td className="py-3.5 px-4 whitespace-nowrap">
                        <span className="text-[11px] font-semibold text-stone-600 dark:text-stone-300 capitalize">
                          {att.assessmentType === "block_quiz"
                            ? "Quiz de Bloque"
                            : att.assessmentType === "chapter_exam"
                            ? "Examen de Capítulo"
                            : "Examen Final"}
                        </span>
                      </td>
                      <td className="py-3.5 px-4 text-center text-xs font-mono text-stone-600 dark:text-stone-400 whitespace-nowrap">
                        {att.score} / {att.max_score} pts
                      </td>
                      <td className="py-3.5 px-4 text-center font-bold text-xs whitespace-nowrap">
                        <span
                          className={cn(
                            att.passed
                              ? "text-emerald-700 dark:text-emerald-400"
                              : "text-rose-600 dark:text-rose-400"
                          )}
                        >
                          {att.percentage}%
                        </span>
                      </td>
                      <td className="py-3.5 px-4 text-right whitespace-nowrap">
                        <Badge
                          variant={att.passed ? "success" : "danger"}
                          className="text-[10px]"
                        >
                          {att.passed ? "Aprobado" : "Reprobado"}
                        </Badge>
                      </td>
                    </tr>
                  ))
                )}
              </tbody>
            </table>
          </div>
        </Card>
      </div>

      {/* Modales */}
      {isEditOpen && (
        <EditParticipantModal
          participant={participantWithStats}
          isOpen={isEditOpen}
          onClose={() => setIsEditOpen(false)}
          onSuccess={() => router.refresh()}
        />
      )}

      {isResetOpen && (
        <ResetPasswordModal
          participant={participantWithStats}
          isOpen={isResetOpen}
          onClose={() => setIsResetOpen(false)}
        />
      )}

      {isDeleteOpen && (
        <DeleteParticipantModal
          participant={participantWithStats}
          isOpen={isDeleteOpen}
          onClose={() => setIsDeleteOpen(false)}
          onSuccess={() => {
            router.push("/admin/participantes");
            router.refresh();
          }}
        />
      )}
    </div>
  );
}

