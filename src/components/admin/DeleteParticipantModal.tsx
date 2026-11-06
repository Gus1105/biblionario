"use client";

import React, { useState } from "react";
import { AlertTriangle, Trash2, X, AlertCircle } from "lucide-react";
import { Button } from "@/components/ui/Button";
import { deleteParticipantAction } from "@/actions/admin.actions";
import { ParticipantWithStats } from "@/services/admin.service";

interface DeleteParticipantModalProps {
  participant: ParticipantWithStats | { id: string; full_name?: string | null; email: string };
  isOpen: boolean;
  onClose: () => void;
  onSuccess: (deletedId: string) => void;
}

export function DeleteParticipantModal({
  participant,
  isOpen,
  onClose,
  onSuccess,
}: DeleteParticipantModalProps) {
  const [isLoading, setIsLoading] = useState(false);
  const [error, setError] = useState<string | null>(null);

  if (!isOpen) return null;

  const handleDelete = async () => {
    setIsLoading(true);
    setError(null);

    const result = await deleteParticipantAction(participant.id);
    setIsLoading(false);

    if (!result.success) {
      setError(result.error || "No se pudo eliminar el participante.");
      return;
    }

    onSuccess(participant.id);
    onClose();
  };

  return (
    <div className="fixed inset-0 z-50 flex items-center justify-center p-4 bg-stone-900/60 backdrop-blur-sm animate-in fade-in duration-150">
      <div className="relative w-full max-w-md bg-white dark:bg-stone-900 rounded-2xl shadow-2xl border border-rose-200 dark:border-rose-950 overflow-hidden">
        {/* Header */}
        <div className="flex items-center justify-between px-6 py-4 border-b border-rose-100 dark:border-rose-950/60 bg-rose-50/60 dark:bg-rose-950/30">
          <div className="flex items-center gap-2.5">
            <div className="w-8 h-8 rounded-lg bg-rose-100 dark:bg-rose-900/60 text-rose-700 dark:text-rose-300 flex items-center justify-center font-bold">
              <Trash2 className="w-4 h-4 text-rose-600" />
            </div>
            <div>
              <h3 className="text-base font-bold text-stone-900 dark:text-stone-100">
                Eliminar Participante
              </h3>
              <p className="text-xs text-rose-600 dark:text-rose-400 font-medium">
                Acción permanente e irreversible
              </p>
            </div>
          </div>
          <button
            onClick={onClose}
            className="p-1 rounded-lg text-stone-400 hover:text-stone-600 dark:hover:text-stone-200 hover:bg-stone-100 dark:hover:bg-stone-800 transition-colors"
          >
            <X className="w-5 h-5" />
          </button>
        </div>

        {/* Content */}
        <div className="p-6 space-y-4">
          {error && (
            <div className="p-3 bg-rose-50 dark:bg-rose-950/50 border border-rose-200 dark:border-rose-800 rounded-xl flex items-start gap-2.5 text-xs text-rose-700 dark:text-rose-300">
              <AlertCircle className="w-4 h-4 flex-shrink-0 mt-0.5" />
              <span>{error}</span>
            </div>
          )}

          <div className="space-y-3">
            <p className="text-sm text-stone-700 dark:text-stone-300">
              ¿Estás seguro de que deseas eliminar permanentemente a este usuario?
            </p>

            <div className="p-3 bg-stone-50 dark:bg-stone-850 rounded-xl border border-stone-200/80 dark:border-stone-800">
              <p className="font-bold text-sm text-stone-900 dark:text-stone-100">
                {participant.full_name || "Sin nombre registrado"}
              </p>
              <p className="text-xs text-stone-500 dark:text-stone-400">
                {participant.email}
              </p>
            </div>

            <div className="p-3 bg-amber-50/60 dark:bg-amber-950/30 rounded-xl border border-amber-200 dark:border-amber-900/40 text-xs text-amber-900 dark:text-amber-200 flex items-start gap-2">
              <AlertTriangle className="w-4 h-4 text-amber-600 flex-shrink-0 mt-0.5" />
              <p>
                Al eliminarlo, se borrarán todos sus accesos, puntuaciones, evaluaciones rendidas y su historial de progreso en Efesios.
              </p>
            </div>
          </div>

          {/* Action buttons */}
          <div className="flex items-center justify-end gap-2 pt-4 border-t border-stone-100 dark:border-stone-800">
            <Button
              type="button"
              variant="outline"
              size="sm"
              onClick={onClose}
              disabled={isLoading}
            >
              Cancelar
            </Button>
            <Button
              type="button"
              variant="danger"
              size="sm"
              onClick={handleDelete}
              isLoading={isLoading}
            >
              <Trash2 className="w-3.5 h-3.5 mr-1.5" />
              Sí, Eliminar Usuario
            </Button>
          </div>
        </div>
      </div>
    </div>
  );
}

