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

export async function getAdminParticipants() {
  const adminSupabase = createAdminClient();

  const { data: profiles } = await adminSupabase
    .from("profiles")
    .select(`
      id,
      email,
      full_name,
      created_at,
      roles:user_roles(role)
    `)
    .order("created_at", { ascending: false })
    .returns<any[]>();

  return profiles || [];
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

