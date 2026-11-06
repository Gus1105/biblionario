"use client";

import React, { useState, useEffect } from "react";
import Link from "next/link";
import { usePathname } from "next/navigation";
import {
  Shield,
  LayoutDashboard,
  HelpCircle,
  Users,
  ArrowLeft,
  Menu,
  X,
  ChevronRight,
} from "lucide-react";
import { Button } from "@/components/ui/Button";
import { cn } from "@/lib/utils";

export function AdminNavbar() {
  const pathname = usePathname();
  const [mobileMenuOpen, setMobileMenuOpen] = useState(false);

  useEffect(() => {
    setMobileMenuOpen(false);
  }, [pathname]);

  const navLinks = [
    {
      name: "Resumen",
      href: "/admin",
      icon: LayoutDashboard,
      exact: true,
    },
    {
      name: "Gestor de Preguntas",
      href: "/admin/preguntas",
      icon: HelpCircle,
    },
    {
      name: "Participantes",
      href: "/admin/participantes",
      icon: Users,
    },
  ];

  return (
    <header className="sticky top-0 z-50 bg-stone-900 text-white border-b border-stone-800 shadow-md">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 h-16 flex items-center justify-between">
        {/* Admin Logo */}
        <div className="flex items-center gap-3">
          <div className="w-9 h-9 rounded-xl bg-amber-600 text-white flex items-center justify-center font-bold shadow-md shadow-amber-600/30">
            <Shield className="w-5 h-5" />
          </div>
          <div>
            <span className="font-bold text-base tracking-tight flex items-center gap-1.5">
              Biblionario CMS
              <span className="text-[10px] bg-amber-500/20 text-amber-300 px-2 py-0.5 rounded font-mono uppercase font-bold">
                Admin
              </span>
            </span>
          </div>
        </div>

        {/* Desktop Navigation */}
        <nav className="hidden md:flex items-center gap-1.5">
          {navLinks.map((link) => {
            const Icon = link.icon;
            const isActive = link.exact
              ? pathname === link.href
              : pathname.startsWith(link.href);

            return (
              <Link
                key={link.href}
                href={link.href}
                prefetch={true}
                className={cn(
                  "px-3.5 py-2 rounded-lg text-sm font-medium transition-colors flex items-center gap-2",
                  isActive
                    ? "bg-amber-600/20 text-amber-300 font-semibold border border-amber-500/30"
                    : "text-stone-300 hover:text-white hover:bg-stone-800"
                )}
              >
                <Icon className="w-4 h-4" />
                <span>{link.name}</span>
              </Link>
            );
          })}
        </nav>

        {/* Desktop Actions & Mobile Menu Toggle */}
        <div className="flex items-center gap-2 sm:gap-3">
          <Link href="/dashboard" prefetch={true} className="hidden sm:inline-flex">
            <Button
              variant="secondary"
              size="sm"
              className="bg-stone-800 text-stone-200 hover:bg-stone-700 hover:text-white text-xs border border-stone-700"
            >
              <ArrowLeft className="w-3.5 h-3.5 mr-1" />
              Volver a la App
            </Button>
          </Link>

          {/* Mobile Menu Toggle Button */}
          <button
            onClick={() => setMobileMenuOpen(!mobileMenuOpen)}
            aria-label={mobileMenuOpen ? "Cerrar menú" : "Abrir menú de administración"}
            className="md:hidden p-2 rounded-lg text-stone-300 hover:text-white hover:bg-stone-800 transition-colors focus:outline-none focus:ring-2 focus:ring-amber-500"
          >
            {mobileMenuOpen ? (
              <X className="w-6 h-6 text-amber-400" />
            ) : (
              <Menu className="w-6 h-6" />
            )}
          </button>
        </div>
      </div>

      {/* Mobile Dropdown Panel for Admin */}
      {mobileMenuOpen && (
        <div className="md:hidden border-t border-stone-800 bg-stone-950/95 backdrop-blur-lg px-4 pt-4 pb-6 shadow-2xl animate-in fade-in slide-in-from-top-2 duration-150">
          <p className="text-[11px] font-bold text-stone-400 uppercase tracking-wider px-2 pb-2">
            Navegación Administrativa
          </p>

          <nav className="space-y-1.5">
            {navLinks.map((link) => {
              const Icon = link.icon;
              const isActive = link.exact
                ? pathname === link.href
                : pathname.startsWith(link.href);

              return (
                <Link
                  key={link.href}
                  href={link.href}
                  prefetch={true}
                  onClick={() => setMobileMenuOpen(false)}
                  className={cn(
                    "flex items-center justify-between px-3.5 py-3 rounded-xl text-sm font-medium transition-colors",
                    isActive
                      ? "bg-amber-600 text-white font-semibold shadow-md shadow-amber-600/30"
                      : "text-stone-200 hover:bg-stone-800 bg-stone-900 border border-stone-800"
                  )}
                >
                  <div className="flex items-center gap-3">
                    <Icon className={cn("w-5 h-5", isActive ? "text-white" : "text-amber-400")} />
                    <span>{link.name}</span>
                  </div>
                  <ChevronRight className={cn("w-4 h-4", isActive ? "text-white/80" : "text-stone-500")} />
                </Link>
              );
            })}
          </nav>

          <div className="pt-4 mt-4 border-t border-stone-800">
            <Link
              href="/dashboard"
              prefetch={true}
              onClick={() => setMobileMenuOpen(false)}
              className="flex items-center justify-center gap-2 w-full py-3 px-4 rounded-xl text-sm font-semibold text-stone-200 bg-stone-900 hover:bg-stone-800 border border-stone-700 transition-colors"
            >
              <ArrowLeft className="w-4 h-4" />
              <span>Volver a la App (Dashboard)</span>
            </Link>
          </div>
        </div>
      )}
    </header>
  );
}

