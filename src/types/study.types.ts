import { Database } from "./database.types";

export type BookRow = Database["public"]["Tables"]["books"]["Row"];
export type ChapterRow = Database["public"]["Tables"]["chapters"]["Row"];
export type StudyBlockRow = Database["public"]["Tables"]["study_blocks"]["Row"];
export type BlockExplanationRow = Database["public"]["Tables"]["block_explanations"]["Row"];

export interface KeyConcept {
  concept: string;
  definition: string;
  context?: string;
}

export interface KeyPhrase {
  phrase: string;
  reference: string;
}

export interface BlockWithExplanation extends StudyBlockRow {
  explanation: {
    introduction: string;
    biblical_passage_rvr1960: string;
    passage_explanation: string;
    key_concepts: KeyConcept[];
    central_ideas: string[];
    key_phrases: KeyPhrase[];
    reading_instruction: string;
  } | null;
  user_progress?: {
    reading_completed: boolean;
    quiz_passed: boolean;
    best_score: number;
    attempts_count: number;
  } | null;
}

export interface ChapterWithBlocks extends ChapterRow {
  blocks: BlockWithExplanation[];
  user_progress?: {
    all_blocks_completed: boolean;
    exam_unlocked: boolean;
    exam_passed: boolean;
    best_score: number;
  } | null;
}

export interface BookWithChapters extends BookRow {
  chapters: ChapterWithBlocks[];
  finalExam?: {
    id: string;
    title: string;
    type: string;
    passing_score_percentage: number;
    questions_count: number;
  } | null;
  userProgress?: {
    completed_chapters_count: number;
    final_exam_unlocked: boolean;
    final_exam_passed: boolean;
    overall_percentage: number;
  } | null;
}

export interface StudyBlockDetail extends StudyBlockRow {
  explanation: {
    id: string;
    introduction: string;
    biblical_passage_rvr1960: string;
    passage_explanation: string;
    key_concepts: KeyConcept[];
    central_ideas: string[];
    key_phrases: KeyPhrase[];
    reading_instruction: string;
  } | null;
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
  assessment?: {
    id: string;
    title: string;
    type: string;
    passing_score_percentage: number;
    questions_count: number;
  } | null;
  navigation: {
    prev: { id: string; block_number: number; title: string; verse_range: string } | null;
    next: { id: string; block_number: number; title: string; verse_range: string } | null;
    totalInChapter: number;
    currentPosition: number;
  };
  userProgress?: {
    reading_completed: boolean;
    quiz_passed: boolean;
    best_score: number;
    attempts_count: number;
  } | null;
}
