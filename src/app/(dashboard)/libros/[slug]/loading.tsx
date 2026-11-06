export default function BookLoading() {
  return (
    <div className="space-y-8 animate-pulse">
      {/* Encabezado del Libro Skeleton */}
      <div className="h-64 rounded-3xl bg-gradient-to-br from-amber-700/40 via-amber-800/30 to-stone-900/40 p-6 sm:p-10 flex flex-col justify-between">
        <div className="space-y-3">
          <div className="flex gap-2">
            <div className="h-5 w-32 bg-white/20 rounded-full" />
            <div className="h-5 w-36 bg-white/20 rounded-full" />
          </div>
          <div className="h-10 w-48 sm:w-64 bg-white/30 rounded-xl" />
          <div className="h-4 w-full max-w-xl bg-white/20 rounded" />
          <div className="h-4 w-3/4 max-w-lg bg-white/20 rounded" />
        </div>
        <div className="flex gap-4">
          <div className="h-4 w-40 bg-white/20 rounded" />
          <div className="h-4 w-40 bg-white/20 rounded" />
        </div>
      </div>

      {/* Grid de Capítulos Skeleton */}
      <div>
        <div className="mb-6 space-y-2">
          <div className="h-6 w-48 bg-stone-200 dark:bg-stone-800 rounded-lg" />
          <div className="h-4 w-80 bg-stone-100 dark:bg-stone-800/60 rounded" />
        </div>

        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
          {[...Array(6)].map((_, i) => (
            <div
              key={i}
              className="p-6 rounded-xl border border-stone-200 dark:border-stone-800 bg-white dark:bg-stone-900 space-y-4"
            >
              <div className="flex justify-between items-center">
                <div className="h-4 w-24 bg-stone-200 dark:bg-stone-800 rounded" />
                <div className="h-5 w-16 bg-stone-100 dark:bg-stone-800 rounded-full" />
              </div>
              <div className="h-6 w-44 bg-stone-200 dark:bg-stone-800 rounded-lg" />
              <div className="h-4 w-full bg-stone-100 dark:bg-stone-800/60 rounded" />
              <div className="h-4 w-2/3 bg-stone-100 dark:bg-stone-800/60 rounded" />
              <div className="pt-2 flex justify-between items-center border-t border-stone-100 dark:border-stone-800">
                <div className="h-4 w-20 bg-stone-200 dark:bg-stone-800 rounded" />
                <div className="h-8 w-24 bg-stone-200 dark:bg-stone-800 rounded-lg" />
              </div>
            </div>
          ))}
        </div>
      </div>
    </div>
  );
}

