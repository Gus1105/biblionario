export default function AdminParticipantsLoading() {
  return (
    <div className="space-y-6 animate-pulse">
      {/* Header Skeleton */}
      <div className="space-y-2">
        <div className="h-8 w-72 sm:w-80 bg-stone-200 dark:bg-stone-800 rounded-lg" />
        <div className="h-4 w-96 max-w-full bg-stone-100 dark:bg-stone-800/60 rounded" />
      </div>

      {/* Barra de Filtro y Botón Skeleton */}
      <div className="p-4 rounded-xl border border-stone-200 dark:border-stone-800 bg-white dark:bg-stone-900 flex flex-col sm:flex-row gap-3 justify-between items-center">
        <div className="h-10 w-full sm:w-80 bg-stone-100 dark:bg-stone-800 rounded-lg" />
        <div className="flex gap-2 w-full sm:w-auto justify-end">
          <div className="h-10 w-24 bg-stone-100 dark:bg-stone-800 rounded-lg" />
          <div className="h-10 w-36 bg-amber-200 dark:bg-amber-900/60 rounded-lg" />
        </div>
      </div>

      {/* Tabla / Lista de Participantes Skeleton */}
      <div className="rounded-xl border border-stone-200 dark:border-stone-800 bg-white dark:bg-stone-900 overflow-hidden">
        <div className="p-4 border-b border-stone-100 dark:border-stone-800 flex justify-between">
          <div className="h-4 w-32 bg-stone-200 dark:bg-stone-800 rounded" />
          <div className="h-4 w-20 bg-stone-100 dark:bg-stone-800 rounded" />
        </div>
        <div className="divide-y divide-stone-100 dark:divide-stone-800">
          {[...Array(6)].map((_, i) => (
            <div key={i} className="p-4 flex items-center justify-between gap-4">
              <div className="flex items-center gap-3">
                <div className="h-10 w-10 rounded-full bg-stone-200 dark:bg-stone-800" />
                <div className="space-y-2">
                  <div className="h-4 w-36 sm:w-48 bg-stone-200 dark:bg-stone-800 rounded" />
                  <div className="h-3 w-48 sm:w-60 bg-stone-100 dark:bg-stone-800/60 rounded" />
                </div>
              </div>
              <div className="hidden md:flex items-center gap-6">
                <div className="h-4 w-20 bg-stone-100 dark:bg-stone-800 rounded" />
                <div className="h-4 w-20 bg-stone-100 dark:bg-stone-800 rounded" />
                <div className="h-6 w-16 bg-stone-200 dark:bg-stone-800 rounded-full" />
              </div>
              <div className="flex items-center gap-2">
                <div className="h-8 w-16 bg-stone-100 dark:bg-stone-800 rounded-lg" />
                <div className="h-8 w-8 bg-stone-100 dark:bg-stone-800 rounded-lg" />
              </div>
            </div>
          ))}
        </div>
      </div>
    </div>
  );
}

