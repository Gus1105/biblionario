import React from "react";
import { cn } from "@/lib/utils";

export interface ProgressProps extends React.HTMLAttributes<HTMLDivElement> {
  value: number; // 0 to 100
  max?: number;
  showLabel?: boolean;
  colorClass?: string;
}

export function Progress({
  value = 0,
  max = 100,
  showLabel = false,
  colorClass = "bg-amber-500",
  className,
  ...props
}: ProgressProps) {
  const percentage = Math.min(Math.max(Math.round((value / max) * 100), 0), 100);

  return (
    <div className={cn("w-full space-y-1.5", className)} {...props}>
      {showLabel && (
        <div className="flex justify-between items-center text-xs font-medium text-stone-600 dark:text-stone-400">
          <span>Progreso</span>
          <span>{percentage}%</span>
        </div>
      )}
      <div className="h-2.5 w-full bg-stone-100 dark:bg-stone-800 rounded-full overflow-hidden">
        <div
          className={cn("h-full rounded-full transition-all duration-500", colorClass)}
          style={{ width: `${percentage}%` }}
        />
      </div>
    </div>
  );
}

