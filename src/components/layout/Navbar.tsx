"use client";

import React, { useState, useEffect, useTransition } from "react";
import Link from "next/link";
import { usePathname } from "next/navigation";
import {
  BookOpen,
  Sparkles,
  LayoutDashboard,
  History,
  Shield,
  LogOut,
  BookMarked,
  User,
  Menu,
  X,
  ChevronRight,
} from "lucide-react";
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
  const [mobileMenuOpen, setMobileMenuOpen] = useState(false);

  // Cerrar el menú móvil automáticamente al navegar
  useEffect(() => {
    setMobileMenuOpen(false);
  }, [pathname]);

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
    <header className="sticky top-0 z-40 w-full border-b border-stone-200/80 dark:border-stone-800 bg-white/95 dark:bg-stone-900/95 backdrop-blur-md transition-colors">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 h-16 flex items-center justify-between">
        {/* Logo */}
        <Link
          href="/dashboard"
          className="flex items-center gap-2 group"
          onClick={() => setMobileMenuOpen(false)}
        >
          <div className="w-9 h-9 sm:w-10 sm:h-10 rounded-xl bg-gradient-to-tr from-amber-600 to-amber-500 text-white flex items-center justify-center shadow-md shadow-amber-600/20 group-hover:scale-105 transition-transform flex-shrink-0">
            <BookOpen className="w-5 h-5" />
          </div>
          <div>
            <span className="text-lg sm:text-xl font-bold tracking-tight text-stone-900 dark:text-stone-100 flex items-center gap-1">
              Biblionario
              <Sparkles className="w-3.5 h-3.5 text-amber-500" />
            </span>
            <span className="text-[10px] text-stone-500 dark:text-stone-400 block -mt-1 font-medium">
              Efesios RVR1960
            </span>
          </div>
        </Link>

        {/* Desktop Navigation items */}
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
                      ? "bg-amber-100 dark:bg-amber-950/60 text-amber-900 dark:text-amber-200 font-semibold shadow-sm shadow-amber-900/5"
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

        {/* Desktop & Mobile Header Actions */}
        <div className="flex items-center gap-2 sm:gap-3">
          {user ? (
            <>
              {/* Desktop User Info & Logout */}
              <div className="hidden md:flex items-center gap-3">
                <div className="flex flex-col text-right">
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

              {/* Mobile Menu Toggle Button */}
              <div className="flex md:hidden items-center gap-1.5">
                <div className="w-8 h-8 rounded-full bg-amber-200 dark:bg-amber-900/80 text-amber-800 dark:text-amber-200 flex items-center justify-center font-bold text-xs uppercase border border-amber-300 dark:border-amber-700 mr-1">
                  {user.fullName ? user.fullName.charAt(0) : <User className="w-3.5 h-3.5" />}
                </div>
                <button
                  onClick={() => setMobileMenuOpen(!mobileMenuOpen)}
                  aria-label={mobileMenuOpen ? "Cerrar menú" : "Abrir menú de navegación"}
                  className="p-2 rounded-lg text-stone-700 dark:text-stone-200 hover:bg-stone-100 dark:hover:bg-stone-800 transition-colors focus:outline-none focus:ring-2 focus:ring-amber-500"
                >
                  {mobileMenuOpen ? (
                    <X className="w-6 h-6 text-amber-600 dark:text-amber-400" />
                  ) : (
                    <Menu className="w-6 h-6" />
                  )}
                </button>
              </div>
            </>
          ) : (
            <div className="flex items-center gap-2">
              <Link
                href="/login"
                className="text-xs sm:text-sm font-medium text-stone-700 dark:text-stone-300 hover:text-amber-600 px-2 sm:px-3 py-2"
              >
                Iniciar Sesión
              </Link>
              <Link
                href="/register"
                className="text-xs sm:text-sm font-semibold text-white bg-amber-600 hover:bg-amber-700 px-3 sm:px-4 py-2 rounded-lg shadow-sm"
              >
                Comenzar Gratis
              </Link>
            </div>
          )}
        </div>
      </div>

      {/* Mobile Slide-down Navigation Panel */}
      {user && mobileMenuOpen && (
        <div className="md:hidden border-t border-stone-200 dark:border-stone-800 bg-stone-50/98 dark:bg-stone-900/98 backdrop-blur-lg px-4 pt-4 pb-6 shadow-xl animate-in fade-in slide-in-from-top-2 duration-200">
          {/* User profile card */}
          <div className="flex items-center gap-3 p-3 bg-white dark:bg-stone-850 rounded-xl border border-stone-200/80 dark:border-stone-800 mb-4 shadow-sm">
            <div className="w-10 h-10 rounded-full bg-amber-200 dark:bg-amber-900/80 text-amber-800 dark:text-amber-200 flex items-center justify-center font-bold text-sm uppercase border border-amber-300 dark:border-amber-700">
              {user.fullName ? user.fullName.charAt(0) : <User className="w-5 h-5" />}
            </div>
            <div className="flex-1 min-w-0">
              <p className="text-sm font-bold text-stone-900 dark:text-stone-100 truncate">
                {user.fullName || "Estudiante de Efesios"}
              </p>
              <p className="text-xs text-stone-500 dark:text-stone-400 truncate">
                {user.email}
              </p>
            </div>
            <span
              className={cn(
                "px-2 py-0.5 rounded text-[11px] font-bold uppercase",
                isAdmin
                  ? "bg-amber-100 text-amber-800 dark:bg-amber-900/60 dark:text-amber-300 border border-amber-200 dark:border-amber-700"
                  : "bg-stone-100 text-stone-700 dark:bg-stone-800 dark:text-stone-300 border border-stone-200 dark:border-stone-700"
              )}
            >
              {isAdmin ? "Admin" : "Alumno"}
            </span>
          </div>

          {/* Navigation Links List */}
          <nav className="space-y-1.5">
            <p className="text-[11px] font-bold text-stone-400 dark:text-stone-500 uppercase tracking-wider px-2 pb-1">
              Menú Principal
            </p>
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
                  onClick={() => setMobileMenuOpen(false)}
                  className={cn(
                    "flex items-center justify-between px-3.5 py-3 rounded-xl text-sm font-medium transition-colors",
                    isActive
                      ? "bg-amber-600 text-white font-semibold shadow-md shadow-amber-600/20"
                      : "text-stone-700 dark:text-stone-200 hover:bg-stone-200/60 dark:hover:bg-stone-800/80 bg-white dark:bg-stone-850/60 border border-stone-200/60 dark:border-stone-800/60"
                  )}
                >
                  <div className="flex items-center gap-3">
                    <Icon className={cn("w-5 h-5", isActive ? "text-white" : "text-amber-600 dark:text-amber-400")} />
                    <span>{link.name}</span>
                  </div>
                  <ChevronRight className={cn("w-4 h-4", isActive ? "text-white/80" : "text-stone-400")} />
                </Link>
              );
            })}
          </nav>

          {/* Logout Action in Mobile */}
          <div className="pt-4 mt-4 border-t border-stone-200 dark:border-stone-800">
            <button
              onClick={handleLogout}
              disabled={isPending}
              className="w-full flex items-center justify-center gap-2 px-4 py-3 rounded-xl text-sm font-semibold text-rose-600 dark:text-rose-400 hover:bg-rose-50 dark:hover:bg-rose-950/40 border border-rose-200 dark:border-rose-900/40 transition-colors cursor-pointer bg-white dark:bg-stone-850"
            >
              <LogOut className="w-4 h-4" />
              <span>{isPending ? "Cerrando sesión..." : "Cerrar Sesión"}</span>
            </button>
          </div>
        </div>
      )}
    </header>
  );
}
