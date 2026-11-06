export default function ChapterLoading() {
  return (
    <div className="space-y-8 animate-pulse">
      {/* Botón de volver */}
      <div className="h-4 w-32 bg-stone-200 dark:bg-stone-800 rounded" />

      {/* Header del Capítulo Skeleton */}
      <div className="p-6 sm:p-8 rounded-2xl border border-stone-200 dark:border-stone-800 bg-white dark:bg-stone-900 space-y-4">
        <div className="flex justify-between items-start">
          <div className="space-y-2">
            <div className="h-5 w-24 bg-amber-100 dark:bg-amber-950/60 rounded-full" />
            <div className="h-8 w-64 sm:w-80 bg-stone-200 dark:bg-stone-800 rounded-lg" />
          </div>
          <div className="h-8 w-28 bg-stone-200 dark:bg-stone-800 rounded-full" />
        </div>
        <div className="h-4 w-full max-w-2xl bg-stone-100 dark:bg-stone-800/60 rounded" />
        <div className="h-2 w-full bg-stone-100 dark:bg-stone-800 rounded-full" />
      </div>

      {/* Grid de Bloques Skeleton */}
      <div className="space-y-4">
        <div className="h-6 w-44 bg-stone-200 dark:bg-stone-800 rounded-lg" />
        <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
          {[...Array(4)].map((_, i) => (
            <div
              key={i}
              className="p-5 rounded-xl border border-stone-200 dark:border-stone-800 bg-white dark:bg-stone-900 space-y-3"
            >
              <div className="flex justify-between items-center">
                <div className="h-4 w-20 bg-stone-200 dark:bg-stone-800 rounded" />
                <div className="h-5 w-16 bg-stone-100 dark:bg-stone-800 rounded-full" />
              </div>
              <div className="h-6 w-52 bg-stone-200 dark:bg-stone-800 rounded-lg" />
              <div className="h-4 w-32 bg-stone-100 dark:bg-stone-800/60 rounded" />
              <div className="pt-2 flex justify-between items-center border-t border-stone-100 dark:border-stone-800">
                <div className="h-4 w-24 bg-stone-100 dark:bg-stone-800 rounded" />
                <div className="h-8 w-28 bg-stone-200 dark:bg-stone-800 rounded-lg" />
              </div>
            </div>
          ))}
        </div>
      </div>

      {/* Tarjeta de Examen del Capítulo Skeleton */}
      <div className="h-32 rounded-xl border border-amber-200/60 dark:border-amber-900/40 bg-amber-50/40 dark:bg-amber-950/20 p-6 flex items-center justify-between">
        <div className="space-y-2">
          <div className="h-5 w-48 bg-amber-200/80 dark:bg-amber-900/60 rounded" />
          <div className="h-4 w-72 bg-amber-100 dark:bg-amber-900/40 rounded" />
        </div>
        <div className="h-10 w-36 bg-amber-300 dark:bg-amber-800 rounded-lg" />
      </div>
    </div>
  );
}

