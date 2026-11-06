import { notFound } from "next/navigation";
import Link from "next/link";
import { ArrowLeft } from "lucide-react";
import { Button } from "@/components/ui/Button";
import { getParticipantProgressDetails } from "@/services/admin.service";
import { ParticipantDetailView } from "@/components/admin/ParticipantDetailView";

export const dynamic = "force-dynamic";

interface AdminParticipantDetailPageProps {
  params: Promise<{
    id: string;
  }>;
}

export default async function AdminParticipantDetailPage({
  params,
}: AdminParticipantDetailPageProps) {
  const { id } = await params;
  const data = await getParticipantProgressDetails(id);

  if (!data) {
    return (
      <div className="max-w-xl mx-auto text-center py-16 space-y-4">
        <h2 className="text-2xl font-bold text-stone-900 dark:text-stone-100">
          Participante no encontrado
        </h2>
        <p className="text-sm text-stone-500">
          No se encontró el perfil del participante con el identificador solicitado o fue eliminado.
        </p>
        <div className="pt-2">
          <Link href="/admin/participantes">
            <Button variant="primary" size="md">
              <ArrowLeft className="w-4 h-4 mr-2" />
              Volver a la lista de participantes
            </Button>
          </Link>
        </div>
      </div>
    );
  }

  return <ParticipantDetailView data={data} />;
}

