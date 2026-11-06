import { notFound, redirect } from "next/navigation";
import { getCurrentUser } from "@/actions/auth.actions";
import { getBlockDetail } from "@/services/study.service";
import { BlockStudyView } from "@/components/study/BlockStudyView";

interface BlockPageProps {
  params: Promise<{
    slug: string;
    num: string;
    blockId: string;
  }>;
}

export const dynamic = "force-dynamic";

export default async function BlockPage({ params }: BlockPageProps) {
  const { slug, num, blockId } = await params;
  const authData = await getCurrentUser();
  const userId = authData?.user.id;

  const blockData = await getBlockDetail(blockId, userId);

  if (!blockData || !blockData.explanation) {
    notFound();
  }

  if (blockData.isChapterLocked) {
    redirect(`/libros/${slug}/capitulos/${num}`);
  }

  return (
    <BlockStudyView
      block={{
        id: blockData.id,
        block_number: blockData.block_number,
        title: blockData.title,
        verse_range: blockData.verse_range,
        estimated_minutes: blockData.estimated_minutes,
      }}
      chapter={{
        chapter_number: blockData.chapter.chapter_number,
        title: blockData.chapter.title,
        book: {
          name: blockData.chapter.book.name,
          slug: blockData.chapter.book.slug,
        },
      }}
      explanation={{
        introduction: blockData.explanation.introduction,
        biblical_passage_rvr1960: blockData.explanation.biblical_passage_rvr1960,
        passage_explanation: blockData.explanation.passage_explanation,
        key_concepts: (blockData.explanation.key_concepts as any) || [],
        central_ideas: (blockData.explanation.central_ideas as any) || [],
        key_phrases: (blockData.explanation.key_phrases as any) || [],
        reading_instruction: blockData.explanation.reading_instruction,
      }}
      assessment={blockData.assessment}
      navigation={{
        prev: blockData.navigation.prev || null,
        next: blockData.navigation.next || null,
        totalInChapter: blockData.navigation.totalInChapter,
        currentPosition: blockData.navigation.currentPosition,
      }}
      initialProgress={blockData.userProgress}
    />
  );
}
