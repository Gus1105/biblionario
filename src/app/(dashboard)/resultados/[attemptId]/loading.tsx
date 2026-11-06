export default function ResultLoading() {
  return (
    <div className="max-w-4xl mx-auto space-y-8 pb-16 animate-pulse">
      {/* Banner de Resultado Skeleton */}
      <div className="h-56 rounded-3xl bg-gradient-to-br from-stone-700/60 to-stone-900/60 p-6 sm:p-10 flex flex-col md:flex-row md:items-center justify-between gap-6">
        <div className="space-y-3">
          <div className="h-5 w-40 bg-white/20 rounded-full" />
          <div className="h-8 w-64 sm:w-80 bg-white/30 rounded-lg" />
          <div className="h-4 w-96 bg-white/20 rounded" />
        </div>
        <div className="h-28 w-44 rounded-2xl bg-white/10 p-5 flex flex-col items-center justify-center space-y-2">
          <div className="h-3 w-20 bg-white/20 rounded" />
          <div className="h-10 w-24 bg-white/30 rounded-lg" />
        </div>
      </div>

      {/* Grid de Métricas de la Prueba Skeleton */}
      <div className="grid grid-cols-1 sm:grid-cols-3 gap-4">
        {[...Array(3)].map((_, i) => (
          <div
            key={i}
            className="p-5 rounded-xl border border-stone-200 dark:border-stone-800 bg-white dark:bg-stone-900 space-y-2"
          >
            <div className="h-3 w-28 bg-stone-200 dark:bg-stone-800 rounded" />
            <div className="h-7 w-20 bg-stone-200 dark:bg-stone-800 rounded-lg" />
          </div>
        ))}
      </div>

      {/* Revisión de Preguntas Skeleton */}
      <div className="space-y-4">
        <div className="h-6 w-48 bg-stone-200 dark:bg-stone-800 rounded-lg" />
        {[...Array(3)].map((_, i) => (
          <div
            key={i}
            className="p-5 rounded-xl border border-stone-200 dark:border-stone-800 bg-white dark:bg-stone-900 space-y-3"
          >
            <div className="flex justify-between items-center">
              <div className="h-4 w-24 bg-stone-200 dark:bg-stone-800 rounded" />
              <div className="h-5 w-16 bg-stone-100 dark:bg-stone-800 rounded-full" />
            </div>
            <div className="h-5 w-full bg-stone-200 dark:bg-stone-800 rounded" />
            <div className="h-4 w-3/4 bg-stone-100 dark:bg-stone-800/60 rounded" />
          </div>
        ))}
      </div>
    </div>
  );
}

