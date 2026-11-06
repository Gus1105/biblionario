export default function BlockLoading() {
  return (
    <div className="max-w-4xl mx-auto space-y-8 pb-16 animate-pulse">
      {/* Top Breadcrumb Skeleton */}
      <div className="flex items-center justify-between pb-3 border-b border-stone-200 dark:border-stone-800">
        <div className="h-4 w-44 bg-stone-200 dark:bg-stone-800 rounded" />
        <div className="h-4 w-28 bg-stone-100 dark:bg-stone-800 rounded" />
      </div>

      {/* Header del Bloque Skeleton */}
      <div className="space-y-3">
        <div className="flex items-center gap-2">
          <div className="h-5 w-24 bg-amber-100 dark:bg-amber-950/60 rounded-full" />
          <div className="h-5 w-20 bg-stone-200 dark:bg-stone-800 rounded-full" />
        </div>
        <div className="h-8 w-72 sm:w-96 bg-stone-200 dark:bg-stone-800 rounded-lg" />
        <div className="h-4 w-40 bg-stone-100 dark:bg-stone-800/60 rounded" />
      </div>

      {/* Texto Bíblico Skeleton (Tarjeta de Escritura) */}
      <div className="rounded-2xl border-2 border-amber-200/80 dark:border-amber-900/60 bg-amber-50/50 dark:bg-amber-950/20 p-6 sm:p-8 space-y-4">
        <div className="h-5 w-40 bg-amber-200 dark:bg-amber-900/60 rounded" />
        <div className="space-y-2 pt-2">
          <div className="h-5 w-full bg-amber-100/80 dark:bg-amber-900/40 rounded" />
          <div className="h-5 w-11/12 bg-amber-100/80 dark:bg-amber-900/40 rounded" />
          <div className="h-5 w-4/5 bg-amber-100/80 dark:bg-amber-900/40 rounded" />
        </div>
      </div>

      {/* Explicación del Pasaje Skeleton */}
      <div className="rounded-xl border border-stone-200 dark:border-stone-800 bg-white dark:bg-stone-900 p-6 sm:p-8 space-y-4">
        <div className="h-5 w-48 bg-stone-200 dark:bg-stone-800 rounded" />
        <div className="space-y-2 pt-1">
          <div className="h-4 w-full bg-stone-100 dark:bg-stone-800/60 rounded" />
          <div className="h-4 w-full bg-stone-100 dark:bg-stone-800/60 rounded" />
          <div className="h-4 w-3/4 bg-stone-100 dark:bg-stone-800/60 rounded" />
        </div>
      </div>

      {/* Conceptos Clave Skeleton */}
      <div className="rounded-xl border border-stone-200 dark:border-stone-800 bg-white dark:bg-stone-900 p-6 space-y-4">
        <div className="h-5 w-36 bg-stone-200 dark:bg-stone-800 rounded" />
        <div className="grid grid-cols-1 sm:grid-cols-2 gap-3">
          {[...Array(4)].map((_, i) => (
            <div key={i} className="h-16 bg-stone-50 dark:bg-stone-800/40 rounded-lg p-3 space-y-2">
              <div className="h-3 w-24 bg-stone-200 dark:bg-stone-700 rounded" />
              <div className="h-3 w-full bg-stone-100 dark:bg-stone-800 rounded" />
            </div>
          ))}
        </div>
      </div>

      {/* Bottom Action Bar Skeleton */}
      <div className="flex flex-col sm:flex-row items-center justify-between gap-4 pt-4 border-t border-stone-200 dark:border-stone-800">
        <div className="h-10 w-44 bg-stone-200 dark:bg-stone-800 rounded-lg" />
        <div className="h-10 w-48 bg-amber-400 dark:bg-amber-700 rounded-lg" />
      </div>
    </div>
  );
}

