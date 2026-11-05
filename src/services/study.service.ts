import { createClient } from "@/lib/supabase/server";
import { Database } from "@/types/database.types";

export interface DashboardStats {
  totalBlocks: number;
  completedBlocks: number;
  totalChapters: number;
  passedChapters: number;
  averageScore: number;
  overallPercentage: number;
  finalExamPassed: boolean;
  nextStep: {
    title: string;
    description: string;
    href: string;
    actionLabel: string;
  } | null;
}

export async function getUserDashboardStats(userId: string): Promise<DashboardStats> {
  const supabase = await createClient();

  // 1. Obtener el libro de Efesios
  const { data: book } = await supabase
    .from("books")
    .select("id, chapters_count")
    .eq("slug", "efesios")
    .maybeSingle<{ id: string; chapters_count: number }>();

  const totalChapters = book?.chapters_count || 6;

  // 2. Obtener total de bloques de Efesios
  const { count: totalBlocksCount } = await supabase
    .from("study_blocks")
    .select("id", { count: "exact", head: true });

  const totalBlocks = totalBlocksCount || 22;

  // 3. Obtener bloques completados por el usuario
  const { data: userBlocks } = await supabase
    .from("user_block_progress")
    .select("block_id, reading_completed, quiz_passed, best_score")
    .eq("user_id", userId)
    .returns<
      Array<{
        block_id: string;
        reading_completed: boolean;
        quiz_passed: boolean;
        best_score: number;
      }>
    >();

  const completedBlocks =
    userBlocks?.filter((b) => b.reading_completed && b.quiz_passed).length || 0;

  // 4. Obtener capítulos aprobados por el usuario
  const { data: userChapters } = await supabase
    .from("user_chapter_progress")
    .select("chapter_id, exam_passed, best_score")
    .eq("user_id", userId)
    .returns<
      Array<{
        chapter_id: string;
        exam_passed: boolean;
        best_score: number;
      }>
    >();

  const passedChapters = userChapters?.filter((c) => c.exam_passed).length || 0;

  // 5. Obtener intentos para calcular el promedio de puntuación
  const { data: attempts } = await supabase
    .from("assessment_attempts")
    .select("percentage, passed")
    .eq("user_id", userId)
    .eq("status", "completed")
    .returns<Array<{ percentage: number; passed: boolean }>>();

  const averageScore =
    attempts && attempts.length > 0
      ? Math.round(
          attempts.reduce((acc, curr) => acc + Number(curr.percentage), 0) / attempts.length
        )
      : 0;

  const overallPercentage =
    totalBlocks > 0 ? Math.round((completedBlocks / totalBlocks) * 100) : 0;

  // 6. Determinar el siguiente paso sugerido
  let nextStep: DashboardStats["nextStep"] = null;

  interface BlockWithChapterRelation {
    id: string;
    block_number: number;
    title: string;
    verse_range: string;
    chapter: {
      chapter_number: number;
      book: { slug: string };
    };
  }

  const { data: allBlocks } = await supabase
    .from("study_blocks")
    .select(`
      id,
      block_number,
      title,
      verse_range,
      chapter:chapters!inner(
        chapter_number,
        book:books!inner(slug)
      )
    `)
    .order("order_index", { ascending: true })
    .returns<BlockWithChapterRelation[]>();

  if (allBlocks && allBlocks.length > 0) {
    const completedBlockIds = new Set(
      userBlocks
        ?.filter((b) => b.reading_completed && b.quiz_passed)
        .map((b) => b.block_id) || []
    );

    const nextPendingBlock = allBlocks.find((b) => !completedBlockIds.has(b.id));

    if (nextPendingBlock) {
      nextStep = {
        title: `Efesios ${nextPendingBlock.chapter.chapter_number} – ${nextPendingBlock.title}`,
        description: `Continúa con los versículos ${nextPendingBlock.verse_range}`,
        href: `/libros/efesios/capitulos/${nextPendingBlock.chapter.chapter_number}/bloques/${nextPendingBlock.id}`,
        actionLabel: "Estudiar Bloque",
      };
    } else if (passedChapters < totalChapters) {
      nextStep = {
        title: "Examen de Capítulo Pendiente",
        description: "Has terminado los bloques de estudio. ¡Realiza el examen de capítulo!",
        href: `/libros/efesios`,
        actionLabel: "Ver Capítulos",
      };
    } else {
      nextStep = {
        title: "Examen Final de Efesios",
        description: "Has completado todos los capítulos. ¡Pon a prueba todo lo aprendido!",
        href: `/libros/efesios`,
        actionLabel: "Examen Final",
      };
    }
  }

  return {
    totalBlocks,
    completedBlocks,
    totalChapters,
    passedChapters,
    averageScore,
    overallPercentage,
    finalExamPassed: false,
    nextStep,
  };
}

export interface BookQueryResult {
  id: string;
  slug: string;
  name: string;
  testament: "antiguo" | "nuevo";
  description: string | null;
  chapters_count: number;
  order_index: number;
  is_published: boolean;
  chapters: Array<{
    id: string;
    chapter_number: number;
    title: string;
    summary: string | null;
    is_published: boolean;
    study_blocks: Array<{
      id: string;
      block_number: number;
      title: string;
      verse_range: string;
      estimated_minutes: number;
      order_index: number;
    }>;
  }>;
}

export async function getBookWithChapters(slug: string, userId?: string) {
  const supabase = await createClient();

  const { data: book } = await supabase
    .from("books")
    .select(`
      id,
      slug,
      name,
      testament,
      description,
      chapters_count,
      order_index,
      is_published,
      chapters (
        id,
        chapter_number,
        title,
        summary,
        is_published,
        study_blocks (
          id,
          block_number,
          title,
          verse_range,
          estimated_minutes,
          order_index
        )
      )
    `)
    .eq("slug", slug)
    .single<BookQueryResult>();

  if (!book) return null;

  // Obtener examen final del libro
  const { data: finalExam } = await supabase
    .from("assessments")
    .select("id, title, type, passing_score_percentage, questions_count")
    .eq("book_id", book.id)
    .eq("type", "book_final")
    .maybeSingle<{
      id: string;
      title: string;
      type: string;
      passing_score_percentage: number;
      questions_count: number;
    }>();

  let userBookProgress: any = null;
  let userChaptersProgress: Record<string, any> = {};

  if (userId) {
    const { data: bookProg } = await supabase
      .from("user_book_progress")
      .select("*")
      .eq("user_id", userId)
      .eq("book_id", book.id)
      .maybeSingle<Database["public"]["Tables"]["user_book_progress"]["Row"]>();
    userBookProgress = bookProg;

    const { data: chapProg } = await supabase
      .from("user_chapter_progress")
      .select("*")
      .eq("user_id", userId)
      .returns<Database["public"]["Tables"]["user_chapter_progress"]["Row"][]>();

    if (chapProg) {
      chapProg.forEach((cp) => {
        userChaptersProgress[cp.chapter_id] = cp;
      });
    }
  }

  const sortedChapters = (book.chapters || []).sort(
    (a, b) => a.chapter_number - b.chapter_number
  );

  return {
    ...book,
    chapters: sortedChapters.map((ch) => ({
      ...ch,
      blocksCount: ch.study_blocks?.length || 0,
      userProgress: userChaptersProgress[ch.id] || null,
    })),
    finalExam,
    userProgress: userBookProgress,
  };
}

export interface ChapterQueryResult {
  id: string;
  chapter_number: number;
  title: string;
  summary: string | null;
  study_blocks: Array<{
    id: string;
    block_number: number;
    title: string;
    verse_range: string;
    estimated_minutes: number;
    order_index: number;
  }>;
}

export async function getChapterDetail(bookSlug: string, chapterNumber: number, userId?: string) {
  const supabase = await createClient();

  const { data: book } = await supabase
    .from("books")
    .select("id, name, slug")
    .eq("slug", bookSlug)
    .single<{ id: string; name: string; slug: string }>();

  if (!book) return null;

  const { data: chapter } = await supabase
    .from("chapters")
    .select(`
      id,
      chapter_number,
      title,
      summary,
      study_blocks (
        id,
        block_number,
        title,
        verse_range,
        estimated_minutes,
        order_index
      )
    `)
    .eq("book_id", book.id)
    .eq("chapter_number", chapterNumber)
    .single<ChapterQueryResult>();

  if (!chapter) return null;

  const { data: chapterAssessment } = await supabase
    .from("assessments")
    .select("id, title, type, passing_score_percentage, questions_count")
    .eq("chapter_id", chapter.id)
    .eq("type", "chapter_exam")
    .maybeSingle<{
      id: string;
      title: string;
      type: string;
      passing_score_percentage: number;
      questions_count: number;
    }>();

  let userProgressMap: Record<string, any> = {};
  let chapterProgress: any = null;

  if (userId) {
    const blockIds = (chapter.study_blocks || []).map((b) => b.id);
    if (blockIds.length > 0) {
      const { data: ubp } = await supabase
        .from("user_block_progress")
        .select("*")
        .eq("user_id", userId)
        .in("block_id", blockIds)
        .returns<Database["public"]["Tables"]["user_block_progress"]["Row"][]>();

      if (ubp) {
        ubp.forEach((p) => {
          userProgressMap[p.block_id] = p;
        });
      }
    }

    const { data: ucp } = await supabase
      .from("user_chapter_progress")
      .select("*")
      .eq("user_id", userId)
      .eq("chapter_id", chapter.id)
      .maybeSingle<Database["public"]["Tables"]["user_chapter_progress"]["Row"]>();

    chapterProgress = ucp;
  }

  const sortedBlocks = (chapter.study_blocks || []).sort(
    (a, b) => a.order_index - b.order_index
  );

  return {
    book,
    chapter: {
      ...chapter,
      blocks: sortedBlocks.map((b) => ({
        ...b,
        userProgress: userProgressMap[b.id] || null,
      })),
      assessment: chapterAssessment,
      userProgress: chapterProgress,
    },
  };
}

export interface BlockQueryResult {
  id: string;
  block_number: number;
  title: string;
  verse_range: string;
  estimated_minutes: number;
  order_index: number;
  chapter_id: string;
  chapter: {
    id: string;
    chapter_number: number;
    title: string;
    book: {
      id: string;
      name: string;
      slug: string;
    };
  };
  explanation: Array<{
    id: string;
    introduction: string;
    biblical_passage_rvr1960: string;
    passage_explanation: string;
    key_concepts: any;
    central_ideas: any;
    key_phrases: any;
    reading_instruction: string;
  }> | null;
}

export async function getBlockDetail(blockId: string, userId?: string) {
  const supabase = await createClient();

  const { data: block } = await supabase
    .from("study_blocks")
    .select(`
      id,
      block_number,
      title,
      verse_range,
      estimated_minutes,
      order_index,
      chapter_id,
      chapter:chapters!inner(
        id,
        chapter_number,
        title,
        book:books!inner(id, name, slug)
      ),
      explanation:block_explanations(
        id,
        introduction,
        biblical_passage_rvr1960,
        passage_explanation,
        key_concepts,
        central_ideas,
        key_phrases,
        reading_instruction
      )
    `)
    .eq("id", blockId)
    .single<BlockQueryResult>();

  if (!block) return null;

  const { data: blockAssessment } = await supabase
    .from("assessments")
    .select("id, title, type, passing_score_percentage, questions_count")
    .eq("block_id", block.id)
    .eq("type", "block_quiz")
    .maybeSingle<{
      id: string;
      title: string;
      type: string;
      passing_score_percentage: number;
      questions_count: number;
    }>();

  const { data: siblings } = await supabase
    .from("study_blocks")
    .select("id, block_number, title, verse_range, order_index")
    .eq("chapter_id", block.chapter_id)
    .order("order_index", { ascending: true })
    .returns<
      Array<{
        id: string;
        block_number: number;
        title: string;
        verse_range: string;
        order_index: number;
      }>
    >();

  const currentIndex = siblings?.findIndex((s) => s.id === block.id) ?? -1;
  const prevBlock = currentIndex > 0 ? siblings?.[currentIndex - 1] : null;
  const nextBlock =
    siblings && currentIndex >= 0 && currentIndex < siblings.length - 1
      ? siblings[currentIndex + 1]
      : null;

  let userProgress: any = null;
  if (userId) {
    const { data: ubp } = await supabase
      .from("user_block_progress")
      .select("*")
      .eq("user_id", userId)
      .eq("block_id", block.id)
      .maybeSingle<Database["public"]["Tables"]["user_block_progress"]["Row"]>();

    userProgress = ubp;
  }

  const rawExp = Array.isArray(block.explanation)
    ? block.explanation[0]
    : block.explanation;

  return {
    ...block,
    explanation: rawExp || null,
    assessment: blockAssessment,
    navigation: {
      prev: prevBlock,
      next: nextBlock,
      totalInChapter: siblings?.length || 0,
      currentPosition: currentIndex + 1,
    },
    userProgress,
  };
}
