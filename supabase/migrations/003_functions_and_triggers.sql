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

