"use client";

import React, { useTransition } from "react";
import Link from "next/link";
import { usePathname } from "next/navigation";
import { BookOpen, Sparkles, LayoutDashboard, History, Shield, LogOut, BookMarked, User } from "lucide-react";
import { logoutAction } from "@/actions/auth.actions";
import { cn } from "@/lib/utils";

interface NavbarProps {
  user?: {
    email: string;
    fullName?: string | null;
  } | null;
  isAdmin?: boolean;
}

export function Navbar({ user, isAdmin = false }: NavbarProps) {
  const pathname = usePathname();
  const [isPending, startTransition] = useTransition();

  const handleLogout = () => {
    startTransition(async () => {
      await logoutAction();
    });
  };

  const navLinks = [
    {
      name: "Dashboard",
      href: "/dashboard",
      icon: LayoutDashboard,
    },
    {
      name: "Efesios",
      href: "/libros/efesios",
      icon: BookMarked,
    },
    {
      name: "Historial",
      href: "/historial",
      icon: History,
    },
  ];

  if (isAdmin) {
    navLinks.push({
      name: "Administración",
      href: "/admin",
      icon: Shield,
    });
  }

  return (
    <header className="sticky top-0 z-40 w-full border-b border-stone-200/80 dark:border-stone-800 bg-white/90 dark:bg-stone-900/90 backdrop-blur-md">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 h-16 flex items-center justify-between">
        {/* Logo */}
        <Link href="/dashboard" className="flex items-center gap-2 group">
          <div className="w-10 h-10 rounded-xl bg-gradient-to-tr from-amber-600 to-amber-500 text-white flex items-center justify-center shadow-md shadow-amber-600/20 group-hover:scale-105 transition-transform">
            <BookOpen className="w-5 h-5" />
          </div>
          <div>
            <span className="text-xl font-bold tracking-tight text-stone-900 dark:text-stone-100 flex items-center gap-1">
              Biblionario
              <Sparkles className="w-3.5 h-3.5 text-amber-500" />
            </span>
            <span className="text-[10px] text-stone-500 dark:text-stone-400 block -mt-1 font-medium">
              Efesios RVR1960
            </span>
          </div>
        </Link>

        {/* Navigation items */}
        {user && (
          <nav className="hidden md:flex items-center gap-1">
            {navLinks.map((link) => {
              const Icon = link.icon;
              const isActive =
                link.href === "/dashboard"
                  ? pathname === "/dashboard"
                  : pathname.startsWith(link.href);

              return (
                <Link
                  key={link.href}
                  href={link.href}
                  className={cn(
                    "flex items-center gap-2 px-3.5 py-2 rounded-lg text-sm font-medium transition-colors",
                    isActive
                      ? "bg-amber-100 dark:bg-amber-950/60 text-amber-900 dark:text-amber-200 font-semibold"
                      : "text-stone-600 dark:text-stone-400 hover:text-stone-900 dark:hover:text-stone-100 hover:bg-stone-100 dark:hover:bg-stone-800"
                  )}
                >
                  <Icon className="w-4 h-4" />
                  <span>{link.name}</span>
                </Link>
              );
            })}
          </nav>
        )}

        {/* User profile & actions */}
        <div className="flex items-center gap-3">
          {user ? (
            <div className="flex items-center gap-3">
              <div className="hidden sm:flex flex-col text-right">
                <span className="text-xs font-semibold text-stone-800 dark:text-stone-200 truncate max-w-[140px]">
                  {user.fullName || user.email.split("@")[0]}
                </span>
                <span className="text-[10px] text-stone-500 dark:text-stone-400 capitalize">
                  {isAdmin ? "Administrador" : "Estudiante"}
                </span>
              </div>

              <div className="w-8 h-8 rounded-full bg-amber-200 dark:bg-amber-900/80 text-amber-800 dark:text-amber-200 flex items-center justify-center font-bold text-xs uppercase border border-amber-300 dark:border-amber-700">
                {user.fullName ? user.fullName.charAt(0) : <User className="w-4 h-4" />}
              </div>

              <button
                onClick={handleLogout}
                disabled={isPending}
                title="Cerrar Sesión"
                className="p-2 rounded-lg text-stone-500 hover:text-rose-600 hover:bg-rose-50 dark:hover:bg-rose-950/40 transition-colors cursor-pointer"
              >
                <LogOut className="w-4 h-4" />
              </button>
            </div>
          ) : (
            <div className="flex items-center gap-2">
              <Link
                href="/login"
                className="text-sm font-medium text-stone-700 dark:text-stone-300 hover:text-amber-600 px-3 py-2"
              >
                Iniciar Sesión
              </Link>
              <Link
                href="/register"
                className="text-sm font-semibold text-white bg-amber-600 hover:bg-amber-700 px-4 py-2 rounded-lg shadow-sm"
              >
                Comenzar Gratis
              </Link>
            </div>
          )}
        </div>
      </div>
    </header>
  );
}

