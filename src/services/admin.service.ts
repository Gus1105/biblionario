import { createAdminClient } from "@/lib/supabase/admin";
import { getCurrentUser } from "@/actions/auth.actions";

export async function verifyAdmin() {
  const authData = await getCurrentUser();
  if (!authData || !authData.isAdmin) {
    return false;
  }
  return true;
}

export async function getAdminMetrics() {
  const adminSupabase = createAdminClient();

  const [
    { count: usersCount },
    { count: booksCount },
    { count: chaptersCount },
    { count: blocksCount },
    { count: questionsCount },
    { count: attemptsCount },
  ] = await Promise.all([
    adminSupabase.from("profiles").select("id", { count: "exact", head: true }),
    adminSupabase.from("books").select("id", { count: "exact", head: true }),
    adminSupabase.from("chapters").select("id", { count: "exact", head: true }),
    adminSupabase.from("study_blocks").select("id", { count: "exact", head: true }),
    adminSupabase.from("questions").select("id", { count: "exact", head: true }),
    adminSupabase.from("assessment_attempts").select("id", { count: "exact", head: true }),
  ]);

  return {
    usersCount: usersCount || 0,
    booksCount: booksCount || 0,
    chaptersCount: chaptersCount || 0,
    blocksCount: blocksCount || 0,
    questionsCount: questionsCount || 0,
    attemptsCount: attemptsCount || 0,
  };
}

export async function getAdminQuestions(chapterId?: string) {
  const adminSupabase = createAdminClient();

  let query = adminSupabase
    .from("questions")
    .select(`
      id,
      prompt,
      question_type,
      verse_reference,
      points,
      difficulty,
      is_active,
      order_index,
      block_id,
      chapter_id,
      options:question_options(
        id,
        option_text,
        is_correct,
        order_index,
        correct_order_position
      )
    `)
    .order("order_index", { ascending: true });

  if (chapterId) {
    query = query.eq("chapter_id", chapterId);
  }

  const { data: questions } = await query.returns<any[]>();
  return questions || [];
}

export interface ParticipantWithStats {
  id: string;
  email: string;
  full_name: string | null;
  created_at: string;
  updated_at: string | null;
  role: "admin" | "participant";
  last_sign_in_at: string | null;
  email_confirmed: boolean;
  total_attempts: number;
  passed_attempts: number;
  completed_blocks: number;
  completed_chapters: number;
  avg_score: number;
  last_activity_at: string | null;
}

export async function getAdminParticipantsWithStats(): Promise<ParticipantWithStats[]> {
  const adminSupabase = createAdminClient();

  // 1. Obtener todos los perfiles con roles
  const { data: profiles } = await adminSupabase
    .from("profiles")
    .select(`
      id,
      email,
      full_name,
      created_at,
      updated_at,
      roles:user_roles(role)
    `)
    .order("created_at", { ascending: false })
    .returns<any[]>();

  const participantsList = profiles || [];
  if (participantsList.length === 0) return [];

  // 2. Obtener estadísticas agregadas en paralelo
  const [
    { data: blockProgress },
    { data: chapterProgress },
    { data: attempts },
  ] = await Promise.all([
    adminSupabase
      .from("user_block_progress")
      .select("user_id, reading_completed, quiz_passed, last_studied_at")
      .returns<any[]>(),
    adminSupabase
      .from("user_chapter_progress")
      .select("user_id, exam_passed")
      .returns<any[]>(),
    adminSupabase
      .from("assessment_attempts")
      .select("user_id, percentage, passed, started_at, completed_at, status")
      .returns<any[]>(),
  ]);

  // Intentar obtener info de auth.users si está disponible
  const authUsersMap = new Map<string, { last_sign_in_at: string | null; email_confirmed: boolean }>();
  try {
    const { data: authData } = await adminSupabase.auth.admin.listUsers({ perPage: 1000 });
    if (authData?.users) {
      for (const u of authData.users) {
        authUsersMap.set(u.id, {
          last_sign_in_at: u.last_sign_in_at || null,
          email_confirmed: Boolean(u.email_confirmed_at),
        });
      }
    }
  } catch (err) {
    // Si la lista de auth no está disponible, continuar con profiles
    console.warn("No se pudo obtener listUsers de auth:", err);
  }

  // Mapas de agregación
  const blocksMap = new Map<string, { count: number; lastDate: string | null }>();
  (blockProgress || []).forEach((b) => {
    if (b.reading_completed && b.quiz_passed) {
      const current = blocksMap.get(b.user_id) || { count: 0, lastDate: null };
      current.count += 1;
      if (b.last_studied_at && (!current.lastDate || new Date(b.last_studied_at) > new Date(current.lastDate))) {
        current.lastDate = b.last_studied_at;
      }
      blocksMap.set(b.user_id, current);
    }
  });

  const chaptersMap = new Map<string, number>();
  (chapterProgress || []).forEach((c) => {
    if (c.exam_passed) {
      chaptersMap.set(c.user_id, (chaptersMap.get(c.user_id) || 0) + 1);
    }
  });

  const attemptsMap = new Map<
    string,
    { total: number; passed: number; sumPercent: number; lastDate: string | null }
  >();
  (attempts || []).forEach((a) => {
    const current = attemptsMap.get(a.user_id) || {
      total: 0,
      passed: 0,
      sumPercent: 0,
      lastDate: null,
    };
    current.total += 1;
    if (a.passed) current.passed += 1;
    current.sumPercent += Number(a.percentage || 0);

    const aDate = a.completed_at || a.started_at;
    if (aDate && (!current.lastDate || new Date(aDate) > new Date(current.lastDate))) {
      current.lastDate = aDate;
    }
    attemptsMap.set(a.user_id, current);
  });

  // Ensamblar respuesta completa
  return participantsList.map((p) => {
    const role: "admin" | "participant" = p.roles?.[0]?.role === "admin" ? "admin" : "participant";
    const authInfo = authUsersMap.get(p.id);
    const bStats = blocksMap.get(p.id) || { count: 0, lastDate: null };
    const cCount = chaptersMap.get(p.id) || 0;
    const aStats = attemptsMap.get(p.id) || { total: 0, passed: 0, sumPercent: 0, lastDate: null };

    // Determinar última actividad
    const dates = [
      authInfo?.last_sign_in_at,
      aStats.lastDate,
      bStats.lastDate,
      p.updated_at,
      p.created_at,
    ].filter(Boolean) as string[];

    const sortedDates = dates.sort((a, b) => new Date(b).getTime() - new Date(a).getTime());
    const last_activity_at = sortedDates[0] || null;

    const avg_score =
      aStats.total > 0 ? Math.round(aStats.sumPercent / aStats.total) : 0;

    return {
      id: p.id,
      email: p.email,
      full_name: p.full_name || null,
      created_at: p.created_at,
      updated_at: p.updated_at || null,
      role,
      last_sign_in_at: authInfo?.last_sign_in_at || null,
      email_confirmed: authInfo?.email_confirmed ?? true,
      total_attempts: aStats.total,
      passed_attempts: aStats.passed,
      completed_blocks: bStats.count,
      completed_chapters: cCount,
      avg_score,
      last_activity_at,
    };
  });
}

// Mantener compatibilidad con getAdminParticipants original
export async function getAdminParticipants() {
  return getAdminParticipantsWithStats();
}

export async function getAdminChaptersAndBlocks() {
  const adminSupabase = createAdminClient();

  const { data: chapters } = await adminSupabase
    .from("chapters")
    .select(`
      id,
      chapter_number,
      title,
      study_blocks (
        id,
        block_number,
        title,
        verse_range
      )
    `)
    .order("chapter_number", { ascending: true })
    .returns<any[]>();

  return chapters || [];
}

export interface ParticipantDetailProgress {
  participant: {
    id: string;
    email: string;
    full_name: string | null;
    created_at: string;
    updated_at: string | null;
    role: "admin" | "participant";
    last_sign_in_at: string | null;
  };
  summary: {
    totalBlocks: number;
    completedBlocks: number;
    totalChapters: number;
    passedChapters: number;
    overallPercentage: number;
    averageScore: number;
    totalAttempts: number;
    passedAttempts: number;
    finalExamUnlocked: boolean;
    finalExamPassed: boolean;
    currentStep: {
      chapterNumber: number;
      chapterTitle: string;
      blockTitle?: string;
      verseRange?: string;
      statusDescription: string;
      phase: "reading" | "quiz" | "exam" | "final" | "completed";
    };
  };
  chapters: Array<{
    id: string;
    chapter_number: number;
    title: string;
    summary: string | null;
    status: "completed" | "in_progress" | "locked";
    exam: {
      id: string | null;
      title: string;
      unlocked: boolean;
      passed: boolean;
      best_score: number;
      completed_at: string | null;
    } | null;
    blocks: Array<{
      id: string;
      block_number: number;
      title: string;
      verse_range: string;
      reading_completed: boolean;
      quiz_passed: boolean;
      best_score: number;
      attempts_count: number;
      last_studied_at: string | null;
      status: "completed" | "in_progress" | "pending";
    }>;
  }>;
  finalExam: {
    id: string | null;
    title: string;
    unlocked: boolean;
    passed: boolean;
    best_score: number;
  } | null;
  attemptsHistory: Array<{
    id: string;
    assessmentTitle: string;
    assessmentType: "block_quiz" | "chapter_exam" | "book_final";
    score: number;
    max_score: number;
    percentage: number;
    passed: boolean;
    status: string;
    started_at: string;
    completed_at: string | null;
  }>;
}

export async function getParticipantProgressDetails(
  participantId: string
): Promise<ParticipantDetailProgress | null> {
  const adminSupabase = createAdminClient();

  // 1. Obtener perfil del usuario
  const { data: profile } = await adminSupabase
    .from("profiles")
    .select(`
      id,
      email,
      full_name,
      created_at,
      updated_at,
      roles:user_roles(role)
    `)
    .eq("id", participantId)
    .single<any>();

  if (!profile) return null;

  // Obtener info de login de auth.users si es posible
  let lastSignIn: string | null = null;
  try {
    const { data: authUser } = await adminSupabase.auth.admin.getUserById(participantId);
    lastSignIn = authUser?.user?.last_sign_in_at || null;
  } catch {}

  // 2. Obtener el libro de Efesios y sus capítulos con bloques y exámenes
  const { data: book } = await adminSupabase
    .from("books")
    .select(`
      id,
      slug,
      name,
      chapters_count,
      chapters:chapters(
        id,
        chapter_number,
        title,
        summary,
        study_blocks:study_blocks(
          id,
          block_number,
          title,
          verse_range,
          order_index
        )
      )
    `)
    .eq("slug", "efesios")
    .single<any>();

  // 3. Obtener todas las evaluaciones (quizzes, exámenes de capítulo, final)
  const { data: assessments } = await adminSupabase
    .from("assessments")
    .select("id, title, type, block_id, chapter_id, book_id, passing_score_percentage")
    .returns<any[]>();

  const assessmentsList = assessments || [];

  // 4. Obtener progreso de bloques del usuario
  const { data: userBlocks } = await adminSupabase
    .from("user_block_progress")
    .select("block_id, reading_completed, quiz_passed, best_score, attempts_count, last_studied_at")
    .eq("user_id", participantId)
    .returns<any[]>();

  const userBlockMap = new Map<string, any>();
  (userBlocks || []).forEach((ub) => {
    userBlockMap.set(ub.block_id, ub);
  });

  // 5. Obtener progreso de capítulos del usuario
  const { data: userChapters } = await adminSupabase
    .from("user_chapter_progress")
    .select("chapter_id, all_blocks_completed, exam_unlocked, exam_passed, best_score, completed_at")
    .eq("user_id", participantId)
    .returns<any[]>();

  const userChapterMap = new Map<string, any>();
  (userChapters || []).forEach((uc) => {
    userChapterMap.set(uc.chapter_id, uc);
  });

  // 6. Obtener progreso del libro
  const { data: userBook } = await adminSupabase
    .from("user_book_progress")
    .select("final_exam_unlocked, final_exam_passed, overall_percentage, completed_chapters_count")
    .eq("user_id", participantId)
    .maybeSingle<any>();

  // 7. Obtener todos los intentos de evaluación del usuario
  const { data: attempts } = await adminSupabase
    .from("assessment_attempts")
    .select(`
      id,
      score,
      max_score,
      percentage,
      passed,
      status,
      started_at,
      completed_at,
      assessment:assessments!inner(
        id,
        title,
        type,
        passing_score_percentage
      )
    `)
    .eq("user_id", participantId)
    .order("started_at", { ascending: false })
    .returns<any[]>();

  const attemptsHistory = (attempts || []).map((a) => ({
    id: a.id,
    assessmentTitle: a.assessment?.title || "Evaluación",
    assessmentType: (a.assessment?.type || "block_quiz") as any,
    score: Number(a.score || 0),
    max_score: Number(a.max_score || 0),
    percentage: Number(a.percentage || 0),
    passed: Boolean(a.passed),
    status: a.status || "completed",
    started_at: a.started_at,
    completed_at: a.completed_at || null,
  }));

  // Ordenar capítulos por número
  const rawChapters = (book?.chapters || []).sort(
    (a: any, b: any) => a.chapter_number - b.chapter_number
  );

  let totalBlocksCount = 0;
  let completedBlocksCount = 0;
  let passedChaptersCount = 0;

  // Construir estructura jerárquica de capítulos y bloques
  const chapters = rawChapters.map((ch: any, chIndex: number) => {
    const sortedBlocks = (ch.study_blocks || []).sort(
      (a: any, b: any) => (a.order_index ?? a.block_number) - (b.order_index ?? b.block_number)
    );

    const chapterExamMeta = assessmentsList.find(
      (ass) => ass.type === "chapter_exam" && ass.chapter_id === ch.id
    );

    const chProgress = userChapterMap.get(ch.id);
    const examPassed = Boolean(chProgress?.exam_passed);
    if (examPassed) passedChaptersCount++;

    const blocks = sortedBlocks.map((blk: any) => {
      totalBlocksCount++;
      const ub = userBlockMap.get(blk.id);
      const reading_completed = Boolean(ub?.reading_completed);
      const quiz_passed = Boolean(ub?.quiz_passed);

      if (reading_completed && quiz_passed) {
        completedBlocksCount++;
      }

      let status: "completed" | "in_progress" | "pending" = "pending";
      if (reading_completed && quiz_passed) {
        status = "completed";
      } else if (reading_completed || (ub && ub.attempts_count > 0)) {
        status = "in_progress";
      }

      return {
        id: blk.id,
        block_number: blk.block_number,
        title: blk.title,
        verse_range: blk.verse_range,
        reading_completed,
        quiz_passed,
        best_score: Number(ub?.best_score || 0),
        attempts_count: Number(ub?.attempts_count || 0),
        last_studied_at: ub?.last_studied_at || null,
        status,
      };
    });

    let chapterStatus: "completed" | "in_progress" | "locked" = "locked";
    if (examPassed) {
      chapterStatus = "completed";
    } else if (
      chIndex === 0 ||
      (chIndex > 0 && userChapterMap.get(rawChapters[chIndex - 1]?.id)?.exam_passed) ||
      blocks.some((b: any) => b.reading_completed || b.quiz_passed)
    ) {
      chapterStatus = "in_progress";
    }

    return {
      id: ch.id,
      chapter_number: ch.chapter_number,
      title: ch.title,
      summary: ch.summary,
      status: chapterStatus,
      exam: chapterExamMeta
        ? {
            id: chapterExamMeta.id,
            title: chapterExamMeta.title,
            unlocked: Boolean(chProgress?.exam_unlocked || examPassed),
            passed: examPassed,
            best_score: Number(chProgress?.best_score || 0),
            completed_at: chProgress?.completed_at || null,
          }
        : null,
      blocks,
    };
  });

  const finalExamMeta = assessmentsList.find(
    (ass) => ass.type === "book_final" && ass.book_id === book?.id
  );

  const finalExam = finalExamMeta
    ? {
        id: finalExamMeta.id,
        title: finalExamMeta.title,
        unlocked: Boolean(userBook?.final_exam_unlocked || passedChaptersCount >= 6),
        passed: Boolean(userBook?.final_exam_passed),
        best_score: 0,
      }
    : null;

  // Determinar "¿Por dónde va?" (currentStep)
  let currentStep: ParticipantDetailProgress["summary"]["currentStep"] = {
    chapterNumber: 1,
    chapterTitle: "Efesios 1",
    statusDescription: "Aún no ha iniciado el estudio del Capítulo 1",
    phase: "reading",
  };

  if (userBook?.final_exam_passed) {
    currentStep = {
      chapterNumber: 6,
      chapterTitle: "Efesios Completo",
      statusDescription: "¡Ha completado todo el libro de Efesios y aprobado el Examen Final!",
      phase: "completed",
    };
  } else if (finalExam?.unlocked) {
    currentStep = {
      chapterNumber: 6,
      chapterTitle: "Examen Final de Efesios",
      statusDescription: "Completó todos los capítulos. Tiene disponible el Examen Final de Efesios.",
      phase: "final",
    };
  } else {
    // Buscar el primer capítulo no completado
    const activeChapter = chapters.find((c: any) => c.status !== "completed") || chapters[0];
    if (activeChapter) {
      const pendingBlock = activeChapter.blocks.find((b: any) => !b.quiz_passed);
      if (pendingBlock) {
        if (!pendingBlock.reading_completed) {
          currentStep = {
            chapterNumber: activeChapter.chapter_number,
            chapterTitle: activeChapter.title,
            blockTitle: `Bloque ${pendingBlock.block_number}: ${pendingBlock.title}`,
            verseRange: pendingBlock.verse_range,
            statusDescription: `Pendiente por leer la porción bíblica (${pendingBlock.verse_range}).`,
            phase: "reading",
          };
        } else {
          currentStep = {
            chapterNumber: activeChapter.chapter_number,
            chapterTitle: activeChapter.title,
            blockTitle: `Bloque ${pendingBlock.block_number}: ${pendingBlock.title}`,
            verseRange: pendingBlock.verse_range,
            statusDescription: `Lectura realizada. Tiene pendiente aprobar el Quiz del Bloque ${pendingBlock.block_number}.`,
            phase: "quiz",
          };
        }
      } else {
        currentStep = {
          chapterNumber: activeChapter.chapter_number,
          chapterTitle: activeChapter.title,
          statusDescription: `Completó todos los bloques del Capítulo ${activeChapter.chapter_number}. Pendiente por rendir y aprobar el Examen del Capítulo.`,
          phase: "exam",
        };
      }
    }
  }

  const overallPercentage =
    totalBlocksCount > 0 ? Math.round((completedBlocksCount / totalBlocksCount) * 100) : 0;

  const totalAttempts = attemptsHistory.length;
  const passedAttempts = attemptsHistory.filter((a) => a.passed).length;
  const averageScore =
    totalAttempts > 0
      ? Math.round(attemptsHistory.reduce((acc, curr) => acc + curr.percentage, 0) / totalAttempts)
      : 0;

  return {
    participant: {
      id: profile.id,
      email: profile.email,
      full_name: profile.full_name || null,
      created_at: profile.created_at,
      updated_at: profile.updated_at || null,
      role: profile.roles?.[0]?.role === "admin" ? "admin" : "participant",
      last_sign_in_at: lastSignIn,
    },
    summary: {
      totalBlocks: totalBlocksCount || 22,
      completedBlocks: completedBlocksCount,
      totalChapters: 6,
      passedChapters: passedChaptersCount,
      overallPercentage,
      averageScore,
      totalAttempts,
      passedAttempts,
      finalExamUnlocked: Boolean(finalExam?.unlocked),
      finalExamPassed: Boolean(finalExam?.passed),
      currentStep,
    },
    chapters,
    finalExam,
    attemptsHistory,
  };
}
