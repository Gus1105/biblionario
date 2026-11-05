import { getAdminMetrics } from "@/services/admin.service";
import { Card, CardHeader, CardTitle, CardDescription, CardContent } from "@/components/ui/Card";
import { Button } from "@/components/ui/Button";
import Link from "next/link";
import {
  Users,
  BookOpen,
  Layers,
  HelpCircle,
  Award,
  ArrowRight,
  PlusCircle,
  FileText,
} from "lucide-react";

export const dynamic = "force-dynamic";

export default async function AdminDashboardPage() {
  const metrics = await getAdminMetrics();

  return (
    <div className="space-y-8">
      {/* Header */}
      <div className="flex flex-col sm:flex-row sm:items-center justify-between gap-4 pb-4 border-b border-stone-200 dark:border-stone-800">
        <div>
          <span className="text-xs font-bold uppercase tracking-wider text-amber-600">
            Control de Contenido y Métricas
          </span>
          <h1 className="text-2xl sm:text-3xl font-extrabold text-stone-900 dark:text-stone-100 tracking-tight mt-0.5">
            Panel de Administración
          </h1>
          <p className="text-sm text-stone-500 mt-1">
            Gestiona preguntas, bloques de estudio y supervisa el aprendizaje de los participantes sin tocar código.
          </p>
        </div>

        <div className="flex items-center gap-3">
          <Link href="/admin/preguntas">
            <Button variant="primary" size="md">
              <PlusCircle className="w-4 h-4 mr-1.5" />
              Nueva Pregunta
            </Button>
          </Link>
        </div>
      </div>

      {/* Grid de Métricas del Sistema */}
      <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-5">
        <Card>
          <CardHeader className="flex flex-row items-center justify-between pb-2">
            <CardTitle className="text-xs font-bold uppercase tracking-wider text-stone-500">
              Participantes Registrados
            </CardTitle>
            <Users className="w-4 h-4 text-amber-600" />
          </CardHeader>
          <CardContent>
            <div className="text-3xl font-black text-stone-900 dark:text-stone-100">
              {metrics.usersCount}
            </div>
            <p className="text-xs text-stone-400 mt-1">Estudiantes activos en la plataforma</p>
          </CardContent>
        </Card>

        <Card>
          <CardHeader className="flex flex-row items-center justify-between pb-2">
            <CardTitle className="text-xs font-bold uppercase tracking-wider text-stone-500">
              Capítulos y Bloques
            </CardTitle>
            <Layers className="w-4 h-4 text-indigo-600" />
          </CardHeader>
          <CardContent>
            <div className="text-3xl font-black text-stone-900 dark:text-stone-100">
              {metrics.chaptersCount} Cap. / {metrics.blocksCount} Bloques
            </div>
            <p className="text-xs text-stone-400 mt-1">Efesios 1 al 6 completamente estructurado</p>
          </CardContent>
        </Card>

        <Card>
          <CardHeader className="flex flex-row items-center justify-between pb-2">
            <CardTitle className="text-xs font-bold uppercase tracking-wider text-stone-500">
              Preguntas en Base de Datos
            </CardTitle>
            <HelpCircle className="w-4 h-4 text-emerald-600" />
          </CardHeader>
          <CardContent>
            <div className="text-3xl font-black text-stone-900 dark:text-stone-100">
              {metrics.questionsCount}
            </div>
            <p className="text-xs text-stone-400 mt-1">Comprensión, Memoria, Referencias, V/F, Orden</p>
          </CardContent>
        </Card>

        <Card>
          <CardHeader className="flex flex-row items-center justify-between pb-2">
            <CardTitle className="text-xs font-bold uppercase tracking-wider text-stone-500">
              Evaluaciones Completadas
            </CardTitle>
            <Award className="w-4 h-4 text-purple-600" />
          </CardHeader>
          <CardContent>
            <div className="text-3xl font-black text-stone-900 dark:text-stone-100">
              {metrics.attemptsCount}
            </div>
            <p className="text-xs text-stone-400 mt-1">Intentos corregidos automáticamente</p>
          </CardContent>
        </Card>

        <Card>
          <CardHeader className="flex flex-row items-center justify-between pb-2">
            <CardTitle className="text-xs font-bold uppercase tracking-wider text-stone-500">
              Libros Publicados
            </CardTitle>
            <BookOpen className="w-4 h-4 text-sky-600" />
          </CardHeader>
          <CardContent>
            <div className="text-3xl font-black text-stone-900 dark:text-stone-100">
              {metrics.booksCount}
            </div>
            <p className="text-xs text-stone-400 mt-1">Efesios (RVR1960) activo</p>
          </CardContent>
        </Card>
      </div>

      {/* Accesos rápidos */}
      <div className="grid grid-cols-1 md:grid-cols-2 gap-6 pt-4">
        <Card className="hover:border-amber-400 transition-colors">
          <CardHeader>
            <CardTitle className="text-lg flex items-center gap-2">
              <HelpCircle className="w-5 h-5 text-amber-600" />
              Gestión de Preguntas y Evaluaciones
            </CardTitle>
            <CardDescription>
              Crea nuevas preguntas, modifica opciones, activa o desactiva reactivos y asigna explicaciones para cada versículo de Efesios.
            </CardDescription>
          </CardHeader>
          <CardContent>
            <Link href="/admin/preguntas">
              <Button variant="outline" size="md" className="w-full sm:w-auto">
                Abrir Gestor de Preguntas <ArrowRight className="w-4 h-4 ml-1.5" />
              </Button>
            </Link>
          </CardContent>
        </Card>

        <Card className="hover:border-amber-400 transition-colors">
          <CardHeader>
            <CardTitle className="text-lg flex items-center gap-2">
              <Users className="w-5 h-5 text-indigo-600" />
              Participantes y Seguimiento
            </CardTitle>
            <CardDescription>
              Supervisa el avance de los estudiantes registrados, consulta fechas de ingreso y roles de acceso.
            </CardDescription>
          </CardHeader>
          <CardContent>
            <Link href="/admin/participantes">
              <Button variant="outline" size="md" className="w-full sm:w-auto">
                Ver Participantes <ArrowRight className="w-4 h-4 ml-1.5" />
              </Button>
            </Link>
          </CardContent>
        </Card>
      </div>
    </div>
  );
}
