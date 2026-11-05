-- ==============================================================================
-- BIBLIONARIO - MIGRACIÓN 001: ESQUEMA INICIAL DE BASE DE DATOS
-- ==============================================================================

-- 1. Extensiones
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- 2. Tipos y Enums
DO $$ BEGIN
    CREATE TYPE question_type AS ENUM (
        'multiple_choice',
        'fill_blank',
        'reference_identification',
        'true_false',
        'order_events'
    );
EXCEPTION
    WHEN duplicate_object THEN null;
END $$;

DO $$ BEGIN
    CREATE TYPE question_difficulty AS ENUM ('easy', 'medium', 'hard');
EXCEPTION
    WHEN duplicate_object THEN null;
END $$;

DO $$ BEGIN
    CREATE TYPE assessment_type AS ENUM ('block_quiz', 'chapter_exam', 'book_final');
EXCEPTION
    WHEN duplicate_object THEN null;
END $$;

DO $$ BEGIN
    CREATE TYPE attempt_status AS ENUM ('in_progress', 'completed', 'abandoned');
EXCEPTION
    WHEN duplicate_object THEN null;
END $$;

DO $$ BEGIN
    CREATE TYPE testament_type AS ENUM ('antiguo', 'nuevo');
EXCEPTION
    WHEN duplicate_object THEN null;
END $$;

-- 3. Tabla: profiles (extensión de auth.users)
CREATE TABLE IF NOT EXISTS public.profiles (
    id UUID PRIMARY KEY REFERENCES auth.users(id) ON DELETE CASCADE,
    email TEXT NOT NULL,
    full_name TEXT,
    avatar_url TEXT,
    created_at TIMESTAMPTZ NOT NULL DEFAULT timezone('utc'::text, now()),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT timezone('utc'::text, now())
);

-- 4. Tabla: user_roles
CREATE TABLE IF NOT EXISTS public.user_roles (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id UUID NOT NULL REFERENCES public.profiles(id) ON DELETE CASCADE,
    role TEXT NOT NULL CHECK (role IN ('admin', 'participant')),
    created_at TIMESTAMPTZ NOT NULL DEFAULT timezone('utc'::text, now()),
    CONSTRAINT uq_user_role UNIQUE (user_id, role)
);

-- 5. Tabla: books
CREATE TABLE IF NOT EXISTS public.books (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    slug TEXT UNIQUE NOT NULL,
    name TEXT NOT NULL,
    testament testament_type NOT NULL DEFAULT 'nuevo',
    description TEXT,
    chapters_count INT NOT NULL DEFAULT 1,
    order_index INT NOT NULL DEFAULT 1,
    is_published BOOLEAN NOT NULL DEFAULT true,
    created_at TIMESTAMPTZ NOT NULL DEFAULT timezone('utc'::text, now())
);

-- 6. Tabla: chapters
CREATE TABLE IF NOT EXISTS public.chapters (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    book_id UUID NOT NULL REFERENCES public.books(id) ON DELETE CASCADE,
    chapter_number INT NOT NULL,
    title TEXT NOT NULL,
    summary TEXT,
    is_published BOOLEAN NOT NULL DEFAULT true,
    created_at TIMESTAMPTZ NOT NULL DEFAULT timezone('utc'::text, now()),
    CONSTRAINT uq_book_chapter UNIQUE (book_id, chapter_number)
);

-- 7. Tabla: study_blocks
CREATE TABLE IF NOT EXISTS public.study_blocks (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    chapter_id UUID NOT NULL REFERENCES public.chapters(id) ON DELETE CASCADE,
    block_number INT NOT NULL,
    title TEXT NOT NULL,
    verse_range TEXT NOT NULL,
    estimated_minutes INT NOT NULL DEFAULT 10,
    order_index INT NOT NULL DEFAULT 1,
    created_at TIMESTAMPTZ NOT NULL DEFAULT timezone('utc'::text, now()),
    CONSTRAINT uq_chapter_block UNIQUE (chapter_id, block_number)
);

-- 8. Tabla: block_explanations
CREATE TABLE IF NOT EXISTS public.block_explanations (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    block_id UUID NOT NULL UNIQUE REFERENCES public.study_blocks(id) ON DELETE CASCADE,
    introduction TEXT NOT NULL,
    biblical_passage_rvr1960 TEXT NOT NULL,
    passage_explanation TEXT NOT NULL,
    key_concepts JSONB NOT NULL DEFAULT '[]'::jsonb,
    central_ideas JSONB NOT NULL DEFAULT '[]'::jsonb,
    key_phrases JSONB NOT NULL DEFAULT '[]'::jsonb,
    reading_instruction TEXT NOT NULL DEFAULT 'Lee los versículos correspondientes directamente en tu Biblia Reina-Valera 1960. Cuando termines, marca el bloque como leído para comenzar la evaluación.',
    created_at TIMESTAMPTZ NOT NULL DEFAULT timezone('utc'::text, now()),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT timezone('utc'::text, now())
);

-- 9. Tabla: questions
CREATE TABLE IF NOT EXISTS public.questions (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    block_id UUID REFERENCES public.study_blocks(id) ON DELETE CASCADE,
    chapter_id UUID REFERENCES public.chapters(id) ON DELETE CASCADE,
    question_type question_type NOT NULL,
    prompt TEXT NOT NULL,
    verse_reference TEXT NOT NULL,
    explanation TEXT NOT NULL,
    points INT NOT NULL DEFAULT 10,
    difficulty question_difficulty NOT NULL DEFAULT 'medium',
    order_index INT NOT NULL DEFAULT 1,
    is_active BOOLEAN NOT NULL DEFAULT true,
    created_at TIMESTAMPTZ NOT NULL DEFAULT timezone('utc'::text, now())
);

-- 10. Tabla: question_options
CREATE TABLE IF NOT EXISTS public.question_options (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    question_id UUID NOT NULL REFERENCES public.questions(id) ON DELETE CASCADE,
    option_text TEXT NOT NULL,
    is_correct BOOLEAN NOT NULL DEFAULT false,
    order_index INT NOT NULL DEFAULT 1,
    correct_order_position INT DEFAULT NULL
);

-- 11. Tabla: assessments
CREATE TABLE IF NOT EXISTS public.assessments (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    title TEXT NOT NULL,
    type assessment_type NOT NULL,
    block_id UUID REFERENCES public.study_blocks(id) ON DELETE CASCADE,
    chapter_id UUID REFERENCES public.chapters(id) ON DELETE CASCADE,
    book_id UUID REFERENCES public.books(id) ON DELETE CASCADE,
    passing_score_percentage INT NOT NULL DEFAULT 70,
    questions_count INT NOT NULL DEFAULT 10,
    time_limit_minutes INT DEFAULT NULL,
    is_published BOOLEAN NOT NULL DEFAULT true,
    created_at TIMESTAMPTZ NOT NULL DEFAULT timezone('utc'::text, now()),
    CONSTRAINT uq_assessment_block UNIQUE (block_id, type)
);

CREATE UNIQUE INDEX IF NOT EXISTS uq_chapter_exam ON public.assessments (chapter_id) WHERE type = 'chapter_exam';
CREATE UNIQUE INDEX IF NOT EXISTS uq_book_final ON public.assessments (book_id) WHERE type = 'book_final';

-- 12. Tabla: assessment_questions (asociación entre examen y preguntas)
CREATE TABLE IF NOT EXISTS public.assessment_questions (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    assessment_id UUID NOT NULL REFERENCES public.assessments(id) ON DELETE CASCADE,
    question_id UUID NOT NULL REFERENCES public.questions(id) ON DELETE CASCADE,
    order_index INT NOT NULL DEFAULT 1,
    CONSTRAINT uq_assessment_question UNIQUE (assessment_id, question_id)
);

-- 13. Tabla: assessment_attempts (historial de intentos)
CREATE TABLE IF NOT EXISTS public.assessment_attempts (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id UUID NOT NULL REFERENCES public.profiles(id) ON DELETE CASCADE,
    assessment_id UUID NOT NULL REFERENCES public.assessments(id) ON DELETE CASCADE,
    score NUMERIC(6,2) NOT NULL DEFAULT 0,
    max_score NUMERIC(6,2) NOT NULL DEFAULT 0,
    percentage NUMERIC(5,2) NOT NULL DEFAULT 0,
    passed BOOLEAN NOT NULL DEFAULT false,
    status attempt_status NOT NULL DEFAULT 'in_progress',
    started_at TIMESTAMPTZ NOT NULL DEFAULT timezone('utc'::text, now()),
    completed_at TIMESTAMPTZ DEFAULT NULL
);

-- 14. Tabla: assessment_answers (detalle de cada respuesta respondida)
CREATE TABLE IF NOT EXISTS public.assessment_answers (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    attempt_id UUID NOT NULL REFERENCES public.assessment_attempts(id) ON DELETE CASCADE,
    question_id UUID NOT NULL REFERENCES public.questions(id) ON DELETE CASCADE,
    selected_option_id UUID REFERENCES public.question_options(id) ON DELETE SET NULL,
    text_response TEXT DEFAULT NULL,
    order_response JSONB DEFAULT NULL,
    is_correct BOOLEAN NOT NULL DEFAULT false,
    points_awarded NUMERIC(6,2) NOT NULL DEFAULT 0,
    feedback TEXT DEFAULT NULL,
    created_at TIMESTAMPTZ NOT NULL DEFAULT timezone('utc'::text, now())
);

-- 15. Tabla: user_block_progress
CREATE TABLE IF NOT EXISTS public.user_block_progress (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id UUID NOT NULL REFERENCES public.profiles(id) ON DELETE CASCADE,
    block_id UUID NOT NULL REFERENCES public.study_blocks(id) ON DELETE CASCADE,
    reading_completed BOOLEAN NOT NULL DEFAULT false,
    quiz_passed BOOLEAN NOT NULL DEFAULT false,
    best_score NUMERIC(5,2) NOT NULL DEFAULT 0,
    attempts_count INT NOT NULL DEFAULT 0,
    last_studied_at TIMESTAMPTZ NOT NULL DEFAULT timezone('utc'::text, now()),
    CONSTRAINT uq_user_block UNIQUE (user_id, block_id)
);

-- 16. Tabla: user_chapter_progress
CREATE TABLE IF NOT EXISTS public.user_chapter_progress (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id UUID NOT NULL REFERENCES public.profiles(id) ON DELETE CASCADE,
    chapter_id UUID NOT NULL REFERENCES public.chapters(id) ON DELETE CASCADE,
    all_blocks_completed BOOLEAN NOT NULL DEFAULT false,
    exam_unlocked BOOLEAN NOT NULL DEFAULT false,
    exam_passed BOOLEAN NOT NULL DEFAULT false,
    best_score NUMERIC(5,2) NOT NULL DEFAULT 0,
    completed_at TIMESTAMPTZ DEFAULT NULL,
    CONSTRAINT uq_user_chapter UNIQUE (user_id, chapter_id)
);

-- 17. Tabla: user_book_progress
CREATE TABLE IF NOT EXISTS public.user_book_progress (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id UUID NOT NULL REFERENCES public.profiles(id) ON DELETE CASCADE,
    book_id UUID NOT NULL REFERENCES public.books(id) ON DELETE CASCADE,
    completed_chapters_count INT NOT NULL DEFAULT 0,
    final_exam_unlocked BOOLEAN NOT NULL DEFAULT false,
    final_exam_passed BOOLEAN NOT NULL DEFAULT false,
    overall_percentage NUMERIC(5,2) NOT NULL DEFAULT 0,
    updated_at TIMESTAMPTZ NOT NULL DEFAULT timezone('utc'::text, now()),
    CONSTRAINT uq_user_book UNIQUE (user_id, book_id)
);

-- 18. Índices de rendimiento
CREATE INDEX IF NOT EXISTS idx_chapters_book_id ON public.chapters(book_id);
CREATE INDEX IF NOT EXISTS idx_study_blocks_chapter_id ON public.study_blocks(chapter_id);
CREATE INDEX IF NOT EXISTS idx_questions_block_id ON public.questions(block_id);
CREATE INDEX IF NOT EXISTS idx_questions_chapter_id ON public.questions(chapter_id);
CREATE INDEX IF NOT EXISTS idx_question_options_question_id ON public.question_options(question_id);
CREATE INDEX IF NOT EXISTS idx_assessment_questions_assessment_id ON public.assessment_questions(assessment_id);
CREATE INDEX IF NOT EXISTS idx_assessment_attempts_user_id ON public.assessment_attempts(user_id);
CREATE INDEX IF NOT EXISTS idx_assessment_attempts_assessment_id ON public.assessment_attempts(assessment_id);
CREATE INDEX IF NOT EXISTS idx_assessment_answers_attempt_id ON public.assessment_answers(attempt_id);
CREATE INDEX IF NOT EXISTS idx_user_block_progress_user_id ON public.user_block_progress(user_id);
CREATE INDEX IF NOT EXISTS idx_user_chapter_progress_user_id ON public.user_chapter_progress(user_id);
CREATE INDEX IF NOT EXISTS idx_user_book_progress_user_id ON public.user_book_progress(user_id);

