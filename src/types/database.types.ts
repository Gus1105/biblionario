export type Json =
  | string
  | number
  | boolean
  | null
  | { [key: string]: Json | undefined }
  | Json[];

export type QuestionType =
  | "multiple_choice"
  | "fill_blank"
  | "reference_identification"
  | "true_false"
  | "order_events";

export type QuestionDifficulty = "easy" | "medium" | "hard";

export type AssessmentType = "block_quiz" | "chapter_exam" | "book_final";

export type AttemptStatus = "in_progress" | "completed" | "abandoned";

export interface Database {
  public: {
    Tables: {
      profiles: {
        Row: {
          id: string;
          email: string;
          full_name: string | null;
          avatar_url: string | null;
          created_at: string;
          updated_at: string;
        };
        Insert: {
          id: string;
          email: string;
          full_name?: string | null;
          avatar_url?: string | null;
          created_at?: string;
          updated_at?: string;
        };
        Update: {
          id?: string;
          email?: string;
          full_name?: string | null;
          avatar_url?: string | null;
          updated_at?: string;
        };
      };
      user_roles: {
        Row: {
          id: string;
          user_id: string;
          role: "admin" | "participant";
          created_at: string;
        };
        Insert: {
          id?: string;
          user_id: string;
          role?: "admin" | "participant";
          created_at?: string;
        };
        Update: {
          role?: "admin" | "participant";
        };
      };
      books: {
        Row: {
          id: string;
          slug: string;
          name: string;
          testament: "antiguo" | "nuevo";
          description: string | null;
          chapters_count: number;
          order_index: number;
          is_published: boolean;
          created_at: string;
        };
        Insert: {
          id?: string;
          slug: string;
          name: string;
          testament?: "antiguo" | "nuevo";
          description?: string | null;
          chapters_count: number;
          order_index?: number;
          is_published?: boolean;
          created_at?: string;
        };
        Update: {
          slug?: string;
          name?: string;
          testament?: "antiguo" | "nuevo";
          description?: string | null;
          chapters_count?: number;
          order_index?: number;
          is_published?: boolean;
        };
      };
      chapters: {
        Row: {
          id: string;
          book_id: string;
          chapter_number: number;
          title: string;
          summary: string | null;
          is_published: boolean;
          created_at: string;
        };
        Insert: {
          id?: string;
          book_id: string;
          chapter_number: number;
          title: string;
          summary?: string | null;
          is_published?: boolean;
          created_at?: string;
        };
        Update: {
          book_id?: string;
          chapter_number?: number;
          title?: string;
          summary?: string | null;
          is_published?: boolean;
        };
      };
      study_blocks: {
        Row: {
          id: string;
          chapter_id: string;
          block_number: number;
          title: string;
          verse_range: string;
          estimated_minutes: number;
          order_index: number;
          created_at: string;
        };
        Insert: {
          id?: string;
          chapter_id: string;
          block_number: number;
          title: string;
          verse_range: string;
          estimated_minutes?: number;
          order_index?: number;
          created_at?: string;
        };
        Update: {
          chapter_id?: string;
          block_number?: number;
          title?: string;
          verse_range?: string;
          estimated_minutes?: number;
          order_index?: number;
        };
      };
      block_explanations: {
        Row: {
          id: string;
          block_id: string;
          introduction: string;
          biblical_passage_rvr1960: string;
          passage_explanation: string;
          key_concepts: Json; // array of { concept: string, definition: string, context?: string }
          central_ideas: Json; // array of strings
          key_phrases: Json; // array of { phrase: string, reference: string }
          reading_instruction: string;
          created_at: string;
          updated_at: string;
        };
        Insert: {
          id?: string;
          block_id: string;
          introduction: string;
          biblical_passage_rvr1960?: string;
          passage_explanation: string;
          key_concepts?: Json;
          central_ideas?: Json;
          key_phrases?: Json;
          reading_instruction?: string;
          created_at?: string;
          updated_at?: string;
        };
        Update: {
          introduction?: string;
          biblical_passage_rvr1960?: string;
          passage_explanation?: string;
          key_concepts?: Json;
          central_ideas?: Json;
          key_phrases?: Json;
          reading_instruction?: string;
          updated_at?: string;
        };
      };
      questions: {
        Row: {
          id: string;
          block_id: string | null;
          chapter_id: string | null;
          question_type: QuestionType;
          prompt: string;
          verse_reference: string;
          explanation: string;
          points: number;
          difficulty: QuestionDifficulty;
          order_index: number;
          is_active: boolean;
          created_at: string;
        };
        Insert: {
          id?: string;
          block_id?: string | null;
          chapter_id?: string | null;
          question_type: QuestionType;
          prompt: string;
          verse_reference: string;
          explanation: string;
          points?: number;
          difficulty?: QuestionDifficulty;
          order_index?: number;
          is_active?: boolean;
          created_at?: string;
        };
        Update: {
          block_id?: string | null;
          chapter_id?: string | null;
          question_type?: QuestionType;
          prompt?: string;
          verse_reference?: string;
          explanation?: string;
          points?: number;
          difficulty?: QuestionDifficulty;
          order_index?: number;
          is_active?: boolean;
        };
      };
      question_options: {
        Row: {
          id: string;
          question_id: string;
          option_text: string;
          is_correct: boolean;
          order_index: number;
          correct_order_position: number | null;
        };
        Insert: {
          id?: string;
          question_id: string;
          option_text: string;
          is_correct?: boolean;
          order_index?: number;
          correct_order_position?: number | null;
        };
        Update: {
          question_id?: string;
          option_text?: string;
          is_correct?: boolean;
          order_index?: number;
          correct_order_position?: number | null;
        };
      };
      assessments: {
        Row: {
          id: string;
          title: string;
          type: AssessmentType;
          block_id: string | null;
          chapter_id: string | null;
          book_id: string | null;
          passing_score_percentage: number;
          questions_count: number;
          time_limit_minutes: number | null;
          is_published: boolean;
          created_at: string;
        };
        Insert: {
          id?: string;
          title: string;
          type: AssessmentType;
          block_id?: string | null;
          chapter_id?: string | null;
          book_id?: string | null;
          passing_score_percentage?: number;
          questions_count?: number;
          time_limit_minutes?: number | null;
          is_published?: boolean;
          created_at?: string;
        };
        Update: {
          title?: string;
          type?: AssessmentType;
          block_id?: string | null;
          chapter_id?: string | null;
          book_id?: string | null;
          passing_score_percentage?: number;
          questions_count?: number;
          time_limit_minutes?: number | null;
          is_published?: boolean;
        };
      };
      assessment_questions: {
        Row: {
          id: string;
          assessment_id: string;
          question_id: string;
          order_index: number;
        };
        Insert: {
          id?: string;
          assessment_id: string;
          question_id: string;
          order_index?: number;
        };
        Update: {
          order_index?: number;
        };
      };
      assessment_attempts: {
        Row: {
          id: string;
          user_id: string;
          assessment_id: string;
          score: number;
          max_score: number;
          percentage: number;
          passed: boolean;
          status: AttemptStatus;
          started_at: string;
          completed_at: string | null;
        };
        Insert: {
          id?: string;
          user_id: string;
          assessment_id: string;
          score?: number;
          max_score?: number;
          percentage?: number;
          passed?: boolean;
          status?: AttemptStatus;
          started_at?: string;
          completed_at?: string | null;
        };
        Update: {
          score?: number;
          max_score?: number;
          percentage?: number;
          passed?: boolean;
          status?: AttemptStatus;
          completed_at?: string | null;
        };
      };
      assessment_answers: {
        Row: {
          id: string;
          attempt_id: string;
          question_id: string;
          selected_option_id: string | null;
          text_response: string | null;
          order_response: Json | null; // array of option IDs in user chosen order
          is_correct: boolean;
          points_awarded: number;
          feedback: string | null;
          created_at: string;
        };
        Insert: {
          id?: string;
          attempt_id: string;
          question_id: string;
          selected_option_id?: string | null;
          text_response?: string | null;
          order_response?: Json | null;
          is_correct: boolean;
          points_awarded: number;
          feedback?: string | null;
          created_at?: string;
        };
        Update: {
          selected_option_id?: string | null;
          text_response?: string | null;
          order_response?: Json | null;
          is_correct?: boolean;
          points_awarded?: number;
          feedback?: string | null;
        };
      };
      user_block_progress: {
        Row: {
          id: string;
          user_id: string;
          block_id: string;
          reading_completed: boolean;
          quiz_passed: boolean;
          best_score: number;
          attempts_count: number;
          last_studied_at: string;
        };
        Insert: {
          id?: string;
          user_id: string;
          block_id: string;
          reading_completed?: boolean;
          quiz_passed?: boolean;
          best_score?: number;
          attempts_count?: number;
          last_studied_at?: string;
        };
        Update: {
          reading_completed?: boolean;
          quiz_passed?: boolean;
          best_score?: number;
          attempts_count?: number;
          last_studied_at?: string;
        };
      };
      user_chapter_progress: {
        Row: {
          id: string;
          user_id: string;
          chapter_id: string;
          all_blocks_completed: boolean;
          exam_unlocked: boolean;
          exam_passed: boolean;
          best_score: number;
          completed_at: string | null;
        };
        Insert: {
          id?: string;
          user_id: string;
          chapter_id: string;
          all_blocks_completed?: boolean;
          exam_unlocked?: boolean;
          exam_passed?: boolean;
          best_score?: number;
          completed_at?: string | null;
        };
        Update: {
          all_blocks_completed?: boolean;
          exam_unlocked?: boolean;
          exam_passed?: boolean;
          best_score?: number;
          completed_at?: string | null;
        };
      };
      user_book_progress: {
        Row: {
          id: string;
          user_id: string;
          book_id: string;
          completed_chapters_count: number;
          final_exam_unlocked: boolean;
          final_exam_passed: boolean;
          overall_percentage: number;
          updated_at: string;
        };
        Insert: {
          id?: string;
          user_id: string;
          book_id: string;
          completed_chapters_count?: number;
          final_exam_unlocked?: boolean;
          final_exam_passed?: boolean;
          overall_percentage?: number;
          updated_at?: string;
        };
        Update: {
          completed_chapters_count?: number;
          final_exam_unlocked?: boolean;
          final_exam_passed?: boolean;
          overall_percentage?: number;
          updated_at?: string;
        };
      };
    };
    Functions: {
      check_and_unlock_chapter_exam: {
        Args: {
          p_user_id: string;
          p_chapter_id: string;
        };
        Returns: void;
      };
      check_and_unlock_book_final: {
        Args: {
          p_user_id: string;
          p_book_id: string;
        };
        Returns: void;
      };
      get_client_assessment: {
        Args: {
          p_assessment_id: string;
        };
        Returns: Json;
      };
    };
  };
}
