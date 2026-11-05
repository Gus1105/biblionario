import { getAdminParticipants } from "@/services/admin.service";
import { Card, CardHeader, CardTitle, CardContent } from "@/components/ui/Card";
import { Badge } from "@/components/ui/Badge";
import { Users, Calendar, Mail, Shield, User } from "lucide-react";

export const dynamic = "force-dynamic";

export default async function AdminParticipantsPage() {
  const participants = await getAdminParticipants();

  return (
    <div className="space-y-6">
      <div>
        <h1 className="text-2xl font-bold text-stone-900 dark:text-stone-100 tracking-tight">
          Participantes Registrados
        </h1>
        <p className="text-xs text-stone-500 mt-1">
          Supervisión de estudiantes y administradores en la plataforma Biblionario.
        </p>
      </div>

      <Card>
        <div className="overflow-x-auto">
          <table className="w-full text-left text-sm">
            <thead className="bg-stone-50 dark:bg-stone-850 border-b border-stone-200 dark:border-stone-800 text-xs font-bold uppercase tracking-wider text-stone-500">
              <tr>
                <th className="py-3.5 px-4">Participante</th>
                <th className="py-3.5 px-4">Correo</th>
                <th className="py-3.5 px-4">Rol</th>
                <th className="py-3.5 px-4">Fecha de Registro</th>
              </tr>
            </thead>
            <tbody className="divide-y divide-stone-100 dark:divide-stone-800">
              {participants.length === 0 ? (
                <tr>
                  <td colSpan={4} className="py-8 text-center text-stone-400 text-xs">
                    No hay participantes registrados.
                  </td>
                </tr>
              ) : (
                participants.map((p) => {
                  const role = p.roles?.[0]?.role || "participant";
                  const formattedDate = new Date(p.created_at).toLocaleDateString("es-ES", {
                    year: "numeric",
                    month: "short",
                    day: "numeric",
                  });

                  return (
                    <tr key={p.id} className="hover:bg-stone-50/50 dark:hover:bg-stone-850/50">
                      <td className="py-3.5 px-4 font-semibold text-stone-900 dark:text-stone-100 flex items-center gap-2">
                        <div className="w-7 h-7 rounded-full bg-amber-100 dark:bg-amber-950/60 text-amber-800 dark:text-amber-300 flex items-center justify-center text-xs font-bold">
                          {p.full_name ? p.full_name.charAt(0) : "U"}
                        </div>
                        <span>{p.full_name || "Sin nombre"}</span>
                      </td>
                      <td className="py-3.5 px-4 text-stone-600 dark:text-stone-400">
                        {p.email}
                      </td>
                      <td className="py-3.5 px-4">
                        <Badge variant={role === "admin" ? "default" : "outline"} className="text-[10px]">
                          {role === "admin" ? "Administrador" : "Estudiante"}
                        </Badge>
                      </td>
                      <td className="py-3.5 px-4 text-stone-500 text-xs">
                        {formattedDate}
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
  );
}

