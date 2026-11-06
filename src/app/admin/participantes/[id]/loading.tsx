export default function ParticipantDetailLoading() {
  return (
    <div className="space-y-8 pb-16 animate-pulse">
      {/* Back button & Header Skeleton */}
      <div className="flex flex-col sm:flex-row sm:items-center justify-between gap-4 pb-4 border-b border-stone-200 dark:border-stone-800">
        <div className="space-y-2">
          <div className="h-4 w-36 bg-stone-200 dark:bg-stone-800 rounded" />
          <div className="h-8 w-64 sm:w-80 bg-stone-200 dark:bg-stone-800 rounded-lg" />
          <div className="h-4 w-52 bg-stone-100 dark:bg-stone-800/60 rounded" />
        </div>
        <div className="flex gap-2">
          <div className="h-9 w-24 bg-stone-200 dark:bg-stone-800 rounded-lg" />
          <div className="h-9 w-32 bg-stone-200 dark:bg-stone-800 rounded-lg" />
        </div>
      </div>

      {/* Tarjeta de Resumen "¿Por dónde va?" Skeleton */}
      <div className="h-44 rounded-2xl bg-amber-500/10 dark:bg-amber-950/20 border border-amber-200/50 dark:border-amber-900/40 p-6 flex flex-col justify-between">
        <div className="space-y-2">
          <div className="h-5 w-48 bg-amber-200 dark:bg-amber-900/60 rounded-full" />
          <div className="h-7 w-72 bg-stone-200 dark:bg-stone-800 rounded-lg" />
          <div className="h-4 w-96 max-w-full bg-stone-100 dark:bg-stone-800/60 rounded" />
        </div>
        <div className="h-2 w-full bg-amber-200/40 dark:bg-amber-900/40 rounded-full" />
      </div>

      {/* Grid de 4 Métricas Skeleton */}
      <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-4">
        {[...Array(4)].map((_, i) => (
          <div
            key={i}
            className="p-5 rounded-xl border border-stone-200 dark:border-stone-800 bg-white dark:bg-stone-900 space-y-2"
          >
            <div className="h-3 w-28 bg-stone-200 dark:bg-stone-800 rounded" />
            <div className="h-8 w-20 bg-stone-200 dark:bg-stone-800 rounded-lg" />
            <div className="h-3 w-32 bg-stone-100 dark:bg-stone-800/60 rounded" />
          </div>
        ))}
      </div>

      {/* Capítulos y Bloques Skeleton */}
      <div className="space-y-4">
        <div className="h-6 w-48 bg-stone-200 dark:bg-stone-800 rounded-lg" />
        <div className="space-y-3">
          {[...Array(3)].map((_, i) => (
            <div
              key={i}
              className="p-5 rounded-xl border border-stone-200 dark:border-stone-800 bg-white dark:bg-stone-900 space-y-3"
            >
              <div className="flex justify-between items-center">
                <div className="h-5 w-44 bg-stone-200 dark:bg-stone-800 rounded" />
                <div className="h-5 w-20 bg-stone-100 dark:bg-stone-800 rounded-full" />
              </div>
              <div className="grid grid-cols-2 sm:grid-cols-4 gap-2 pt-2">
                {[...Array(4)].map((_, j) => (
                  <div key={j} className="h-10 bg-stone-50 dark:bg-stone-800/50 rounded-lg" />
                ))}
              </div>
            </div>
          ))}
        </div>
      </div>
    </div>
  );
}

