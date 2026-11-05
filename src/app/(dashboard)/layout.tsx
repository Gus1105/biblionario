import { getCurrentUser } from "@/actions/auth.actions";
import { redirect } from "next/navigation";
import { Navbar } from "@/components/layout/Navbar";
import { Footer } from "@/components/layout/Footer";

export const dynamic = "force-dynamic";

export default async function DashboardLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  const authData = await getCurrentUser();

  if (!authData) {
    redirect("/login");
  }

  return (
    <div className="min-h-screen bg-stone-50 dark:bg-stone-950 flex flex-col">
      <Navbar
        user={{
          email: authData.profile.email,
          fullName: authData.profile.full_name,
        }}
        isAdmin={authData.isAdmin}
      />
      <main className="flex-1 max-w-7xl w-full mx-auto px-4 sm:px-6 lg:px-8 py-8">
        {children}
      </main>
      <Footer />
    </div>
  );
}

