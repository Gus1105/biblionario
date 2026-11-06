export default function AssessmentLoading() {
  return (
    <div className="max-w-3xl mx-auto space-y-6 pb-16 animate-pulse">
      {/* Top Header & Question Count Skeleton */}
      <div className="flex items-center justify-between pb-4 border-b border-stone-200 dark:border-stone-800">
        <div className="space-y-2">
          <div className="h-3 w-28 bg-amber-200 dark:bg-amber-900/40 rounded-full" />
          <div className="h-6 w-48 bg-stone-200 dark:bg-stone-800 rounded-lg" />
        </div>
        <div className="h-7 w-20 bg-stone-200 dark:bg-stone-800 rounded-full" />
      </div>

      {/* Progress Bar Skeleton */}
      <div className="h-2 w-full bg-stone-200 dark:bg-stone-800 rounded-full" />

      {/* Question Card Skeleton */}
      <div className="p-6 sm:p-8 rounded-2xl border border-stone-200 dark:border-stone-800 bg-white dark:bg-stone-900 space-y-6">
        <div className="space-y-3">
          <div className="h-4 w-32 bg-stone-200 dark:bg-stone-800 rounded" />
          <div className="h-6 w-full max-w-xl bg-stone-200 dark:bg-stone-800 rounded-lg" />
          <div className="h-6 w-3/4 max-w-md bg-stone-200 dark:bg-stone-800 rounded-lg" />
        </div>

        {/* Options Skeleton */}
        <div className="space-y-3 pt-2">
          {[...Array(4)].map((_, i) => (
            <div
              key={i}
              className="h-14 rounded-xl border border-stone-200 dark:border-stone-800 bg-stone-50/60 dark:bg-stone-800/40 p-4 flex items-center gap-3"
            >
              <div className="h-5 w-5 rounded-full bg-stone-200 dark:bg-stone-700" />
              <div className="h-4 w-3/4 bg-stone-200 dark:bg-stone-700 rounded" />
            </div>
          ))}
        </div>
      </div>

      {/* Navigation Buttons Skeleton */}
      <div className="flex justify-between items-center pt-2">
        <div className="h-10 w-28 bg-stone-200 dark:bg-stone-800 rounded-lg" />
        <div className="h-10 w-32 bg-amber-300 dark:bg-amber-800 rounded-lg" />
      </div>
    </div>
  );
}

