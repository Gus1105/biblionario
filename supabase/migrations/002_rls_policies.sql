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

