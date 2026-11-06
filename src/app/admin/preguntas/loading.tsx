export default function AdminQuestionsLoading() {
  return (
    <div className="space-y-6 animate-pulse">
      {/* Header Skeleton */}
      <div className="space-y-2">
        <div className="h-8 w-64 sm:w-80 bg-stone-200 dark:bg-stone-800 rounded-lg" />
        <div className="h-4 w-96 max-w-full bg-stone-100 dark:bg-stone-800/60 rounded" />
      </div>

      {/* Controles de Filtros Skeleton */}
      <div className="p-4 rounded-xl border border-stone-200 dark:border-stone-800 bg-white dark:bg-stone-900 flex flex-wrap gap-3 items-center justify-between">
        <div className="flex gap-2">
          <div className="h-9 w-32 bg-stone-100 dark:bg-stone-800 rounded-lg" />
          <div className="h-9 w-36 bg-stone-100 dark:bg-stone-800 rounded-lg" />
        </div>
        <div className="h-9 w-36 bg-amber-200 dark:bg-amber-900/60 rounded-lg" />
      </div>

      {/* Lista de Preguntas Skeleton */}
      <div className="space-y-3">
        {[...Array(5)].map((_, i) => (
          <div
            key={i}
            className="p-5 rounded-xl border border-stone-200 dark:border-stone-800 bg-white dark:bg-stone-900 space-y-3"
          >
            <div className="flex justify-between items-center">
              <div className="flex items-center gap-2">
                <div className="h-5 w-24 bg-amber-100 dark:bg-amber-950/60 rounded-full" />
                <div className="h-5 w-16 bg-stone-100 dark:bg-stone-800 rounded-full" />
              </div>
              <div className="flex gap-2">
                <div className="h-8 w-8 bg-stone-100 dark:bg-stone-800 rounded-lg" />
                <div className="h-8 w-8 bg-stone-100 dark:bg-stone-800 rounded-lg" />
              </div>
            </div>
            <div className="h-5 w-3/4 bg-stone-200 dark:bg-stone-800 rounded" />
            <div className="h-4 w-1/2 bg-stone-100 dark:bg-stone-800/60 rounded" />
          </div>
        ))}
      </div>
    </div>
  );
}

