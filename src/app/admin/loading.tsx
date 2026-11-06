export default function AdminLoading() {
  return (
    <div className="space-y-8 animate-pulse">
      {/* Header Skeleton */}
      <div className="flex flex-col sm:flex-row sm:items-center justify-between gap-4 pb-4 border-b border-stone-200 dark:border-stone-800">
        <div className="space-y-2">
          <div className="h-3 w-36 bg-amber-200 dark:bg-amber-900/40 rounded-full" />
          <div className="h-8 w-64 sm:w-80 bg-stone-200 dark:bg-stone-800 rounded-lg" />
          <div className="h-4 w-72 sm:w-96 bg-stone-100 dark:bg-stone-800/60 rounded" />
        </div>
        <div className="h-10 w-36 bg-stone-200 dark:bg-stone-800 rounded-lg" />
      </div>

      {/* Grid de 6 Métricas Skeleton */}
      <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-5">
        {[...Array(6)].map((_, i) => (
          <div
            key={i}
            className="p-6 rounded-xl border border-stone-200 dark:border-stone-800 bg-white dark:bg-stone-900 space-y-3"
          >
            <div className="flex justify-between items-center">
              <div className="h-3 w-32 bg-stone-200 dark:bg-stone-800 rounded" />
              <div className="h-4 w-4 bg-stone-200 dark:bg-stone-800 rounded" />
            </div>
            <div className="h-9 w-20 bg-stone-200 dark:bg-stone-800 rounded-lg" />
            <div className="h-3 w-40 bg-stone-100 dark:bg-stone-800/60 rounded" />
          </div>
        ))}
      </div>

      {/* Acciones Rápidas Skeleton */}
      <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
        {[...Array(2)].map((_, i) => (
          <div
            key={i}
            className="p-6 rounded-xl border border-stone-200 dark:border-stone-800 bg-white dark:bg-stone-900 space-y-4"
          >
            <div className="h-5 w-44 bg-stone-200 dark:bg-stone-800 rounded" />
            <div className="h-4 w-64 bg-stone-100 dark:bg-stone-800/60 rounded" />
            <div className="h-10 w-36 bg-stone-200 dark:bg-stone-800 rounded-lg" />
          </div>
        ))}
      </div>
    </div>
  );
}

