-- ==============================================================================
-- BIBLIONARIO - SEED 000: ESTRUCTURA DEL LIBRO DE EFESIOS Y SUS 6 CAPÍTULOS
-- ==============================================================================

-- 1. Insertar Libro de Efesios
INSERT INTO public.books (id, slug, name, testament, description, chapters_count, order_index, is_published)
VALUES (
    'a0000000-0000-0000-0000-000000000001',
    'efesios',
    'Efesios',
    'nuevo',
    'La epístola del apóstol Pablo a los efesios expone las riquezas insondables de la gracia de Dios, la salvación por medio de la fe, la unión de judíos y gentiles en un solo cuerpo que es la Iglesia, y las instrucciones prácticas para el andar diario, el matrimonio y la armadura espiritual.',
    6,
    1,
    true
)
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    chapters_count = EXCLUDED.chapters_count;

-- 2. Insertar los 6 Capítulos
INSERT INTO public.chapters (id, book_id, chapter_number, title, summary, is_published)
VALUES
(
    'c0000000-0000-0000-0000-000000000001',
    'a0000000-0000-0000-0000-000000000001',
    1,
    'Las Bendiciones Espirituales en Cristo y la Supremacía del Hijo',
    'Pablo alaba a Dios por bendecirnos con toda bendición espiritual en lugares celestiales, la elección en Cristo antes de la fundación del mundo, la redención por su sangre, el sello del Espíritu Santo de la promesa y ora por espíritu de sabiduría y revelación.',
    true
),
(
    'c0000000-0000-0000-0000-000000000002',
    'a0000000-0000-0000-0000-000000000001',
    2,
    'De Muerte a Vida: Salvos por Gracia y la Reconciliación en la Cruz',
    'De estar muertos en delitos y pecados, Dios por su gran amor nos dio vida juntamente con Cristo: salvos por gracia por medio de la fe, para buenas obras. Cristo derriba la pared intermedia de separación reconciliando a ambos en un solo cuerpo.',
    true
),
(
    'c0000000-0000-0000-0000-000000000003',
    'a0000000-0000-0000-0000-000000000001',
    3,
    'El Misterio de Cristo y la Sabiduría Multiforme de Dios',
    'El misterio que en otras generaciones no se dio a conocer: que los gentiles son coherederos y miembros del mismo cuerpo. La multiforme sabiduría de Dios dada a conocer por medio de la iglesia y la oración por poder y amor.',
    true
),
(
    'c0000000-0000-0000-0000-000000000004',
    'a0000000-0000-0000-0000-000000000001',
    4,
    'La Unidad del Espíritu, los Ministerios y el Nuevo Hombre',
    'Andar como es digno de la vocación con toda humildad. Un cuerpo, un Espíritu, un Señor, una fe, un bautismo. Los dones ministeriales para perfeccionar a los santos. Despojarse del viejo hombre y vestirse del nuevo creado según Dios.',
    true
),
(
    'c0000000-0000-0000-0000-000000000005',
    'a0000000-0000-0000-0000-000000000001',
    5,
    'Andar en Amor, como Hijos de Luz y el Matrimonio Cristiano',
    'Sed imitadores de Dios como hijos amados. Andad como hijos de luz comprobando lo que es agradable al Señor. No embriagarse con vino sino ser llenos del Espíritu. El matrimonio como figura sagrada de Cristo y la Iglesia.',
    true
),
(
    'c0000000-0000-0000-0000-000000000006',
    'a0000000-0000-0000-0000-000000000001',
    6,
    'Relaciones Familiares, la Armadura de Dios y la Oración Constante',
    'Deberes de hijos, padres, siervos y amos. Fortaleceos en el Señor y en el poder de su fuerza. Vestíos de toda la armadura de Dios (cinturón de la verdad, coraza de justicia, calzado del evangelio, escudo de la fe, yelmo de salvación, espada del Espíritu) y orad en todo tiempo.',
    true
)
ON CONFLICT (book_id, chapter_number) DO UPDATE SET
    title = EXCLUDED.title,
    summary = EXCLUDED.summary;

-- 3. Insertar los 22 Bloques de Estudio
INSERT INTO public.study_blocks (id, chapter_id, block_number, title, verse_range, estimated_minutes, order_index)
VALUES
-- Efesios 1
('b0000001-0001-0000-0000-000000000001', 'c0000000-0000-0000-0000-000000000001', 1, 'Saludo Apostólico y Destinatarios', '1:1-2', 8, 1),
('b0000001-0002-0000-0000-000000000002', 'c0000000-0000-0000-0000-000000000001', 2, 'Las Bendiciones Espirituales y la Elección Eterna', '1:3-6', 12, 2),
('b0000001-0003-0000-0000-000000000003', 'c0000000-0000-0000-0000-000000000001', 3, 'Redención por su Sangre y el Sello del Espíritu', '1:7-14', 15, 3),
('b0000001-0004-0000-0000-000000000004', 'c0000000-0000-0000-0000-000000000001', 4, 'La Oración de Pablo y la Supremacía de Cristo', '1:15-23', 15, 4),

-- Efesios 2
('b0000002-0001-0000-0000-000000000001', 'c0000000-0000-0000-0000-000000000002', 1, 'De Muerte a Vida: Salvos por Gracia mediante la Fe', '2:1-10', 15, 5),
('b0000002-0002-0000-0000-000000000002', 'c0000000-0000-0000-0000-000000000002', 2, 'Cercanos por la Sangre de Cristo', '2:11-13', 10, 6),
('b0000002-0003-0000-0000-000000000003', 'c0000000-0000-0000-0000-000000000002', 3, 'Cristo Nuestra Paz y la Reconciliación en la Cruz', '2:14-18', 12, 7),
('b0000002-0004-0000-0000-000000000004', 'c0000000-0000-0000-0000-000000000002', 4, 'Miembros de la Familia de Dios y Templo Santo', '2:19-22', 10, 8),

-- Efesios 3
('b0000003-0001-0000-0000-000000000001', 'c0000000-0000-0000-0000-000000000003', 1, 'El Misterio Revelado y la Comisión de Pablo', '3:1-13', 15, 9),
('b0000003-0002-0000-0000-000000000002', 'c0000000-0000-0000-0000-000000000003', 2, 'Oración por Fortaleza Espiritual y la Plenitud de Dios', '3:14-21', 12, 10),

-- Efesios 4
('b0000004-0001-0000-0000-000000000001', 'c0000000-0000-0000-0000-000000000004', 1, 'La Unidad del Espíritu en el Vínculo de la Paz', '4:1-6', 10, 11),
('b0000004-0002-0000-0000-000000000002', 'c0000000-0000-0000-0000-000000000004', 2, 'Dones Ministeriales y la Madurez del Cuerpo', '4:7-16', 15, 12),
('b0000004-0003-0000-0000-000000000003', 'c0000000-0000-0000-0000-000000000004', 3, 'El Despojo del Viejo Hombre y el Nuevo Hombre', '4:17-24', 12, 13),
('b0000004-0004-0000-0000-000000000004', 'c0000000-0000-0000-0000-000000000004', 4, 'Normas Prácticas para la Vida Renacida', '4:25-32', 12, 14),

-- Efesios 5
('b0000005-0001-0000-0000-000000000001', 'c0000000-0000-0000-0000-000000000005', 1, 'Andar en Amor como Imitadores de Dios', '5:1-7', 10, 15),
('b0000005-0002-0000-0000-000000000002', 'c0000000-0000-0000-0000-000000000005', 2, 'Andar como Hijos de Luz', '5:8-14', 10, 16),
('b0000005-0003-0000-0000-000000000003', 'c0000000-0000-0000-0000-000000000005', 3, 'Andar en Sabiduría y la Llenura del Espíritu', '5:15-21', 12, 17),
('b0000005-0004-0000-0000-000000000004', 'c0000000-0000-0000-0000-000000000005', 4, 'El Matrimonio Cristiano y el Misterio de Cristo y la Iglesia', '5:22-33', 15, 18),

-- Efesios 6
('b0000006-0001-0000-0000-000000000001', 'c0000000-0000-0000-0000-000000000006', 1, 'Deberes Mutuos: Hijos y Padres', '6:1-4', 8, 19),
('b0000006-0002-0000-0000-000000000002', 'c0000000-0000-0000-0000-000000000006', 2, 'Deberes Mutuos: Siervos y Amos', '6:5-9', 8, 20),
('b0000006-0003-0000-0000-000000000003', 'c0000000-0000-0000-0000-000000000006', 3, 'Toda la Armadura de Dios y la Oración', '6:10-20', 18, 21),
('b0000006-0004-0000-0000-000000000004', 'c0000000-0000-0000-0000-000000000006', 4, 'Mención de Tíquico y Bendición Apostólica', '6:21-24', 6, 22)
ON CONFLICT (chapter_id, block_number) DO UPDATE SET
    title = EXCLUDED.title,
    verse_range = EXCLUDED.verse_range,
    estimated_minutes = EXCLUDED.estimated_minutes,
    order_index = EXCLUDED.order_index;

-- 4. Insertar las Evaluaciones de Bloques (22 evaluaciones)
INSERT INTO public.assessments (id, title, type, block_id, chapter_id, book_id, passing_score_percentage, questions_count)
VALUES
-- Bloques Efesios 1
('e0000001-0001-0000-0000-000000000001', 'Evaluación: Efesios 1:1-2', 'block_quiz', 'b0000001-0001-0000-0000-000000000001', 'c0000000-0000-0000-0000-000000000001', 'a0000000-0000-0000-0000-000000000001', 70, 5),
('e0000001-0002-0000-0000-000000000002', 'Evaluación: Efesios 1:3-6', 'block_quiz', 'b0000001-0002-0000-0000-000000000002', 'c0000000-0000-0000-0000-000000000001', 'a0000000-0000-0000-0000-000000000001', 70, 6),
('e0000001-0003-0000-0000-000000000003', 'Evaluación: Efesios 1:7-14', 'block_quiz', 'b0000001-0003-0000-0000-000000000003', 'c0000000-0000-0000-0000-000000000001', 'a0000000-0000-0000-0000-000000000001', 70, 7),
('e0000001-0004-0000-0000-000000000004', 'Evaluación: Efesios 1:15-23', 'block_quiz', 'b0000001-0004-0000-0000-000000000004', 'c0000000-0000-0000-0000-000000000001', 'a0000000-0000-0000-0000-000000000001', 70, 7),

-- Bloques Efesios 2
('e0000002-0001-0000-0000-000000000001', 'Evaluación: Efesios 2:1-10', 'block_quiz', 'b0000002-0001-0000-0000-000000000001', 'c0000000-0000-0000-0000-000000000002', 'a0000000-0000-0000-0000-000000000001', 70, 7),
('e0000002-0002-0000-0000-000000000002', 'Evaluación: Efesios 2:11-13', 'block_quiz', 'b0000002-0002-0000-0000-000000000002', 'c0000000-0000-0000-0000-000000000002', 'a0000000-0000-0000-0000-000000000001', 70, 6),
('e0000002-0003-0000-0000-000000000003', 'Evaluación: Efesios 2:14-18', 'block_quiz', 'b0000002-0003-0000-0000-000000000002', 'c0000000-0000-0000-0000-000000000002', 'a0000000-0000-0000-0000-000000000001', 70, 6),
('e0000002-0004-0000-0000-000000000004', 'Evaluación: Efesios 2:19-22', 'block_quiz', 'b0000002-0004-0000-0000-000000000002', 'c0000000-0000-0000-0000-000000000002', 'a0000000-0000-0000-0000-000000000001', 70, 6),

-- Bloques Efesios 3
('e0000003-0001-0000-0000-000000000001', 'Evaluación: Efesios 3:1-13', 'block_quiz', 'b0000003-0001-0000-0000-000000000003', 'c0000000-0000-0000-0000-000000000003', 'a0000000-0000-0000-0000-000000000001', 70, 7),
('e0000003-0002-0000-0000-000000000002', 'Evaluación: Efesios 3:14-21', 'block_quiz', 'b0000003-0002-0000-0000-000000000003', 'c0000000-0000-0000-0000-000000000003', 'a0000000-0000-0000-0000-000000000001', 70, 6),

-- Bloques Efesios 4
('e0000004-0001-0000-0000-000000000001', 'Evaluación: Efesios 4:1-6', 'block_quiz', 'b0000004-0001-0000-0000-000000000004', 'c0000000-0000-0000-0000-000000000004', 'a0000000-0000-0000-0000-000000000001', 70, 6),
('e0000004-0002-0000-0000-000000000002', 'Evaluación: Efesios 4:7-16', 'block_quiz', 'b0000004-0002-0000-0000-000000000004', 'c0000000-0000-0000-0000-000000000004', 'a0000000-0000-0000-0000-000000000001', 70, 7),
('e0000004-0003-0000-0000-000000000003', 'Evaluación: Efesios 4:17-24', 'block_quiz', 'b0000004-0003-0000-0000-000000000004', 'c0000000-0000-0000-0000-000000000004', 'a0000000-0000-0000-0000-000000000001', 70, 6),
('e0000004-0004-0000-0000-000000000004', 'Evaluación: Efesios 4:25-32', 'block_quiz', 'b0000004-0004-0000-0000-000000000004', 'c0000000-0000-0000-0000-000000000004', 'a0000000-0000-0000-0000-000000000001', 70, 7),

-- Bloques Efesios 5
('e0000005-0001-0000-0000-000000000001', 'Evaluación: Efesios 5:1-7', 'block_quiz', 'b0000005-0001-0000-0000-000000000005', 'c0000000-0000-0000-0000-000000000005', 'a0000000-0000-0000-0000-000000000001', 70, 6),
('e0000005-0002-0000-0000-000000000002', 'Evaluación: Efesios 5:8-14', 'block_quiz', 'b0000005-0002-0000-0000-000000000005', 'c0000000-0000-0000-0000-000000000005', 'a0000000-0000-0000-0000-000000000001', 70, 6),
('e0000005-0003-0000-0000-000000000003', 'Evaluación: Efesios 5:15-21', 'block_quiz', 'b0000005-0003-0000-0000-000000000005', 'c0000000-0000-0000-0000-000000000005', 'a0000000-0000-0000-0000-000000000001', 70, 6),
('e0000005-0004-0000-0000-000000000004', 'Evaluación: Efesios 5:22-33', 'block_quiz', 'b0000005-0004-0000-0000-000000000005', 'c0000000-0000-0000-0000-000000000005', 'a0000000-0000-0000-0000-000000000001', 70, 7),

-- Bloques Efesios 6
('e0000006-0001-0000-0000-000000000001', 'Evaluación: Efesios 6:1-4', 'block_quiz', 'b0000006-0001-0000-0000-000000000006', 'c0000000-0000-0000-0000-000000000006', 'a0000000-0000-0000-0000-000000000001', 70, 6),
('e0000006-0002-0000-0000-000000000002', 'Evaluación: Efesios 6:5-9', 'block_quiz', 'b0000006-0002-0000-0000-000000000006', 'c0000000-0000-0000-0000-000000000006', 'a0000000-0000-0000-0000-000000000001', 70, 6),
('e0000006-0003-0000-0000-000000000003', 'Evaluación: Efesios 6:10-20', 'block_quiz', 'b0000006-0003-0000-0000-000000000006', 'c0000000-0000-0000-0000-000000000006', 'a0000000-0000-0000-0000-000000000001', 70, 8),
('e0000006-0004-0000-0000-000000000004', 'Evaluación: Efesios 6:21-24', 'block_quiz', 'b0000006-0004-0000-0000-000000000006', 'c0000000-0000-0000-0000-000000000006', 'a0000000-0000-0000-0000-000000000001', 70, 5)
ON CONFLICT (block_id, type) DO NOTHING;

-- 5. Insertar los 6 Exámenes Generales de Capítulo (Nivel 3)
INSERT INTO public.assessments (id, title, type, chapter_id, book_id, passing_score_percentage, questions_count)
VALUES
('a0000001-0000-0000-0000-000000000001', 'Efesios 1 – Examen General', 'chapter_exam', 'c0000000-0000-0000-0000-000000000001', 'a0000000-0000-0000-0000-000000000001', 70, 25),
('a0000002-0000-0000-0000-000000000002', 'Efesios 2 – Examen General', 'chapter_exam', 'c0000000-0000-0000-0000-000000000002', 'a0000000-0000-0000-0000-000000000001', 70, 25),
('a0000003-0000-0000-0000-000000000003', 'Efesios 3 – Examen General', 'chapter_exam', 'c0000000-0000-0000-0000-000000000003', 'a0000000-0000-0000-0000-000000000001', 70, 25),
('a0000004-0000-0000-0000-000000000004', 'Efesios 4 – Examen General', 'chapter_exam', 'c0000000-0000-0000-0000-000000000004', 'a0000000-0000-0000-0000-000000000001', 70, 25),
('a0000005-0000-0000-0000-000000000005', 'Efesios 5 – Examen General', 'chapter_exam', 'c0000000-0000-0000-0000-000000000005', 'a0000000-0000-0000-0000-000000000001', 70, 25),
('a0000006-0000-0000-0000-000000000006', 'Efesios 6 – Examen General', 'chapter_exam', 'c0000000-0000-0000-0000-000000000006', 'a0000000-0000-0000-0000-000000000001', 70, 25)
ON CONFLICT (chapter_id, type) DO NOTHING;

-- 6. Insertar el Examen Final de Efesios (Nivel 4)
INSERT INTO public.assessments (id, title, type, book_id, passing_score_percentage, questions_count)
VALUES (
    'f0000000-0000-0000-0000-000000000001',
    'Examen Final: El Libro de Efesios Completo',
    'book_final',
    'a0000000-0000-0000-0000-000000000001',
    75,
    50
)
ON CONFLICT (id) DO NOTHING;

