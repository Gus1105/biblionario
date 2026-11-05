-- ==============================================================================
-- BIBLIONARIO - MASTER MIGRATION (ESQUEMA, RLS Y FUNCIONES/TRIGGERS)
-- ==============================================================================



-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
-- ARCHIVO: 001_initial_schema.sql
-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

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



-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
-- ARCHIVO: 002_rls_policies.sql
-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

-- ==============================================================================
-- BIBLIONARIO - MIGRACIÓN 002: POLÍTICAS DE SEGURIDAD (RLS)
-- ==============================================================================

-- 1. Habilitar RLS en todas las tablas
ALTER TABLE public.profiles ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.user_roles ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.books ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.chapters ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.study_blocks ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.block_explanations ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.questions ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.question_options ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.assessments ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.assessment_questions ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.assessment_attempts ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.assessment_answers ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.user_block_progress ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.user_chapter_progress ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.user_book_progress ENABLE ROW LEVEL SECURITY;

-- 2. Funciones de verificación de rol administrador
CREATE OR REPLACE FUNCTION public.is_admin(user_uuid UUID)
RETURNS BOOLEAN
LANGUAGE sql
SECURITY DEFINER
SET search_path = public
STABLE
AS $$
    SELECT EXISTS (
        SELECT 1
        FROM public.user_roles
        WHERE user_id = user_uuid AND role = 'admin'
    );
$$;

CREATE OR REPLACE FUNCTION public.is_current_user_admin()
RETURNS BOOLEAN
LANGUAGE sql
SECURITY DEFINER
SET search_path = public
STABLE
AS $$
    SELECT public.is_admin(auth.uid());
$$;

-- ------------------------------------------------------------------------------
-- 3. Políticas para PROFILES
-- ------------------------------------------------------------------------------
CREATE POLICY "Los usuarios pueden ver su propio perfil o los administradores pueden ver todos"
    ON public.profiles FOR SELECT
    USING (auth.uid() = id OR public.is_current_user_admin());

CREATE POLICY "Los usuarios pueden actualizar su propio perfil"
    ON public.profiles FOR UPDATE
    USING (auth.uid() = id)
    WITH CHECK (auth.uid() = id);

-- ------------------------------------------------------------------------------
-- 4. Políticas para USER_ROLES
-- ------------------------------------------------------------------------------
CREATE POLICY "Los usuarios pueden ver su propio rol"
    ON public.user_roles FOR SELECT
    USING (auth.uid() = user_id OR public.is_current_user_admin());

CREATE POLICY "Solo administradores pueden gestionar roles"
    ON public.user_roles FOR ALL
    USING (public.is_current_user_admin());

-- ------------------------------------------------------------------------------
-- 5. Políticas para CONTENIDO EDUCATIVO (Books, Chapters, Blocks, Explanations, Assessments)
-- Lectura pública para contenido publicado; gestión total para administradores.
-- ------------------------------------------------------------------------------

-- BOOKS
CREATE POLICY "Lectura pública de libros publicados"
    ON public.books FOR SELECT
    USING (is_published = true OR public.is_current_user_admin());

CREATE POLICY "Administradores pueden gestionar libros"
    ON public.books FOR ALL
    USING (public.is_current_user_admin());

-- CHAPTERS
CREATE POLICY "Lectura de capítulos publicados"
    ON public.chapters FOR SELECT
    USING (is_published = true OR public.is_current_user_admin());

CREATE POLICY "Administradores pueden gestionar capítulos"
    ON public.chapters FOR ALL
    USING (public.is_current_user_admin());

-- STUDY_BLOCKS
CREATE POLICY "Lectura de bloques de estudio"
    ON public.study_blocks FOR SELECT
    USING (true);

CREATE POLICY "Administradores pueden gestionar bloques de estudio"
    ON public.study_blocks FOR ALL
    USING (public.is_current_user_admin());

-- BLOCK_EXPLANATIONS
CREATE POLICY "Lectura de explicaciones de bloques"
    ON public.block_explanations FOR SELECT
    USING (true);

CREATE POLICY "Administradores pueden gestionar explicaciones"
    ON public.block_explanations FOR ALL
    USING (public.is_current_user_admin());

-- ASSESSMENTS
CREATE POLICY "Lectura de evaluaciones publicadas"
    ON public.assessments FOR SELECT
    USING (is_published = true OR public.is_current_user_admin());

CREATE POLICY "Administradores pueden gestionar evaluaciones"
    ON public.assessments FOR ALL
    USING (public.is_current_user_admin());

-- ASSESSMENT_QUESTIONS
CREATE POLICY "Lectura de preguntas asociadas a evaluaciones"
    ON public.assessment_questions FOR SELECT
    USING (true);

CREATE POLICY "Administradores pueden gestionar preguntas de evaluaciones"
    ON public.assessment_questions FOR ALL
    USING (public.is_current_user_admin());

-- ------------------------------------------------------------------------------
-- 6. Políticas de SEGURIDAD para QUESTIONS y QUESTION_OPTIONS
-- Evitar que los participantes lean directamente 'is_correct' o 'explanation'.
-- La consulta para estudiantes se realiza a través de Server Actions con createAdminClient
-- que proyecta solo los campos necesarios, o a través de vistas seguras.
-- ------------------------------------------------------------------------------
CREATE POLICY "Solo administradores pueden leer questions directamente"
    ON public.questions FOR SELECT
    USING (public.is_current_user_admin());

CREATE POLICY "Solo administradores pueden gestionar questions"
    ON public.questions FOR ALL
    USING (public.is_current_user_admin());

CREATE POLICY "Solo administradores pueden leer question_options directamente"
    ON public.question_options FOR SELECT
    USING (public.is_current_user_admin());

CREATE POLICY "Solo administradores pueden gestionar question_options"
    ON public.question_options FOR ALL
    USING (public.is_current_user_admin());

-- ------------------------------------------------------------------------------
-- 7. Políticas para ASSESSMENT_ATTEMPTS
-- ------------------------------------------------------------------------------
CREATE POLICY "Los participantes pueden ver sus propios intentos"
    ON public.assessment_attempts FOR SELECT
    USING (auth.uid() = user_id OR public.is_current_user_admin());

CREATE POLICY "Los participantes pueden crear sus propios intentos"
    ON public.assessment_attempts FOR INSERT
    WITH CHECK (auth.uid() = user_id);

CREATE POLICY "Los participantes pueden actualizar sus intentos en curso"
    ON public.assessment_attempts FOR UPDATE
    USING (auth.uid() = user_id OR public.is_current_user_admin());

-- ------------------------------------------------------------------------------
-- 8. Políticas para ASSESSMENT_ANSWERS
-- ------------------------------------------------------------------------------
CREATE POLICY "Los participantes pueden ver las respuestas de sus propios intentos"
    ON public.assessment_answers FOR SELECT
    USING (
        EXISTS (
            SELECT 1 FROM public.assessment_attempts a
            WHERE a.id = attempt_id AND (a.user_id = auth.uid() OR public.is_current_user_admin())
        )
    );

CREATE POLICY "Los participantes pueden insertar respuestas en sus intentos"
    ON public.assessment_answers FOR INSERT
    WITH CHECK (
        EXISTS (
            SELECT 1 FROM public.assessment_attempts a
            WHERE a.id = attempt_id AND a.user_id = auth.uid()
        )
    );

-- ------------------------------------------------------------------------------
-- 9. Políticas para TABLAS DE PROGRESO
-- ------------------------------------------------------------------------------
-- USER_BLOCK_PROGRESS
CREATE POLICY "Progreso de bloque propio"
    ON public.user_block_progress FOR SELECT
    USING (auth.uid() = user_id OR public.is_current_user_admin());

CREATE POLICY "Actualizar progreso de bloque propio"
    ON public.user_block_progress FOR ALL
    USING (auth.uid() = user_id OR public.is_current_user_admin())
    WITH CHECK (auth.uid() = user_id);

-- USER_CHAPTER_PROGRESS
CREATE POLICY "Progreso de capitulo propio"
    ON public.user_chapter_progress FOR SELECT
    USING (auth.uid() = user_id OR public.is_current_user_admin());

CREATE POLICY "Actualizar progreso de capitulo propio"
    ON public.user_chapter_progress FOR ALL
    USING (auth.uid() = user_id OR public.is_current_user_admin())
    WITH CHECK (auth.uid() = user_id);

-- USER_BOOK_PROGRESS
CREATE POLICY "Progreso de libro propio"
    ON public.user_book_progress FOR SELECT
    USING (auth.uid() = user_id OR public.is_current_user_admin());

CREATE POLICY "Actualizar progreso de libro propio"
    ON public.user_book_progress FOR ALL
    USING (auth.uid() = user_id OR public.is_current_user_admin())
    WITH CHECK (auth.uid() = user_id);



-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
-- ARCHIVO: 003_functions_and_triggers.sql
-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

-- ==============================================================================
-- BIBLIONARIO - MIGRACIÓN 003: FUNCIONES, TRIGGERS Y RPC
-- ==============================================================================

-- 1. Trigger para creación automática de perfil al registrarse en auth.users
CREATE OR REPLACE FUNCTION public.handle_new_user()
RETURNS TRIGGER
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = public
AS $$
BEGIN
    INSERT INTO public.profiles (id, email, full_name, avatar_url)
    VALUES (
        NEW.id,
        NEW.email,
        COALESCE(NEW.raw_user_meta_data->>'full_name', split_part(NEW.email, '@', 1)),
        NEW.raw_user_meta_data->>'avatar_url'
    );

    -- Asignar rol de participante por defecto
    INSERT INTO public.user_roles (user_id, role)
    VALUES (NEW.id, 'participant')
    ON CONFLICT (user_id, role) DO NOTHING;

    RETURN NEW;
END;
$$;

DROP TRIGGER IF EXISTS on_auth_user_created ON auth.users;
CREATE TRIGGER on_auth_user_created
    AFTER INSERT ON auth.users
    FOR EACH ROW EXECUTE FUNCTION public.handle_new_user();

-- ------------------------------------------------------------------------------
-- 2. Función para desbloquear automáticamente el Examen de Capítulo
--    cuando todos los bloques del capítulo han sido leídos y aprobados.
-- ------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION public.check_and_unlock_chapter_exam(
    p_user_id UUID,
    p_chapter_id UUID
)
RETURNS VOID
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = public
AS $$
DECLARE
    v_total_blocks INT;
    v_completed_blocks INT;
    v_avg_score NUMERIC;
BEGIN
    -- Contar bloques totales del capítulo
    SELECT COUNT(*) INTO v_total_blocks
    FROM public.study_blocks
    WHERE chapter_id = p_chapter_id;

    -- Contar bloques completados (leídos y quiz aprobado) por el usuario
    SELECT COUNT(*), COALESCE(AVG(ubp.best_score), 0)
    INTO v_completed_blocks, v_avg_score
    FROM public.user_block_progress ubp
    JOIN public.study_blocks sb ON sb.id = ubp.block_id
    WHERE sb.chapter_id = p_chapter_id
      AND ubp.user_id = p_user_id
      AND ubp.reading_completed = true
      AND ubp.quiz_passed = true;

    -- Si todos los bloques están completados, desbloquear el examen del capítulo
    IF v_total_blocks > 0 AND v_completed_blocks = v_total_blocks THEN
        INSERT INTO public.user_chapter_progress (
            user_id,
            chapter_id,
            all_blocks_completed,
            exam_unlocked,
            best_score
        )
        VALUES (
            p_user_id,
            p_chapter_id,
            true,
            true,
            v_avg_score
        )
        ON CONFLICT (user_id, chapter_id)
        DO UPDATE SET
            all_blocks_completed = true,
            exam_unlocked = true;
    ELSE
        INSERT INTO public.user_chapter_progress (
            user_id,
            chapter_id,
            all_blocks_completed,
            exam_unlocked,
            best_score
        )
        VALUES (
            p_user_id,
            p_chapter_id,
            false,
            false,
            v_avg_score
        )
        ON CONFLICT (user_id, chapter_id)
        DO UPDATE SET
            all_blocks_completed = false;
    END IF;
END;
$$;

-- ------------------------------------------------------------------------------
-- 3. Función para verificar y desbloquear el Examen Final del Libro
--    cuando todos los capítulos han sido aprobados.
-- ------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION public.check_and_unlock_book_final(
    p_user_id UUID,
    p_book_id UUID
)
RETURNS VOID
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = public
AS $$
DECLARE
    v_total_chapters INT;
    v_passed_chapters INT;
    v_overall_avg NUMERIC;
BEGIN
    -- Contar capítulos totales del libro
    SELECT COUNT(*) INTO v_total_chapters
    FROM public.chapters
    WHERE book_id = p_book_id AND is_published = true;

    -- Contar capítulos con examen aprobado
    SELECT COUNT(*), COALESCE(AVG(ucp.best_score), 0)
    INTO v_passed_chapters, v_overall_avg
    FROM public.user_chapter_progress ucp
    JOIN public.chapters c ON c.id = ucp.chapter_id
    WHERE c.book_id = p_book_id
      AND ucp.user_id = p_user_id
      AND ucp.exam_passed = true;

    IF v_total_chapters > 0 AND v_passed_chapters = v_total_chapters THEN
        INSERT INTO public.user_book_progress (
            user_id,
            book_id,
            completed_chapters_count,
            final_exam_unlocked,
            overall_percentage
        )
        VALUES (
            p_user_id,
            p_book_id,
            v_passed_chapters,
            true,
            v_overall_avg
        )
        ON CONFLICT (user_id, book_id)
        DO UPDATE SET
            completed_chapters_count = v_passed_chapters,
            final_exam_unlocked = true,
            overall_percentage = v_overall_avg,
            updated_at = timezone('utc'::text, now());
    ELSE
        INSERT INTO public.user_book_progress (
            user_id,
            book_id,
            completed_chapters_count,
            final_exam_unlocked,
            overall_percentage
        )
        VALUES (
            p_user_id,
            p_book_id,
            v_passed_chapters,
            false,
            v_overall_avg
        )
        ON CONFLICT (user_id, book_id)
        DO UPDATE SET
            completed_chapters_count = v_passed_chapters,
            overall_percentage = v_overall_avg,
            updated_at = timezone('utc'::text, now());
    END IF;
END;
$$;

-- ------------------------------------------------------------------------------
-- 4. RPC Seguro para obtener preguntas de una evaluación sin exponer respuestas
-- ------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION public.get_client_assessment(p_assessment_id UUID)
RETURNS JSONB
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = public
AS $$
DECLARE
    v_assessment JSONB;
BEGIN
    SELECT jsonb_build_object(
        'id', a.id,
        'title', a.title,
        'type', a.type,
        'passing_score_percentage', a.passing_score_percentage,
        'questions_count', a.questions_count,
        'time_limit_minutes', a.time_limit_minutes,
        'block_id', a.block_id,
        'chapter_id', a.chapter_id,
        'book_id', a.book_id,
        'questions', (
            SELECT jsonb_agg(
                jsonb_build_object(
                    'id', q.id,
                    'question_type', q.question_type,
                    'prompt', q.prompt,
                    'verse_reference', q.verse_reference,
                    'points', q.points,
                    'difficulty', q.difficulty,
                    'order_index', aq.order_index,
                    'options', (
                        SELECT jsonb_agg(
                            jsonb_build_object(
                                'id', qo.id,
                                'option_text', qo.option_text,
                                'order_index', qo.order_index
                            ) ORDER BY qo.order_index
                        )
                        FROM public.question_options qo
                        WHERE qo.question_id = q.id
                    )
                ) ORDER BY aq.order_index
            )
            FROM public.assessment_questions aq
            JOIN public.questions q ON q.id = aq.question_id
            WHERE aq.assessment_id = a.id AND q.is_active = true
        )
    )
    INTO v_assessment
    FROM public.assessments a
    WHERE a.id = p_assessment_id;

    RETURN v_assessment;
END;
$$;

