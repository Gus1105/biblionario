import { getAdminQuestions, getAdminChaptersAndBlocks } from "@/services/admin.service";
import { QuestionsManager } from "@/components/admin/QuestionsManager";

export const dynamic = "force-dynamic";

export default async function AdminQuestionsPage() {
  const [questions, chapters] = await Promise.all([
    getAdminQuestions(),
    getAdminChaptersAndBlocks(),
  ]);

  return (
    <div className="space-y-6">
      <div>
        <h1 className="text-2xl font-bold text-stone-900 dark:text-stone-100 tracking-tight">
          Gestor de Preguntas Bíblicas
        </h1>
        <p className="text-xs text-stone-500 mt-1">
          Administra las evaluaciones de cada bloque y examen general de Efesios.
        </p>
      </div>

      <QuestionsManager
        initialQuestions={questions}
        chapters={chapters}
      />
    </div>
  );
}

