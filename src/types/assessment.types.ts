import { QuestionType, QuestionDifficulty, AssessmentType } from "./database.types";

export interface ClientQuestionOption {
  id: string;
  option_text: string;
  order_index: number;
}

export interface ClientQuestion {
  id: string;
  question_type: QuestionType;
  prompt: string;
  verse_reference: string;
  points: number;
  difficulty: QuestionDifficulty;
  order_index: number;
  options: ClientQuestionOption[];
}

export interface AssessmentWithQuestions {
  id: string;
  title: string;
  type: AssessmentType;
  passing_score_percentage: number;
  questions_count: number;
  time_limit_minutes: number | null;
  block_id: string | null;
  chapter_id: string | null;
  book_id: string | null;
  questions: ClientQuestion[];
}

export interface UserSubmittedAnswer {
  questionId: string;
  selectedOptionId?: string | null;
  textResponse?: string | null;
  orderResponse?: string[] | null; // option IDs in student's chosen order
}

export interface SubmitAssessmentPayload {
  assessmentId: string;
  attemptId?: string;
  answers: UserSubmittedAnswer[];
}

export interface QuestionEvaluationResult {
  questionId: string;
  prompt: string;
  questionType: QuestionType;
  verseReference: string;
  isCorrect: boolean;
  pointsAwarded: number;
  maxPoints: number;
  correctAnswerText: string;
  userAnswerText: string;
  explanation: string;
}

export interface AssessmentResultSummary {
  attemptId: string;
  assessmentId: string;
  assessmentTitle: string;
  assessmentType?: string;
  score: number;
  maxScore: number;
  percentage: number;
  passed: boolean;
  passingScorePercentage: number;
  totalQuestions: number;
  correctCount: number;
  incorrectCount: number;
  completedAt: string;
  results: QuestionEvaluationResult[];
  blockId?: string | null;
  chapterId?: string | null;
  chapterExamInfo?: {
    id: string;
    title: string;
    chapterNumber: number;
  } | null;
  nextStep?: {
    type: "next_block" | "chapter_exam" | "next_chapter" | "book_final" | "dashboard";
    label: string;
    href: string;
  };
}

