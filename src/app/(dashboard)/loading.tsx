export default function DashboardLoading() {
  return (
    <div className="space-y-8 animate-pulse">
      {/* Saludo & Bienvenida Skeleton */}
      <div className="flex flex-col md:flex-row md:items-center md:justify-between gap-4 pb-4 border-b border-stone-200 dark:border-stone-800">
        <div className="space-y-2">
          <div className="h-3 w-32 bg-amber-200 dark:bg-amber-900/40 rounded-full" />
          <div className="h-8 w-64 sm:w-80 bg-stone-200 dark:bg-stone-800 rounded-lg" />
          <div className="h-4 w-72 sm:w-96 bg-stone-100 dark:bg-stone-800/60 rounded" />
        </div>
        <div className="h-10 w-32 bg-stone-200 dark:bg-stone-800 rounded-lg" />
      </div>

      {/* Tarjeta de Siguiente Paso Skeleton */}
      <div className="h-44 rounded-2xl bg-gradient-to-r from-amber-600/30 via-amber-700/20 to-stone-800/30 p-6 sm:p-8 flex flex-col justify-between">
        <div className="space-y-3">
          <div className="h-5 w-40 bg-white/20 rounded-full" />
          <div className="h-7 w-72 bg-white/30 rounded-lg" />
          <div className="h-4 w-96 bg-white/20 rounded" />
        </div>
        <div className="h-10 w-44 bg-white/30 rounded-lg" />
      </div>

      {/* Grid de 4 Métricas Skeleton */}
      <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-4">
        {[...Array(4)].map((_, i) => (
          <div
            key={i}
            className="p-5 rounded-xl border border-stone-200/80 dark:border-stone-800 bg-white dark:bg-stone-900 space-y-3"
          >
            <div className="flex justify-between items-center">
              <div className="h-3 w-28 bg-stone-200 dark:bg-stone-800 rounded" />
              <div className="h-5 w-5 bg-stone-200 dark:bg-stone-800 rounded" />
            </div>
            <div className="h-8 w-20 bg-stone-200 dark:bg-stone-800 rounded-lg" />
            <div className="h-2 w-full bg-stone-100 dark:bg-stone-800 rounded-full" />
          </div>
        ))}
      </div>

      {/* Secciones de Estudio Skeleton */}
      <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
        <div className="h-64 rounded-xl border border-stone-200 dark:border-stone-800 bg-white dark:bg-stone-900 p-6 space-y-4">
          <div className="h-5 w-48 bg-stone-200 dark:bg-stone-800 rounded" />
          <div className="space-y-3">
            {[...Array(3)].map((_, j) => (
              <div key={j} className="h-12 bg-stone-100 dark:bg-stone-800/60 rounded-lg" />
            ))}
          </div>
        </div>
        <div className="h-64 rounded-xl border border-stone-200 dark:border-stone-800 bg-white dark:bg-stone-900 p-6 space-y-4">
          <div className="h-5 w-48 bg-stone-200 dark:bg-stone-800 rounded" />
          <div className="space-y-3">
            {[...Array(3)].map((_, j) => (
              <div key={j} className="h-12 bg-stone-100 dark:bg-stone-800/60 rounded-lg" />
            ))}
          </div>
        </div>
      </div>
    </div>
  );
}

