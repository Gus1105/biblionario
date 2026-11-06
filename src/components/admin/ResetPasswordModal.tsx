"use client";

import React, { useState } from "react";
import {
  X,
  KeyRound,
  Mail,
  Copy,
  Check,
  AlertCircle,
  Eye,
  EyeOff,
  Link as LinkIcon,
  Send,
} from "lucide-react";
import { Button } from "@/components/ui/Button";
import {
  resetParticipantPasswordAction,
  generatePasswordRecoveryAction,
} from "@/actions/admin.actions";
import { ParticipantWithStats } from "@/services/admin.service";

interface ResetPasswordModalProps {
  participant: ParticipantWithStats;
  isOpen: boolean;
  onClose: () => void;
}

export function ResetPasswordModal({
  participant,
  isOpen,
  onClose,
}: ResetPasswordModalProps) {
  const [tab, setTab] = useState<"direct" | "link">("direct");
  const [newPassword, setNewPassword] = useState("");
  const [showPassword, setShowPassword] = useState(false);
  const [isLoading, setIsLoading] = useState(false);
  const [error, setError] = useState<string | null>(null);
  const [successMessage, setSuccessMessage] = useState<string | null>(null);
  const [generatedLink, setGeneratedLink] = useState<string | null>(null);
  const [copied, setCopied] = useState(false);

  if (!isOpen) return null;

  const handleDirectReset = async (e: React.FormEvent) => {
    e.preventDefault();
    setIsLoading(true);
    setError(null);
    setSuccessMessage(null);

    if (newPassword.length < 6) {
      setError("La nueva contraseña debe tener al menos 6 caracteres.");
      setIsLoading(false);
      return;
    }

    const res = await resetParticipantPasswordAction({
      userId: participant.id,
      newPassword,
    });

    setIsLoading(false);

    if (!res.success) {
      setError(res.error || "No se pudo cambiar la contraseña.");
      return;
    }

    setSuccessMessage("¡Contraseña actualizada correctamente para el participante!");
    setNewPassword("");
  };

  const handleGenerateLink = async () => {
    setIsLoading(true);
    setError(null);
    setSuccessMessage(null);
    setGeneratedLink(null);

    const res = await generatePasswordRecoveryAction(participant.email);
    setIsLoading(false);

    if (!res.success) {
      setError(res.error || "No se pudo generar el enlace de recuperación.");
      return;
    }

    setSuccessMessage(
      "Enlace de recuperación generado y solicitud de correo enviada al participante."
    );
    if (res.recoveryLink) {
      setGeneratedLink(res.recoveryLink);
    }
  };

  const handleCopyLink = () => {
    if (!generatedLink) return;
    navigator.clipboard.writeText(generatedLink);
    setCopied(true);
    setTimeout(() => setCopied(false), 2500);
  };

  return (
    <div className="fixed inset-0 z-50 flex items-center justify-center p-4 bg-stone-900/60 backdrop-blur-sm animate-in fade-in duration-150">
      <div className="relative w-full max-w-md bg-white dark:bg-stone-900 rounded-2xl shadow-2xl border border-stone-200 dark:border-stone-800 overflow-hidden">
        {/* Header */}
        <div className="flex items-center justify-between px-6 py-4 border-b border-stone-100 dark:border-stone-800 bg-stone-50/50 dark:bg-stone-850/50">
          <div className="flex items-center gap-2.5">
            <div className="w-8 h-8 rounded-lg bg-amber-100 dark:bg-amber-950/60 text-amber-700 dark:text-amber-300 flex items-center justify-center font-bold">
              <KeyRound className="w-4 h-4" />
            </div>
            <div>
              <h3 className="text-base font-bold text-stone-900 dark:text-stone-100">
                Recuperación de Contraseña
              </h3>
              <p className="text-xs text-stone-500 truncate max-w-[230px]">
                {participant.full_name || participant.email}
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

        {/* Tab Selector */}
        <div className="flex border-b border-stone-100 dark:border-stone-800 bg-stone-50 dark:bg-stone-850">
          <button
            type="button"
            onClick={() => {
              setTab("direct");
              setError(null);
              setSuccessMessage(null);
            }}
            className={`flex-1 py-3 text-xs font-bold text-center border-b-2 transition-colors ${
              tab === "direct"
                ? "border-amber-600 text-amber-700 dark:text-amber-300 bg-white dark:bg-stone-900"
                : "border-transparent text-stone-500 hover:text-stone-800 dark:hover:text-stone-300"
            }`}
          >
            Asignar Contraseña Directa
          </button>
          <button
            type="button"
            onClick={() => {
              setTab("link");
              setError(null);
              setSuccessMessage(null);
            }}
            className={`flex-1 py-3 text-xs font-bold text-center border-b-2 transition-colors ${
              tab === "link"
                ? "border-amber-600 text-amber-700 dark:text-amber-300 bg-white dark:bg-stone-900"
                : "border-transparent text-stone-500 hover:text-stone-800 dark:hover:text-stone-300"
            }`}
          >
            Enlace de Recuperación
          </button>
        </div>

        {/* Body Content */}
        <div className="p-6 space-y-4">
          {error && (
            <div className="p-3 bg-rose-50 dark:bg-rose-950/50 border border-rose-200 dark:border-rose-800 rounded-xl flex items-start gap-2.5 text-xs text-rose-700 dark:text-rose-300">
              <AlertCircle className="w-4 h-4 flex-shrink-0 mt-0.5" />
              <span>{error}</span>
            </div>
          )}

          {successMessage && (
            <div className="p-3 bg-emerald-50 dark:bg-emerald-950/50 border border-emerald-200 dark:border-emerald-800 rounded-xl flex items-start gap-2.5 text-xs text-emerald-700 dark:text-emerald-300">
              <Check className="w-4 h-4 flex-shrink-0 mt-0.5 text-emerald-600" />
              <span>{successMessage}</span>
            </div>
          )}

          {tab === "direct" ? (
            <form onSubmit={handleDirectReset} className="space-y-4">
              <div>
                <label className="block text-xs font-semibold text-stone-700 dark:text-stone-300 mb-1.5">
                  Nueva Contraseña para el participante
                </label>
                <div className="relative">
                  <KeyRound className="w-4 h-4 text-stone-400 absolute left-3 top-1/2 -translate-y-1/2" />
                  <input
                    type={showPassword ? "text" : "password"}
                    required
                    minLength={6}
                    value={newPassword}
                    onChange={(e) => setNewPassword(e.target.value)}
                    placeholder="Mínimo 6 caracteres"
                    className="w-full pl-9 pr-10 py-2 text-sm rounded-xl border border-stone-300 dark:border-stone-700 bg-white dark:bg-stone-800 text-stone-900 dark:text-stone-100 focus:outline-none focus:ring-2 focus:ring-amber-500/50 focus:border-amber-500"
                  />
                  <button
                    type="button"
                    onClick={() => setShowPassword(!showPassword)}
                    className="absolute right-3 top-1/2 -translate-y-1/2 text-stone-400 hover:text-stone-600"
                  >
                    {showPassword ? <EyeOff className="w-4 h-4" /> : <Eye className="w-4 h-4" />}
                  </button>
                </div>
                <p className="text-[11px] text-stone-500 dark:text-stone-400 mt-1.5">
                  Esta contraseña reemplazará inmediatamente la anterior. Podrás facilitársela al participante.
                </p>
              </div>

              <div className="flex items-center justify-end gap-2 pt-2">
                <Button type="button" variant="outline" size="sm" onClick={onClose}>
                  Cerrar
                </Button>
                <Button type="submit" variant="primary" size="sm" isLoading={isLoading}>
                  Actualizar Contraseña
                </Button>
              </div>
            </form>
          ) : (
            <div className="space-y-4">
              <div className="p-3 bg-amber-50/60 dark:bg-amber-950/30 rounded-xl border border-amber-200 dark:border-amber-900/40 text-xs text-amber-900 dark:text-amber-200">
                <p className="font-semibold flex items-center gap-1.5 mb-1">
                  <Mail className="w-4 h-4" /> Destinatario: {participant.email}
                </p>
                <p className="text-[11px] text-stone-600 dark:text-stone-400">
                  Genera un enlace criptográfico seguro para que el usuario restablezca su propia contraseña. Puedes copiarlo para enviárselo por WhatsApp o chat directo.
                </p>
              </div>

              <Button
                type="button"
                variant="primary"
                size="md"
                className="w-full"
                onClick={handleGenerateLink}
                isLoading={isLoading}
              >
                <LinkIcon className="w-4 h-4 mr-1.5" />
                Generar Enlace Seguro
              </Button>

              {generatedLink && (
                <div className="space-y-1.5 pt-2">
                  <label className="block text-xs font-semibold text-stone-700 dark:text-stone-300">
                    Enlace de recuperación generado:
                  </label>
                  <div className="flex items-center gap-2">
                    <input
                      type="text"
                      readOnly
                      value={generatedLink}
                      className="w-full text-xs font-mono py-2 px-3 bg-stone-100 dark:bg-stone-800 rounded-xl border border-stone-200 dark:border-stone-700 text-stone-700 dark:text-stone-300 select-all"
                    />
                    <Button
                      type="button"
                      variant="outline"
                      size="sm"
                      onClick={handleCopyLink}
                      className="flex-shrink-0"
                    >
                      {copied ? (
                        <>
                          <Check className="w-3.5 h-3.5 text-emerald-600 mr-1" />
                          Copiado
                        </>
                      ) : (
                        <>
                          <Copy className="w-3.5 h-3.5 mr-1" />
                          Copiar
                        </>
                      )}
                    </Button>
                  </div>
                </div>
              )}

              <div className="flex items-center justify-end pt-2">
                <Button type="button" variant="outline" size="sm" onClick={onClose}>
                  Cerrar
                </Button>
              </div>
            </div>
          )}
        </div>
      </div>
    </div>
  );
}

