import React from "react";
import { cn } from "@/lib/utils";
import { Loader2 } from "lucide-react";

export interface ButtonProps extends React.ButtonHTMLAttributes<HTMLButtonElement> {
  variant?: "primary" | "secondary" | "outline" | "ghost" | "danger" | "success";
  size?: "sm" | "md" | "lg";
  isLoading?: boolean;
}

export const Button = React.forwardRef<HTMLButtonElement, ButtonProps>(
  (
    {
      className,
      variant = "primary",
      size = "md",
      isLoading = false,
      disabled,
      children,
      ...props
    },
    ref
  ) => {
    const baseStyles =
      "inline-flex items-center justify-center font-medium rounded-lg transition-all duration-150 focus:outline-none focus:ring-2 focus:ring-offset-2 disabled:opacity-50 disabled:cursor-not-allowed cursor-pointer";

    const variantStyles = {
      primary:
        "bg-amber-600 hover:bg-amber-700 active:bg-amber-800 text-white shadow-sm shadow-amber-600/30 focus:ring-amber-500",
      secondary:
        "bg-stone-100 hover:bg-stone-200 active:bg-stone-300 dark:bg-stone-800 dark:hover:bg-stone-700 text-stone-800 dark:text-stone-200 focus:ring-stone-400",
      outline:
        "border border-stone-300 dark:border-stone-700 hover:bg-stone-50 dark:hover:bg-stone-850 text-stone-700 dark:text-stone-300 focus:ring-amber-500",
      ghost:
        "hover:bg-stone-100 dark:hover:bg-stone-800 text-stone-700 dark:text-stone-300 focus:ring-stone-400",
      danger:
        "bg-rose-600 hover:bg-rose-700 text-white shadow-sm shadow-rose-600/30 focus:ring-rose-500",
      success:
        "bg-emerald-600 hover:bg-emerald-700 text-white shadow-sm shadow-emerald-600/30 focus:ring-emerald-500",
    };

    const sizeStyles = {
      sm: "text-xs px-2.5 py-1.5 gap-1.5",
      md: "text-sm px-4 py-2 gap-2",
      lg: "text-base px-5 py-2.5 gap-2.5",
    };

    return (
      <button
        ref={ref}
        disabled={disabled || isLoading}
        className={cn(baseStyles, variantStyles[variant], sizeStyles[size], className)}
        {...props}
      >
        {isLoading && <Loader2 className="w-4 h-4 animate-spin flex-shrink-0" />}
        {children}
      </button>
    );
  }
);

Button.displayName = "Button";

