"use client";

import React, { useState, useEffect } from "react";
import Link from "next/link";
import { useRouter } from "next/navigation";
import {
  Users,
  Search,
  Shield,
  User,
  UserPlus,
  Eye,
  Edit2,
  KeyRound,
  Trash2,
  Calendar,
  Clock,
  Award,
  BookOpen,
  CheckCircle2,
  Filter,
} from "lucide-react";
import { Card } from "@/components/ui/Card";
import { Badge } from "@/components/ui/Badge";
import { Button } from "@/components/ui/Button";
import { ParticipantWithStats } from "@/services/admin.service";
import { EditParticipantModal } from "./EditParticipantModal";
import { ResetPasswordModal } from "./ResetPasswordModal";
import { DeleteParticipantModal } from "./DeleteParticipantModal";
import { CreateParticipantModal } from "./CreateParticipantModal";
import { cn } from "@/lib/utils";

interface ParticipantListClientProps {
  initialParticipants: ParticipantWithStats[];
}

export function ParticipantListClient({
  initialParticipants,
}: ParticipantListClientProps) {
  const router = useRouter();
  const [participants, setParticipants] = useState<ParticipantWithStats[]>(initialParticipants);
  const [searchTerm, setSearchTerm] = useState("");
  const [roleFilter, setRoleFilter] = useState<"all" | "participant" | "admin">("all");

  const [isCreateOpen, setIsCreateOpen] = useState(false);
  const [editingParticipant, setEditingParticipant] = useState<ParticipantWithStats | null>(null);
  const [resettingParticipant, setResettingParticipant] = useState<ParticipantWithStats | null>(null);
  const [deletingParticipant, setDeletingParticipant] = useState<ParticipantWithStats | null>(null);

  // Mantener sincronizado el estado local si cambian los datos del servidor
  useEffect(() => {
    setParticipants(initialParticipants);
  }, [initialParticipants]);

  // Filtrado reactivo
  const filteredParticipants = participants.filter((p) => {
    const matchesSearch =
      (p.full_name || "").toLowerCase().includes(searchTerm.toLowerCase()) ||
      p.email.toLowerCase().includes(searchTerm.toLowerCase());

    const matchesRole =
      roleFilter === "all" ? true : p.role === roleFilter;

    return matchesSearch && matchesRole;
  });

  // Métricas rápidas
  const totalUsers = participants.length;
  const totalStudents = participants.filter((p) => p.role === "participant").length;
  const totalAdmins = participants.filter((p) => p.role === "admin").length;
  const overallAvg =
    totalUsers > 0
      ? Math.round(
          participants.reduce((acc, curr) => acc + curr.avg_score, 0) /
            participants.filter((p) => p.total_attempts > 0).length || 0
        )
      : 0;

  const handleUpdateSuccess = () => {
    router.refresh();
  };

  const handleDeleteSuccess = (deletedId: string) => {
    // 1. Quitarlo de inmediato de la lista visual (sin esperar recarga)
    setParticipants((prev) => prev.filter((p) => p.id !== deletedId));
    // 2. Refrescar datos en segundo plano
    router.refresh();
  };

  const formatDate = (dateStr: string | null) => {
    if (!dateStr) return "Sin actividad";
    try {
      return new Date(dateStr).toLocaleDateString("es-ES", {
        year: "numeric",
        month: "short",
        day: "numeric",
      });
    } catch {
      return dateStr;
    }
  };

  return (
    <div className="space-y-6">
      {/* KPI Stats Cards */}
      <div className="grid grid-cols-2 lg:grid-cols-4 gap-3 sm:gap-4">
        <div className="p-4 sm:p-5 rounded-2xl bg-white dark:bg-stone-900 border border-stone-200 dark:border-stone-800 shadow-sm">
          <div className="flex items-center justify-between">
            <span className="text-xs font-semibold text-stone-500 uppercase tracking-wider">
              Total Participantes
            </span>
            <div className="p-2 bg-amber-100 dark:bg-amber-950/60 rounded-xl text-amber-700 dark:text-amber-300">
              <Users className="w-4 h-4" />
            </div>
          </div>
          <p className="text-2xl sm:text-3xl font-extrabold text-stone-900 dark:text-stone-100 mt-2">
            {totalUsers}
          </p>
          <span className="text-[11px] text-stone-400">Registrados en la plataforma</span>
        </div>

        <div className="p-4 sm:p-5 rounded-2xl bg-white dark:bg-stone-900 border border-stone-200 dark:border-stone-800 shadow-sm">
          <div className="flex items-center justify-between">
            <span className="text-xs font-semibold text-stone-500 uppercase tracking-wider">
              Estudiantes
            </span>
            <div className="p-2 bg-emerald-100 dark:bg-emerald-950/60 rounded-xl text-emerald-700 dark:text-emerald-300">
              <User className="w-4 h-4" />
            </div>
          </div>
          <p className="text-2xl sm:text-3xl font-extrabold text-emerald-600 dark:text-emerald-400 mt-2">
            {totalStudents}
          </p>
          <span className="text-[11px] text-stone-400">Cursando Efesios</span>
        </div>

        <div className="p-4 sm:p-5 rounded-2xl bg-white dark:bg-stone-900 border border-stone-200 dark:border-stone-800 shadow-sm">
          <div className="flex items-center justify-between">
            <span className="text-xs font-semibold text-stone-500 uppercase tracking-wider">
              Administradores
            </span>
            <div className="p-2 bg-indigo-100 dark:bg-indigo-950/60 rounded-xl text-indigo-700 dark:text-indigo-300">
              <Shield className="w-4 h-4" />
            </div>
          </div>
          <p className="text-2xl sm:text-3xl font-extrabold text-indigo-600 dark:text-indigo-400 mt-2">
            {totalAdmins}
          </p>
          <span className="text-[11px] text-stone-400">Con permisos totales</span>
        </div>

        <div className="p-4 sm:p-5 rounded-2xl bg-white dark:bg-stone-900 border border-stone-200 dark:border-stone-800 shadow-sm">
          <div className="flex items-center justify-between">
            <span className="text-xs font-semibold text-stone-500 uppercase tracking-wider">
              Promedio General
            </span>
            <div className="p-2 bg-sky-100 dark:bg-sky-950/60 rounded-xl text-sky-700 dark:text-sky-300">
              <Award className="w-4 h-4" />
            </div>
          </div>
          <p className="text-2xl sm:text-3xl font-extrabold text-sky-600 dark:text-sky-400 mt-2">
            {overallAvg}%
          </p>
          <span className="text-[11px] text-stone-400">En evaluaciones realizadas</span>
        </div>
      </div>

      {/* Filter and Search Bar */}
      <div className="flex flex-col md:flex-row gap-3 md:items-center justify-between bg-white dark:bg-stone-900 p-4 rounded-2xl border border-stone-200 dark:border-stone-800 shadow-sm">
        {/* Search */}
        <div className="relative flex-1 max-w-md">
          <Search className="w-4 h-4 text-stone-400 absolute left-3 top-1/2 -translate-y-1/2" />
          <input
            type="text"
            value={searchTerm}
            onChange={(e) => setSearchTerm(e.target.value)}
            placeholder="Buscar por nombre o correo electrónico..."
            className="w-full pl-9 pr-4 py-2 text-sm rounded-xl border border-stone-200 dark:border-stone-700 bg-stone-50 dark:bg-stone-800/80 text-stone-900 dark:text-stone-100 placeholder:text-stone-400 focus:outline-none focus:ring-2 focus:ring-amber-500/50 focus:border-amber-500"
          />
        </div>

        <div className="flex items-center gap-2.5 justify-between md:justify-end flex-wrap sm:flex-nowrap">
          {/* Role Filters */}
          <div className="flex items-center gap-1.5 overflow-x-auto pb-1 sm:pb-0">
            <button
              onClick={() => setRoleFilter("all")}
              className={cn(
                "px-3 py-1.5 rounded-lg text-xs font-bold transition-colors whitespace-nowrap cursor-pointer",
                roleFilter === "all"
                  ? "bg-stone-900 text-white dark:bg-stone-100 dark:text-stone-900"
                  : "bg-stone-100 text-stone-600 dark:bg-stone-800 dark:text-stone-300 hover:bg-stone-200"
              )}
            >
              Todos ({totalUsers})
            </button>
            <button
              onClick={() => setRoleFilter("participant")}
              className={cn(
                "px-3 py-1.5 rounded-lg text-xs font-bold transition-colors whitespace-nowrap cursor-pointer",
                roleFilter === "participant"
                  ? "bg-amber-600 text-white shadow-sm"
                  : "bg-stone-100 text-stone-600 dark:bg-stone-800 dark:text-stone-300 hover:bg-stone-200"
              )}
            >
              Estudiantes ({totalStudents})
            </button>
            <button
              onClick={() => setRoleFilter("admin")}
              className={cn(
                "px-3 py-1.5 rounded-lg text-xs font-bold transition-colors whitespace-nowrap cursor-pointer",
                roleFilter === "admin"
                  ? "bg-indigo-600 text-white shadow-sm"
                  : "bg-stone-100 text-stone-600 dark:bg-stone-800 dark:text-stone-300 hover:bg-stone-200"
              )}
            >
              Admins ({totalAdmins})
            </button>
          </div>

          {/* Botón para crear participante sin límite de correos */}
          <Button
            variant="primary"
            size="sm"
            onClick={() => setIsCreateOpen(true)}
            className="text-xs whitespace-nowrap py-2"
          >
            <UserPlus className="w-3.5 h-3.5 mr-1" />
            Nuevo Participante
          </Button>
        </div>
      </div>

      {/* Participants Table (Desktop) */}
      <div className="hidden lg:block">
        <Card className="overflow-hidden border-stone-200 dark:border-stone-800">
          <div className="overflow-x-auto">
            <table className="w-full text-left text-sm">
              <thead className="bg-stone-50 dark:bg-stone-850 border-b border-stone-200 dark:border-stone-800 text-xs font-bold uppercase tracking-wider text-stone-500">
                <tr>
                  <th className="py-3.5 px-4">Participante</th>
                  <th className="py-3.5 px-4">Rol</th>
                  <th className="py-3.5 px-4">Progreso Efesios</th>
                  <th className="py-3.5 px-4 text-center">Evaluaciones</th>
                  <th className="py-3.5 px-4 text-center">Promedio</th>
                  <th className="py-3.5 px-4">Última Actividad</th>
                  <th className="py-3.5 px-4 text-right">Acciones</th>
                </tr>
              </thead>
              <tbody className="divide-y divide-stone-100 dark:divide-stone-800">
                {filteredParticipants.length === 0 ? (
                  <tr>
                    <td colSpan={7} className="py-12 text-center text-stone-400 text-xs">
                      No se encontraron participantes con ese criterio de búsqueda.
                    </td>
                  </tr>
                ) : (
                  filteredParticipants.map((p) => {
                    const blockPercent = Math.round((p.completed_blocks / 22) * 100);

                    return (
                      <tr
                        key={p.id}
                        className="hover:bg-stone-50/70 dark:hover:bg-stone-850/60 transition-colors"
                      >
                        {/* Participante name & email */}
                        <td className="py-3.5 px-4">
                          <div className="flex items-center gap-3">
                            <div className="w-9 h-9 rounded-full bg-gradient-to-tr from-amber-500 to-amber-600 text-white flex items-center justify-center text-xs font-bold flex-shrink-0 shadow-sm">
                              {p.full_name ? p.full_name.charAt(0).toUpperCase() : "U"}
                            </div>
                            <div className="min-w-0">
                              <p className="font-semibold text-stone-900 dark:text-stone-100 truncate">
                                {p.full_name || "Sin nombre registrado"}
                              </p>
                              <p className="text-xs text-stone-500 dark:text-stone-400 truncate">
                                {p.email}
                              </p>
                            </div>
                          </div>
                        </td>

                        {/* Rol */}
                        <td className="py-3.5 px-4 whitespace-nowrap">
                          <Badge
                            variant={p.role === "admin" ? "default" : "outline"}
                            className="text-[11px]"
                          >
                            {p.role === "admin" ? "Administrador" : "Estudiante"}
                          </Badge>
                        </td>

                        {/* Progreso */}
                        <td className="py-3.5 px-4 min-w-[160px]">
                          <div className="space-y-1">
                            <div className="flex items-center justify-between text-xs">
                              <span className="font-semibold text-stone-700 dark:text-stone-300">
                                {p.completed_blocks}/22 bloques
                              </span>
                              <span className="text-stone-400 text-[11px] font-mono">
                                {blockPercent}%
                              </span>
                            </div>
                            <div className="w-full bg-stone-100 dark:bg-stone-800 h-2 rounded-full overflow-hidden">
                              <div
                                className="bg-amber-600 h-full rounded-full transition-all"
                                style={{ width: `${blockPercent}%` }}
                              />
                            </div>
                            <span className="text-[10px] text-stone-400">
                              {p.completed_chapters}/6 caps. aprobados
                            </span>
                          </div>
                        </td>

                        {/* Total Intentos */}
                        <td className="py-3.5 px-4 text-center whitespace-nowrap">
                          <span className="inline-flex items-center px-2.5 py-1 rounded-lg bg-stone-100 dark:bg-stone-800 text-stone-700 dark:text-stone-300 text-xs font-semibold">
                            {p.total_attempts} intentos
                          </span>
                        </td>

                        {/* Promedio */}
                        <td className="py-3.5 px-4 text-center whitespace-nowrap">
                          {p.total_attempts > 0 ? (
                            <span
                              className={cn(
                                "inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-bold border",
                                p.avg_score >= 70
                                  ? "bg-emerald-100 text-emerald-800 dark:bg-emerald-950/60 dark:text-emerald-300 border-emerald-300 dark:border-emerald-800"
                                  : "bg-amber-100 text-amber-800 dark:bg-amber-950/60 dark:text-amber-300 border-amber-300 dark:border-amber-800"
                              )}
                            >
                              {p.avg_score}%
                            </span>
                          ) : (
                            <span className="text-xs text-stone-400">—</span>
                          )}
                        </td>

                        {/* Última actividad */}
                        <td className="py-3.5 px-4 text-xs text-stone-500 whitespace-nowrap">
                          <div className="flex items-center gap-1.5">
                            <Clock className="w-3.5 h-3.5 text-stone-400" />
                            <span>{formatDate(p.last_activity_at)}</span>
                          </div>
                        </td>

                        {/* Botones de acción */}
                        <td className="py-3.5 px-4 text-right whitespace-nowrap">
                          <div className="flex items-center justify-end gap-1.5">
                            {/* Ver Progreso */}
                            <Link href={`/admin/participantes/${p.id}`}>
                              <Button
                                variant="outline"
                                size="sm"
                                title="Ver Progreso y Detalles"
                                className="hover:bg-amber-50 hover:text-amber-700 hover:border-amber-300 dark:hover:bg-amber-950/40 text-xs"
                              >
                                <Eye className="w-3.5 h-3.5 mr-1" />
                                Ver
                              </Button>
                            </Link>

                            {/* Editar */}
                            <Button
                              variant="secondary"
                              size="sm"
                              onClick={() => setEditingParticipant(p)}
                              title="Editar Información"
                              className="text-xs"
                            >
                              <Edit2 className="w-3.5 h-3.5 mr-1" />
                              Editar
                            </Button>

                            {/* Contraseña */}
                            <Button
                              variant="secondary"
                              size="sm"
                              onClick={() => setResettingParticipant(p)}
                              title="Recuperar / Cambiar Contraseña"
                              className="text-xs text-amber-700 dark:text-amber-300 hover:bg-amber-100 dark:hover:bg-amber-950/60"
                            >
                              <KeyRound className="w-3.5 h-3.5 mr-1" />
                              Clave
                            </Button>

                            {/* Eliminar */}
                            <Button
                              variant="secondary"
                              size="sm"
                              onClick={() => setDeletingParticipant(p)}
                              title="Eliminar Usuario"
                              className="text-xs text-rose-600 dark:text-rose-400 hover:bg-rose-50 dark:hover:bg-rose-950/50 hover:border-rose-300"
                            >
                              <Trash2 className="w-3.5 h-3.5" />
                            </Button>
                          </div>
                        </td>
                      </tr>
                    );
                  })
                )}
              </tbody>
            </table>
          </div>
        </Card>
      </div>

      {/* Participants Cards (Mobile & Tablet) */}
      <div className="lg:hidden space-y-3">
        {filteredParticipants.length === 0 ? (
          <div className="p-8 text-center bg-white dark:bg-stone-900 rounded-2xl border border-stone-200 dark:border-stone-800 text-stone-400 text-xs">
            No se encontraron participantes registrados.
          </div>
        ) : (
          filteredParticipants.map((p) => {
            const blockPercent = Math.round((p.completed_blocks / 22) * 100);

            return (
              <div
                key={p.id}
                className="p-4 sm:p-5 bg-white dark:bg-stone-900 rounded-2xl border border-stone-200 dark:border-stone-800 shadow-sm space-y-3.5"
              >
                {/* Header card info */}
                <div className="flex items-start justify-between gap-3">
                  <div className="flex items-center gap-3 min-w-0">
                    <div className="w-10 h-10 rounded-full bg-gradient-to-tr from-amber-500 to-amber-600 text-white flex items-center justify-center text-sm font-bold flex-shrink-0 shadow-sm">
                      {p.full_name ? p.full_name.charAt(0).toUpperCase() : "U"}
                    </div>
                    <div className="min-w-0">
                      <p className="font-bold text-stone-900 dark:text-stone-100 text-sm truncate">
                        {p.full_name || "Sin nombre registrado"}
                      </p>
                      <p className="text-xs text-stone-500 dark:text-stone-400 truncate">
                        {p.email}
                      </p>
                    </div>
                  </div>

                  <Badge
                    variant={p.role === "admin" ? "default" : "outline"}
                    className="text-[10px] flex-shrink-0"
                  >
                    {p.role === "admin" ? "Admin" : "Alumno"}
                  </Badge>
                </div>

                {/* Progress bar */}
                <div className="p-3 bg-stone-50 dark:bg-stone-850 rounded-xl space-y-1.5 border border-stone-100 dark:border-stone-800">
                  <div className="flex items-center justify-between text-xs">
                    <span className="font-bold text-stone-700 dark:text-stone-300">
                      Progreso: {p.completed_blocks}/22 bloques
                    </span>
                    <span className="font-mono text-amber-700 dark:text-amber-300 font-bold">
                      {blockPercent}%
                    </span>
                  </div>
                  <div className="w-full bg-stone-200 dark:bg-stone-700 h-2 rounded-full overflow-hidden">
                    <div
                      className="bg-amber-600 h-full rounded-full transition-all"
                      style={{ width: `${blockPercent}%` }}
                    />
                  </div>
                  <div className="flex items-center justify-between text-[11px] text-stone-500 dark:text-stone-400 pt-1">
                    <span>{p.completed_chapters}/6 caps. aprobados</span>
                    <span>{p.total_attempts} intentos ({p.avg_score}% prom.)</span>
                  </div>
                </div>

                {/* Dates info */}
                <div className="flex items-center justify-between text-[11px] text-stone-400 px-1">
                  <span>Reg: {formatDate(p.created_at)}</span>
                  <span>Activo: {formatDate(p.last_activity_at)}</span>
                </div>

                {/* Actions Grid */}
                <div className="grid grid-cols-4 gap-1.5 pt-1 border-t border-stone-100 dark:border-stone-800">
                  <Link href={`/admin/participantes/${p.id}`} className="w-full">
                    <Button
                      variant="primary"
                      size="sm"
                      className="w-full text-xs py-2 px-1"
                    >
                      <Eye className="w-3.5 h-3.5 mr-1" />
                      Ver
                    </Button>
                  </Link>

                  <Button
                    variant="outline"
                    size="sm"
                    onClick={() => setEditingParticipant(p)}
                    className="w-full text-xs py-2 px-1"
                  >
                    <Edit2 className="w-3.5 h-3.5 mr-1" />
                    Editar
                  </Button>

                  <Button
                    variant="secondary"
                    size="sm"
                    onClick={() => setResettingParticipant(p)}
                    className="w-full text-xs py-2 px-1 text-amber-800 dark:text-amber-200"
                  >
                    <KeyRound className="w-3.5 h-3.5 mr-1" />
                    Clave
                  </Button>

                  <Button
                    variant="secondary"
                    size="sm"
                    onClick={() => setDeletingParticipant(p)}
                    className="w-full text-xs py-2 px-1 text-rose-600 dark:text-rose-400 hover:bg-rose-50"
                  >
                    <Trash2 className="w-3.5 h-3.5 mr-1" />
                    Borrar
                  </Button>
                </div>
              </div>
            );
          })
        )}
      </div>

      {/* Modales */}
      {editingParticipant && (
        <EditParticipantModal
          participant={editingParticipant}
          isOpen={Boolean(editingParticipant)}
          onClose={() => setEditingParticipant(null)}
          onSuccess={handleUpdateSuccess}
        />
      )}

      {resettingParticipant && (
        <ResetPasswordModal
          participant={resettingParticipant}
          isOpen={Boolean(resettingParticipant)}
          onClose={() => setResettingParticipant(null)}
        />
      )}

      {deletingParticipant && (
        <DeleteParticipantModal
          participant={deletingParticipant}
          isOpen={Boolean(deletingParticipant)}
          onClose={() => setDeletingParticipant(null)}
          onSuccess={handleDeleteSuccess}
        />
      )}

      {isCreateOpen && (
        <CreateParticipantModal
          isOpen={isCreateOpen}
          onClose={() => setIsCreateOpen(false)}
          onSuccess={handleUpdateSuccess}
        />
      )}
    </div>
  );
}

