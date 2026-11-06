import { getAdminParticipantsWithStats } from "@/services/admin.service";
import { ParticipantListClient } from "@/components/admin/ParticipantListClient";

export const dynamic = "force-dynamic";

export default async function AdminParticipantsPage() {
  const participants = await getAdminParticipantsWithStats();

  return (
    <div className="space-y-6">
      <div>
        <h1 className="text-2xl sm:text-3xl font-extrabold text-stone-900 dark:text-stone-100 tracking-tight">
          Gestión de Participantes
        </h1>
        <p className="text-xs sm:text-sm text-stone-500 mt-1">
          Supervisión integral de estudiantes y administradores en Biblionario: progreso, evaluaciones, edición y recuperación de contraseñas.
        </p>
      </div>

      <ParticipantListClient initialParticipants={participants} />
    </div>
  );
}
