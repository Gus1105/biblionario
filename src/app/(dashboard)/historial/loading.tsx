export default function HistoryLoading() {
  return (
    <div className="space-y-8 pb-16 animate-pulse">
      {/* Header Skeleton */}
      <div className="flex flex-col sm:flex-row sm:items-center justify-between gap-4 pb-4 border-b border-stone-200 dark:border-stone-800">
        <div className="space-y-2">
          <div className="h-3 w-32 bg-amber-200 dark:bg-amber-900/40 rounded-full" />
          <div className="h-8 w-72 sm:w-96 bg-stone-200 dark:bg-stone-800 rounded-lg" />
          <div className="h-4 w-64 bg-stone-100 dark:bg-stone-800/60 rounded" />
        </div>
        <div className="h-9 w-36 bg-stone-200 dark:bg-stone-800 rounded-lg" />
      </div>

      {/* Grid de 3 Métricas Skeleton */}
      <div className="grid grid-cols-1 sm:grid-cols-3 gap-4">
        {[...Array(3)].map((_, i) => (
          <div
            key={i}
            className="p-5 rounded-xl border border-stone-200/80 dark:border-stone-800 bg-white dark:bg-stone-900 space-y-3"
          >
            <div className="h-3 w-28 bg-stone-200 dark:bg-stone-800 rounded" />
            <div className="h-8 w-20 bg-stone-200 dark:bg-stone-800 rounded-lg" />
            <div className="h-3 w-36 bg-stone-100 dark:bg-stone-800/60 rounded" />
          </div>
        ))}
      </div>

      {/* Lista de Intentos Skeleton */}
      <div className="rounded-xl border border-stone-200 dark:border-stone-800 bg-white dark:bg-stone-900 p-6 space-y-4">
        <div className="h-5 w-48 bg-stone-200 dark:bg-stone-800 rounded" />
        <div className="space-y-3 pt-2">
          {[...Array(5)].map((_, i) => (
            <div
              key={i}
              className="p-4 rounded-xl border border-stone-100 dark:border-stone-800/60 bg-stone-50/50 dark:bg-stone-800/30 flex items-center justify-between"
            >
              <div className="space-y-2">
                <div className="h-4 w-48 bg-stone-200 dark:bg-stone-700 rounded" />
                <div className="h-3 w-32 bg-stone-100 dark:bg-stone-800 rounded" />
              </div>
              <div className="flex items-center gap-3">
                <div className="h-6 w-16 bg-stone-200 dark:bg-stone-700 rounded-full" />
                <div className="h-8 w-24 bg-stone-200 dark:bg-stone-700 rounded-lg" />
              </div>
            </div>
          ))}
        </div>
      </div>
    </div>
  );
}

