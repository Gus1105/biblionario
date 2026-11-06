import { getCurrentUser } from "@/actions/auth.actions";
import { redirect } from "next/navigation";
import { AdminNavbar } from "@/components/layout/AdminNavbar";

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
      <AdminNavbar />
      <main className="flex-1 max-w-7xl w-full mx-auto px-4 sm:px-6 lg:px-8 py-6 sm:py-8">
        {children}
      </main>
    </div>
  );
}
