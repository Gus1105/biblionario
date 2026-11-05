import { getCurrentUser } from "@/actions/auth.actions";
import { redirect } from "next/navigation";
import Link from "next/link";
import {
  Shield,
  LayoutDashboard,
  HelpCircle,
  Users,
  BookOpen,
  ArrowLeft,
  Sparkles,
} from "lucide-react";
import { Button } from "@/components/ui/Button";

export const dynamic = "force-dynamic";

export default async function AdminLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  const authData = await getCurrentUser();

  if (!authData) {
    redirect("/login");
  }

  if (!authData.isAdmin) {
    redirect("/dashboard");
  }

  return (
    <div className="min-h-screen bg-stone-100 dark:bg-stone-950 flex flex-col">
      {/* Admin Navbar */}
      <header className="sticky top-0 z-50 bg-stone-900 text-white border-b border-stone-800 shadow-md">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 h-16 flex items-center justify-between">
          <div className="flex items-center gap-3">
            <div className="w-9 h-9 rounded-xl bg-amber-600 text-white flex items-center justify-center font-bold">
              <Shield className="w-5 h-5" />
            </div>
            <div>
              <span className="font-bold text-base tracking-tight flex items-center gap-1.5">
                Biblionario CMS
                <span className="text-[10px] bg-amber-500/20 text-amber-300 px-2 py-0.5 rounded font-mono uppercase">
                  Admin
                </span>
              </span>
            </div>
          </div>

          <nav className="hidden md:flex items-center gap-2">
            <Link
              href="/admin"
              className="px-3.5 py-2 rounded-lg text-sm font-medium text-stone-300 hover:text-white hover:bg-stone-800 transition-colors flex items-center gap-1.5"
            >
              <LayoutDashboard className="w-4 h-4" />
              <span>Resumen</span>
            </Link>
            <Link
              href="/admin/preguntas"
              className="px-3.5 py-2 rounded-lg text-sm font-medium text-stone-300 hover:text-white hover:bg-stone-800 transition-colors flex items-center gap-1.5"
            >
              <HelpCircle className="w-4 h-4" />
              <span>Gestor de Preguntas</span>
            </Link>
            <Link
              href="/admin/participantes"
              className="px-3.5 py-2 rounded-lg text-sm font-medium text-stone-300 hover:text-white hover:bg-stone-800 transition-colors flex items-center gap-1.5"
            >
              <Users className="w-4 h-4" />
              <span>Participantes</span>
            </Link>
          </nav>

          <div className="flex items-center gap-3">
            <Link href="/dashboard">
              <Button variant="secondary" size="sm" className="bg-stone-800 text-white hover:bg-stone-700 text-xs">
                <ArrowLeft className="w-3.5 h-3.5 mr-1" />
                Volver a la App
              </Button>
            </Link>
          </div>
        </div>
      </header>

      {/* Main Admin Content */}
      <main className="flex-1 max-w-7xl w-full mx-auto px-4 sm:px-6 lg:px-8 py-8">
        {children}
      </main>
    </div>
  );
}

