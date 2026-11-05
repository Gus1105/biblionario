-- ==============================================================================
-- BIBLIONARIO - MASTER SEED (TODO EL CONTENIDO DEL LIBRO DE EFESIOS)
-- ==============================================================================



-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
-- ARCHIVO: 000_book_and_chapters.sql
-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

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


-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
-- ARCHIVO: 001_efesios_capitulo_1.sql
-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

-- ==============================================================================
-- BIBLIONARIO - SEED 001: EFESIOS CAPÍTULO 1 (RVR1960)
-- Explicaciones completas y Evaluaciones de los 4 Bloques
-- ==============================================================================

-- ------------------------------------------------------------------------------
-- 1. EXPLICACIONES DE LOS 4 BLOQUES DE EFESIOS 1
-- ------------------------------------------------------------------------------

-- Bloque 1.1: Efesios 1:1-2
INSERT INTO public.block_explanations (
    block_id,
    introduction,
    biblical_passage_rvr1960,
    passage_explanation,
    key_concepts,
    central_ideas,
    key_phrases,
    reading_instruction
)
VALUES (
    'b0000001-0001-0000-0000-000000000001',
    'Pablo inicia su epístola estableciendo con solemnidad su autoridad apostólica y el doble carácter de los creyentes en Éfeso: consagrados a Dios y perseverantes en su fe.',
    '1 Pablo, apóstol de Jesucristo por la voluntad de Dios, a los santos y fieles en Cristo Jesús que están en Éfeso:
2 Gracia y paz a vosotros, de Dios nuestro Padre y del Señor Jesucristo.',
    'En estos dos versículos introductorios encontramos tres verdades fundamentales:

1. El origen del apostolado de Pablo (v. 1):
Pablo no se autoproclamó apóstol ni fue designado por decisión humana o mérito personal, sino "por la voluntad de Dios". Esto confiere a la carta autoridad apostólica directa, no como una opinión privada, sino como revelación guiada por el Espíritu Santo.

2. La identidad de los destinatarios (v. 1):
Los creyentes son descritos con dos términos complementarios:
- "Santos" (apartados, consagrados para Dios): señala su posición ante Dios en virtud de la salvación.
- "Fieles en Cristo Jesús": describe su conducta y perseverancia activa de confianza en el Salvador.
Estar "en Cristo Jesús" es la esfera espiritual de vida del creyente; aunque geográficamente estaban "en Éfeso", espiritualmente su morada y seguridad estaban "en Cristo".

3. El saludo de bendición apostólica (v. 2):
"Gracia y paz":
- La gracia (favor inmerecido, fuente de salvación) siempre antecede a la paz.
- La paz (reconciliación con Dios y serenidad espiritual) es el fruto directo de haber recibido la gracia. Ambas proceden conjuntamente de "Dios nuestro Padre y del Señor Jesucristo", colocando a Jesús en perfecta divinidad junto al Padre.',
    '[
        {"concept": "Apóstol", "definition": "Enviado o mensajero comisionado oficialmente con la autoridad de quien lo envía; en este caso, llamado por la expresa voluntad de Dios."},
        {"concept": "Santos", "definition": "Personas apartadas y consagradas para Dios por la obra redentora de Jesucristo; no alude a perfección moral sin pecado, sino a una posición sagrada ante Dios."},
        {"concept": "En Cristo Jesús", "definition": "Frase teológica cumbre de Pablo que expresa la unión vital, legal y espiritual del creyente con el Redentor."},
        {"concept": "Gracia y Paz", "definition": "El favor inmerecido y soberano de Dios (gracia) que engendra descanso, perdón y reconciliación espiritual (paz)."}
    ]'::jsonb,
    '[
        "El ministerio apostólico de Pablo se origina en la soberana voluntad divina y no en ambiciones humanas.",
        "Los creyentes son santos por su consagración a Dios y fieles por su perseverancia en la fe en Cristo.",
        "La gracia divina siempre precede a la paz interior y relacional con Dios."
    ]'::jsonb,
    '[
        {"phrase": "Pablo, apóstol de Jesucristo por la voluntad de Dios", "reference": "Efesios 1:1"},
        {"phrase": "A los santos y fieles en Cristo Jesús", "reference": "Efesios 1:1"},
        {"phrase": "Gracia y paz a vosotros, de Dios nuestro Padre y del Señor Jesucristo", "reference": "Efesios 1:2"}
    ]'::jsonb,
    'Lee atentamente Efesios 1:1-2 directamente en tu Biblia Reina-Valera 1960. Cuando hayas concluido la lectura, marca la casilla correspondiente para habilitar la evaluación.'
)
ON CONFLICT (block_id) DO UPDATE SET
    introduction = EXCLUDED.introduction,
    passage_explanation = EXCLUDED.passage_explanation,
    key_concepts = EXCLUDED.key_concepts,
    central_ideas = EXCLUDED.central_ideas,
    key_phrases = EXCLUDED.key_phrases;

-- Bloque 1.2: Efesios 1:3-6
INSERT INTO public.block_explanations (
    block_id,
    introduction,
    biblical_passage_rvr1960,
    passage_explanation,
    key_concepts,
    central_ideas,
    key_phrases,
    reading_instruction
)
VALUES (
    'b0000001-0002-0000-0000-000000000002',
    'Pablo prorrumpa en una doxología gloriosa alabando al Padre por su plan eterno: habernos bendecido con toda bendición espiritual y escogido en Cristo para ser santos.',
    '3 Bendito sea el Dios y Padre de nuestro Señor Jesucristo, que nos bendijo con toda bendición espiritual en los lugares celestiales en Cristo,
4 según nos escogió en él antes de la fundación del mundo, para que fuésemos santos y sin mancha delante de él,
5 en amor habiéndonos predestinado para ser adoptados hijos suyos por medio de Jesucristo, según el puro afecto de su voluntad,
6 para alabanza de la gloria de su gracia, con la cual nos hizo aceptos en el Amado,',
    'Este pasaje contiene el fundamento eterno de la salvación del creyente:

1. La doxología y el alcance de las bendiciones (v. 3):
Pablo bendice a Dios porque Él ya "nos bendijo" (en tiempo pasado, indicando una realidad ya concedida y consumada). No son bendiciones terrenales o materiales transitorias, sino "toda bendición espiritual", radicadas en "los lugares celestiales", la dimensión celestial gobernada por Cristo.

2. La elección soberana antes del tiempo (v. 4):
Dios nos escogió en Cristo "antes de la fundación del mundo". Esto demuestra que la salvación no fue una reacción imprevista de Dios ante la caída, sino un designio premeditado en la eternidad. El propósito de dicha elección es ético y espiritual: "para que fuésemos santos y sin mancha delante de él".

3. La predestinación para adopción de hijos (v. 5):
La predestinación está enmarcada "en amor". El motivo de Dios no fue mérito alguno en el ser humano, sino "el puro afecto de su voluntad". La adopción confería todos los derechos legales y privilegios eternos de un hijo biológico en la familia de Dios.

4. El fin supremo de todo el plan redentor (v. 6):
El objetivo final de la gracia no es la exaltación humana, sino "la alabanza de la gloria de su gracia". En virtud de Cristo, Dios nos hizo plenamente "aceptos en el Amado".',
    '[
        {"concept": "Lugares celestiales", "definition": "El ámbito celestial donde Cristo reina y donde se originan y custodian todas las bendiciones espirituales."},
        {"concept": "Elección eterna", "definition": "El acto soberano de Dios mediante el cual escoge a su pueblo en Cristo antes de la creación temporal del universo."},
        {"concept": "Adopción de hijos", "definition": "El acto judicial y de gracia por el cual el creyente es integrado en la familia divina con plenos derechos de herencia eterna."},
        {"concept": "El Amado", "definition": "Título mesiánico aplicado a Jesucristo, en quien el Padre tiene toda su complacencia."}
    ]'::jsonb,
    '[
        "Dios ya ha otorgado al creyente la totalidad de las bendiciones espirituales en Cristo.",
        "La elección divina ocurrió antes de la creación del mundo con el fin de vivir en santidad e integridad.",
        "La adopción filial brota exclusivamente del puro afecto y beneplácito de la voluntad de Dios.",
        "La meta de la salvación es la exaltación y alabanza de la gloria de la gracia divina."
    ]'::jsonb,
    '[
        {"phrase": "Nos bendijo con toda bendición espiritual en los lugares celestiales en Cristo", "reference": "Efesios 1:3"},
        {"phrase": "Según nos escogió en él antes de la fundación del mundo", "reference": "Efesios 1:4"},
        {"phrase": "Para ser adoptados hijos suyos por medio de Jesucristo", "reference": "Efesios 1:5"},
        {"phrase": "Para alabanza de la gloria de su gracia", "reference": "Efesios 1:6"}
    ]'::jsonb,
    'Lee con reverencia Efesios 1:3-6 directamente en tu Biblia Reina-Valera 1960. Al concluir, confirma la lectura para realizar la evaluación del bloque.'
)
ON CONFLICT (block_id) DO UPDATE SET
    introduction = EXCLUDED.introduction,
    passage_explanation = EXCLUDED.passage_explanation,
    key_concepts = EXCLUDED.key_concepts,
    central_ideas = EXCLUDED.central_ideas,
    key_phrases = EXCLUDED.key_phrases;

-- Bloque 1.3: Efesios 1:7-14
INSERT INTO public.block_explanations (
    block_id,
    introduction,
    biblical_passage_rvr1960,
    passage_explanation,
    key_concepts,
    central_ideas,
    key_phrases,
    reading_instruction
)
VALUES (
    'b0000001-0003-0000-0000-000000000003',
    'Pablo expone la obra del Hijo que redime por su sangre y la obra del Espíritu Santo que sella al creyente como garantía de la herencia eterna.',
    '7 en quien tenemos redención por su sangre, el perdón de pecados según las riquezas de su gracia,
8 que hizo sobreabundar para con nosotros en toda sabiduría e inteligencia,
9 dándonos a conocer el misterio de su voluntad, según su beneplácito, el cual se había propuesto en sí mismo,
10 de reunir todas las cosas en Cristo, en la dispensación del cumplimiento de los tiempos, así las que están en los cielos, como las que están en la tierra.
11 En él asimismo tuvimos herencia, habiendo sido predestinados conforme al propósito del que hace todas las cosas según el designio de su voluntad,
12 a fin de que seamos para alabanza de su gloria, nosotros los que primeramente esperábamos en Cristo.
13 En él también vosotros, habiendo oído la palabra de verdad, el evangelio de vuestra salvación, y habiendo creído en él, fuisteis sellados con el Espíritu Santo de la promesa,
14 que es las arras de nuestra herencia hasta la redención de la posesión adquirida, para alabanza de su gloria.',
    'Este pasaje despliega la consumación histórica y la aplicación personal de la redención:

1. El precio y alcance de la redención (v. 7-8):
Nuestra liberación no se pagó con riquezas terrenales sino "por su sangre", obteniendo "el perdón de pecados". Esto no fue medido con escasez, sino "según las riquezas de su gracia", manifestada con sobreabundante sabiduría espiritual.

2. La revelación del misterio cósmico (v. 9-10):
Dios nos dio a conocer "el misterio de su voluntad": el propósito final de la historia es "reunir todas las cosas en Cristo", tanto las celestiales como las terrenales, bajo su supremo señorío cuando los tiempos alcancen su plenitud.

3. La herencia en Cristo (v. 11-12):
En Cristo los creyentes participan de una gloriosa herencia eterna, ordenada conforme al designio soberano de Aquel que ejecuta todas las cosas según su consejo perfecto.

4. El sello y las arras del Espíritu Santo (v. 13-14):
Pablo describe el orden de la experiencia salvífica:
1) Oír la palabra de verdad (el evangelio).
2) Creer en Cristo.
3) Ser "sellados con el Espíritu Santo de la promesa".
El sello simbolizaba propiedad irrevocable, autenticidad y seguridad.
El Espíritu es además "las arras de nuestra herencia": un anticipo o garantía divina que asegura la redención final de la posesión que Dios adquirió.',
    '[
        {"concept": "Redención", "definition": "Liberación mediante el pago de un rescate; en Cristo, la liberación de la condenación del pecado pagada con su propia sangre."},
        {"concept": "Misterio de su voluntad", "definition": "Verdad previamente velada en el Antiguo Testamento que Dios revela ahora en el evangelio: la centralidad absoluta de Cristo unificando toda la creación."},
        {"concept": "Sello del Espíritu Santo", "definition": "Marca divina e indeleble de propiedad, protección y autenticidad conferida al creyente al momento de creer."},
        {"concept": "Arras", "definition": "Garantía, depósito inicial o anticipo legal que asegura que la totalidad del pago o herencia prometida se consumará."}
    ]'::jsonb,
    '[
        "La redención y el perdón de los pecados tienen como precio único y suficiente la sangre de Jesucristo.",
        "El propósito supremo de Dios en la plenitud de los tiempos es encabezar y unificar todas las cosas en Cristo.",
        "Al creer en el evangelio, todo cristiano es sellado por el Espíritu Santo como pertenencia perpetua de Dios.",
        "El Espíritu Santo es la fianza y anticipo divino que asegura nuestra glorificación final."
    ]'::jsonb,
    '[
        {"phrase": "En quien tenemos redención por su sangre, el perdón de pecados", "reference": "Efesios 1:7"},
        {"phrase": "De reunir todas las cosas en Cristo", "reference": "Efesios 1:10"},
        {"phrase": "Fuisteis sellados con el Espíritu Santo de la promesa", "reference": "Efesios 1:13"},
        {"phrase": "Que es las arras de nuestra herencia", "reference": "Efesios 1:14"}
    ]'::jsonb,
    'Lee con atención Efesios 1:7-14 directamente en tu Biblia Reina-Valera 1960. Marca la casilla al terminar para acceder a la evaluación.'
)
ON CONFLICT (block_id) DO UPDATE SET
    introduction = EXCLUDED.introduction,
    passage_explanation = EXCLUDED.passage_explanation,
    key_concepts = EXCLUDED.key_concepts,
    central_ideas = EXCLUDED.central_ideas,
    key_phrases = EXCLUDED.key_phrases;

-- Bloque 1.4: Efesios 1:15-23
INSERT INTO public.block_explanations (
    block_id,
    introduction,
    biblical_passage_rvr1960,
    passage_explanation,
    key_concepts,
    central_ideas,
    key_phrases,
    reading_instruction
)
VALUES (
    'b0000001-0004-0000-0000-000000000004',
    'Pablo eleva una oración ferviente para que los creyentes conozcan experimentalmente la grandeza de Dios, culminando en la proclamación del señorío cósmico de Cristo sobre la Iglesia.',
    '15 Por esta causa también yo, habiendo oído de vuestra fe en el Señor Jesús, y de vuestro amor para con todos los santos,
16 no ceso de dar gracias por vosotros, haciendo memoria de vosotros en mis oraciones,
17 para que el Dios de nuestro Señor Jesucristo, el Padre de gloria, os dé espíritu de sabiduría y de revelación en el conocimiento de él,
18 alumbrando los ojos de vuestro entendimiento, para que sepáis cuál es la esperanza a que él os ha llamado, y cuáles las riquezas de la gloria de su herencia en los santos,
19 y cuál la supereminente grandeza de su poder para con nosotros los que creemos, según la operación del poder de su fuerza,
20 la cual operó en Cristo, resucitándole de los muertos y sentándole a su diestra en los lugares celestiales,
21 sobre todo principado y autoridad y poder y señorío, y sobre todo nombre que se nombra, no sólo en este siglo, sino también en el venidero;
22 y sometió todas las cosas bajo sus pies, y lo dio por cabeza sobre todas las cosas a la iglesia,
23 la cual es su cuerpo, la plenitud de Aquel que todo lo llena en todo.',
    'Esta magnífica oración apostólica revela las prioridades espirituales de Pablo:

1. El motivo de gratitud (v. 15-16):
Pablo agradece a Dios por dos evidencias indispensables de salvación genuina: fe auténtica en Jesucristo y amor sincero y práctico hacia "todos los santos".

2. La petición de sabiduría e iluminación espiritual (v. 17-18):
Pablo ruega por "espíritu de sabiduría y de revelación" para conocer profundamente a Dios, pidiendo que sean "alumbrados los ojos de vuestro entendimiento".
Pide que comprendan tres realidades trascendentales:
a) Cuál es la esperanza del llamamiento divino.
b) Cuáles son las riquezas de la gloria de su herencia.
c) Cuál es la supereminente grandeza de su poder hacia los creyentes.

3. El poder manifestado en la resurrección y exaltación de Cristo (v. 19-21):
El poder que obra en el creyente es el mismo poder omnipotente que resucitó a Cristo de entre los muertos y lo sentó a la diestra del Padre en lugares celestiales. Cristo está infinitamente por encima de todo principado, autoridad, poder, señorío y cualquier título que exista en el siglo presente y en el venidero.

4. Cristo, cabeza soberana de la Iglesia (v. 22-23):
El Padre puso "todas las cosas bajo sus pies". Y para bendición de su pueblo, dio a este Cristo soberano como "cabeza sobre todas las cosas a la iglesia". La Iglesia es su cuerpo místico y visible, la plenitud de Aquel que satura y llena todo en todo.',
    '[
        {"concept": "Espíritu de sabiduría y revelación", "definition": "Don espiritual del Espíritu Santo que capacita la mente humana para comprender la verdad de Dios y su carácter."},
        {"concept": "Ojos del entendimiento", "definition": "Capacidad espiritual e interior del corazón para discernir las realidades invisibles y eternas del reino de Dios."},
        {"concept": "Supereminente grandeza de su poder", "definition": "El poder todopoderoso de Dios (dunamis) que sobrepasa toda medida humana, demostrado en la resurrección de Cristo."},
        {"concept": "Cabeza de la Iglesia", "definition": "La posición de autoridad absoluta, gobierno vital y sustento que Jesucristo ejerce sobre su cuerpo que es la Iglesia."}
    ]'::jsonb,
    '[
        "La fe en el Señor Jesús debe manifestarse necesariamente en amor práctico hacia los hermanos en la fe.",
        "El verdadero conocimiento espiritual requiere la iluminación interior que solo el Espíritu Santo puede otorgar.",
        "El mismo poder que resucitó a Jesús de los muertos opera activa y eficazmente en los creyentes.",
        "Cristo está entronizado sobre toda jerarquía espiritual y terrenal, y reina como cabeza protectora de su Iglesia."
    ]'::jsonb,
    '[
        {"phrase": "Haciendo memoria de vosotros en mis oraciones", "reference": "Efesios 1:16"},
        {"phrase": "Alumbrando los ojos de vuestro entendimiento", "reference": "Efesios 1:18"},
        {"phrase": "Sobre todo principado y autoridad y poder y señorío", "reference": "Efesios 1:21"},
        {"phrase": "Y lo dio por cabeza sobre todas las cosas a la iglesia", "reference": "Efesios 1:22"}
    ]'::jsonb,
    'Lee con meditación Efesios 1:15-23 directamente en tu Biblia Reina-Valera 1960. Al terminar, marca como leído para comenzar la evaluación.'
)
ON CONFLICT (block_id) DO UPDATE SET
    introduction = EXCLUDED.introduction,
    passage_explanation = EXCLUDED.passage_explanation,
    key_concepts = EXCLUDED.key_concepts,
    central_ideas = EXCLUDED.central_ideas,
    key_phrases = EXCLUDED.key_phrases;

-- ------------------------------------------------------------------------------
-- 2. PREGUNTAS Y OPCIONES DE LOS BLOQUES DE EFESIOS 1
-- ------------------------------------------------------------------------------

-- PREGUNTAS BLOQUE 1.1 (Efesios 1:1-2)
INSERT INTO public.questions (id, block_id, chapter_id, question_type, prompt, verse_reference, explanation, points, difficulty, order_index, is_active)
VALUES
(
    'q0001001-0001-0000-0000-000000000001',
    'b0000001-0001-0000-0000-000000000001',
    'c0000000-0000-0000-0000-000000000001',
    'multiple_choice',
    'Según Efesios 1:1, ¿por qué causa o principio fue Pablo apóstol de Jesucristo?',
    'Efesios 1:1',
    'Efesios 1:1 declara explícitamente: "Pablo, apóstol de Jesucristo por la voluntad de Dios". No fue por mérito ni por elección de hombres.',
    10, 'easy', 1, true
),
(
    'q0001001-0002-0000-0000-000000000002',
    'b0000001-0001-0000-0000-000000000001',
    'c0000000-0000-0000-0000-000000000001',
    'multiple_choice',
    '¿Qué dos calificativos utiliza el apóstol Pablo para describir a los destinatarios de su carta en Efesios 1:1?',
    'Efesios 1:1',
    'Pablo se dirige a "los santos y fieles en Cristo Jesús que están en Éfeso".',
    10, 'easy', 2, true
),
(
    'q0001001-0003-0000-0000-000000000003',
    'b0000001-0001-0000-0000-000000000001',
    'c0000000-0000-0000-0000-000000000001',
    'fill_blank',
    'Completa el saludo de Efesios 1:2: "________ y paz a vosotros, de Dios nuestro Padre y del Señor Jesucristo".',
    'Efesios 1:2',
    'El saludo bíblico textual comienza con "Gracia" ("Gracia y paz a vosotros...").',
    10, 'easy', 3, true
),
(
    'q0001001-0004-0000-0000-000000000004',
    'b0000001-0001-0000-0000-000000000001',
    'c0000000-0000-0000-0000-000000000001',
    'true_false',
    'En el saludo apostólico de Efesios 1:2, la paz y la gracia proceden de Dios nuestro Padre y del Señor Jesucristo.',
    'Efesios 1:2',
    'Verdadero. Efesios 1:2 afirma: "...de Dios nuestro Padre y del Señor Jesucristo", colocando a ambos como fuente de la bendición.',
    10, 'easy', 4, true
),
(
    'q0001001-0005-0000-0000-000000000005',
    'b0000001-0001-0000-0000-000000000001',
    'c0000000-0000-0000-0000-000000000001',
    'reference_identification',
    '¿En qué versículo del primer capítulo de Efesios encontramos la expresión "a los santos y fieles en Cristo Jesús que están en Éfeso"?',
    'Efesios 1:1',
    'Esta salutación inicial se encuentra en Efesios 1:1.',
    10, 'easy', 5, true
)
ON CONFLICT (id) DO NOTHING;

-- Opciones para preguntas Bloque 1.1
INSERT INTO public.question_options (question_id, option_text, is_correct, order_index)
VALUES
-- q1: multiple_choice
('q0001001-0001-0000-0000-000000000001', 'Por la voluntad de Dios', true, 1),
('q0001001-0001-0000-0000-000000000001', 'Por decisión del concilio de Jerusalén', false, 2),
('q0001001-0001-0000-0000-000000000001', 'Por sus propios méritos fariseos', false, 3),
('q0001001-0001-0000-0000-000000000001', 'Por elección de la iglesia de Éfeso', false, 4),

-- q2: multiple_choice
('q0001001-0002-0000-0000-000000000002', 'A los santos y fieles en Cristo Jesús', true, 1),
('q0001001-0002-0000-0000-000000000002', 'A los sabios y entendidos de Asia', false, 2),
('q0001001-0002-0000-0000-000000000002', 'A los discípulos y ancianos de Éfeso', false, 3),
('q0001001-0002-0000-0000-000000000002', 'A los justos y gobernantes de la ciudad', false, 4),

-- q3: fill_blank
('q0001001-0003-0000-0000-000000000003', 'Gracia', true, 1),

-- q4: true_false
('q0001001-0004-0000-0000-000000000004', 'Verdadero', true, 1),
('q0001001-0004-0000-0000-000000000004', 'Falso', false, 2),

-- q5: reference_identification
('q0001001-0005-0000-0000-000000000005', 'Efesios 1:1', true, 1),
('q0001001-0005-0000-0000-000000000005', 'Efesios 1:2', false, 2),
('q0001001-0005-0000-0000-000000000005', 'Efesios 1:3', false, 3),
('q0001001-0005-0000-0000-000000000005', 'Efesios 1:7', false, 4)
ON CONFLICT (id) DO NOTHING;

-- Asociar preguntas de Bloque 1.1 con su evaluación
INSERT INTO public.assessment_questions (assessment_id, question_id, order_index)
VALUES
('e0000001-0001-0000-0000-000000000001', 'q0001001-0001-0000-0000-000000000001', 1),
('e0000001-0001-0000-0000-000000000002', 'q0001001-0002-0000-0000-000000000002', 2),
('e0000001-0001-0000-0000-000000000003', 'q0001001-0003-0000-0000-000000000003', 3),
('e0000001-0001-0000-0000-000000000004', 'q0001001-0004-0000-0000-000000000004', 4),
('e0000001-0001-0000-0000-000000000005', 'q0001001-0005-0000-0000-000000000005', 5)
ON CONFLICT DO NOTHING;

-- PREGUNTAS BLOQUE 1.2 (Efesios 1:3-6)
INSERT INTO public.questions (id, block_id, chapter_id, question_type, prompt, verse_reference, explanation, points, difficulty, order_index, is_active)
VALUES
(
    'q0001002-0001-0000-0000-000000000001',
    'b0000001-0002-0000-0000-000000000002',
    'c0000000-0000-0000-0000-000000000001',
    'multiple_choice',
    'Según Efesios 1:3, ¿con qué clase de bendiciones nos ha bendecido Dios y en qué ámbito?',
    'Efesios 1:3',
    'Efesios 1:3 señala que nos bendijo con "toda bendición espiritual en los lugares celestiales en Cristo".',
    10, 'easy', 1, true
),
(
    'q0001002-0002-0000-0000-000000000002',
    'b0000001-0002-0000-0000-000000000002',
    'c0000000-0000-0000-0000-000000000001',
    'multiple_choice',
    '¿Cuándo escogió Dios a los creyentes en Cristo según Efesios 1:4?',
    'Efesios 1:4',
    'El texto declara: "según nos escogió en él antes de la fundación del mundo".',
    10, 'easy', 2, true
),
(
    'q0001002-0003-0000-0000-000000000003',
    'b0000001-0002-0000-0000-000000000002',
    'c0000000-0000-0000-0000-000000000001',
    'fill_blank',
    'Completa el versículo de Efesios 1:4: "para que fuésemos santos y sin ________ delante de él".',
    'Efesios 1:4',
    'Efesios 1:4 dice: "para que fuésemos santos y sin mancha delante de él".',
    10, 'medium', 3, true
),
(
    'q0001002-0004-0000-0000-000000000004',
    'b0000001-0002-0000-0000-000000000002',
    'c0000000-0000-0000-0000-000000000001',
    'multiple_choice',
    'De acuerdo con Efesios 1:5, ¿para qué fuimos predestinados en amor y según qué criterio?',
    'Efesios 1:5',
    'Efesios 1:5 indica: "para ser adoptados hijos suyos por medio de Jesucristo, según el puro afecto de su voluntad".',
    10, 'medium', 4, true
),
(
    'q0001002-0005-0000-0000-000000000005',
    'b0000001-0002-0000-0000-000000000002',
    'c0000000-0000-0000-0000-000000000001',
    'true_false',
    'Efesios 1:6 enseña que fuimos hechos aceptos en el Amado para alabanza de la gloria de su gracia.',
    'Efesios 1:6',
    'Verdadero. Efesios 1:6 afirma textualmente: "para alabanza de la gloria de su gracia, con la cual nos hizo aceptos en el Amado".',
    10, 'easy', 5, true
),
(
    'q0001002-0006-0000-0000-000000000006',
    'b0000001-0002-0000-0000-000000000002',
    'c0000000-0000-0000-0000-000000000001',
    'reference_identification',
    '¿En qué versículo de Efesios 1 se encuentra la afirmación "con la cual nos hizo aceptos en el Amado"?',
    'Efesios 1:6',
    'Esta expresión concluye el versículo 6 de Efesios 1.',
    10, 'medium', 6, true
)
ON CONFLICT (id) DO NOTHING;

-- Opciones Bloque 1.2
INSERT INTO public.question_options (question_id, option_text, is_correct, order_index)
VALUES
-- q1: multiple_choice
('q0001002-0001-0000-0000-000000000001', 'Con toda bendición espiritual en los lugares celestiales en Cristo', true, 1),
('q0001002-0001-0000-0000-000000000001', 'Con riquezas materiales en la tierra prometida', false, 2),
('q0001002-0001-0000-0000-000000000001', 'Con bendiciones temporales según la ley de Moisés', false, 3),
('q0001002-0001-0000-0000-000000000001', 'Con honra terrenal y poder sobre las naciones', false, 4),

-- q2: multiple_choice
('q0001002-0002-0000-0000-000000000002', 'Antes de la fundación del mundo', true, 1),
('q0001002-0002-0000-0000-000000000002', 'Al momento de bautizarnos en agua', false, 2),
('q0001002-0002-0000-0000-000000000002', 'Cuando el hombre demostró hacer buenas obras', false, 3),
('q0001002-0002-0000-0000-000000000002', 'Durante el ministerio terrenal de los apóstoles', false, 4),

-- q3: fill_blank
('q0001002-0003-0000-0000-000000000003', 'mancha', true, 1),

-- q4: multiple_choice
('q0001002-0004-0000-0000-000000000004', 'Para ser adoptados hijos suyos por medio de Jesucristo, según el puro afecto de su voluntad', true, 1),
('q0001002-0004-0000-0000-000000000004', 'Para ser siervos bajo el yugo de la condenación legal', false, 2),
('q0001002-0004-0000-0000-000000000004', 'Para gobernar Éfeso según las leyes del imperio romano', false, 3),
('q0001002-0004-0000-0000-000000000004', 'Para recibir dones sin necesidad de santidad', false, 4),

-- q5: true_false
('q0001002-0005-0000-0000-000000000005', 'Verdadero', true, 1),
('q0001002-0005-0000-0000-000000000005', 'Falso', false, 2),

-- q6: reference_identification
('q0001002-0006-0000-0000-000000000006', 'Efesios 1:6', true, 1),
('q0001002-0006-0000-0000-000000000006', 'Efesios 1:3', false, 2),
('q0001002-0006-0000-0000-000000000006', 'Efesios 1:4', false, 3),
('q0001002-0006-0000-0000-000000000006', 'Efesios 1:5', false, 4)
ON CONFLICT (id) DO NOTHING;

-- Asociar preguntas Bloque 1.2
INSERT INTO public.assessment_questions (assessment_id, question_id, order_index)
VALUES
('e0000001-0002-0000-0000-000000000002', 'q0001002-0001-0000-0000-000000000001', 1),
('e0000001-0002-0000-0000-000000000002', 'q0001002-0002-0000-0000-000000000002', 2),
('e0000001-0002-0000-0000-000000000002', 'q0001002-0003-0000-0000-000000000003', 3),
('e0000001-0002-0000-0000-000000000002', 'q0001002-0004-0000-0000-000000000004', 4),
('e0000001-0002-0000-0000-000000000002', 'q0001002-0005-0000-0000-000000000005', 5),
('e0000001-0002-0000-0000-000000000002', 'q0001002-0006-0000-0000-000000000006', 6)
ON CONFLICT DO NOTHING;

-- PREGUNTAS BLOQUE 1.3 (Efesios 1:7-14)
INSERT INTO public.questions (id, block_id, chapter_id, question_type, prompt, verse_reference, explanation, points, difficulty, order_index, is_active)
VALUES
(
    'q0001003-0001-0000-0000-000000000001',
    'b0000001-0003-0000-0000-000000000003',
    'c0000000-0000-0000-0000-000000000001',
    'multiple_choice',
    'Según Efesios 1:7, ¿a través de qué medio tenemos redención y el perdón de pecados?',
    'Efesios 1:7',
    'Efesios 1:7 afirma: "en quien tenemos redención por su sangre, el perdón de pecados según las riquezas de su gracia".',
    10, 'easy', 1, true
),
(
    'q0001003-0002-0000-0000-000000000002',
    'b0000001-0003-0000-0000-000000000003',
    'c0000000-0000-0000-0000-000000000001',
    'multiple_choice',
    '¿Cuál es el misterio de la voluntad de Dios que se propuso para la dispensación del cumplimiento de los tiempos (Efesios 1:9-10)?',
    'Efesios 1:9-10',
    'Efesios 1:10 declara: "de reunir todas las cosas en Cristo... así las que están en los cielos, como las que están en la tierra".',
    10, 'medium', 2, true
),
(
    'q0001003-0003-0000-0000-000000000003',
    'b0000001-0003-0000-0000-000000000003',
    'c0000000-0000-0000-0000-000000000001',
    'fill_blank',
    'Completa Efesios 1:13: "y habiendo creído en él, fuisteis ________ con el Espíritu Santo de la promesa".',
    'Efesios 1:13',
    'Efesios 1:13 dice textualmente: "...fuisteis sellados con el Espíritu Santo de la promesa".',
    10, 'medium', 3, true
),
(
    'q0001003-0004-0000-0000-000000000004',
    'b0000001-0003-0000-0000-000000000003',
    'c0000000-0000-0000-0000-000000000001',
    'multiple_choice',
    '¿Qué función cumple el Espíritu Santo respecto a nuestra herencia según Efesios 1:14?',
    'Efesios 1:14',
    'Efesios 1:14 enseña que el Espíritu Santo "es las arras de nuestra herencia hasta la redención de la posesión adquirida".',
    10, 'medium', 4, true
),
(
    'q0001003-0005-0000-0000-000000000005',
    'b0000001-0003-0000-0000-000000000003',
    'c0000000-0000-0000-0000-000000000001',
    'true_false',
    'Según Efesios 1:13, el sello del Espíritu Santo se recibe después de haber oído la palabra de verdad y haber creído en Cristo.',
    'Efesios 1:13',
    'Verdadero. El texto dice: "habiendo oído la palabra de verdad... y habiendo creído en él, fuisteis sellados...".',
    10, 'easy', 5, true
),
(
    'q0001003-0006-0000-0000-000000000006',
    'b0000001-0003-0000-0000-000000000003',
    'c0000000-0000-0000-0000-000000000001',
    'reference_identification',
    '¿En qué versículo se encuentra la afirmación "en quien tenemos redención por su sangre, el perdón de pecados"?',
    'Efesios 1:7',
    'Esta afirmación central de la expiación se ubica en Efesios 1:7.',
    10, 'easy', 6, true
),
(
    'q0001003-0007-0000-0000-000000000007',
    'b0000001-0003-0000-0000-000000000003',
    'c0000000-0000-0000-0000-000000000001',
    'order_events',
    'Ordena la secuencia del proceso espiritual que describe Pablo en Efesios 1:13:',
    'Efesios 1:13',
    'Efesios 1:13 presenta el orden: 1) Oír la palabra de verdad, 2) Creer en Cristo, 3) Ser sellados con el Espíritu Santo.',
    10, 'hard', 7, true
)
ON CONFLICT (id) DO NOTHING;

-- Opciones Bloque 1.3
INSERT INTO public.question_options (question_id, option_text, is_correct, order_index, correct_order_position)
VALUES
-- q1: multiple_choice
('q0001003-0001-0000-0000-000000000001', 'Por su sangre', true, 1, null),
('q0001003-0001-0000-0000-000000000001', 'Por nuestras buenas obras', false, 2, null),
('q0001003-0001-0000-0000-000000000001', 'Por sacrificios de la ley ceremonial', false, 3, null),
('q0001003-0001-0000-0000-000000000001', 'Por cumplir las tradiciones religiosas', false, 4, null),

-- q2: multiple_choice
('q0001003-0002-0000-0000-000000000002', 'Reunir todas las cosas en Cristo, en los cielos y en la tierra', true, 1, null),
('q0001003-0002-0000-0000-000000000002', 'Restaurar el templo material de Jerusalén', false, 2, null),
('q0001003-0002-0000-0000-000000000002', 'Destruir a todas las naciones gentiles', false, 3, null),
('q0001003-0002-0000-0000-000000000002', 'Separar a los creyentes en dos pueblos distintos', false, 4, null),

-- q3: fill_blank
('q0001003-0003-0000-0000-000000000003', 'sellados', true, 1, null),

-- q4: multiple_choice
('q0001003-0004-0000-0000-000000000004', 'Es las arras de nuestra herencia hasta la redención de la posesión adquirida', true, 1, null),
('q0001003-0004-0000-0000-000000000004', 'Un testigo acusador de nuestras faltas diarias', false, 2, null),
('q0001003-0004-0000-0000-000000000004', 'Una señal visible temporal que caduca en la muerte', false, 3, null),
('q0001003-0004-0000-0000-000000000004', 'Un premio exclusivo para los apóstoles', false, 4, null),

-- q5: true_false
('q0001003-0005-0000-0000-000000000005', 'Verdadero', true, 1, null),
('q0001003-0005-0000-0000-000000000005', 'Falso', false, 2, null),

-- q6: reference_identification
('q0001003-0006-0000-0000-000000000006', 'Efesios 1:7', true, 1, null),
('q0001003-0006-0000-0000-000000000006', 'Efesios 1:11', false, 2, null),
('q0001003-0006-0000-0000-000000000006', 'Efesios 1:13', false, 3, null),
('q0001003-0006-0000-0000-000000000006', 'Efesios 1:15', false, 4, null),

-- q7: order_events
('q0001003-0007-0000-0000-000000000007', 'Habiendo oído la palabra de verdad (el evangelio)', true, 1, 1),
('q0001003-0007-0000-0000-000000000007', 'Habiendo creído en Cristo', true, 2, 2),
('q0001003-0007-0000-0000-000000000007', 'Fuisteis sellados con el Espíritu Santo de la promesa', true, 3, 3)
ON CONFLICT (id) DO NOTHING;

-- Asociar preguntas Bloque 1.3
INSERT INTO public.assessment_questions (assessment_id, question_id, order_index)
VALUES
('e0000001-0003-0000-0000-000000000003', 'q0001003-0001-0000-0000-000000000001', 1),
('e0000001-0003-0000-0000-000000000003', 'q0001003-0002-0000-0000-000000000002', 2),
('e0000001-0003-0000-0000-000000000003', 'q0001003-0003-0000-0000-000000000003', 3),
('e0000001-0003-0000-0000-000000000003', 'q0001003-0004-0000-0000-000000000004', 4),
('e0000001-0003-0000-0000-000000000003', 'q0001003-0005-0000-0000-000000000005', 5),
('e0000001-0003-0000-0000-000000000003', 'q0001003-0006-0000-0000-000000000006', 6),
('e0000001-0003-0000-0000-000000000003', 'q0001003-0007-0000-0000-000000000007', 7)
ON CONFLICT DO NOTHING;

-- PREGUNTAS BLOQUE 1.4 (Efesios 1:15-23)
INSERT INTO public.questions (id, block_id, chapter_id, question_type, prompt, verse_reference, explanation, points, difficulty, order_index, is_active)
VALUES
(
    'q0001004-0001-0000-0000-000000000001',
    'b0000001-0004-0000-0000-000000000004',
    'c0000000-0000-0000-0000-000000000001',
    'multiple_choice',
    '¿Por qué dos virtudes de los efesios Pablo no cesa de dar gracias a Dios en Efesios 1:15-16?',
    'Efesios 1:15-16',
    'Efesios 1:15 menciona: "habiendo oído de vuestra fe en el Señor Jesús, y de vuestro amor para con todos los santos".',
    10, 'easy', 1, true
),
(
    'q0001004-0002-0000-0000-000000000002',
    'b0000001-0004-0000-0000-000000000004',
    'c0000000-0000-0000-0000-000000000001',
    'multiple_choice',
    '¿Qué pide Pablo que Dios dé a los creyentes según Efesios 1:17?',
    'Efesios 1:17',
    'Efesios 1:17 ruega: "os dé espíritu de sabiduría y de revelación en el conocimiento de él".',
    10, 'medium', 2, true
),
(
    'q0001004-0003-0000-0000-000000000003',
    'b0000001-0004-0000-0000-000000000004',
    'c0000000-0000-0000-0000-000000000001',
    'fill_blank',
    'Completa Efesios 1:18: "alumbrando los ojos de vuestro ________, para que sepáis cuál es la esperanza a que él os ha llamado".',
    'Efesios 1:18',
    'El texto bíblico dice textualmente: "alumbrando los ojos de vuestro entendimiento...".',
    10, 'medium', 3, true
),
(
    'q0001004-0004-0000-0000-000000000004',
    'b0000001-0004-0000-0000-000000000004',
    'c0000000-0000-0000-0000-000000000001',
    'multiple_choice',
    '¿En qué acontecimiento histórico supremo operó Dios la supereminente grandeza de su poder según Efesios 1:20?',
    'Efesios 1:20',
    'Efesios 1:20 declara: "la cual operó en Cristo, resucitándole de los muertos y sentándole a su diestra en los lugares celestiales".',
    10, 'medium', 4, true
),
(
    'q0001004-0005-0000-0000-000000000005',
    'b0000001-0004-0000-0000-000000000004',
    'c0000000-0000-0000-0000-000000000001',
    'multiple_choice',
    'Según Efesios 1:22, ¿a quién dio Dios por cabeza sobre todas las cosas y para qué entidad?',
    'Efesios 1:22',
    'Efesios 1:22 dice: "y sometió todas las cosas bajo sus pies, y lo dio por cabeza sobre todas las cosas a la iglesia".',
    10, 'easy', 5, true
),
(
    'q0001004-0006-0000-0000-000000000004',
    'b0000001-0004-0000-0000-000000000004',
    'c0000000-0000-0000-0000-000000000001',
    'true_false',
    'Efesios 1:23 define a la iglesia como el cuerpo de Cristo, la plenitud de Aquel que todo lo llena en todo.',
    'Efesios 1:23',
    'Verdadero. Efesios 1:23 concluye diciendo: "la cual es su cuerpo, la plenitud de Aquel que todo lo llena en todo".',
    10, 'easy', 6, true
),
(
    'q0001004-0007-0000-0000-000000000004',
    'b0000001-0004-0000-0000-000000000004',
    'c0000000-0000-0000-0000-000000000001',
    'reference_identification',
    '¿En qué versículo de Efesios se declara que Dios puso a Cristo "sobre todo principado y autoridad y poder y señorío"?',
    'Efesios 1:21',
    'Esta exaltación de Cristo por encima de toda potestad se encuentra en Efesios 1:21.',
    10, 'medium', 7, true
)
ON CONFLICT (id) DO NOTHING;

-- Opciones Bloque 1.4
INSERT INTO public.question_options (question_id, option_text, is_correct, order_index)
VALUES
-- q1: multiple_choice
('q0001004-0001-0000-0000-000000000001', 'De su fe en el Señor Jesús y de su amor para con todos los santos', true, 1),
('q0001004-0001-0000-0000-000000000001', 'De sus riquezas y de su posición social en Éfeso', false, 2),
('q0001004-0001-0000-0000-000000000001', 'De su habilidad retórica y conocimiento filosófico', false, 3),
('q0001004-0001-0000-0000-000000000001', 'De la cantidad de miembros que asistían a sus reuniones', false, 4),

-- q2: multiple_choice
('q0001004-0002-0000-0000-000000000002', 'Espíritu de sabiduría y de revelación en el conocimiento de él', true, 1),
('q0001004-0002-0000-0000-000000000002', 'Bienes materiales para no padecer necesidad', false, 2),
('q0001004-0002-0000-0000-000000000002', 'Poder político para derrotar a los gobernantes romanos', false, 3),
('q0001004-0002-0000-0000-000000000002', 'Visión profética sobre el fin de Éfeso', false, 4),

-- q3: fill_blank
('q0001004-0003-0000-0000-000000000003', 'entendimiento', true, 1),

-- q4: multiple_choice
('q0001004-0004-0000-0000-000000000004', 'Resucitándole de los muertos y sentándole a su diestra en los lugares celestiales', true, 1),
('q0001004-0004-0000-0000-000000000004', 'Multiplicando los panes y los peces en Galilea', false, 2),
('q0001004-0004-0000-0000-000000000004', 'Derribando los muros de Jericó', false, 3),
('q0001004-0004-0000-0000-000000000004', 'Abriendo el mar Rojo ante Moisés', false, 4),

-- q5: multiple_choice
('q0001004-0005-0000-0000-000000000005', 'A Cristo, como cabeza sobre todas las cosas a la iglesia', true, 1),
('q0001004-0005-0000-0000-000000000005', 'A Pedro, como cabeza universal de la cristiandad', false, 2),
('q0001004-0005-0000-0000-000000000005', 'A los ángeles, como gobernantes de las iglesias locales', false, 3),
('q0001004-0005-0000-0000-000000000005', 'Al emperador de Roma, como protector de la religión', false, 4),

-- q6: true_false
('q0001004-0006-0000-0000-000000000004', 'Verdadero', true, 1),
('q0001004-0006-0000-0000-000000000004', 'Falso', false, 2),

-- q7: reference_identification
('q0001004-0007-0000-0000-000000000004', 'Efesios 1:21', true, 1),
('q0001004-0007-0000-0000-000000000004', 'Efesios 1:16', false, 2),
('q0001004-0007-0000-0000-000000000004', 'Efesios 1:18', false, 3),
('q0001004-0007-0000-0000-000000000004', 'Efesios 1:19', false, 4)
ON CONFLICT (id) DO NOTHING;

-- Asociar preguntas Bloque 1.4
INSERT INTO public.assessment_questions (assessment_id, question_id, order_index)
VALUES
('e0000001-0004-0000-0000-000000000004', 'q0001004-0001-0000-0000-000000000001', 1),
('e0000001-0004-0000-0000-000000000004', 'q0001004-0002-0000-0000-000000000002', 2),
('e0000001-0004-0000-0000-000000000004', 'q0001004-0003-0000-0000-000000000003', 3),
('e0000001-0004-0000-0000-000000000004', 'q0001004-0004-0000-0000-000000000004', 4),
('e0000001-0004-0000-0000-000000000004', 'q0001004-0005-0000-0000-000000000005', 5),
('e0000001-0004-0000-0000-000000000004', 'q0001004-0006-0000-0000-000000000004', 6),
('e0000001-0004-0000-0000-000000000004', 'q0001004-0007-0000-0000-000000000004', 7)
ON CONFLICT DO NOTHING;


-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
-- ARCHIVO: 002_efesios_capitulo_2.sql
-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

-- ==============================================================================
-- BIBLIONARIO - SEED 002: EFESIOS CAPÍTULO 2 (RVR1960)
-- Explicaciones completas y Evaluaciones de los 4 Bloques (2:1-10, 2:11-13, 2:14-18, 2:19-22)
-- ==============================================================================

-- ------------------------------------------------------------------------------
-- 1. EXPLICACIONES DE LOS 4 BLOQUES DE EFESIOS 2
-- ------------------------------------------------------------------------------

-- Bloque 2.1: Efesios 2:1-10
INSERT INTO public.block_explanations (
    block_id,
    introduction,
    biblical_passage_rvr1960,
    passage_explanation,
    key_concepts,
    central_ideas,
    key_phrases,
    reading_instruction
)
VALUES (
    'b0000002-0001-0000-0000-000000000001',
    'Pablo contrasta radicalmente la condición desesperada del ser humano sin Cristo (muerto en pecados) con la iniciativa soberana de Dios que por pura gracia nos da vida y nos salva mediante la fe para buenas obras.',
    '1 Y él os dio vida a vosotros, cuando estabais muertos en vuestros delitos y pecados,
2 en los cuales anduvisteis en otro tiempo, siguiendo la corriente de este mundo, conforme al príncipe de la potestad del aire, el espíritu que ahora opera en los hijos de desobediencia,
3 entre los cuales también todos nosotros vivimos en otro tiempo en los deseos de nuestra carne, haciendo la voluntad de la carne y de los pensamientos, y éramos por naturaleza hijos de ira, lo mismo que los demás.
4 Pero Dios, que es rico en misericordia, por su gran amor con que nos amó,
5 aun estando nosotros muertos en pecados, nos dio vida juntamente con Cristo (por gracia sois salvos),
6 y juntamente con él nos resucitó, y asimismo nos hizo sentar en los lugares celestiales con Cristo Jesús,
7 para mostrar en los siglos venideros las abundantes riquezas de su gracia en su bondad para con nosotros en Cristo Jesús.
8 Porque por gracia sois salvos por medio de la fe; y esto no de vosotros, pues es don de Dios;
9 no por obras, para que nadie se gloríe.
10 Porque somos hechura suya, creados en Cristo Jesús para buenas obras, las cuales Dios preparó de antemano para que anduviésemos en ellas.',
    'Este pasaje es una de las declaraciones teológicas más trascendentales de todas las Escrituras:

1. El diagnóstico de la condición humana (v. 1-3):
Antes de Cristo, el ser humano no estaba simplemente enfermo o débil, sino "muerto en delitos y pecados". Estaba dominado por tres fuerzas enemigas:
- El mundo ("la corriente de este mundo"): la cultura y sistema alejado de Dios.
- El diablo ("el príncipe de la potestad del aire"): el espíritu que opera en los rebeldes.
- La carne ("los deseos de nuestra carne"): la naturaleza humana caída.
Por tanto, éramos "por naturaleza hijos de ira", merecedores del juicio divino.

2. La intervención de la misericordia divina (v. 4-7):
El punto de inflexión es: "Pero Dios...". No intervino por nuestras obras, sino porque "es rico en misericordia, por su gran amor con que nos amó".
Estando muertos, Dios hizo tres cosas en unión con Cristo:
a) Nos dio vida juntamente con Cristo.
b) Nos resucitó juntamente con Él.
c) Nos hizo sentar en los lugares celestiales con Cristo Jesús.

3. La doctrina de la salvación por gracia (v. 8-9):
"Porque por gracia sois salvos por medio de la fe; y esto no de vosotros, pues es don de Dios; no por obras, para que nadie se gloríe".
- La causa eficiente de la salvación es la gracia (el favor no merecido de Dios).
- El instrumento de recepción es la fe (confianza exclusiva en Cristo, no una obra humana meritoria).
- La salvación completa es un "don de Dios", excluyendo absolutamente toda jactancia personal.

4. El propósito de la salvación: buenas obras (v. 10):
Las buenas obras no son la raíz o causa de la salvación, sino su fruto necesario. Somos "hechura suya" (su poema u obra maestra espiritual), creados en Cristo Jesús "para buenas obras, las cuales Dios preparó de antemano para que anduviésemos en ellas".',
    '[
        {"concept": "Muertos en pecados", "definition": "Incapacidad y alienación espiritual absoluta respecto a Dios; la imposibilidad del ser humano de salvarse o justificarse a sí mismo."},
        {"concept": "Gracia", "definition": "El favor inmerecido y generoso de Dios que otorga salvación, vida eterna y bendición a quien merecía juicio."},
        {"concept": "Don de Dios", "definition": "Un regalo soberano y gratuito otorgado por Dios que no puede ser comprado, ganado ni merecido por el hombre."},
        {"concept": "Hechura suya", "definition": "Del griego poiēma, creación u obra de arte exclusiva de Dios producida por medio de la regeneración en Cristo."}
    ]'::jsonb,
    '[
        "El ser humano sin Cristo está espiritualmente muerto e impotente en sus pecados.",
        "Dios toma la iniciativa de salvar por causa de su abundante misericordia y su gran amor.",
        "La salvación es un regalo inmerecido recibido únicamente por medio de la fe en Cristo, nunca por méritos u obras humanas.",
        "Las buenas obras son el fruto y diseño de la nueva vida creada en Cristo, no el medio para obtenerla."
    ]'::jsonb,
    '[
        {"phrase": "Y él os dio vida a vosotros, cuando estabais muertos en vuestros delitos y pecados", "reference": "Efesios 2:1"},
        {"phrase": "Pero Dios, que es rico en misericordia, por su gran amor con que nos amó", "reference": "Efesios 2:4"},
        {"phrase": "Porque por gracia sois salvos por medio de la fe", "reference": "Efesios 2:8"},
        {"phrase": "No por obras, para que nadie se gloríe", "reference": "Efesios 2:9"},
        {"phrase": "Porque somos hechura suya, creados en Cristo Jesús para buenas obras", "reference": "Efesios 2:10"}
    ]'::jsonb,
    'Lee detenidamente Efesios 2:1-10 directamente en tu Biblia Reina-Valera 1960. Marca la lectura como completada para realizar la evaluación del bloque.'
)
ON CONFLICT (block_id) DO UPDATE SET
    introduction = EXCLUDED.introduction,
    passage_explanation = EXCLUDED.passage_explanation,
    key_concepts = EXCLUDED.key_concepts,
    central_ideas = EXCLUDED.central_ideas,
    key_phrases = EXCLUDED.key_phrases;

-- Bloque 2.2: Efesios 2:11-13
INSERT INTO public.block_explanations (
    block_id,
    introduction,
    biblical_passage_rvr1960,
    passage_explanation,
    key_concepts,
    central_ideas,
    key_phrases,
    reading_instruction
)
VALUES (
    'b0000002-0002-0000-0000-000000000002',
    'Pablo exhorta a los gentiles a recordar su trágica exclusión histórica de los pactos de Dios, y cómo la sangre de Cristo anuló esa distancia infinita.',
    '11 Por tanto, acordaos de que en otro tiempo vosotros, los gentiles en cuanto a la carne, erais llamados incircuncisión por la llamada circuncisión hecha con mano en la carne.
12 En aquel tiempo estabais sin Cristo, alejados de la ciudadanía de Israel y ajenos a los pactos de la promesa, sin esperanza y sin Dios en el mundo.
13 Pero ahora en Cristo Jesús, vosotros que en otro tiempo estabais lejos, habéis sido hechos cercanos por la sangre de Cristo.',
    'Pablo llama a los creyentes a la memoria histórica para valorar la magnitud de la gracia recibida:

1. La discriminación externa del pasado (v. 11):
Los gentiles eran despreciados por los judíos y calificados como "incircuncisión" por aquellos que ostentaban la "circuncisión hecha con mano en la carne", una señal externa que con frecuencia se había transformado en orgullo étnico y legalista.

2. Las cinco trágicas privaciones del gentil (v. 12):
Antes del evangelio, los gentiles se encontraban en una bancarrota espiritual total:
a) "Sin Cristo": privados del conocimiento del Mesías y de su redención.
b) "Alejados de la ciudadanía de Israel": excluidos de la teocracia y del pueblo escogido.
c) "Ajenos a los pactos de la promesa": sin parte en los pactos sagrados (abrahámico, davídico) que prometían bendición.
d) "Sin esperanza": sin ninguna expectativa certera de resurrección ni gloria eterna.
e) "Sin Dios en el mundo": viviendo en el ateísmo práctico o la idolatría pagana vacía.

3. La gloriosa transformación por la sangre de Cristo (v. 13):
"Pero ahora en Cristo Jesús, vosotros que en otro tiempo estabais lejos, habéis sido hechos cercanos por la sangre de Cristo".
La cruz de Cristo eliminó la barrera espiritual: la sangre del Redentor no solo perdona el pecado individual, sino que acerca a los que estaban alejados, integrándolos plenamente en la comunión divina.',
    '[
        {"concept": "Gentiles", "definition": "Todas las personas y naciones que no pertenecían al pueblo étnico de Israel según la carne."},
        {"concept": "Pactos de la promesa", "definition": "Los solemnes acuerdos y promesas redentoras que Dios estableció en el Antiguo Testamento anunciando salvación y un reino venidero."},
        {"concept": "Hechos cercanos", "definition": "La reconciliación de posición que permite a quienes estaban excluidos entrar confiadamente a la presencia de Dios."},
        {"concept": "La sangre de Cristo", "definition": "El sacrificio expiatorio y sustitutivo de Jesús en la cruz que purifica y derriba toda barrera espiritual."}
    ]'::jsonb,
    '[
        "Los gentiles estaban históricamente privados de las promesas, los pactos, la esperanza y la revelación del Dios verdadero.",
        "Ninguna persona puede jactarse de una herencia o ritual externo como la circuncisión de la carne.",
        "La sangre de Jesucristo es el único medio eficaz que acorta la distancia y acerca al pecador alejado hacia Dios."
    ]'::jsonb,
    '[
        {"phrase": "Ajenos a los pactos de la promesa, sin esperanza y sin Dios en el mundo", "reference": "Efesios 2:12"},
        {"phrase": "Habéis sido hechos cercanos por la sangre de Cristo", "reference": "Efesios 2:13"}
    ]'::jsonb,
    'Lee atentamente Efesios 2:11-13 en tu Biblia Reina-Valera 1960 y marca el bloque como leído para iniciar la evaluación.'
)
ON CONFLICT (block_id) DO UPDATE SET
    introduction = EXCLUDED.introduction,
    passage_explanation = EXCLUDED.passage_explanation,
    key_concepts = EXCLUDED.key_concepts,
    central_ideas = EXCLUDED.central_ideas,
    key_phrases = EXCLUDED.key_phrases;

-- Bloque 2.3: Efesios 2:14-18
INSERT INTO public.block_explanations (
    block_id,
    introduction,
    biblical_passage_rvr1960,
    passage_explanation,
    key_concepts,
    central_ideas,
    key_phrases,
    reading_instruction
)
VALUES (
    'b0000002-0003-0000-0000-000000000003',
    'Cristo no solo otorga la paz, sino que Él mismo es nuestra paz: destruyó la pared intermedia de separación y reconcilió a judíos y gentiles en un solo cuerpo por la cruz.',
    '14 Porque él es nuestra paz, que de ambos pueblos hizo uno, derribando la pared intermedia de separación,
15 aboliendo en su carne las enemistades, la ley de los mandamientos expresados en ordenanzas, para crear en sí mismo de los dos un solo y nuevo hombre, haciendo la paz,
16 y mediante la cruz reconciliar con Dios a ambos en un solo cuerpo, matando en ella las enemistades.
17 Y vino y anunció las buenas nuevas de paz a vosotros que estabais lejos, y a los que estaban cerca;
18 porque por medio de él los unos y los otros tenemos entrada por un mismo Espíritu al Padre.',
    'Este pasaje proclama la reconciliación comunitaria y teológica lograda en el Calvario:

1. Cristo es nuestra paz (v. 14):
Jesús no es un mero mediador pasivo; "él es nuestra paz". Realizó dos actos asombrosos:
- "De ambos pueblos hizo uno": fusionó al pueblo judío creyente y al pueblo gentil creyente.
- "Derribó la pared intermedia de separación": alusión al muro del templo de Jerusalén (el Soreg) que advertía a los gentiles pena de muerte si pasaban a los atrios interiores.

2. La abolición de las enemistades ceremoniales (v. 15):
Cristo abolió en su cuerpo sacrificado la ley ceremonial ("la ley de los mandamientos expresados en ordenanzas") que funcionaba como un muro divisorio entre judíos y gentiles.
Su propósito: "para crear en sí mismo de los dos un solo y nuevo hombre, haciendo la paz". No hizo al gentil judío, ni al judío gentil: creó una nueva humanidad redimida, la Iglesia.

3. Reconciliación con Dios en un solo cuerpo (v. 16):
La cruz tuvo una dimensión vertical y horizontal: reconcilió a ambos pueblos con Dios "en un solo cuerpo", matando la enemistad en la cruz.

4. El anuncio de paz y el acceso trinitario (v. 17-18):
Jesús proclamó paz a los que estaban lejos (gentiles) y a los que estaban cerca (judíos).
El versículo 18 es profundamente trinitario: "porque por medio de él [Cristo] los unos y los otros tenemos entrada por un mismo Espíritu al Padre". Ambos tienen el mismo e idéntico acceso a Dios.',
    '[
        {"concept": "Él es nuestra paz", "definition": "Afirmación de que Cristo es la persona, la causa y la encarnación viva de la reconciliación entre Dios y los hombres, y entre seres humanos divididos."},
        {"concept": "Pared intermedia de separación", "definition": "La barrera ritual y legal que separaba a los judíos de las naciones gentiles, ejemplificada en el muro divisorio del templo."},
        {"concept": "Un solo y nuevo hombre", "definition": "La nueva creación colectiva (la Iglesia de Cristo) donde desaparecen las hostilidades y divisiones étnicas ante Dios."},
        {"concept": "Entrada al Padre", "definition": "El derecho libre y confiado de acceso a la presencia del Dios Todopoderoso a través del sacrificio de Cristo mediante el Espíritu Santo."}
    ]'::jsonb,
    '[
        "Jesucristo derribó toda barrera de hostilidad étnica y religiosa entre judíos y gentiles.",
        "En la cruz, Dios no asimiló un pueblo en otro, sino que creó una identidad espiritual completamente nueva: la Iglesia.",
        "La cruz mató la enemistad hacia Dios y la enemistad entre los seres humanos.",
        "Tanto judíos como gentiles tienen el mismo e idéntico acceso al Padre por medio del mismo Espíritu."
    ]'::jsonb,
    '[
        {"phrase": "Porque él es nuestra paz, que de ambos pueblos hizo uno", "reference": "Efesios 2:14"},
        {"phrase": "Para crear en sí mismo de los dos un solo y nuevo hombre, haciendo la paz", "reference": "Efesios 2:15"},
        {"phrase": "Y mediante la cruz reconciliar con Dios a ambos en un solo cuerpo", "reference": "Efesios 2:16"},
        {"phrase": "Tenemos entrada por un mismo Espíritu al Padre", "reference": "Efesios 2:18"}
    ]'::jsonb,
    'Lee atentamente Efesios 2:14-18 directamente en tu Biblia Reina-Valera 1960. Marca la lectura como completada para realizar la evaluación.'
)
ON CONFLICT (block_id) DO UPDATE SET
    introduction = EXCLUDED.introduction,
    passage_explanation = EXCLUDED.passage_explanation,
    key_concepts = EXCLUDED.key_concepts,
    central_ideas = EXCLUDED.central_ideas,
    key_phrases = EXCLUDED.key_phrases;

-- Bloque 2.4: Efesios 2:19-22
INSERT INTO public.block_explanations (
    block_id,
    introduction,
    biblical_passage_rvr1960,
    passage_explanation,
    key_concepts,
    central_ideas,
    key_phrases,
    reading_instruction
)
VALUES (
    'b0000002-0004-0000-0000-000000000004',
    'Pablo concluye el capítulo 2 describiendo la nueva condición de los creyentes: conciudadanos del reino de Dios, miembros de su familia y piedras vivas de un templo santo donde Dios mora.',
    '19 Así que ya no sois extranjeros ni advenedizos, sino conciudadanos de los santos, y miembros de la familia de Dios,
20 edificados sobre el fundamento de los apóstoles y profetas, siendo la principal piedra del ángulo Jesucristo mismo,
21 en quien todo el edificio, bien coordinado, va creciendo para ser un templo santo en el Señor;
22 en quien vosotros también sois juntamente edificados para morada de Dios en el Espíritu.',
    'Este pasaje ofrece tres hermosas metáforas sobre la identidad corporativa de la Iglesia:

1. De extranjeros a ciudadanos y familiares (v. 19):
"Así que ya no sois extranjeros ni advenedizos":
- En el imperio antiguo, el "extranjero" carecía de derechos civiles y el "advenedizo" era un residente temporal sin estatus legal pleno.
- Ahora los creyentes gentiles son:
  a) "Conciudadanos de los santos": comparten la plena ciudadanía del reino eterno de Dios.
  b) "Miembros de la familia de Dios": tienen la intimidad y protección de los hijos en la misma casa paterna.

2. El edificio espiritual y sus cimientos (v. 20):
La Iglesia es comparada con un magnífico edificio:
- "El fundamento de los apóstoles y profetas": la doctrina y revelación inspirada del evangelio transmitida por ellos.
- "La principal piedra del ángulo Jesucristo mismo": en la arquitectura antigua, la piedra angular era la piedra maestra de la esquina que sostenía el edificio, alineaba las paredes y garantizaba la estabilidad de toda la estructura.

3. El templo santo y morada de Dios (v. 21-22):
Todo el edificio, "bien coordinado" en Cristo, no permanece estático, sino que "va creciendo para ser un templo santo en el Señor".
El templo del Nuevo Pacto no está edificado de ladrillos de barro en Jerusalén o Éfeso, sino de personas regeneradas ("vosotros también sois juntamente edificados") para ser "morada de Dios en el Espíritu".',
    '[
        {"concept": "Conciudadanos de los santos", "definition": "Posición de poseer plenos derechos espirituales y perpetuos en el reino de Dios junto con todos los redimidos de todas las épocas."},
        {"concept": "Familia de Dios", "definition": "La relación íntima y paternal donde los creyentes comparten la vida, la herencia y el amor del mismo Padre celestial."},
        {"concept": "Piedra del ángulo", "definition": "La piedra fundamental que determina la orientación, solidez y unión de todo el edificio; tipo supremo de Cristo."},
        {"concept": "Morada de Dios en el Espíritu", "definition": "La presencia real y santa de Dios que habita no en santuarios materiales, sino en la comunidad de su pueblo."}
    ]'::jsonb,
    '[
        "Los creyentes gentiles ya no son ciudadanos de segunda categoría ni forasteros temporales ante Dios.",
        "La Iglesia está fundada sobre la doctrina apostólica y profética revelada, teniendo a Jesucristo como su piedra angular insustituible.",
        "La Iglesia es un templo viviente y santo donde Dios habita por medio de su Santo Espíritu."
    ]'::jsonb,
    '[
        {"phrase": "Así que ya no sois extranjeros ni advenedizos, sino conciudadanos de los santos", "reference": "Efesios 2:19"},
        {"phrase": "Siendo la principal piedra del ángulo Jesucristo mismo", "reference": "Efesios 2:20"},
        {"phrase": "Juntamente edificados para morada de Dios en el Espíritu", "reference": "Efesios 2:22"}
    ]'::jsonb,
    'Lee atentamente Efesios 2:19-22 en tu Biblia Reina-Valera 1960. Marca como leído para habilitar la evaluación del bloque.'
)
ON CONFLICT (block_id) DO UPDATE SET
    introduction = EXCLUDED.introduction,
    passage_explanation = EXCLUDED.passage_explanation,
    key_concepts = EXCLUDED.key_concepts,
    central_ideas = EXCLUDED.central_ideas,
    key_phrases = EXCLUDED.key_phrases;

-- ------------------------------------------------------------------------------
-- 2. PREGUNTAS Y EVALUACIONES DE LOS BLOQUES DE EFESIOS 2
-- ------------------------------------------------------------------------------

-- PREGUNTAS BLOQUE 2.1 (Efesios 2:1-10)
INSERT INTO public.questions (id, block_id, chapter_id, question_type, prompt, verse_reference, explanation, points, difficulty, order_index, is_active)
VALUES
(
    'q0002001-0001-0000-0000-000000000001',
    'b0000002-0001-0000-0000-000000000002',
    'c0000000-0000-0000-0000-000000000002',
    'multiple_choice',
    'Según Efesios 2:1, ¿en qué condición espiritual se encontraban los creyentes antes de que Dios les diera vida?',
    'Efesios 2:1',
    'Efesios 2:1 afirma textualmente: "...cuando estabais muertos en vuestros delitos y pecados".',
    10, 'easy', 1, true
),
(
    'q0002001-0002-0000-0000-000000000002',
    'b0000002-0001-0000-0000-000000000002',
    'c0000000-0000-0000-0000-000000000002',
    'multiple_choice',
    'De acuerdo con Efesios 2:4-5, ¿por qué razón Dios nos dio vida juntamente con Cristo aun estando muertos en pecados?',
    'Efesios 2:4-5',
    'Efesios 2:4 señala: "Pero Dios, que es rico en misericordia, por su gran amor con que nos amó...".',
    10, 'easy', 2, true
),
(
    'q0002001-0003-0000-0000-000000000003',
    'b0000002-0001-0000-0000-000000000002',
    'c0000000-0000-0000-0000-000000000002',
    'fill_blank',
    'Completa Efesios 2:8: "Porque por gracia sois salvos por medio de la ________; y esto no de vosotros, pues es don de Dios".',
    'Efesios 2:8',
    'La palabra textual que completa la cita es "fe".',
    10, 'easy', 3, true
),
(
    'q0002001-0004-0000-0000-000000000004',
    'b0000002-0001-0000-0000-000000000002',
    'c0000000-0000-0000-0000-000000000002',
    'true_false',
    'Efesios 2:9 enseña que la salvación es por obras humanas para que podamos gloriarnos ante Dios.',
    'Efesios 2:9',
    'Falso. Efesios 2:9 declara explícitamente: "no por obras, para que nadie se gloríe".',
    10, 'easy', 4, true
),
(
    'q0002001-0005-0000-0000-000000000005',
    'b0000002-0001-0000-0000-000000000002',
    'c0000000-0000-0000-0000-000000000002',
    'multiple_choice',
    'Según Efesios 2:10, ¿para qué fuimos creados en Cristo Jesús como hechura de Dios?',
    'Efesios 2:10',
    'Efesios 2:10 explica: "creados en Cristo Jesús para buenas obras, las cuales Dios preparó de antemano para que anduviésemos en ellas".',
    10, 'medium', 5, true
),
(
    'q0002001-0006-0000-0000-000000000006',
    'b0000002-0001-0000-0000-000000000002',
    'c0000000-0000-0000-0000-000000000002',
    'reference_identification',
    '¿En qué versículo de Efesios se encuentra la declaración: "Porque somos hechura suya, creados en Cristo Jesús para buenas obras"?',
    'Efesios 2:10',
    'Esta célebre frase corresponde a Efesios 2:10.',
    10, 'easy', 6, true
),
(
    'q0002001-0007-0000-0000-000000000007',
    'b0000002-0001-0000-0000-000000000002',
    'c0000000-0000-0000-0000-000000000002',
    'order_events',
    'Ordena el flujo de las verdades expuestas por Pablo en Efesios 2:1-10:',
    'Efesios 2:1-10',
    'El orden es: 1) Estábamos muertos en delitos y pecados, 2) Dios nos dio vida juntamente con Cristo por su gran amor, 3) Somos salvos por gracia por medio de la fe, 4) Creados en Cristo para buenas obras.',
    10, 'hard', 7, true
)
ON CONFLICT (id) DO NOTHING;

-- Opciones Bloque 2.1
INSERT INTO public.question_options (question_id, option_text, is_correct, order_index, correct_order_position)
VALUES
-- q1: multiple_choice
('q0002001-0001-0000-0000-000000000001', 'Muertos en vuestros delitos y pecados', true, 1, null),
('q0002001-0001-0000-0000-000000000001', 'Enfermos buscando al Señor sinceramente', false, 2, null),
('q0002001-0001-0000-0000-000000000001', 'Justos según la ley de Moisés', false, 3, null),
('q0002001-0001-0000-0000-000000000001', 'Ignorantes pero inocentes de toda culpa', false, 4, null),

-- q2: multiple_choice
('q0002001-0002-0000-0000-000000000002', 'Por su abundante misericordia y por su gran amor', true, 1, null),
('q0002001-0002-0000-0000-000000000002', 'Porque el ser humano decidió obedecer la ley ceremonial', false, 2, null),
('q0002001-0002-0000-0000-000000000002', 'Por los méritos morales acumulados por los efesios', false, 3, null),
('q0002001-0002-0000-0000-000000000002', 'Por una obligación legal que Dios tenía con Adán', false, 4, null),

-- q3: fill_blank
('q0002001-0003-0000-0000-000000000003', 'fe', true, 1, null),

-- q4: true_false
('q0002001-0004-0000-0000-000000000004', 'Verdadero', false, 1, null),
('q0002001-0004-0000-0000-000000000004', 'Falso', true, 2, null),

-- q5: multiple_choice
('q0002001-0005-0000-0000-000000000005', 'Para buenas obras, las cuales Dios preparó de antemano', true, 1, null),
('q0002001-0005-0000-0000-000000000005', 'Para vivir ociosamente sin ningún compromiso moral', false, 2, null),
('q0002001-0005-0000-0000-000000000005', 'Para continuar viviendo conforme a los deseos de la carne', false, 3, null),
('q0002001-0005-0000-0000-000000000005', 'Para ganar la justificación mediante ritos religiosos', false, 4, null),

-- q6: reference_identification
('q0002001-0006-0000-0000-000000000006', 'Efesios 2:10', true, 1, null),
('q0002001-0006-0000-0000-000000000006', 'Efesios 2:1', false, 2, null),
('q0002001-0006-0000-0000-000000000006', 'Efesios 2:5', false, 3, null),
('q0002001-0006-0000-0000-000000000006', 'Efesios 2:8', false, 4, null),

-- q7: order_events
('q0002001-0007-0000-0000-000000000007', 'Estabais muertos en vuestros delitos y pecados (v. 1)', true, 1, 1),
('q0002001-0007-0000-0000-000000000007', 'Dios nos dio vida juntamente con Cristo por su gran amor (v. 4-5)', true, 2, 2),
('q0002001-0007-0000-0000-000000000007', 'Por gracia sois salvos por medio de la fe; no por obras (v. 8-9)', true, 3, 3),
('q0002001-0007-0000-0000-000000000007', 'Creados en Cristo Jesús para buenas obras preparadas de antemano (v. 10)', true, 4, 4)
ON CONFLICT (id) DO NOTHING;

-- Asociar preguntas Bloque 2.1
INSERT INTO public.assessment_questions (assessment_id, question_id, order_index)
VALUES
('e0000002-0001-0000-0000-000000000001', 'q0002001-0001-0000-0000-000000000001', 1),
('e0000002-0001-0000-0000-000000000001', 'q0002001-0002-0000-0000-000000000002', 2),
('e0000002-0001-0000-0000-000000000001', 'q0002001-0003-0000-0000-000000000003', 3),
('e0000002-0001-0000-0000-000000000001', 'q0002001-0004-0000-0000-000000000004', 4),
('e0000002-0001-0000-0000-000000000001', 'q0002001-0005-0000-0000-000000000005', 5),
('e0000002-0001-0000-0000-000000000001', 'q0002001-0006-0000-0000-000000000006', 6),
('e0000002-0001-0000-0000-000000000001', 'q0002001-0007-0000-0000-000000000007', 7)
ON CONFLICT DO NOTHING;

-- PREGUNTAS BLOQUE 2.2 (Efesios 2:11-13)
INSERT INTO public.questions (id, block_id, chapter_id, question_type, prompt, verse_reference, explanation, points, difficulty, order_index, is_active)
VALUES
(
    'q0002002-0001-0000-0000-000000000001',
    'b0000002-0002-0000-0000-000000000002',
    'c0000000-0000-0000-0000-000000000002',
    'multiple_choice',
    'Según Efesios 2:12, ¿cuáles eran las condiciones en que se encontraban los gentiles en aquel tiempo antes de Cristo?',
    'Efesios 2:12',
    'Efesios 2:12 resume: "sin Cristo, alejados de la ciudadanía de Israel y ajenos a los pactos de la promesa, sin esperanza y sin Dios en el mundo".',
    10, 'easy', 1, true
),
(
    'q0002002-0002-0000-0000-000000000002',
    'b0000002-0002-0000-0000-000000000002',
    'c0000000-0000-0000-0000-000000000002',
    'fill_blank',
    'Completa Efesios 2:13: "vosotros que en otro tiempo estabais lejos, habéis sido hechos cercanos por la ________ de Cristo".',
    'Efesios 2:13',
    'Efesios 2:13 afirma: "...habéis sido hechos cercanos por la sangre de Cristo".',
    10, 'easy', 2, true
),
(
    'q0002002-0003-0000-0000-000000000003',
    'b0000002-0002-0000-0000-000000000002',
    'c0000000-0000-0000-0000-000000000002',
    'true_false',
    'En Efesios 2:11, Pablo recuerda que los gentiles eran llamados incircuncisión por la llamada circuncisión hecha con mano en la carne.',
    'Efesios 2:11',
    'Verdadero. Efesios 2:11 alude a esta distinción étnica y ritual del pasado.',
    10, 'easy', 3, true
),
(
    'q0002002-0004-0000-0000-000000000004',
    'b0000002-0002-0000-0000-000000000002',
    'c0000000-0000-0000-0000-000000000002',
    'multiple_choice',
    '¿Qué significa que los gentiles estaban "sin esperanza y sin Dios en el mundo" (Efesios 2:12)?',
    'Efesios 2:12',
    'Significa que carecían de la revelación redentora del Dios verdadero y no tenían una expectativa segura de salvación y vida eterna.',
    10, 'medium', 4, true
),
(
    'q0002002-0005-0000-0000-000000000005',
    'b0000002-0002-0000-0000-000000000002',
    'c0000000-0000-0000-0000-000000000002',
    'reference_identification',
    '¿En qué versículo de Efesios se declara que los que estaban lejos fueron hechos cercanos por la sangre de Cristo?',
    'Efesios 2:13',
    'Esta afirmación se encuentra en Efesios 2:13.',
    10, 'easy', 5, true
),
(
    'q0002002-0006-0000-0000-000000000006',
    'b0000002-0002-0000-0000-000000000002',
    'c0000000-0000-0000-0000-000000000002',
    'multiple_choice',
    '¿A qué pactos eran ajenos los gentiles según la enseñanza explícita de Efesios 2:12?',
    'Efesios 2:12',
    'Efesios 2:12 especifica: "ajenos a los pactos de la promesa".',
    10, 'medium', 6, true
)
ON CONFLICT (id) DO NOTHING;

-- Opciones Bloque 2.2
INSERT INTO public.question_options (question_id, option_text, is_correct, order_index)
VALUES
-- q1: multiple_choice
('q0002002-0001-0000-0000-000000000001', 'Sin Cristo, alejados de la ciudadanía de Israel, ajenos a los pactos, sin esperanza y sin Dios', true, 1),
('q0002002-0001-0000-0000-000000000001', 'Prósperos y justos gracias a la filosofía griega', false, 2),
('q0002002-0001-0000-0000-000000000001', 'Guardando los mandamientos de la ley en secreto', false, 3),
('q0002002-0001-0000-0000-000000000001', 'Gobernando espiritualmente sobre los judíos', false, 4),

-- q2: fill_blank
('q0002002-0002-0000-0000-000000000002', 'sangre', true, 1),

-- q3: true_false
('q0002002-0003-0000-0000-000000000003', 'Verdadero', true, 1),
('q0002002-0003-0000-0000-000000000003', 'Falso', false, 2),

-- q4: multiple_choice
('q0002002-0004-0000-0000-000000000004', 'Carecían de la revelación del Dios verdadero y de la promesa cierta de gloria eterna', true, 1),
('q0002002-0004-0000-0000-000000000004', 'No tenían templos paganos en Éfeso', false, 2),
('q0002002-0004-0000-0000-000000000004', 'Eran pobres materialmente', false, 3),
('q0002002-0004-0000-0000-000000000004', 'Carecían de ejército militar', false, 4),

-- q5: reference_identification
('q0002002-0005-0000-0000-000000000005', 'Efesios 2:13', true, 1),
('q0002002-0005-0000-0000-000000000005', 'Efesios 2:11', false, 2),
('q0002002-0005-0000-0000-000000000005', 'Efesios 2:12', false, 3),
('q0002002-0005-0000-0000-000000000005', 'Efesios 2:14', false, 4),

-- q6: multiple_choice
('q0002002-0006-0000-0000-000000000006', 'A los pactos de la promesa', true, 1),
('q0002002-0006-0000-0000-000000000006', 'A los tratados comerciales romanos', false, 2),
('q0002002-0006-0000-0000-000000000006', 'A las ordenanzas sacerdotales de Diana', false, 3),
('q0002002-0006-0000-0000-000000000006', 'A los votos de los nazareos', false, 4)
ON CONFLICT (id) DO NOTHING;

-- Asociar preguntas Bloque 2.2
INSERT INTO public.assessment_questions (assessment_id, question_id, order_index)
VALUES
('e0000002-0002-0000-0000-000000000002', 'q0002002-0001-0000-0000-000000000001', 1),
('e0000002-0002-0000-0000-000000000002', 'q0002002-0002-0000-0000-000000000002', 2),
('e0000002-0002-0000-0000-000000000002', 'q0002002-0003-0000-0000-000000000003', 3),
('e0000002-0002-0000-0000-000000000002', 'q0002002-0004-0000-0000-000000000004', 4),
('e0000002-0002-0000-0000-000000000002', 'q0002002-0005-0000-0000-000000000005', 5),
('e0000002-0002-0000-0000-000000000002', 'q0002002-0006-0000-0000-000000000006', 6)
ON CONFLICT DO NOTHING;

-- PREGUNTAS BLOQUE 2.3 (Efesios 2:14-18)
INSERT INTO public.questions (id, block_id, chapter_id, question_type, prompt, verse_reference, explanation, points, difficulty, order_index, is_active)
VALUES
(
    'q0002003-0001-0000-0000-000000000001',
    'b0000002-0003-0000-0000-000000000003',
    'c0000000-0000-0000-0000-000000000002',
    'multiple_choice',
    'Según Efesios 2:14, ¿qué hizo Cristo con los dos pueblos (judíos y gentiles) y qué derribó?',
    'Efesios 2:14',
    'Efesios 2:14 declara: "Porque él es nuestra paz, que de ambos pueblos hizo uno, derribando la pared intermedia de separación".',
    10, 'easy', 1, true
),
(
    'q0002003-0002-0000-0000-000000000002',
    'b0000002-0003-0000-0000-000000000003',
    'c0000000-0000-0000-0000-000000000002',
    'fill_blank',
    'Completa Efesios 2:15: "para crear en sí mismo de los dos un solo y ________ hombre, haciendo la paz".',
    'Efesios 2:15',
    'Efesios 2:15 dice textualmente: "...un solo y nuevo hombre, haciendo la paz".',
    10, 'medium', 2, true
),
(
    'q0002003-0003-0000-0000-000000000003',
    'b0000002-0003-0000-0000-000000000003',
    'c0000000-0000-0000-0000-000000000002',
    'multiple_choice',
    '¿A través de qué instrumento reconcilió Cristo con Dios a ambos pueblos en un solo cuerpo según Efesios 2:16?',
    'Efesios 2:16',
    'Efesios 2:16 afirma: "y mediante la cruz reconciliar con Dios a ambos en un solo cuerpo, matando en ella las enemistades".',
    10, 'easy', 3, true
),
(
    'q0002003-0004-0000-0000-000000000004',
    'b0000002-0003-0000-0000-000000000003',
    'c0000000-0000-0000-0000-000000000002',
    'true_false',
    'Efesios 2:18 afirma que por medio de Cristo tanto judíos como gentiles tenemos entrada por un mismo Espíritu al Padre.',
    'Efesios 2:18',
    'Verdadero. Efesios 2:18 expone claramente el acceso trinitario de ambos pueblos al Padre.',
    10, 'easy', 4, true
),
(
    'q0002003-0005-0000-0000-000000000005',
    'b0000002-0003-0000-0000-000000000003',
    'c0000000-0000-0000-0000-000000000002',
    'reference_identification',
    '¿En qué versículo de Efesios se declara: "Porque él es nuestra paz, que de ambos pueblos hizo uno"?',
    'Efesios 2:14',
    'Esta afirmación se encuentra en Efesios 2:14.',
    10, 'easy', 5, true
),
(
    'q0002003-0006-0000-0000-000000000006',
    'b0000002-0003-0000-0000-000000000003',
    'c0000000-0000-0000-0000-000000000002',
    'multiple_choice',
    'Según Efesios 2:15, ¿qué abolió Cristo en su carne para eliminar las enemistades?',
    'Efesios 2:15',
    'El texto especifica: "aboliendo en su carne las enemistades, la ley de los mandamientos expresados en ordenanzas".',
    10, 'medium', 6, true
)
ON CONFLICT (id) DO NOTHING;

-- Opciones Bloque 2.3
INSERT INTO public.question_options (question_id, option_text, is_correct, order_index)
VALUES
-- q1: multiple_choice
('q0002003-0001-0000-0000-000000000001', 'De ambos pueblos hizo uno, derribando la pared intermedia de separación', true, 1),
('q0002003-0001-0000-0000-000000000001', 'Estableció dos iglesias separadas por idioma', false, 2),
('q0002003-0001-0000-0000-000000000001', 'Edificó una muralla más alta para proteger a los judíos', false, 3),
('q0002003-0001-0000-0000-000000000001', 'Obligó a los gentiles a guardar la pascua judía', false, 4),

-- q2: fill_blank
('q0002003-0002-0000-0000-000000000002', 'nuevo', true, 1),

-- q3: multiple_choice
('q0002003-0003-0000-0000-000000000003', 'Mediante la cruz', true, 1),
('q0002003-0003-0000-0000-000000000003', 'Mediante tratados políticos en Roma', false, 2),
('q0002003-0003-0000-0000-000000000003', 'Por medio del sacerdocio levítico', false, 3),
('q0002003-0003-0000-0000-000000000003', 'A través de sacrificios en el templo de Jerusalén', false, 4),

-- q4: true_false
('q0002003-0004-0000-0000-000000000004', 'Verdadero', true, 1),
('q0002003-0004-0000-0000-000000000004', 'Falso', false, 2),

-- q5: reference_identification
('q0002003-0005-0000-0000-000000000005', 'Efesios 2:14', true, 1),
('q0002003-0005-0000-0000-000000000005', 'Efesios 2:15', false, 2),
('q0002003-0005-0000-0000-000000000005', 'Efesios 2:16', false, 3),
('q0002003-0005-0000-0000-000000000005', 'Efesios 2:18', false, 4),

-- q6: multiple_choice
('q0002003-0006-0000-0000-000000000006', 'La ley de los mandamientos expresados en ordenanzas', true, 1),
('q0002003-0006-0000-0000-000000000006', 'El mandamiento moral de amar al prójimo', false, 2),
('q0002003-0006-0000-0000-000000000006', 'El conocimiento de las profecías mesiánicas', false, 3),
('q0002003-0006-0000-0000-000000000006', 'Los diez mandamientos dados en el Sinaí', false, 4)
ON CONFLICT (id) DO NOTHING;

-- Asociar preguntas Bloque 2.3
INSERT INTO public.assessment_questions (assessment_id, question_id, order_index)
VALUES
('e0000002-0003-0000-0000-000000000003', 'q0002003-0001-0000-0000-000000000001', 1),
('e0000002-0003-0000-0000-000000000003', 'q0002003-0002-0000-0000-000000000002', 2),
('e0000002-0003-0000-0000-000000000003', 'q0002003-0003-0000-0000-000000000003', 3),
('e0000002-0003-0000-0000-000000000003', 'q0002003-0004-0000-0000-000000000004', 4),
('e0000002-0003-0000-0000-000000000003', 'q0002003-0005-0000-0000-000000000005', 5),
('e0000002-0003-0000-0000-000000000003', 'q0002003-0006-0000-0000-000000000006', 6)
ON CONFLICT DO NOTHING;

-- PREGUNTAS BLOQUE 2.4 (Efesios 2:19-22)
INSERT INTO public.questions (id, block_id, chapter_id, question_type, prompt, verse_reference, explanation, points, difficulty, order_index, is_active)
VALUES
(
    'q0002004-0001-0000-0000-000000000001',
    'b0000002-0004-0000-0000-000000000004',
    'c0000000-0000-0000-0000-000000000002',
    'multiple_choice',
    'Según Efesios 2:19, ¿qué ya no son los creyentes gentiles y qué son ahora?',
    'Efesios 2:19',
    'Efesios 2:19 dice: "ya no sois extranjeros ni advenedizos, sino conciudadanos de los santos, y miembros de la familia de Dios".',
    10, 'easy', 1, true
),
(
    'q0002004-0002-0000-0000-000000000002',
    'b0000002-0004-0000-0000-000000000004',
    'c0000000-0000-0000-0000-000000000002',
    'multiple_choice',
    'De acuerdo con Efesios 2:20, ¿sobre qué fundamento está edificada la iglesia y quién es la principal piedra del ángulo?',
    'Efesios 2:20',
    'Efesios 2:20 indica: "edificados sobre el fundamento de los apóstoles y profetas, siendo la principal piedra del ángulo Jesucristo mismo".',
    10, 'easy', 2, true
),
(
    'q0002004-0003-0000-0000-000000000003',
    'b0000002-0004-0000-0000-000000000004',
    'c0000000-0000-0000-0000-000000000002',
    'fill_blank',
    'Completa Efesios 2:22: "en quien vosotros también sois juntamente edificados para ________ de Dios en el Espíritu".',
    'Efesios 2:22',
    'Efesios 2:22 concluye: "para morada de Dios en el Espíritu".',
    10, 'medium', 3, true
),
(
    'q0002004-0004-0000-0000-000000000004',
    'b0000002-0004-0000-0000-000000000004',
    'c0000000-0000-0000-0000-000000000002',
    'true_false',
    'Efesios 2:21 afirma que todo el edificio de la iglesia, bien coordinado en Cristo, va creciendo para ser un templo santo en el Señor.',
    'Efesios 2:21',
    'Verdadero. El versículo 21 describe el crecimiento orgánico y santo del templo espiritual.',
    10, 'easy', 4, true
),
(
    'q0002004-0005-0000-0000-000000000005',
    'b0000002-0004-0000-0000-000000000004',
    'c0000000-0000-0000-0000-000000000002',
    'reference_identification',
    '¿En qué versículo de Efesios encontramos la frase: "siendo la principal piedra del ángulo Jesucristo mismo"?',
    'Efesios 2:20',
    'Esta definición cristológica se ubica en Efesios 2:20.',
    10, 'easy', 5, true
),
(
    'q0002004-0006-0000-0000-000000000006',
    'b0000002-0004-0000-0000-000000000004',
    'c0000000-0000-0000-0000-000000000002',
    'multiple_choice',
    '¿Qué dos términos usa Pablo en Efesios 2:19 para contrastar la condición previa de exclusión de los gentiles frente a su nueva condición en Cristo?',
    'Efesios 2:19',
    'Pablo dice que ya no son "extranjeros ni advenedizos", sino "conciudadanos y miembros de la familia de Dios".',
    10, 'medium', 6, true
)
ON CONFLICT (id) DO NOTHING;

-- Opciones Bloque 2.4
INSERT INTO public.question_options (question_id, option_text, is_correct, order_index)
VALUES
-- q1: multiple_choice
('q0002004-0001-0000-0000-000000000001', 'Ya no sois extranjeros ni advenedizos, sino conciudadanos de los santos y miembros de la familia de Dios', true, 1),
('q0002004-0001-0000-0000-000000000001', 'Ya no sois sabios en el mundo, sino siervos del templo romano', false, 2),
('q0002004-0001-0000-0000-000000000001', 'Ahora sois gobernadores políticos de la provincia de Asia', false, 3),
('q0002004-0001-0000-0000-000000000001', 'Sois forasteros tolerados en el atrio de los gentiles', false, 4),

-- q2: multiple_choice
('q0002004-0002-0000-0000-000000000002', 'Sobre el fundamento de los apóstoles y profetas, siendo Jesucristo mismo la principal piedra del ángulo', true, 1),
('q0002004-0002-0000-0000-000000000002', 'Sobre las doctrinas de los filósofos de Éfeso', false, 2),
('q0002004-0002-0000-0000-000000000002', 'Sobre el templo de Salomón y sus leyes ceremoniales', false, 3),
('q0002004-0002-0000-0000-000000000002', 'Sobre la tradición oral de los escribas y fariseos', false, 4),

-- q3: fill_blank
('q0002004-0003-0000-0000-000000000003', 'morada', true, 1),

-- q4: true_false
('q0002004-0004-0000-0000-000000000004', 'Verdadero', true, 1),
('q0002004-0004-0000-0000-000000000004', 'Falso', false, 2),

-- q5: reference_identification
('q0002004-0005-0000-0000-000000000005', 'Efesios 2:20', true, 1),
('q0002004-0005-0000-0000-000000000005', 'Efesios 2:19', false, 2),
('q0002004-0005-0000-0000-000000000005', 'Efesios 2:21', false, 3),
('q0002004-0005-0000-0000-000000000005', 'Efesios 2:22', false, 4),

-- q6: multiple_choice
('q0002004-0006-0000-0000-000000000006', 'Extranjeros ni advenedizos', true, 1),
('q0002004-0006-0000-0000-000000000006', 'Soldados ni centuriones', false, 2),
('q0002004-0006-0000-0000-000000000006', 'Esclavos ni libertos', false, 3),
('q0002004-0006-0000-0000-000000000006', 'Griegos ni bárbaros', false, 4)
ON CONFLICT (id) DO NOTHING;

-- Asociar preguntas Bloque 2.4
INSERT INTO public.assessment_questions (assessment_id, question_id, order_index)
VALUES
('e0000002-0004-0000-0000-000000000004', 'q0002004-0001-0000-0000-000000000001', 1),
('e0000002-0004-0000-0000-000000000004', 'q0002004-0002-0000-0000-000000000002', 2),
('e0000002-0004-0000-0000-000000000004', 'q0002004-0003-0000-0000-000000000003', 3),
('e0000002-0004-0000-0000-000000000004', 'q0002004-0004-0000-0000-000000000004', 4),
('e0000002-0004-0000-0000-000000000004', 'q0002004-0005-0000-0000-000000000005', 5),
('e0000002-0004-0000-0000-000000000004', 'q0002004-0006-0000-0000-000000000006', 6)
ON CONFLICT DO NOTHING;


-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
-- ARCHIVO: 003_efesios_capitulo_3.sql
-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

-- ==============================================================================
-- BIBLIONARIO - SEED 003: EFESIOS CAPÍTULO 3 (RVR1960)
-- Explicaciones completas y Evaluaciones de los 2 Bloques (3:1-13 y 3:14-21)
-- ==============================================================================

-- ------------------------------------------------------------------------------
-- 1. EXPLICACIONES DE LOS 2 BLOQUES DE EFESIOS 3
-- ------------------------------------------------------------------------------

-- Bloque 3.1: Efesios 3:1-13
INSERT INTO public.block_explanations (
    block_id,
    introduction,
    biblical_passage_rvr1960,
    passage_explanation,
    key_concepts,
    central_ideas,
    key_phrases,
    reading_instruction
)
VALUES (
    'b0000003-0001-0000-0000-000000000001',
    'Pablo expone el misterio que le fue revelado directamente por Dios: los gentiles no son prosélitos secundarios, sino coherederos y miembros plenos del cuerpo de Cristo.',
    '1 Por esta causa yo Pablo, prisionero de Cristo Jesús por vosotros los gentiles;
2 si es que habéis oído de la administración de la gracia de Dios que me fue dada para con vosotros;
3 que por revelación me fue declarado el misterio, como antes he escrito brevemente,
4 leyendo lo cual podéis entender cuál sea mi conocimiento en el misterio de Cristo,
5 misterio que en otras generaciones no se dio a conocer a los hijos de los hombres, como ahora es revelado a sus santos apóstoles y profetas por el Espíritu:
6 que los gentiles son coherederos y miembros del mismo cuerpo, y copartícipes de la promesa en Cristo Jesús por medio del evangelio,
7 del cual yo fui hecho ministro por el don de la gracia de Dios que me ha sido dado según la operación de su poder.
8 A mí, que soy menos que el más pequeño de todos los santos, me fue dada esta gracia de anunciar entre los gentiles el evangelio de las inescrutables riquezas de Cristo,
9 y de aclarar a todos cuál sea la dispensación del misterio escondido desde los siglos en Dios, que creó todas las cosas;
10 para que la multiforme sabiduría de Dios sea ahora dada a conocer por medio de la iglesia a los principados y potestades en los lugares celestiales,
11 conforme al propósito eterno que hizo en Cristo Jesús nuestro Señor,
12 en quien tenemos seguridad y acceso con confianza por medio de la fe en él;
13 por lo cual pido que no desmayéis a causa de mis tribulaciones por vosotros, las cuales son vuestra gloria.',
    'Pablo profundiza en la revelación del misterio divino y su ministerio a las naciones:

1. El prisionero de Cristo Jesús (v. 1-2):
Pablo escribe desde la prisión romana, pero no se considera prisionero de César, sino "prisionero de Cristo Jesús por vosotros los gentiles". Su encarcelamiento fue consecuencia directa de predicar la inclusión de los gentiles en el pueblo de Dios.

2. La revelación del misterio de Cristo (v. 3-6):
Un "misterio" en el vocabulario paulino no es un enigma incomprensible, sino una verdad que estuvo oculta en el pasado y que ahora Dios ha revelado soberanamente por su Espíritu.
El contenido específico del misterio es triple (v. 6):
a) "Coherederos": comparten la misma herencia divina con Israel.
b) "Miembros del mismo cuerpo" (en griego syssōma): un solo organismo espiritual sin superioridad étnica.
c) "Copartícipes de la promesa": reciben el cumplimiento pleno del Espíritu y la vida eterna en Cristo por medio del evangelio.

3. El ministerio de la gracia y las inescrutables riquezas (v. 7-9):
Con profunda humildad, Pablo se describe como "menos que el más pequeño de todos los santos", reconociendo que su apostolado es puro don. Su comisión es proclamar "las inescrutables riquezas de Cristo" (riquezas insondables e inagotables).

4. La multiforme sabiduría de Dios y los ángeles (v. 10-13):
La Iglesia tiene un propósito cósmico asombroso: ser el escenario donde "la multiforme sabiduría de Dios" (su sabiduría de múltiples matices y riquezas) es exhibida ante los principados y potestades celestiales (las jerarquías angelicales).
En Cristo, el creyente posee "seguridad y acceso con confianza por medio de la fe en él".',
    '[
        {"concept": "Misterio de Cristo", "definition": "El plan eterno de Dios antes oculto, revelado en el evangelio: que los gentiles son integrados en absoluta igualdad con los creyentes judíos en un solo cuerpo."},
        {"concept": "Coherederos y miembros del mismo cuerpo", "definition": "Plena igualdad espiritual y de derechos eternos entre gentiles y judíos en la Iglesia de Cristo."},
        {"concept": "Inescrutables riquezas", "definition": "Las bendiciones, gracia y atributos de Cristo que sobrepasan todo entendimiento y jamás pueden agotarse."},
        {"concept": "Multiforme sabiduría", "definition": "Del griego polupoikilos, la infinita sabiduría de Dios desplegada en una variedad deslumbrante de facetas a través de la salvación de la Iglesia."}
    ]'::jsonb,
    '[
        "El misterio divino consiste en que los gentiles son coherederos y miembros del mismo cuerpo en Cristo mediante el evangelio.",
        "El ministerio apostólico es un don soberano recibido por pura gracia y no por mérito personal.",
        "La Iglesia es el instrumento mediante el cual Dios exhibe su infinita y multiforme sabiduría ante las potestades celestiales.",
        "En Cristo, el creyente tiene entrada, seguridad y libertad de acceso ante la presencia de Dios."
    ]'::jsonb,
    '[
        {"phrase": "Prisionero de Cristo Jesús por vosotros los gentiles", "reference": "Efesios 3:1"},
        {"phrase": "Que los gentiles son coherederos y miembros del mismo cuerpo", "reference": "Efesios 3:6"},
        {"phrase": "El evangelio de las inescrutables riquezas de Cristo", "reference": "Efesios 3:8"},
        {"phrase": "Para que la multiforme sabiduría de Dios sea ahora dada a conocer por medio de la iglesia", "reference": "Efesios 3:10"}
    ]'::jsonb,
    'Lee con atención Efesios 3:1-13 en tu Biblia Reina-Valera 1960. Marca la lectura como completada para realizar la evaluación del bloque.'
)
ON CONFLICT (block_id) DO UPDATE SET
    introduction = EXCLUDED.introduction,
    passage_explanation = EXCLUDED.passage_explanation,
    key_concepts = EXCLUDED.key_concepts,
    central_ideas = EXCLUDED.central_ideas,
    key_phrases = EXCLUDED.key_phrases;

-- Bloque 3.2: Efesios 3:14-21
INSERT INTO public.block_explanations (
    block_id,
    introduction,
    biblical_passage_rvr1960,
    passage_explanation,
    key_concepts,
    central_ideas,
    key_phrases,
    reading_instruction
)
VALUES (
    'b0000003-0002-0000-0000-000000000002',
    'Pablo dobla sus rodillas en una de las oraciones más sublimes de la Escritura, intercediendo por el fortalecimiento interior de los creyentes y culminando en una doxología eterna.',
    '14 Por esta causa doblo mis rodillas ante el Padre de nuestro Señor Jesucristo,
15 de quien toma nombre toda familia en los cielos y en la tierra,
16 para que os dé, conforme a las riquezas de su gloria, el ser fortalecidos con poder en el hombre interior por su Espíritu;
17 para que habite Cristo por la fe en vuestros corazones, a fin de que, arraigados y cimentados en amor,
18 seáis plenamente capaces de comprender con todos los santos cuál sea la anchura, la longitud, la profundidad y la altura,
19 y de conocer el amor de Cristo, que excede a todo conocimiento, para que seáis llenos de toda la plenitud de Dios.
20 Y a Aquel que es poderoso para hacer todas las cosas mucho más abundantemente de lo que pedimos o entendemos, según el poder que actúa en nosotros,
21 a él sea gloria en la iglesia en Cristo Jesús por todas las edades, por los siglos de los siglos. Amén.',
    'Esta oración pastoral y apostólica asciende a las más altas cumbres de la vida espiritual:

1. La postura de reverencia y la paternidad divina (v. 14-15):
"Doblo mis rodillas ante el Padre": la postura física de arrodillarse expresa profunda sumisión, reverencia y fervor. Dios es el gran Padre de quien "toma nombre toda familia en los cielos y en la tierra", fuente de toda paternidad legítima y comunión santa.

2. Las cuatro peticiones progresivas de Pablo (v. 16-19):
a) Poder interior (v. 16): Ser "fortalecidos con poder en el hombre interior por su Espíritu". La verdadera fuerza del cristiano radica en su interior renovado, no en apariencias externas.
b) La morada de Cristo por la fe (v. 17a): Que Cristo "habite" (tome posesión permanente y se sienta cómodo en casa) en nuestros corazones.
c) Arraigo y comprensión del amor inmenso (v. 17b-18): Dos metáforas: "arraigados" (como árbol robusto) y "cimentados" (como edificio inamovible) en amor, para comprender las cuatro dimensiones sagradas: la anchura, longitud, profundidad y altura de la redención.
d) Conocer lo inabarcable (v. 19): "Conocer el amor de Cristo, que excede a todo conocimiento", experimentando lo que supera la pura razón intelectual, hasta ser "llenos de toda la plenitud de Dios".

3. La doxología culminante (v. 20-21):
Pablo concluye con una alabanza conmovedora a Aquel que "es poderoso para hacer todas las cosas mucho más abundantemente de lo que pedimos o entendemos, según el poder que actúa en nosotros".
A Él sea gloria:
- "En la iglesia": la asamblea redimida que testifica de su gracia.
- "En Cristo Jesús": el mediador y cabeza eterna.
- "Por todas las edades, por los siglos de los siglos. Amén".',
    '[
        {"concept": "Hombre interior", "definition": "La dimensión espiritual y moral del creyente regenerado, sustentada y renovada por el Espíritu Santo."},
        {"concept": "Arraigados y cimentados", "definition": "Metáforas tomadas de la botánica (raíces profundas) y la construcción (cimientos sólidos) que describen estabilidad inamovible en el amor."},
        {"concept": "El amor que excede a todo conocimiento", "definition": "El amor sacrificial de Cristo, tan vasto e inagotable que ninguna mente humana puede sondearlo por completo."},
        {"concept": "Doxología", "definition": "Expresión solemne y litúrgica de alabanza y gloria dirigida exclusivamente al Dios Trino."}
    ]'::jsonb,
    '[
        "El Espíritu Santo fortalece con poder el hombre interior del creyente para que pueda resistir y perseverar.",
        "Cristo anhela morar plenamente en el corazón del creyente mediante una fe viva y dependiente.",
        "El amor de Cristo es infinito en sus dimensiones y sobrepasa todo entendimiento meramente humano.",
        "Dios es poderoso para hacer muchísimo más de lo que jamás podamos pedir, soñar o comprender."
    ]'::jsonb,
    '[
        {"phrase": "Doblo mis rodillas ante el Padre de nuestro Señor Jesucristo", "reference": "Efesios 3:14"},
        {"phrase": "Fortalecidos con poder en el hombre interior por su Espíritu", "reference": "Efesios 3:16"},
        {"phrase": "Y de conocer el amor de Cristo, que excede a todo conocimiento", "reference": "Efesios 3:19"},
        {"phrase": "Mucho más abundantemente de lo que pedimos o entendemos", "reference": "Efesios 3:20"},
        {"phrase": "A él sea gloria en la iglesia en Cristo Jesús por todas las edades", "reference": "Efesios 3:21"}
    ]'::jsonb,
    'Lee atentamente Efesios 3:14-21 directamente en tu Biblia Reina-Valera 1960. Marca la lectura como completada para realizar la evaluación del bloque.'
)
ON CONFLICT (block_id) DO UPDATE SET
    introduction = EXCLUDED.introduction,
    passage_explanation = EXCLUDED.passage_explanation,
    key_concepts = EXCLUDED.key_concepts,
    central_ideas = EXCLUDED.central_ideas,
    key_phrases = EXCLUDED.key_phrases;

-- ------------------------------------------------------------------------------
-- 2. PREGUNTAS Y OPCIONES DE LOS BLOQUES DE EFESIOS 3
-- ------------------------------------------------------------------------------

-- PREGUNTAS BLOQUE 3.1 (Efesios 3:1-13)
INSERT INTO public.questions (id, block_id, chapter_id, question_type, prompt, verse_reference, explanation, points, difficulty, order_index, is_active)
VALUES
(
    'q0003001-0001-0000-0000-000000000001',
    'b0000003-0001-0000-0000-000000000001',
    'c0000000-0000-0000-0000-000000000003',
    'multiple_choice',
    '¿Cuál es el misterio que antes no se dio a conocer pero que ahora fue revelado a los apóstoles y profetas (Efesios 3:5-6)?',
    'Efesios 3:5-6',
    'Efesios 3:6 especifica: "que los gentiles son coherederos y miembros del mismo cuerpo, y copartícipes de la promesa en Cristo Jesús por medio del evangelio".',
    10, 'easy', 1, true
),
(
    'q0003001-0002-0000-0000-000000000002',
    'b0000003-0001-0000-0000-000000000001',
    'c0000000-0000-0000-0000-000000000003',
    'fill_blank',
    'Completa Efesios 3:8: "A mí, que soy menos que el más pequeño de todos los santos, me fue dada esta gracia de anunciar entre los gentiles el evangelio de las ________ riquezas de Cristo".',
    'Efesios 3:8',
    'La palabra textual que califica las riquezas en Efesios 3:8 es "inescrutables".',
    10, 'medium', 2, true
),
(
    'q0003001-0003-0000-0000-000000000003',
    'b0000003-0001-0000-0000-000000000001',
    'c0000000-0000-0000-0000-000000000003',
    'multiple_choice',
    'Según Efesios 3:10, ¿por medio de qué entidad es dada a conocer la multiforme sabiduría de Dios a los principados y potestades celestiales?',
    'Efesios 3:10',
    'Efesios 3:10 afirma: "...sea ahora dada a conocer por medio de la iglesia a los principados y potestades en los lugares celestiales".',
    10, 'easy', 3, true
),
(
    'q0003001-0004-0000-0000-000000000004',
    'b0000003-0001-0000-0000-000000000001',
    'c0000000-0000-0000-0000-000000000003',
    'true_false',
    'En Efesios 3:1, Pablo se describe a sí mismo como prisionero del emperador romano Nerón por su rebelión civil.',
    'Efesios 3:1',
    'Falso. Pablo se describe como "prisionero de Cristo Jesús por vosotros los gentiles".',
    10, 'easy', 4, true
),
(
    'q0003001-0005-0000-0000-000000000005',
    'b0000003-0001-0000-0000-000000000001',
    'c0000000-0000-0000-0000-000000000003',
    'reference_identification',
    '¿En qué versículo de Efesios se declara que en Cristo "tenemos seguridad y acceso con confianza por medio de la fe en él"?',
    'Efesios 3:12',
    'Esta afirmación se encuentra en Efesios 3:12.',
    10, 'easy', 5, true
),
(
    'q0003001-0006-0000-0000-000000000006',
    'b0000003-0001-0000-0000-000000000001',
    'c0000000-0000-0000-0000-000000000003',
    'multiple_choice',
    '¿Qué adjetivo emplea Pablo en Efesios 3:10 para calificar la infinita sabiduría de Dios manifestada en la iglesia?',
    'Efesios 3:10',
    'Efesios 3:10 utiliza la expresión: "la multiforme sabiduría de Dios".',
    10, 'medium', 6, true
),
(
    'q0003001-0007-0000-0000-000000000007',
    'b0000003-0001-0000-0000-000000000001',
    'c0000000-0000-0000-0000-000000000003',
    'multiple_choice',
    '¿Por qué pide Pablo a los efesios que no desmayen a causa de sus tribulaciones (Efesios 3:13)?',
    'Efesios 3:13',
    'Pablo dice: "por lo cual pido que no desmayéis a causa de mis tribulaciones por vosotros, las cuales son vuestra gloria".',
    10, 'medium', 7, true
)
ON CONFLICT (id) DO NOTHING;

-- Opciones Bloque 3.1
INSERT INTO public.question_options (question_id, option_text, is_correct, order_index)
VALUES
-- q1: multiple_choice
('q0003001-0001-0000-0000-000000000001', 'Que los gentiles son coherederos y miembros del mismo cuerpo, y copartícipes de la promesa en Cristo', true, 1),
('q0003001-0001-0000-0000-000000000001', 'Que la ley mosaica debía imponerse obligatoriamente a todas las naciones', false, 2),
('q0003001-0001-0000-0000-000000000001', 'Que los ángeles gobernarían las iglesias de Asia Menor', false, 3),
('q0003001-0001-0000-0000-000000000001', 'Que el templo de Jerusalén sería reconstruido con oro físico', false, 4),

-- q2: fill_blank
('q0003001-0002-0000-0000-000000000002', 'inescrutables', true, 1),

-- q3: multiple_choice
('q0003001-0003-0000-0000-000000000003', 'Por medio de la iglesia', true, 1),
('q0003001-0003-0000-0000-000000000003', 'Por medio del senado romano', false, 2),
('q0003001-0003-0000-0000-000000000003', 'A través de las leyes de la naturaleza visible', false, 3),
('q0003001-0003-0000-0000-000000000003', 'Por medio de los sacerdotes levitas del templo', false, 4),

-- q4: true_false
('q0003001-0004-0000-0000-000000000004', 'Verdadero', false, 1),
('q0003001-0004-0000-0000-000000000004', 'Falso', true, 2),

-- q5: reference_identification
('q0003001-0005-0000-0000-000000000005', 'Efesios 3:12', true, 1),
('q0003001-0005-0000-0000-000000000005', 'Efesios 3:1', false, 2),
('q0003001-0005-0000-0000-000000000005', 'Efesios 3:6', false, 3),
('q0003001-0005-0000-0000-000000000005', 'Efesios 3:10', false, 4),

-- q6: multiple_choice
('q0003001-0006-0000-0000-000000000006', 'Multiforme', true, 1),
('q0003001-0006-0000-0000-000000000006', 'Oculta para siempre', false, 2),
('q0003001-0006-0000-0000-000000000006', 'Filosófica y humana', false, 3),
('q0003001-0006-0000-0000-000000000006', 'Temporal y mutable', false, 4),

-- q7: multiple_choice
('q0003001-0007-0000-0000-000000000007', 'Porque sus tribulaciones son la gloria de los creyentes', true, 1),
('q0003001-0007-0000-0000-000000000007', 'Porque pronto saldría de la cárcel con riquezas', false, 2),
('q0003001-0007-0000-0000-000000000007', 'Porque los guardias se habían convertido todos', false, 3),
('q0003001-0007-0000-0000-000000000007', 'Porque los efesios tenían ejércitos para defenderlo', false, 4)
ON CONFLICT (id) DO NOTHING;

-- Asociar preguntas Bloque 3.1
INSERT INTO public.assessment_questions (assessment_id, question_id, order_index)
VALUES
('e0000003-0001-0000-0000-000000000001', 'q0003001-0001-0000-0000-000000000001', 1),
('e0000003-0001-0000-0000-000000000001', 'q0003001-0002-0000-0000-000000000002', 2),
('e0000003-0001-0000-0000-000000000001', 'q0003001-0003-0000-0000-000000000003', 3),
('e0000003-0001-0000-0000-000000000001', 'q0003001-0004-0000-0000-000000000004', 4),
('e0000003-0001-0000-0000-000000000001', 'q0003001-0005-0000-0000-000000000005', 5),
('e0000003-0001-0000-0000-000000000001', 'q0003001-0006-0000-0000-000000000006', 6),
('e0000003-0001-0000-0000-000000000001', 'q0003001-0007-0000-0000-000000000007', 7)
ON CONFLICT DO NOTHING;

-- PREGUNTAS BLOQUE 3.2 (Efesios 3:14-21)
INSERT INTO public.questions (id, block_id, chapter_id, question_type, prompt, verse_reference, explanation, points, difficulty, order_index, is_active)
VALUES
(
    'q0003002-0001-0000-0000-000000000001',
    'b0000003-0002-0000-0000-000000000002',
    'c0000000-0000-0000-0000-000000000003',
    'multiple_choice',
    '¿Qué postura de reverencia adopta Pablo al orar en Efesios 3:14?',
    'Efesios 3:14',
    'Efesios 3:14 dice: "Por esta causa doblo mis rodillas ante el Padre de nuestro Señor Jesucristo".',
    10, 'easy', 1, true
),
(
    'q0003002-0002-0000-0000-000000000002',
    'b0000003-0002-0000-0000-000000000002',
    'c0000000-0000-0000-0000-000000000003',
    'fill_blank',
    'Completa Efesios 3:16: "el ser fortalecidos con poder en el hombre ________ por su Espíritu".',
    'Efesios 3:16',
    'Efesios 3:16 dice: "el ser fortalecidos con poder en el hombre interior por su Espíritu".',
    10, 'medium', 2, true
),
(
    'q0003002-0003-0000-0000-000000000003',
    'b0000003-0002-0000-0000-000000000002',
    'c0000000-0000-0000-0000-000000000003',
    'multiple_choice',
    'Según Efesios 3:17-19, ¿en qué deben estar arraigados y cimentados los creyentes para conocer el amor de Cristo?',
    'Efesios 3:17-19',
    'Efesios 3:17 declara: "arraigados y cimentados en amor".',
    10, 'easy', 3, true
),
(
    'q0003002-0004-0000-0000-000000000004',
    'b0000003-0002-0000-0000-000000000002',
    'c0000000-0000-0000-0000-000000000003',
    'true_false',
    'En Efesios 3:19, Pablo afirma que el amor de Cristo puede ser comprendido plenamente y agotado por el conocimiento humano.',
    'Efesios 3:19',
    'Falso. Efesios 3:19 dice expresamente: "...y de conocer el amor de Cristo, que excede a todo conocimiento".',
    10, 'easy', 4, true
),
(
    'q0003002-0005-0000-0000-000000000005',
    'b0000003-0002-0000-0000-000000000002',
    'c0000000-0000-0000-0000-000000000003',
    'reference_identification',
    '¿En qué versículo se encuentra la doxología: "Y a Aquel que es poderoso para hacer todas las cosas mucho más abundantemente de lo que pedimos o entendemos"?',
    'Efesios 3:20',
    'Esta gloriosa alabanza se ubica en Efesios 3:20.',
    10, 'easy', 5, true
),
(
    'q0003002-0006-0000-0000-000000000006',
    'b0000003-0002-0000-0000-000000000002',
    'c0000000-0000-0000-0000-000000000003',
    'multiple_choice',
    '¿Cuáles son las cuatro dimensiones mencionadas en Efesios 3:18 para comprender el plan de Dios y el amor de Cristo?',
    'Efesios 3:18',
    'Efesios 3:18 enumera: "cuál sea la anchura, la longitud, la profundidad y la altura".',
    10, 'medium', 6, true
)
ON CONFLICT (id) DO NOTHING;

-- Opciones Bloque 3.2
INSERT INTO public.question_options (question_id, option_text, is_correct, order_index)
VALUES
-- q1: multiple_choice
('q0003002-0001-0000-0000-000000000001', 'Doblo mis rodillas ante el Padre de nuestro Señor Jesucristo', true, 1),
('q0003002-0001-0000-0000-000000000001', 'Me pongo de pie mirando hacia el oriente', false, 2),
('q0003002-0001-0000-0000-000000000001', 'Me siento a debatir con los sabios de Éfeso', false, 3),
('q0003002-0001-0000-0000-000000000001', 'Me postro exclusivamente ante los apóstoles de Jerusalén', false, 4),

-- q2: fill_blank
('q0003002-0002-0000-0000-000000000002', 'interior', true, 1),

-- q3: multiple_choice
('q0003002-0003-0000-0000-000000000003', 'En amor', true, 1),
('q0003002-0003-0000-0000-000000000003', 'En ritos externos', false, 2),
('q0003002-0003-0000-0000-000000000003', 'En argumentos filosóficos', false, 3),
('q0003002-0003-0000-0000-000000000003', 'En leyes civiles de Roma', false, 4),

-- q4: true_false
('q0003002-0004-0000-0000-000000000004', 'Verdadero', false, 1),
('q0003002-0004-0000-0000-000000000004', 'Falso', true, 2),

-- q5: reference_identification
('q0003002-0005-0000-0000-000000000005', 'Efesios 3:20', true, 1),
('q0003002-0005-0000-0000-000000000005', 'Efesios 3:14', false, 2),
('q0003002-0005-0000-0000-000000000005', 'Efesios 3:16', false, 3),
('q0003002-0005-0000-0000-000000000005', 'Efesios 3:18', false, 4),

-- q6: multiple_choice
('q0003002-0006-0000-0000-000000000006', 'La anchura, la longitud, la profundidad y la altura', true, 1),
('q0003002-0006-0000-0000-000000000006', 'El pasado, el presente, el futuro y la eternidad', false, 2),
('q0003002-0006-0000-0000-000000000006', 'La fe, la esperanza, el amor y la paciencia', false, 3),
('q0003002-0006-0000-0000-000000000006', 'El cielo, la tierra, el mar y los abismos', false, 4)
ON CONFLICT (id) DO NOTHING;

-- Asociar preguntas Bloque 3.2
INSERT INTO public.assessment_questions (assessment_id, question_id, order_index)
VALUES
('e0000003-0002-0000-0000-000000000002', 'q0003002-0001-0000-0000-000000000001', 1),
('e0000003-0002-0000-0000-000000000002', 'q0003002-0002-0000-0000-000000000002', 2),
('e0000003-0002-0000-0000-000000000002', 'q0003002-0003-0000-0000-000000000003', 3),
('e0000003-0002-0000-0000-000000000002', 'q0003002-0004-0000-0000-000000000004', 4),
('e0000003-0002-0000-0000-000000000002', 'q0003002-0005-0000-0000-000000000005', 5),
('e0000003-0002-0000-0000-000000000002', 'q0003002-0006-0000-0000-000000000006', 6)
ON CONFLICT DO NOTHING;


-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
-- ARCHIVO: 004_efesios_capitulo_4.sql
-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

-- ==============================================================================
-- BIBLIONARIO - SEED 004: EFESIOS CAPÍTULO 4 (RVR1960)
-- Explicaciones completas y Evaluaciones de los 4 Bloques (4:1-6, 4:7-16, 4:17-24, 4:25-32)
-- ==============================================================================

-- ------------------------------------------------------------------------------
-- 1. EXPLICACIONES DE LOS 4 BLOQUES DE EFESIOS 4
-- ------------------------------------------------------------------------------

-- Bloque 4.1: Efesios 4:1-6
INSERT INTO public.block_explanations (
    block_id,
    introduction,
    biblical_passage_rvr1960,
    passage_explanation,
    key_concepts,
    central_ideas,
    key_phrases,
    reading_instruction
)
VALUES (
    'b0000004-0001-0000-0000-000000000001',
    'Pablo pasa de la gran teología doctrinal a las demandas éticas prácticas: exhorta a los creyentes a andar como es digno de su llamamiento preservando la sagrada unidad del Espíritu.',
    '1 Yo pues, preso en el Señor, os ruego que andéis como es digno de la vocación con que fuisteis llamados,
2 con toda humildad y mansedumbre, soportándoos con paciencia los unos a los otros en amor,
3 solícitos en guardar la unidad del Espíritu en el vínculo de la paz;
4 un cuerpo, y un Espíritu, como fuisteis también llamados en una misma esperanza de vuestra vocación;
5 un Señor, una fe, un bautismo,
6 un Dios y Padre de todos, el cual es sobre todos, y por todos, y en todos.',
    'A partir del capítulo 4, la epístola enfatiza el comportamiento consecuente del cristiano:

1. El llamamiento a andar dignamente (v. 1):
La palabra "andar" representa el estilo de vida diario. El cristiano no vive para alcanzar la salvación, sino que vive de forma coherente con el llamamiento santo que ya recibió.

2. Las virtudes que sostienen la unidad (v. 2-3):
La unidad no se sostiene con reglamentos externos, sino con virtudes del carácter:
- "Humildad": ausencia de orgullo y soberbia; reconocer el valor de los demás.
- "Mansedumbre": fuerza bajo control, paciencia y apacibilidad sin revancha.
- "Paciencia y amor": soportar las debilidades y roces mutuos en la congregación.
- "Solícitos en guardar la unidad del Espíritu": los creyentes no "crean" la unidad (la unidad ya fue creada por el Espíritu), sino que tienen el deber solícito de "guardarla" mediante el vínculo de la paz.

3. La séptuple plataforma de la unidad cristiana (v. 4-6):
Pablo enumera siete verdades indivisibles que fundamentan la unidad de la fe:
1) "Un cuerpo": la Iglesia universal de Jesucristo.
2) "Un Espíritu": el Espíritu Santo que mora en todos los creyentes.
3) "Una misma esperanza": la gloria venidera y la resurrección.
4) "Un Señor": Jesucristo, Salvador y Cabeza soberana.
5) "Una fe": el cuerpo doctrinal del evangelio apostólico.
6) "Un bautismo": la inmersión espiritual en el cuerpo de Cristo y su testimonio visible.
7) "Un Dios y Padre de todos": soberano trascendente ("sobre todos"), activo ("por todos") e inmanente ("en todos").',
    '[
        {"concept": "Andar digno", "definition": "Vivir de manera coherente, íntegra y balanceada con respecto a la sublime posición espiritual otorgada por Dios en Cristo."},
        {"concept": "Humildad y mansedumbre", "definition": "Virtudes fundamentales de Cristo que desechan la arrogancia y la agresividad para edificar la paz comunitaria."},
        {"concept": "Unidad del Espíritu", "definition": "La armonía espiritual real e indivisible que el Espíritu Santo produce entre todos los verdaderos creyentes."},
        {"concept": "Siete unidades sagradas", "definition": "Los siete pilares teológicos inalterables que sostienen la comunión de la Iglesia: un cuerpo, un Espíritu, una esperanza, un Señor, una fe, un bautismo y un Padre."}
    ]'::jsonb,
    '[
        "El cristiano debe reflejar en su conducta práctica la grandeza de la salvación que ha recibido.",
        "La unidad en la iglesia se preserva cultivando activamente la humildad, la mansedumbre y la paciencia mutua.",
        "La verdadera unidad cristiana reposa sobre siete verdades inmutables centradas en el Dios Trino."
    ]'::jsonb,
    '[
        {"phrase": "Andéis como es digno de la vocación con que fuisteis llamados", "reference": "Efesios 4:1"},
        {"phrase": "Solícitos en guardar la unidad del Espíritu en el vínculo de la paz", "reference": "Efesios 4:3"},
        {"phrase": "Un Señor, una fe, un bautismo", "reference": "Efesios 4:5"},
        {"phrase": "Un Dios y Padre de todos, el cual es sobre todos, y por todos, y en todos", "reference": "Efesios 4:6"}
    ]'::jsonb,
    'Lee atentamente Efesios 4:1-6 en tu Biblia Reina-Valera 1960. Al terminar, marca el bloque como leído para realizar la evaluación.'
)
ON CONFLICT (block_id) DO UPDATE SET
    introduction = EXCLUDED.introduction,
    passage_explanation = EXCLUDED.passage_explanation,
    key_concepts = EXCLUDED.key_concepts,
    central_ideas = EXCLUDED.central_ideas,
    key_phrases = EXCLUDED.key_phrases;

-- Bloque 4.2: Efesios 4:7-16
INSERT INTO public.block_explanations (
    block_id,
    introduction,
    biblical_passage_rvr1960,
    passage_explanation,
    key_concepts,
    central_ideas,
    key_phrases,
    reading_instruction
)
VALUES (
    'b0000004-0002-0000-0000-000000000002',
    'Cristo victorioso distribuyó dones a su pueblo y constituyó ministerios para capacitar a los santos, con el fin de que el cuerpo crezca en amor hacia la estatura de Cristo.',
    '7 Pero a cada uno de nosotros fue dada la gracia conforme a la medida del don de Cristo.
8 Por lo cual dice:
Subiendo a lo alto, llevó cautiva la cautividad,
Y dio dones a los hombres.
9 Y eso de que subió, ¿qué es, sino que también había descendido primero a las partes más bajas de la tierra?
10 El que descendió, es el mismo que también subió por encima de todos los cielos para llenarlo todo.
11 Y él mismo constituyó a unos, apóstoles; a otros, profetas; a otros, evangelistas; a otros, pastores y maestros,
12 a fin de perfeccionar a los santos para la obra del ministerio, para la edificación del cuerpo de Cristo,
13 hasta que todos lleguemos a la unidad de la fe y del conocimiento del Hijo de Dios, a un varón perfecto, a la medida de la estatura de la plenitud de Cristo;
14 para que ya no seamos niños fluctuantes, llevados por doquiera de todo viento de doctrina, por estratagema de hombres que para engañar emplean con astucia las artimañas del error,
15 sino que siguiendo la verdad en amor, crezcamos en todo en aquel que es la cabeza, esto es, Cristo,
16 de quien todo el cuerpo, bien concertado y unido entre sí por todas las coyunturas que se ayudan mutuamente, según la actividad propia de cada miembro, recibe su crecimiento para ir edificándose en amor.',
    'Pablo describe la diversidad funcional y el propósito formativo de los dones:

1. La victoria triunfal de Cristo (v. 7-10):
Citando el Salmo 68:18, Pablo presenta a Cristo como un rey conquistador que, habiendo vencido a sus enemigos en su muerte y resurrección ("llevó cautiva la cautividad"), asciende en triunfo y derrama dones a los miembros de su Iglesia.

2. Los ministerios dados por Cristo (v. 11):
Cristo soberanamente dio hombres-dones a la iglesia:
- "Apóstoles" y "profetas": ministerios fundacionales que establecieron el cimiento doctrinal de la revelación.
- "Evangelistas": proclamadores itinerantes de las buenas nuevas a los inconversos.
- "Pastores y maestros": ministros locales que cuidan, apacientan y enseñan la doctrina sana al rebaño.

3. El propósito de los ministerios (v. 12-13):
Los líderes ministeriales no existen para acaparar todo el trabajo, sino "a fin de perfeccionar [equipar, capacitar] a los santos para la obra del ministerio, para la edificación del cuerpo de Cristo".
La meta:
a) La unidad de la fe y del conocimiento del Hijo de Dios.
b) Alcanzar "un varón perfecto" (madurez espiritual comunitaria).
c) Llegar "a la medida de la estatura de la plenitud de Cristo".

4. El antídoto contra el engaño y el crecimiento mutuo (v. 14-16):
La madurez bíblica protege a la iglesia de ser "niños fluctuantes", vulnerables a cualquier "viento de doctrina" manipulado por hombres astutos.
El camino es: "siguiendo la verdad en amor", donde cada miembro, como una coyuntura viva conectada a la Cabeza que es Cristo, cumple su función activa y hace crecer el cuerpo en edificación y amor.',
    '[
        {"concept": "Don de Cristo", "definition": "Capacitación espiritual y gracia otorgada individualmente a cada creyente para el servicio en el cuerpo de Cristo."},
        {"concept": "Perfeccionar a los santos", "definition": "Del griego katartismos, equipar, adiestrar y poner en orden a los creyentes para que ejerzan su ministerio propio."},
        {"concept": "Medida de la estatura de Cristo", "definition": "El estándar perfecto de carácter, madurez y santidad que la Iglesia como cuerpo debe alcanzar."},
        {"concept": "Viento de doctrina", "definition": "Enseñanzas falsas, modas teológicas erradas o manipulaciones humanas que confunden a los inmaduros en la fe."}
    ]'::jsonb,
    '[
        "Cada creyente ha recibido una gracia y don específico otorgado por Cristo glorificado.",
        "Los dones ministeriales tienen el propósito de capacitar a todos los miembros de la iglesia para el servicio cristiano.",
        "El crecimiento hacia la madurez doctrinal es la única defensa sólida contra los engaños de falsas doctrinas.",
        "El cuerpo de Cristo crece sanamente cuando cada miembro colabora activamente unido a la Cabeza en verdad y amor."
    ]'::jsonb,
    '[
        {"phrase": "Y él mismo constituyó a unos, apóstoles; a otros, profetas; a otros, evangelistas; a otros, pastores y maestros", "reference": "Efesios 4:11"},
        {"phrase": "A fin de perfeccionar a los santos para la obra del ministerio", "reference": "Efesios 4:12"},
        {"phrase": "A la medida de la estatura de la plenitud de Cristo", "reference": "Efesios 4:13"},
        {"phrase": "Siguiendo la verdad en amor, crezcamos en todo en aquel que es la cabeza, esto es, Cristo", "reference": "Efesios 4:15"}
    ]'::jsonb,
    'Lee atentamente Efesios 4:7-16 en tu Biblia Reina-Valera 1960. Marca la lectura como completada para realizar la evaluación del bloque.'
)
ON CONFLICT (block_id) DO UPDATE SET
    introduction = EXCLUDED.introduction,
    passage_explanation = EXCLUDED.passage_explanation,
    key_concepts = EXCLUDED.key_concepts,
    central_ideas = EXCLUDED.central_ideas,
    key_phrases = EXCLUDED.key_phrases;

-- Bloque 4.3: Efesios 4:17-24
INSERT INTO public.block_explanations (
    block_id,
    introduction,
    biblical_passage_rvr1960,
    passage_explanation,
    key_concepts,
    central_ideas,
    key_phrases,
    reading_instruction
)
VALUES (
    'b0000004-0003-0000-0000-000000000003',
    'Pablo traza una línea divisoria tajante entre la antigua vida pagana corrompida y el imperativo de despojarse del viejo hombre y vestirse del nuevo hombre creado según Dios.',
    '17 Esto, pues, digo y requiero en el Señor: que ya no andéis como los otros gentiles, que andan en la vanidad de su mente,
18 teniendo el entendimiento entenebrecido, ajenos de la vida de Dios por la ignorancia que en ellos hay, por la dureza de su corazón;
19 los cuales, después que perdieron toda sensibilidad, se entregaron a la lascivia para cometer con avidez toda clase de impureza.
20 Mas vosotros no habéis aprendido así a Cristo,
21 si en verdad le habéis oído, y habéis sido por él enseñados, conforme a la verdad que está en Jesús.
22 En cuanto a la pasada manera de vivir, despojaos del viejo hombre, que está viciado conforme a los deseos engañosos,
23 y renovaos en el espíritu de vuestra mente,
24 y vestíos del nuevo hombre, creado según Dios en la justicia y santidad de la verdad.',
    'Pablo describe la radical metamorfosis moral del creyente:

1. El retrato de la vida gentil sin regeneración (v. 17-19):
Pablo exige tajantemente que el creyente corte con su pasado pagano:
- "Vanidad de su mente": pensamientos vacíos y fútiles sin Dios.
- "Entendimiento entenebrecido": incapacidad de percibir la luz divina.
- "Ajenos de la vida de Dios": separados de la fuente de la vida espiritual por ignorancia voluntaria y "dureza de corazón".
- "Perdieron toda sensibilidad": su conciencia se insensibilizó, entregándose a la lascivia y a toda impureza con avidez insaciable.

2. Aprender a Cristo (v. 20-21):
"Mas vosotros no habéis aprendido así a Cristo". El cristianismo no es una filosofía abstracta, sino una relación transformadora con la Persona viva de Jesús, conforme a la verdad encarnada en Él.

3. La triple acción del discipulado cristiano (v. 22-24):
a) "Despojaos del viejo hombre": como quitarse ropa sucia y contaminada. El viejo hombre es la naturaleza adámica caída con sus hábitos y deseos engañosos.
b) "Renovaos en el espíritu de vuestra mente": renovación interior continua donde el pensamiento es saturado y moldeado por la verdad bíblica.
c) "Vestíos del nuevo hombre": ponerse el ropaje de la nueva creación, "creado según Dios en la justicia y santidad de la verdad".',
    '[
        {"concept": "Vanidad de la mente", "definition": "El estado de pensar fútil y sin sentido del ser humano apartado de la verdad de Dios."},
        {"concept": "Entendimiento entenebrecido", "definition": "Ceguera espiritual y moral producida por el pecado que impide discernir la voluntad de Dios."},
        {"concept": "Viejo hombre", "definition": "La naturaleza caída anterior heredada de Adán, caracterizada por la rebeldía y los deseos engañosos."},
        {"concept": "Nuevo hombre", "definition": "La nueva identidad y naturaleza espiritual implantada por Dios en el creyente por medio de la regeneración en Cristo."}
    ]'::jsonb,
    '[
        "El cristiano tiene prohibido volver a vivir según los patrones ciegos e inmorales del mundo paganizado.",
        "La dureza de corazón hacia Dios produce progresivamente insensibilidad moral y desenfreno.",
        "La vida cristiana exige despojarse de los viejos hábitos pecaminosos y vestirse de la santidad y justicia del nuevo hombre."
    ]'::jsonb,
    '[
        {"phrase": "Teniendo el entendimiento entenebrecido, ajenos de la vida de Dios", "reference": "Efesios 4:18"},
        {"phrase": "Mas vosotros no habéis aprendido así a Cristo", "reference": "Efesios 4:20"},
        {"phrase": "Despojaos del viejo hombre, que está viciado conforme a los deseos engañosos", "reference": "Efesios 4:22"},
        {"phrase": "Vestíos del nuevo hombre, creado según Dios en la justicia y santidad de la verdad", "reference": "Efesios 4:24"}
    ]'::jsonb,
    'Lee con detenimiento Efesios 4:17-24 en tu Biblia Reina-Valera 1960. Marca la lectura como completada para realizar la evaluación del bloque.'
)
ON CONFLICT (block_id) DO UPDATE SET
    introduction = EXCLUDED.introduction,
    passage_explanation = EXCLUDED.passage_explanation,
    key_concepts = EXCLUDED.key_concepts,
    central_ideas = EXCLUDED.central_ideas,
    key_phrases = EXCLUDED.key_phrases;

-- Bloque 4.4: Efesios 4:25-32
INSERT INTO public.block_explanations (
    block_id,
    introduction,
    biblical_passage_rvr1960,
    passage_explanation,
    key_concepts,
    central_ideas,
    key_phrases,
    reading_instruction
)
VALUES (
    'b0000004-0004-0000-0000-000000000004',
    'Pablo detalla normas éticas específicas para la convivencia del nuevo hombre: verdad, dominio de la ira, trabajo honrado, palabras edificantes, perdón y no contristar al Espíritu.',
    '25 Por lo cual, desechando la mentira, hablad verdad cada uno con su prójimo; porque somos miembros los unos de los otros.
26 Airaos, pero no pequéis; no se ponga el sol sobre vuestro enojo,
27 ni deis lugar al diablo.
28 El que hurtaba, no hurte más, sino trabaje, haciendo con sus manos lo que es bueno, para que tenga qué compartir con el que padece necesidad.
29 Ninguna palabra corrompida salga de vuestra boca, sino la que sea buena para la necesaria edificación, a fin de dar gracia a los oyentes.
30 Y no contristéis al Espíritu Santo de Dios, con el cual fuisteis sellados para el día de la redención.
31 Quítense de vosotros toda amargura, enojo, ira, gritería y maledicencia, y toda malicia.
32 Antes sed benignos unos con otros, misericordiosos, perdonándoos unos a otros, como Dios también os perdonó a vosotros en Cristo.',
    'Pablo ilustra cómo se ve el "nuevo hombre" en la práctica cotidiana comunitaria mediante contrastes directos (dejar lo malo y hacer lo bueno):

1. Verdad en lugar de mentira (v. 25):
"Desechando la mentira, hablad verdad cada uno con su prójimo". La razón es comunitaria: "porque somos miembros los unos de los otros". Mentirle a un hermano es como el ojo engañando a la mano.

2. El manejo de la ira (v. 26-27):
"Airaos, pero no pequéis; no se ponga el sol sobre vuestro enojo, ni deis lugar al diablo".
Existe una santa indignación contra el pecado, pero la ira descontrolada o rencorosa se convierte en pecado. El enojo debe resolverse el mismo día; guardar rencor abre una puerta de oportunidad estratégica ("lugar") al diablo para sembrar amargura y división.

3. Trabajo generoso en lugar de robo (v. 28):
El ladrón no solo debe dejar de robar, sino ir dos pasos adelante: trabajar honradamente con sus manos y tener un corazón generoso "para que tenga qué compartir con el que padece necesidad".

4. Palabras de edificación en lugar de lenguaje corrompido (v. 29):
"Ninguna palabra corrompida [podrida, destructiva] salga de vuestra boca, sino la que sea buena para la necesaria edificación, a fin de dar gracia a los oyentes".

5. No contristar al Espíritu Santo (v. 30):
El Espíritu Santo es una Persona divina y amorosa que puede ser "contristado" (entristecido, afligido) por el pecado, la división y las malas palabras de los creyentes a quienes selló con ternura para el día de la redención final.

6. De la amargura al perdón redentor (v. 31-32):
Pablo exige eliminar toda la cadena del resentimiento: amargura interior, enojo que hierve, ira que estalla, gritería pública y maledicencia (chisme e insultos).
En su lugar, manda cultivar tres virtudes supremas:
- Ser benignos (amables, atentos).
- Ser misericordiosos (compasivos de corazón).
- Perdonarse mutuamente según el modelo supremo: "como Dios también os perdonó a vosotros en Cristo".',
    '[
        {"concept": "Hablar verdad", "definition": "Transparencia y sinceridad absoluta en la comunicación interpersonal entre los miembros del cuerpo de Cristo."},
        {"concept": "No dar lugar al diablo", "definition": "Evitar dejar brechas emocionales o rencores sin resolver que el enemigo pueda aprovechar para destruir relaciones."},
        {"concept": "Palabra corrompida", "definition": "Lenguaje vulgar, chismoso, hiriente o podrido que destruye la comunión en lugar de edificar espiritualmente."},
        {"concept": "Contristar al Espíritu", "definition": "Afligir y entristecer el corazón del Espíritu Santo mediante actitudes carnales, rencores o pecados en la iglesia."},
        {"concept": "Perdón en Cristo", "definition": "Perdonar con la misma gracia inmerecida, completa y sacrificial con la que Dios nos perdonó en el sacrificio de Jesús."}
    ]'::jsonb,
    '[
        "La mentira atenta directamente contra la unidad orgánica del cuerpo de Cristo.",
        "El enojo no resuelto rápidamente se transforma en pecado y en una puerta de entrada para la acción del diablo.",
        "El lenguaje del creyente debe ser un canal de gracia y edificación para los que escuchan.",
        "Las actitudes de amargura y maledicencia entristecen al Espíritu Santo de Dios.",
        "El estándar incuestionable del perdón entre hermanos es el perdón que Dios nos otorgó en Cristo."
    ]'::jsonb,
    '[
        {"phrase": "Airaos, pero no pequéis; no se ponga el sol sobre vuestro enojo, ni deis lugar al diablo", "reference": "Efesios 4:26-27"},
        {"phrase": "Ninguna palabra corrompida salga de vuestra boca, sino la que sea buena para la necesaria edificación", "reference": "Efesios 4:29"},
        {"phrase": "Y no contristéis al Espíritu Santo de Dios", "reference": "Efesios 4:30"},
        {"phrase": "Perdonándoos unos a otros, como Dios también os perdonó a vosotros en Cristo", "reference": "Efesios 4:32"}
    ]'::jsonb,
    'Lee atentamente Efesios 4:25-32 en tu Biblia Reina-Valera 1960. Marca la lectura como completada para realizar la evaluación del bloque.'
)
ON CONFLICT (block_id) DO UPDATE SET
    introduction = EXCLUDED.introduction,
    passage_explanation = EXCLUDED.passage_explanation,
    key_concepts = EXCLUDED.key_concepts,
    central_ideas = EXCLUDED.central_ideas,
    key_phrases = EXCLUDED.key_phrases;

-- ------------------------------------------------------------------------------
-- 2. PREGUNTAS Y OPCIONES DE LOS BLOQUES DE EFESIOS 4
-- ------------------------------------------------------------------------------

-- PREGUNTAS BLOQUE 4.1 (Efesios 4:1-6)
INSERT INTO public.questions (id, block_id, chapter_id, question_type, prompt, verse_reference, explanation, points, difficulty, order_index, is_active)
VALUES
(
    'q0004001-0001-0000-0000-000000000001',
    'b0000004-0001-0000-0000-000000000004',
    'c0000000-0000-0000-0000-000000000004',
    'multiple_choice',
    '¿Qué virtudes menciona Pablo en Efesios 4:2 como necesarias para andar como es digno de nuestra vocación?',
    'Efesios 4:2',
    'Efesios 4:2 dice: "con toda humildad y mansedumbre, soportándoos con paciencia los unos a los otros en amor".',
    10, 'easy', 1, true
),
(
    'q0004001-0002-0000-0000-000000000002',
    'b0000004-0001-0000-0000-000000000004',
    'c0000000-0000-0000-0000-000000000004',
    'fill_blank',
    'Completa Efesios 4:3: "solícitos en guardar la unidad del Espíritu en el vínculo de la ________".',
    'Efesios 4:3',
    'Efesios 4:3 concluye: "...en el vínculo de la paz".',
    10, 'easy', 2, true
),
(
    'q0004001-0003-0000-0000-000000000003',
    'b0000004-0001-0000-0000-000000000004',
    'c0000000-0000-0000-0000-000000000004',
    'multiple_choice',
    '¿Cuáles son las tres realidades unificadas que Pablo junta en Efesios 4:5?',
    'Efesios 4:5',
    'Efesios 4:5 declara textualmente: "un Señor, una fe, un bautismo".',
    10, 'easy', 3, true
),
(
    'q0004001-0004-0000-0000-000000000004',
    'b0000004-0001-0000-0000-000000000004',
    'c0000000-0000-0000-0000-000000000004',
    'true_false',
    'Según Efesios 4:6, Dios el Padre es sobre todos, y por todos, y en todos.',
    'Efesios 4:6',
    'Verdadero. Efesios 4:6 expresa la soberanía, acción y presencia de Dios Padre sobre toda su creación redimida.',
    10, 'easy', 4, true
),
(
    'q0004001-0005-0000-0000-000000000005',
    'b0000004-0001-0000-0000-000000000004',
    'c0000000-0000-0000-0000-000000000004',
    'reference_identification',
    '¿En qué versículo de Efesios se encuentra la expresión "un Señor, una fe, un bautismo"?',
    'Efesios 4:5',
    'Esta declaración fundamental se encuentra en Efesios 4:5.',
    10, 'easy', 5, true
),
(
    'q0004001-0006-0000-0000-000000000006',
    'b0000004-0001-0000-0000-000000000004',
    'c0000000-0000-0000-0000-000000000004',
    'multiple_choice',
    '¿Cómo se describe a sí mismo Pablo al iniciar su ruego ético en Efesios 4:1?',
    'Efesios 4:1',
    'Pablo se llama: "preso en el Señor".',
    10, 'medium', 6, true
)
ON CONFLICT (id) DO NOTHING;

-- Opciones Bloque 4.1
INSERT INTO public.question_options (question_id, option_text, is_correct, order_index)
VALUES
-- q1: multiple_choice
('q0004001-0001-0000-0000-000000000001', 'Con toda humildad y mansedumbre, soportándoos con paciencia los unos a los otros en amor', true, 1),
('q0004001-0001-0000-0000-000000000001', 'Con elocuencia, riquezas materiales y sabiduría humana', false, 2),
('q0004001-0001-0000-0000-000000000001', 'Con imposición de autoridad militar y fuerza física', false, 3),
('q0004001-0001-0000-0000-000000000001', 'Con aislamiento de la sociedad en conventos', false, 4),

-- q2: fill_blank
('q0004001-0002-0000-0000-000000000002', 'paz', true, 1),

-- q3: multiple_choice
('q0004001-0003-0000-0000-000000000003', 'Un Señor, una fe, un bautismo', true, 1),
('q0004001-0003-0000-0000-000000000003', 'Un templo, un sacerdote, un altar', false, 2),
('q0004001-0003-0000-0000-000000000003', 'Un líder, una nación, un idioma', false, 3),
('q0004001-0003-0000-0000-000000000003', 'Un día de reposo, un sacrificio, una ofrenda', false, 4),

-- q4: true_false
('q0004001-0004-0000-0000-000000000004', 'Verdadero', true, 1),
('q0004001-0004-0000-0000-000000000004', 'Falso', false, 2),

-- q5: reference_identification
('q0004001-0005-0000-0000-000000000005', 'Efesios 4:5', true, 1),
('q0004001-0005-0000-0000-000000000005', 'Efesios 4:1', false, 2),
('q0004001-0005-0000-0000-000000000005', 'Efesios 4:3', false, 3),
('q0004001-0005-0000-0000-000000000005', 'Efesios 4:7', false, 4),

-- q6: multiple_choice
('q0004001-0006-0000-0000-000000000006', 'Preso en el Señor', true, 1),
('q0004001-0006-0000-0000-000000000006', 'Gobernador en Asia', false, 2),
('q0004001-0006-0000-0000-000000000006', 'Profeta de las naciones', false, 3),
('q0004001-0006-0000-0000-000000000006', 'Doctor de la ley judía', false, 4)
ON CONFLICT (id) DO NOTHING;

-- Asociar preguntas Bloque 4.1
INSERT INTO public.assessment_questions (assessment_id, question_id, order_index)
VALUES
('e0000004-0001-0000-0000-000000000001', 'q0004001-0001-0000-0000-000000000001', 1),
('e0000004-0001-0000-0000-000000000001', 'q0004001-0002-0000-0000-000000000002', 2),
('e0000004-0001-0000-0000-000000000001', 'q0004001-0003-0000-0000-000000000003', 3),
('e0000004-0001-0000-0000-000000000001', 'q0004001-0004-0000-0000-000000000004', 4),
('e0000004-0001-0000-0000-000000000001', 'q0004001-0005-0000-0000-000000000005', 5),
('e0000004-0001-0000-0000-000000000001', 'q0004001-0006-0000-0000-000000000006', 6)
ON CONFLICT DO NOTHING;

-- PREGUNTAS BLOQUE 4.2 (Efesios 4:7-16)
INSERT INTO public.questions (id, block_id, chapter_id, question_type, prompt, verse_reference, explanation, points, difficulty, order_index, is_active)
VALUES
(
    'q0004002-0001-0000-0000-000000000001',
    'b0000004-0002-0000-0000-000000000004',
    'c0000000-0000-0000-0000-000000000004',
    'multiple_choice',
    '¿Cuáles son los ministerios que Cristo mismo constituyó en la iglesia según Efesios 4:11?',
    'Efesios 4:11',
    'Efesios 4:11 enumera: "apóstoles, profetas, evangelistas, pastores y maestros".',
    10, 'easy', 1, true
),
(
    'q0004002-0002-0000-0000-000000000002',
    'b0000004-0002-0000-0000-000000000004',
    'c0000000-0000-0000-0000-000000000004',
    'multiple_choice',
    'De acuerdo con Efesios 4:12, ¿cuál es el propósito primordial de los dones ministeriales?',
    'Efesios 4:12',
    'Efesios 4:12 señala: "a fin de perfeccionar a los santos para la obra del ministerio, para la edificación del cuerpo de Cristo".',
    10, 'medium', 2, true
),
(
    'q0004002-0003-0000-0000-000000000003',
    'b0000004-0002-0000-0000-000000000004',
    'c0000000-0000-0000-0000-000000000004',
    'fill_blank',
    'Completa Efesios 4:13: "hasta que todos lleguemos a la unidad de la fe... a la medida de la estatura de la ________ de Cristo".',
    'Efesios 4:13',
    'Efesios 4:13 dice textualmente: "...a la medida de la estatura de la plenitud de Cristo".',
    10, 'medium', 3, true
),
(
    'q0004002-0004-0000-0000-000000000004',
    'b0000004-0002-0000-0000-000000000004',
    'c0000000-0000-0000-0000-000000000004',
    'multiple_choice',
    '¿Qué peligro advierte Pablo que sufrirán quienes permanecen como "niños fluctuantes" según Efesios 4:14?',
    'Efesios 4:14',
    'Advierte que serán "llevados por doquiera de todo viento de doctrina, por estratagema de hombres que para engañar emplean con astucia las artimañas del error".',
    10, 'medium', 4, true
),
(
    'q0004002-0005-0000-0000-000000000005',
    'b0000004-0002-0000-0000-000000000004',
    'c0000000-0000-0000-0000-000000000004',
    'true_false',
    'Efesios 4:15 enseña que el crecimiento del creyente se produce siguiendo la verdad en amor para crecer en Cristo.',
    'Efesios 4:15',
    'Verdadero. Efesios 4:15 declara: "sino que siguiendo la verdad en amor, crezcamos en todo en aquel que es la cabeza, esto es, Cristo".',
    10, 'easy', 5, true
),
(
    'q0004002-0006-0000-0000-000000000006',
    'b0000004-0002-0000-0000-000000000004',
    'c0000000-0000-0000-0000-000000000004',
    'reference_identification',
    '¿En qué versículo de Efesios se encuentra la lista de los cinco ministerios (apóstoles, profetas, evangelistas, pastores y maestros)?',
    'Efesios 4:11',
    'Esta mención se ubica en Efesios 4:11.',
    10, 'easy', 6, true
),
(
    'q0004002-0007-0000-0000-000000000007',
    'b0000004-0002-0000-0000-000000000004',
    'c0000000-0000-0000-0000-000000000004',
    'multiple_choice',
    'Según Efesios 4:8, ¿qué hizo Cristo al subir a lo alto según la cita del Salmo 68:18?',
    'Efesios 4:8',
    'Efesios 4:8 cita: "Subiendo a lo alto, llevó cautiva la cautividad, y dio dones a los hombres".',
    10, 'medium', 7, true
)
ON CONFLICT (id) DO NOTHING;

-- Opciones Bloque 4.2
INSERT INTO public.question_options (question_id, option_text, is_correct, order_index)
VALUES
-- q1: multiple_choice
('q0004002-0001-0000-0000-000000000001', 'Apóstoles, profetas, evangelistas, pastores y maestros', true, 1),
('q0004002-0001-0000-0000-000000000001', 'Reyes, generales, sacerdotes y escribas', false, 2),
('q0004002-0001-0000-0000-000000000001', 'Filósofos, oradores, jueces y magistrados', false, 3),
('q0004002-0001-0000-0000-000000000001', 'Levitas, cantores y porteros del templo', false, 4),

-- q2: multiple_choice
('q0004002-0002-0000-0000-000000000002', 'Perfeccionar a los santos para la obra del ministerio, para la edificación del cuerpo de Cristo', true, 1),
('q0004002-0002-0000-0000-000000000002', 'Concentrar todo el gobierno en una sola jerarquía sacerdotal', false, 2),
('q0004002-0002-0000-0000-000000000002', 'Recaudar tributos civiles para la ciudad de Éfeso', false, 3),
('q0004002-0002-0000-0000-000000000002', 'Sustituir la lectura personal de la Biblia por discursos humanos', false, 4),

-- q3: fill_blank
('q0004002-0003-0000-0000-000000000003', 'plenitud', true, 1),

-- q4: multiple_choice
('q0004002-0004-0000-0000-000000000004', 'Ser llevados por doquiera de todo viento de doctrina por artimañas del error', true, 1),
('q0004002-0004-0000-0000-000000000004', 'Perder sus posesiones materiales en el mercado de Éfeso', false, 2),
('q0004002-0004-0000-0000-000000000004', 'Olvidar cómo orar en público', false, 3),
('q0004002-0004-0000-0000-000000000004', 'Enfermar físicamente por falta de alimentos', false, 4),

-- q5: true_false
('q0004002-0005-0000-0000-000000000005', 'Verdadero', true, 1),
('q0004002-0005-0000-0000-000000000005', 'Falso', false, 2),

-- q6: reference_identification
('q0004002-0006-0000-0000-000000000006', 'Efesios 4:11', true, 1),
('q0004002-0006-0000-0000-000000000006', 'Efesios 4:7', false, 2),
('q0004002-0006-0000-0000-000000000006', 'Efesios 4:13', false, 3),
('q0004002-0006-0000-0000-000000000006', 'Efesios 4:16', false, 4),

-- q7: multiple_choice
('q0004002-0007-0000-0000-000000000007', 'Llevó cautiva la cautividad y dio dones a los hombres', true, 1),
('q0004002-0007-0000-0000-000000000007', 'Condenó a todos los habitantes de la tierra', false, 2),
('q0004002-0007-0000-0000-000000000007', 'Exigió ofrendas de oro a los emperadores', false, 3),
('q0004002-0007-0000-0000-000000000007', 'Estableció un ejército terrenal invencible', false, 4)
ON CONFLICT (id) DO NOTHING;

-- Asociar preguntas Bloque 4.2
INSERT INTO public.assessment_questions (assessment_id, question_id, order_index)
VALUES
('e0000004-0002-0000-0000-000000000002', 'q0004002-0001-0000-0000-000000000001', 1),
('e0000004-0002-0000-0000-000000000002', 'q0004002-0002-0000-0000-000000000002', 2),
('e0000004-0002-0000-0000-000000000002', 'q0004002-0003-0000-0000-000000000003', 3),
('e0000004-0002-0000-0000-000000000002', 'q0004002-0004-0000-0000-000000000004', 4),
('e0000004-0002-0000-0000-000000000002', 'q0004002-0005-0000-0000-000000000005', 5),
('e0000004-0002-0000-0000-000000000002', 'q0004002-0006-0000-0000-000000000006', 6),
('e0000004-0002-0000-0000-000000000002', 'q0004002-0007-0000-0000-000000000007', 7)
ON CONFLICT DO NOTHING;

-- PREGUNTAS BLOQUE 4.3 (Efesios 4:17-24)
INSERT INTO public.questions (id, block_id, chapter_id, question_type, prompt, verse_reference, explanation, points, difficulty, order_index, is_active)
VALUES
(
    'q0004003-0001-0000-0000-000000000001',
    'b0000004-0003-0000-0000-000000000004',
    'c0000000-0000-0000-0000-000000000004',
    'multiple_choice',
    'Según Efesios 4:17-18, ¿cómo andan los otros gentiles y qué caracteriza su entendimiento?',
    'Efesios 4:17-18',
    'Efesios 4:17-18 dice: "en la vanidad de su mente, teniendo el entendimiento entenebrecido, ajenos de la vida de Dios por la ignorancia que en ellos hay, por la dureza de su corazón".',
    10, 'easy', 1, true
),
(
    'q0004003-0002-0000-0000-000000000002',
    'b0000004-0003-0000-0000-000000000004',
    'c0000000-0000-0000-0000-000000000004',
    'multiple_choice',
    'De acuerdo con Efesios 4:22, ¿de qué debe despojarse el creyente en cuanto a su pasada manera de vivir?',
    'Efesios 4:22',
    'Efesios 4:22 declara: "despojaos del viejo hombre, que está viciado conforme a los deseos engañosos".',
    10, 'easy', 2, true
),
(
    'q0004003-0003-0000-0000-000000000003',
    'b0000004-0003-0000-0000-000000000004',
    'c0000000-0000-0000-0000-000000000004',
    'fill_blank',
    'Completa Efesios 4:24: "y vestíos del nuevo hombre, creado según Dios en la justicia y ________ de la verdad".',
    'Efesios 4:24',
    'Efesios 4:24 concluye: "...en la justicia y santidad de la verdad".',
    10, 'medium', 3, true
),
(
    'q0004003-0004-0000-0000-000000000004',
    'b0000004-0003-0000-0000-000000000004',
    'c0000000-0000-0000-0000-000000000004',
    'true_false',
    'Efesios 4:23 manda al creyente: "y renovaos en el espíritu de vuestra mente".',
    'Efesios 4:23',
    'Verdadero. La transformación del creyente involucra la renovación interior de sus pensamientos por el Espíritu Santo.',
    10, 'easy', 4, true
),
(
    'q0004003-0005-0000-0000-000000000005',
    'b0000004-0003-0000-0000-000000000004',
    'c0000000-0000-0000-0000-000000000004',
    'reference_identification',
    '¿En qué versículo de Efesios se encuentra la expresión: "despojaos del viejo hombre, que está viciado conforme a los deseos engañosos"?',
    'Efesios 4:22',
    'Esta exhortación se encuentra en Efesios 4:22.',
    10, 'easy', 5, true
),
(
    'q0004003-0006-0000-0000-000000000004',
    'b0000004-0003-0000-0000-000000000004',
    'c0000000-0000-0000-0000-000000000004',
    'multiple_choice',
    '¿Qué consecuencia moral sufrieron los gentiles tras perder toda sensibilidad según Efesios 4:19?',
    'Efesios 4:19',
    'Efesios 4:19 declara: "se entregaron a la lascivia para cometer con avidez toda clase de impureza".',
    10, 'medium', 6, true
)
ON CONFLICT (id) DO NOTHING;

-- Opciones Bloque 4.3
INSERT INTO public.question_options (question_id, option_text, is_correct, order_index)
VALUES
-- q1: multiple_choice
('q0004003-0001-0000-0000-000000000001', 'En la vanidad de su mente, teniendo el entendimiento entenebrecido y ajenos de la vida de Dios', true, 1),
('q0004003-0001-0000-0000-000000000001', 'En profunda devoción piadosa buscando la verdad', false, 2),
('q0004003-0001-0000-0000-000000000001', 'Guardando los diez mandamientos con rigor moral', false, 3),
('q0004003-0001-0000-0000-000000000001', 'Esperando la redención de Israel con ayunos', false, 4),

-- q2: multiple_choice
('q0004003-0002-0000-0000-000000000002', 'Del viejo hombre, que está viciado conforme a los deseos engañosos', true, 1),
('q0004003-0002-0000-0000-000000000002', 'De sus bienes terrenales y vestiduras físicas', false, 2),
('q0004003-0002-0000-0000-000000000002', 'De sus deberes familiares y laborales', false, 3),
('q0004003-0002-0000-0000-000000000002', 'De sus amistades cristianas en la iglesia', false, 4),

-- q3: fill_blank
('q0004003-0003-0000-0000-000000000003', 'santidad', true, 1),

-- q4: true_false
('q0004003-0004-0000-0000-000000000004', 'Verdadero', true, 1),
('q0004003-0004-0000-0000-000000000004', 'Falso', false, 2),

-- q5: reference_identification
('q0004003-0005-0000-0000-000000000005', 'Efesios 4:22', true, 1),
('q0004003-0005-0000-0000-000000000005', 'Efesios 4:17', false, 2),
('q0004003-0005-0000-0000-000000000005', 'Efesios 4:20', false, 3),
('q0004003-0005-0000-0000-000000000005', 'Efesios 4:24', false, 4),

-- q6: multiple_choice
('q0004003-0006-0000-0000-000000000006', 'Se entregaron a la lascivia para cometer con avidez toda clase de impureza', true, 1),
('q0004003-0006-0000-0000-000000000006', 'Construyeron templos monásticos de retiro', false, 2),
('q0004003-0006-0000-0000-000000000006', 'Buscaron la ayuda de los profetas de Jerusalén', false, 3),
('q0004003-0006-0000-0000-000000000006', 'Decidieron no pecar más por fuerza de voluntad', false, 4)
ON CONFLICT (id) DO NOTHING;

-- Asociar preguntas Bloque 4.3
INSERT INTO public.assessment_questions (assessment_id, question_id, order_index)
VALUES
('e0000004-0003-0000-0000-000000000003', 'q0004003-0001-0000-0000-000000000001', 1),
('e0000004-0003-0000-0000-000000000003', 'q0004003-0002-0000-0000-000000000002', 2),
('e0000004-0003-0000-0000-000000000003', 'q0004003-0003-0000-0000-000000000003', 3),
('e0000004-0003-0000-0000-000000000003', 'q0004003-0004-0000-0000-000000000004', 4),
('e0000004-0003-0000-0000-000000000003', 'q0004003-0005-0000-0000-000000000005', 5),
('e0000004-0003-0000-0000-000000000003', 'q0004003-0006-0000-0000-000000000006', 6)
ON CONFLICT DO NOTHING;

-- PREGUNTAS BLOQUE 4.4 (Efesios 4:25-32)
INSERT INTO public.questions (id, block_id, chapter_id, question_type, prompt, verse_reference, explanation, points, difficulty, order_index, is_active)
VALUES
(
    'q0004004-0001-0000-0000-000000000001',
    'b0000004-0004-0000-0000-000000000004',
    'c0000000-0000-0000-0000-000000000004',
    'multiple_choice',
    'Según Efesios 4:25, ¿por qué razón debemos desechar la mentira y hablar verdad con el prójimo?',
    'Efesios 4:25',
    'Efesios 4:25 responde explícitamente: "...porque somos miembros los unos de los otros".',
    10, 'easy', 1, true
),
(
    'q0004004-0002-0000-0000-000000000002',
    'b0000004-0004-0000-0000-000000000004',
    'c0000000-0000-0000-0000-000000000004',
    'fill_blank',
    'Completa Efesios 4:26: "Airaos, pero no pequéis; no se ponga el ________ sobre vuestro enojo".',
    'Efesios 4:26',
    'Efesios 4:26 dice: "...no se ponga el sol sobre vuestro enojo".',
    10, 'easy', 2, true
),
(
    'q0004004-0003-0000-0000-000000000003',
    'b0000004-0004-0000-0000-000000000004',
    'c0000000-0000-0000-0000-000000000004',
    'multiple_choice',
    '¿Qué debe hacer el que hurtaba según la instrucción redentora de Efesios 4:28?',
    'Efesios 4:28',
    'Efesios 4:28 enseña: "no hurte más, sino trabaje, haciendo con sus manos lo que es bueno, para que tenga qué compartir con el que padece necesidad".',
    10, 'easy', 3, true
),
(
    'q0004004-0004-0000-0000-000000000004',
    'b0000004-0004-0000-0000-000000000004',
    'c0000000-0000-0000-0000-000000000004',
    'multiple_choice',
    '¿Qué advertencia solemne hace Pablo en Efesios 4:30 respecto a la Tercera Persona de la Trinidad?',
    'Efesios 4:30',
    'Efesios 4:30 exhorta: "Y no contristéis al Espíritu Santo de Dios, con el cual fuisteis sellados para el día de la redención".',
    10, 'medium', 4, true
),
(
    'q0004004-0005-0000-0000-000000000005',
    'b0000004-0004-0000-0000-000000000004',
    'c0000000-0000-0000-0000-000000000004',
    'true_false',
    'En Efesios 4:32, el estándar para perdonarnos unos a otros es: "como Dios también os perdonó a vosotros en Cristo".',
    'Efesios 4:32',
    'Verdadero. Ese es el modelo supremo y perfecto de perdón cristiano.',
    10, 'easy', 5, true
),
(
    'q0004004-0006-0000-0000-000000000006',
    'b0000004-0004-0000-0000-000000000004',
    'c0000000-0000-0000-0000-000000000004',
    'reference_identification',
    '¿En qué versículo se encuentra el mandato: "Ninguna palabra corrompida salga de vuestra boca, sino la que sea buena para la necesaria edificación"?',
    'Efesios 4:29',
    'Este principio ético de las palabras se halla en Efesios 4:29.',
    10, 'easy', 6, true
),
(
    'q0004004-0007-0000-0000-000000000007',
    'b0000004-0004-0000-0000-000000000004',
    'c0000000-0000-0000-0000-000000000004',
    'multiple_choice',
    '¿Qué actitudes y vicios deben quitarse de los creyentes según Efesios 4:31?',
    'Efesios 4:31',
    'Efesios 4:31 ordena: "Quítense de vosotros toda amargura, enojo, ira, gritería y maledicencia, y toda malicia".',
    10, 'medium', 7, true
)
ON CONFLICT (id) DO NOTHING;

-- Opciones Bloque 4.4
INSERT INTO public.question_options (question_id, option_text, is_correct, order_index)
VALUES
-- q1: multiple_choice
('q0004004-0001-0000-0000-000000000001', 'Porque somos miembros los unos de los otros', true, 1),
('q0004004-0001-0000-0000-000000000001', 'Para evitar multas de las autoridades civiles', false, 2),
('q0004004-0001-0000-0000-000000000001', 'Porque la mentira disminuye las ventas en el comercio', false, 3),
('q0004004-0001-0000-0000-000000000001', 'Para ganar fama de intelectuales honestos', false, 4),

-- q2: fill_blank
('q0004004-0002-0000-0000-000000000002', 'sol', true, 1),

-- q3: multiple_choice
('q0004004-0003-0000-0000-000000000003', 'No hurte más, sino trabaje con sus manos para tener qué compartir con el necesitado', true, 1),
('q0004004-0003-0000-0000-000000000003', 'Pida limosna en las puertas de la iglesia', false, 2),
('q0004004-0003-0000-0000-000000000003', 'Huya de la ciudad de Éfeso para no ser arrestado', false, 3),
('q0004004-0003-0000-0000-000000000003', 'Haga sacrificios de animales para expiar su culpa', false, 4),

-- q4: multiple_choice
('q0004004-0004-0000-0000-000000000004', 'No contristéis al Espíritu Santo de Dios', true, 1),
('q0004004-0004-0000-0000-000000000004', 'No descuidéis el templo material de Jerusalén', false, 2),
('q0004004-0004-0000-0000-000000000004', 'No discuta con los filósofos griegos', false, 3),
('q0004004-0004-0000-0000-000000000004', 'No viaje en días de tormenta marina', false, 4),

-- q5: true_false
('q0004004-0005-0000-0000-000000000005', 'Verdadero', true, 1),
('q0004004-0005-0000-0000-000000000005', 'Falso', false, 2),

-- q6: reference_identification
('q0004004-0006-0000-0000-000000000006', 'Efesios 4:29', true, 1),
('q0004004-0006-0000-0000-000000000006', 'Efesios 4:25', false, 2),
('q0004004-0006-0000-0000-000000000006', 'Efesios 4:27', false, 3),
('q0004004-0006-0000-0000-000000000006', 'Efesios 4:31', false, 4),

-- q7: multiple_choice
('q0004004-0007-0000-0000-000000000007', 'Toda amargura, enojo, ira, gritería y maledicencia, y toda malicia', true, 1),
('q0004004-0007-0000-0000-000000000007', 'Todo trabajo físico y esfuerzo manual', false, 2),
('q0004004-0007-0000-0000-000000000007', 'Toda conversación con personas inconversas', false, 3),
('q0004004-0007-0000-0000-000000000007', 'Toda alabanza musical en la congregación', false, 4)
ON CONFLICT (id) DO NOTHING;

-- Asociar preguntas Bloque 4.4
INSERT INTO public.assessment_questions (assessment_id, question_id, order_index)
VALUES
('e0000004-0004-0000-0000-000000000004', 'q0004004-0001-0000-0000-000000000001', 1),
('e0000004-0004-0000-0000-000000000004', 'q0004004-0002-0000-0000-000000000002', 2),
('e0000004-0004-0000-0000-000000000004', 'q0004004-0003-0000-0000-000000000003', 3),
('e0000004-0004-0000-0000-000000000004', 'q0004004-0004-0000-0000-000000000004', 4),
('e0000004-0004-0000-0000-000000000004', 'q0004004-0005-0000-0000-000000000005', 5),
('e0000004-0004-0000-0000-000000000004', 'q0004004-0006-0000-0000-000000000006', 6),
('e0000004-0004-0000-0000-000000000004', 'q0004004-0007-0000-0000-000000000007', 7)
ON CONFLICT DO NOTHING;


-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
-- ARCHIVO: 005_efesios_capitulo_5.sql
-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

-- ==============================================================================
-- BIBLIONARIO - SEED 005: EFESIOS CAPÍTULO 5 (RVR1960)
-- Explicaciones completas y Evaluaciones de los 4 Bloques (5:1-7, 5:8-14, 5:15-21, 5:22-33)
-- ==============================================================================

-- ------------------------------------------------------------------------------
-- 1. EXPLICACIONES DE LOS 4 BLOQUES DE EFESIOS 5
-- ------------------------------------------------------------------------------

-- Bloque 5.1: Efesios 5:1-7
INSERT INTO public.block_explanations (
    block_id,
    introduction,
    biblical_passage_rvr1960,
    passage_explanation,
    key_concepts,
    central_ideas,
    key_phrases,
    reading_instruction
)
VALUES (
    'b0000005-0001-0000-0000-000000000001',
    'Pablo convoca a los creyentes a imitar el carácter amoroso y santo de Dios Padre, alejándose de toda fornicación, codicia y lenguaje deshonesto.',
    '1 Sed, pues, imitadores de Dios como hijos amados.
2 Y andad en amor, como también Cristo nos amó, y se entregó a sí mismo por nosotros, ofrenda y sacrificio a Dios en olor fragante.
3 Pero fornicación y toda inmundicia, o avaricia, ni aun se nombre entre vosotros, como conviene a santos;
4 ni palabras deshonestas, ni necedades, ni truhanerías, que no convienen, sino antes bien acciones de gracias.
5 Porque sabéis esto, que ningún fornicario, o inmundo, o avaro, que es idólatra, tiene herencia en el reino de Cristo y de Dios.
6 Nadie os engañe con palabras vanas, porque por estas cosas viene la ira de Dios sobre los hijos de desobediencia.
7 No seáis, pues, partícipes con ellos.',
    'Pablo establece el modelo supremo de la conducta cristiana:

1. El llamamiento a imitar a Dios (v. 1-2):
"Sed, pues, imitadores de Dios como hijos amados":
- Así como los niños pequeños imitan naturalmente los gestos y valores de sus padres a quienes aman, los creyentes deben reproducir el carácter de su Padre celestial.
- El estándar del andar en amor es la entrega de Cristo: "se entregó a sí mismo por nosotros, ofrenda y sacrificio a Dios en olor fragante". El amor cristiano es sacrificial y orientado a complacer a Dios.

2. Pecados incompatibles con la santidad (v. 3-4):
Pablo enumera conductas que deben ser erradicadas tajantemente:
- "Fornicación y toda inmundicia": toda transgresión del diseño sexual puro de Dios.
- "Avaricia": el deseo insaciable de acumular bienes terrenales o placeres.
- "Palabras deshonestas, necedades y truhanerías": chistes groseros, vulgaridades y conversaciones vanas que deshonran a Dios.
El sustituto bíblico para la boca del creyente es: "acciones de gracias".

3. La advertencia sobre la herencia y la ira de Dios (v. 5-7):
Pablo es categórico: quien practica persistentemente la fornicación, inmundicia o avaricia (la cual es calificada como "idolatría", pues pone el dinero en el trono de Dios), "no tiene herencia en el reino de Cristo y de Dios".
Advierte contra falsos maestros que excusan el pecado con "palabras vanas": la ira santa de Dios viene sobre los rebeldes, por lo cual los creyentes no deben ser "partícipes con ellos".',
    '[
        {"concept": "Imitadores de Dios", "definition": "Seguir activamente el modelo de santidad, justicia, misericordia y perdón demostrado por el Padre celestial."},
        {"concept": "Olor fragante", "definition": "Alusión a los sacrificios del Antiguo Testamento que eran plenamente aceptables y de deleite ante la presencia de Dios; tipo de la entrega de Cristo."},
        {"concept": "Avaricia como idolatría", "definition": "El afán desmedido por poseer bienes materiales que desplaza a Dios del corazón y convierte las posesiones en un ídolo."},
        {"concept": "Palabras vanas", "definition": "Argumentos engañosos y vacíos que minimizan la gravedad del pecado y justifican la inmoralidad moral."}
    ]'::jsonb,
    '[
        "El estándar incuestionable del amor cristiano es el sacrificio voluntario y fragante de Jesucristo en la cruz.",
        "La inmoralidad sexual, la codicia y el lenguaje vulgar son totalmente incompatibles con la identidad de los santos.",
        "La avaricia es idolatría espiritual ante Dios y descalifica de la herencia del reino a quien vive en ella.",
        "Los creyentes no deben ser engañados por ideologías o discursos que pretenden trivializar la ira de Dios sobre el pecado."
    ]'::jsonb,
    '[
        {"phrase": "Sed, pues, imitadores de Dios como hijos amados", "reference": "Efesios 5:1"},
        {"phrase": "Andad en amor, como también Cristo nos amó", "reference": "Efesios 5:2"},
        {"phrase": "Ni palabras deshonestas, ni necedades, ni truhanerías, que no convienen", "reference": "Efesios 5:4"},
        {"phrase": "Ningún fornicario, o inmundo, o avaro, que es idólatra, tiene herencia en el reino", "reference": "Efesios 5:5"}
    ]'::jsonb,
    'Lee atentamente Efesios 5:1-7 en tu Biblia Reina-Valera 1960. Al concluir, confirma la lectura para habilitar la evaluación del bloque.'
)
ON CONFLICT (block_id) DO UPDATE SET
    introduction = EXCLUDED.introduction,
    passage_explanation = EXCLUDED.passage_explanation,
    key_concepts = EXCLUDED.key_concepts,
    central_ideas = EXCLUDED.central_ideas,
    key_phrases = EXCLUDED.key_phrases;

-- Bloque 5.2: Efesios 5:8-14
INSERT INTO public.block_explanations (
    block_id,
    introduction,
    biblical_passage_rvr1960,
    passage_explanation,
    key_concepts,
    central_ideas,
    key_phrases,
    reading_instruction
)
VALUES (
    'b0000005-0002-0000-0000-000000000002',
    'Pablo describe la radiante identidad del creyente como luz en el Señor, mandando comprobar lo agradable a Dios y desenmascarar las obras infructuosas de las tinieblas.',
    '8 Porque en otro tiempo erais tinieblas, mas ahora sois luz en el Señor; andad como hijos de luz
9 (porque el fruto del Espíritu es en toda bondad, justicia y verdad),
10 comprobando lo que es agradable al Señor.
11 Y no participéis en las obras infructuosas de las tinieblas, sino más bien reprendedlas;
12 porque vergonzoso es aun hablar de lo que ellos hacen en secreto.
13 Mas todas las cosas, cuando son puestas en evidencia por la luz, son hechas manifiestas; porque la luz es lo que manifiesta todo.
14 Por lo cual dice:
Despiértate, tú que duermes,
Y levántate de los muertos,
Y te alumbrará Cristo.',
    'Pablo utiliza el poderoso contraste cósmico entre la luz y las tinieblas:

1. De tinieblas a luz (v. 8):
Pablo no dice meramente que estaban "en" tinieblas, sino: "en otro tiempo erais tinieblas". El pecado saturaba su ser interior.
"Mas ahora sois luz en el Señor": la conversión no es solo recibir iluminación, sino ser transformados en portadores vivientes de luz en unión con Cristo. Por tanto: "andad como hijos de luz".

2. El fruto luminoso del Espíritu (v. 9-10):
El carácter del hijo de luz produce un fruto inconfundible compuesto por tres elementos:
- "Bondad": generosidad benevolente activa hacia el prójimo.
- "Justicia": integridad moral y apego a la recta voluntad de Dios.
- "Verdad": transparencia y fidelidad a la revelación divina.
El creyente vive "comprobando" (examinando diligentemente con discernimiento) qué agrada al Señor.

3. Reprender las obras de las tinieblas (v. 11-13):
El cristiano tiene una doble responsabilidad:
- Negativa: "no participéis en las obras infructuosas de las tinieblas".
- Positiva: "sino más bien reprendedlas" (ponerlas al descubierto mediante la pureza de la vida y la verdad del evangelio).
El pecado busca la clandestinidad del secreto, pero la luz celestial lo expone todo.

4. El himno del despertar espiritual (v. 14):
Pablo cita lo que parece ser un antiguo himno bautismal cristiano:
"Despiértate, tú que duermes, y levántate de los muertos, y te alumbrará Cristo".
Un llamado ferviente a sacudirse la letargia espiritual para que el resplandor de Cristo brille con poder.',
    '[
        {"concept": "Hijos de luz", "definition": "Creyentes regenerados que pertenecen al reino celestial de Dios y reflejan la verdad y pureza de Cristo en medio de una sociedad moralmente oscura."},
        {"concept": "Fruto del Espíritu", "definition": "Las manifestaciones morales y visibles de bondad, justicia y verdad producidas por la acción interna del Espíritu Santo."},
        {"concept": "Obras infructuosas", "definition": "Las prácticas pecaminosas del mundo que no producen ningún fruto de vida eterna, sino solo ruina, culpa y muerte."},
        {"concept": "Reprender", "definition": "Exponer, desenmascarar y confrontar el error y la inmoralidad mediante la luz de la verdad bíblica y el testimonio de santidad."}
    ]'::jsonb,
    '[
        "La salvación transforma radicalmente al creyente de ser tinieblas a convertirse en luz en el Señor.",
        "El fruto genuino de la luz divina se manifiesta concretamente en toda bondad, justicia y verdad.",
        "El cristiano no puede ser cómplice ni indiferente ante las obras pecaminosas de las tinieblas, sino que debe exponerlas con su vida santa.",
        "Cristo promete iluminar con su gloria a todo creyente que despierta de la complacencia espiritual."
    ]'::jsonb,
    '[
        {"phrase": "En otro tiempo erais tinieblas, mas ahora sois luz en el Señor; andad como hijos de luz", "reference": "Efesios 5:8"},
        {"phrase": "El fruto del Espíritu es en toda bondad, justicia y verdad", "reference": "Efesios 5:9"},
        {"phrase": "No participéis en las obras infructuosas de las tinieblas, sino más bien reprendedlas", "reference": "Efesios 5:11"},
        {"phrase": "Despiértate, tú que duermes, y levántate de los muertos, y te alumbrará Cristo", "reference": "Efesios 5:14"}
    ]'::jsonb,
    'Lee con atención Efesios 5:8-14 directamente en tu Biblia Reina-Valera 1960. Marca el bloque como leído para comenzar la evaluación.'
)
ON CONFLICT (block_id) DO UPDATE SET
    introduction = EXCLUDED.introduction,
    passage_explanation = EXCLUDED.passage_explanation,
    key_concepts = EXCLUDED.key_concepts,
    central_ideas = EXCLUDED.central_ideas,
    key_phrases = EXCLUDED.key_phrases;

-- Bloque 5.3: Efesios 5:15-21
INSERT INTO public.block_explanations (
    block_id,
    introduction,
    biblical_passage_rvr1960,
    passage_explanation,
    key_concepts,
    central_ideas,
    key_phrases,
    reading_instruction
)
VALUES (
    'b0000005-0003-0000-0000-000000000003',
    'Pablo exhorta a caminar con sabiduría redimiendo el tiempo, contrastando la embriaguez carnal con la llenura del Espíritu Santo, la alabanza gozosa y el mutuo sometimiento.',
    '15 Mirad, pues, con diligencia cómo andéis, no como necios sino como sabios,
16 redimiendo el tiempo, porque los días son malos.
17 Por tanto, no seáis insensatos, sino entendidos de cuál sea la voluntad del Señor.
18 No os embriaguéis con vino, en lo cual hay disolución; antes bien sed llenos del Espíritu,
19 hablando entre vosotros con salmos, con himnos y cánticos espirituales, cantando y alabando al Señor en vuestros corazones;
20 dando siempre gracias por todo al Dios y Padre, en el nombre de nuestro Señor Jesucristo.
21 Someteos unos a otros en el temor de Dios.',
    'Pablo delinea la vida guiada por la sabiduría divina:

1. Caminar con diligencia y redimir el tiempo (v. 15-17):
"Mirad, pues, con diligencia cómo andéis":
- El cristiano examina cuidadosamente por dónde pisa su vida moral.
- "Redimiendo el tiempo" (en griego exagorazō): comprar o rescatar cada oportunidad estratégica para la gloria de Dios de un mercado dominado por la maldad ("porque los días son malos").
- El necio malgasta la vida; el sabio procura ser "entendido de cuál sea la voluntad del Señor".

2. La orden de ser llenos del Espíritu Santo (v. 18):
Pablo establece un contraste contundente:
"No os embriaguéis con vino, en lo cual hay disolución; antes bien sed llenos del Espíritu".
- El alcohol controla y distorsiona la mente conduciendo al desenfreno ("disolución").
- En cambio, estar "lleno del Espíritu" (un mandamiento en presente continuo: "sed continuamente llenos") significa estar bajo el control voluntario y gozoso del Espíritu de Dios.

3. Las cuatro evidencias directas de la llenura del Espíritu (v. 19-21):
Una persona llena del Espíritu manifiesta cuatro frutos evidentes:
a) Comunión edificante (v. 19a): "Hablando entre vosotros con salmos, con himnos y cánticos espirituales".
b) Alabanza interior profunda (v. 19b): "Cantando y alabando al Señor en vuestros corazones".
c) Gratitud constante (v. 20): "Dando siempre gracias por todo al Dios y Padre, en el nombre de nuestro Señor Jesucristo".
d) Sumisión mutua (v. 21): "Someteos unos a otros en el temor de Dios", reconociendo con reverencia el señorío de Cristo en las relaciones interpersonales.',
    '[
        {"concept": "Redimir el tiempo", "definition": "Aprovechar al máximo cada instante y oportunidad espiritual para hacer la voluntad de Dios en un mundo hostil."},
        {"concept": "Llenura del Espíritu", "definition": "El estado continuo donde el creyente se rinde voluntariamente a la dirección, influencia y poder del Espíritu Santo."},
        {"concept": "Salmos, himnos y cánticos espirituales", "definition": "Las diversas expresiones de adoración congregacional e individual que instruyen, alaban a Dios y fortalecen la fe."},
        {"concept": "Someteos unos a otros", "definition": "La actitud humilde de ceder y servir mutuamente en la iglesia motivados por el santo temor de Dios."}
    ]'::jsonb,
    '[
        "El cristiano debe administrar sabiamente el tiempo terrenal porque los días presentes son moralmente adversos.",
        "La voluntad de Dios no es un misterio inalcanzable, sino una revelación que el creyente debe comprender y obedecer.",
        "La llenura del Espíritu Santo es un mandato continuo para todo cristiano y se evidencia en gozo, cántico, gratitud y sumisión mutua."
    ]'::jsonb,
    '[
        {"phrase": "Mirad, pues, con diligencia cómo andéis, no como necios sino como sabios", "reference": "Efesios 5:15"},
        {"phrase": "Redimiendo el tiempo, porque los días son malos", "reference": "Efesios 5:16"},
        {"phrase": "No os embriaguéis con vino, en lo cual hay disolución; antes bien sed llenos del Espíritu", "reference": "Efesios 5:18"},
        {"phrase": "Dando siempre gracias por todo al Dios y Padre", "reference": "Efesios 5:20"},
        {"phrase": "Someteos unos a otros en el temor de Dios", "reference": "Efesios 5:21"}
    ]'::jsonb,
    'Lee con cuidado Efesios 5:15-21 en tu Biblia Reina-Valera 1960. Marca la lectura como completada para realizar la evaluación del bloque.'
)
ON CONFLICT (block_id) DO UPDATE SET
    introduction = EXCLUDED.introduction,
    passage_explanation = EXCLUDED.passage_explanation,
    key_concepts = EXCLUDED.key_concepts,
    central_ideas = EXCLUDED.central_ideas,
    key_phrases = EXCLUDED.key_phrases;

-- Bloque 5.4: Efesios 5:22-33
INSERT INTO public.block_explanations (
    block_id,
    introduction,
    biblical_passage_rvr1960,
    passage_explanation,
    key_concepts,
    central_ideas,
    key_phrases,
    reading_instruction
)
VALUES (
    'b0000005-0004-0000-0000-000000000004',
    'Pablo expone la teología bíblica del matrimonio cristiano, revelando que la unión matrimonial terrenal es una figura sagrada del amor sacrificial de Cristo hacia su Iglesia.',
    '22 Las casadas estén sujetas a sus propios maridos, como al Señor;
23 porque el marido es cabeza de la mujer, así como Cristo es cabeza de la iglesia, la cual es su cuerpo, y él es su Salvador.
24 Así que, como la iglesia está sujeta a Cristo, así también las casadas lo estén a sus maridos en todo.
25 Maridos, amad a vuestras mujeres, así como Cristo amó a la iglesia, y se entregó a sí mismo por ella,
26 para santificarla, habiéndola purificado en el lavamiento del agua por la palabra,
27 a fin de presentársela a sí mismo, una iglesia gloriosa, que no tuviese mancha ni arruga ni cosa semejante, sino que fuese santa y sin mancha.
28 Así también los maridos deben amar a sus mujeres como a sus mismos cuerpos. El que ama a su mujer, a sí mismo se ama.
29 Porque nadie aborreció jamás a su propia carne, sino que la sustenta y la cuida, como también Cristo a la iglesia,
30 porque somos miembros de su cuerpo, de su carne y de sus huesos.
31 Por esto dejará el hombre a su padre y a su madre, y se unirá a su mujer, y los dos serán una sola carne.
32 Grande es este misterio; mas yo digo esto respecto de Cristo y de la iglesia.
33 Por lo demás, cada uno de vosotros ame también a su mujer como a sí mismo; y la mujer respete a su marido.',
    'Pablo eleva la institución del matrimonio a las más altas esferas teológicas:

1. La responsabilidad de la esposa (v. 22-24):
"Las casadas estén sujetas a sus propios maridos, como al Señor".
La sujeción bíblica no es servidumbre forzada ni inferioridad de valor, sino un reconocimiento voluntario del orden funcional establecido por Dios:
- "Porque el marido es cabeza de la mujer, así como Cristo es cabeza de la iglesia": la esposa honra el liderazgo protector de su esposo como reflejo de la sumisión gozosa de la Iglesia hacia Cristo.

2. El mandato supremo al esposo: amor sacrificial (v. 25-27):
El estándar para el esposo es monumental y exige sacrificio total:
"Maridos, amad a vuestras mujeres, así como Cristo amó a la iglesia, y se entregó a sí mismo por ella":
- No es un liderazgo tiránico, sino de servicio redentor.
- El propósito del amor de Cristo por la Iglesia fue "santificarla, habiéndola purificado en el lavamiento del agua por la palabra".
- La meta: presentársela como "una iglesia gloriosa, que no tuviese mancha ni arruga ni cosa semejante, sino que fuese santa y sin mancha".

3. Amor conyugal como cuidado del propio cuerpo (v. 28-30):
El esposo debe amar a su cónyuge como a su propia persona: "nadie aborreció jamás a su propia carne, sino que la sustenta [alimenta] y la cuida [abriga], como también Cristo a la iglesia".

4. El gran misterio: Cristo y la Iglesia (v. 31-33):
Citando Génesis 2:24 ("Por esto dejará el hombre a su padre y a su madre, y se unirá a su mujer, y los dos serán una sola carne"), Pablo revela el significado supremo del matrimonio:
"Grande es este misterio; mas yo digo esto respecto de Cristo y de la iglesia".
Dios diseñó el matrimonio desde el principio como una parábola viviente que prefiguraba la unión espiritual indivisible entre Cristo y los redimidos.
Concluye con un resumen práctico: el esposo debe amar a su esposa como a sí mismo, y la esposa debe respetar a su marido.',
    '[
        {"concept": "Cabeza del hogar", "definition": "Posición de responsabilidad, liderazgo de servicio y cuidado protector conferida por Dios al esposo, modelada en Cristo."},
        {"concept": "Amor sacrificial", "definition": "El amor incondicional que busca el bienestar supremo y la santificación del cónyuge, dispuesto al sacrificio propio."},
        {"concept": "Lavamiento del agua por la palabra", "definition": "El poder purificador y santificador de la verdad del evangelio aplicada por el Espíritu Santo a la vida del creyente."},
        {"concept": "Una sola carne", "definition": "La profunda unión física, emocional y espiritual entre un hombre y una mujer en el matrimonio divino."}
    ]'::jsonb,
    '[
        "El matrimonio bíblico es un reflejo sagrado de la relación gloriosa e indisoluble entre Cristo y su Iglesia.",
        "El esposo tiene el mandato imperativo de amar a su esposa con la misma entrega sacrificial con que Cristo amó a la iglesia.",
        "La esposa es llamada a respetar y apoyar voluntariamente el liderazgo protector de su marido como al Señor.",
        "Cristo purifica y cuida continuamente a su Iglesia para presentársela sin mancha ni arruga en el día final."
    ]'::jsonb,
    '[
        {"phrase": "El marido es cabeza de la mujer, así como Cristo es cabeza de la iglesia", "reference": "Efesios 5:23"},
        {"phrase": "Maridos, amad a vuestras mujeres, así como Cristo amó a la iglesia, y se entregó a sí mismo por ella", "reference": "Efesios 5:25"},
        {"phrase": "A fin de presentársela a sí mismo, una iglesia gloriosa, que no tuviese mancha ni arruga", "reference": "Efesios 5:27"},
        {"phrase": "Grande es este misterio; mas yo digo esto respecto de Cristo y de la iglesia", "reference": "Efesios 5:32"}
    ]'::jsonb,
    'Lee atentamente Efesios 5:22-33 en tu Biblia Reina-Valera 1960. Marca la lectura como completada para realizar la evaluación del bloque.'
)
ON CONFLICT (block_id) DO UPDATE SET
    introduction = EXCLUDED.introduction,
    passage_explanation = EXCLUDED.passage_explanation,
    key_concepts = EXCLUDED.key_concepts,
    central_ideas = EXCLUDED.central_ideas,
    key_phrases = EXCLUDED.key_phrases;

-- ------------------------------------------------------------------------------
-- 2. PREGUNTAS Y OPCIONES DE LOS BLOQUES DE EFESIOS 5
-- ------------------------------------------------------------------------------

-- PREGUNTAS BLOQUE 5.1 (Efesios 5:1-7)
INSERT INTO public.questions (id, block_id, chapter_id, question_type, prompt, verse_reference, explanation, points, difficulty, order_index, is_active)
VALUES
(
    'q0005001-0001-0000-0000-000000000001',
    'b0000005-0001-0000-0000-000000000001',
    'c0000000-0000-0000-0000-000000000005',
    'multiple_choice',
    'Según Efesios 5:1-2, ¿a quién debemos imitar y cómo debemos andar?',
    'Efesios 5:1-2',
    'Efesios 5:1-2 manda: "Sed, pues, imitadores de Dios como hijos amados. Y andad en amor, como también Cristo nos amó...".',
    10, 'easy', 1, true
),
(
    'q0005001-0002-0000-0000-000000000002',
    'b0000005-0001-0000-0000-000000000001',
    'c0000000-0000-0000-0000-000000000005',
    'fill_blank',
    'Completa Efesios 5:5: "ningún fornicario, o inmundo, o avaro, que es ________, tiene herencia en el reino de Cristo y de Dios".',
    'Efesios 5:5',
    'Efesios 5:5 identifica al avaro como "idólatra".',
    10, 'medium', 2, true
),
(
    'q0005001-0003-0000-0000-000000000003',
    'b0000005-0001-0000-0000-000000000001',
    'c0000000-0000-0000-0000-000000000005',
    'multiple_choice',
    '¿Qué tipo de lenguaje señala Pablo en Efesios 5:4 que no conviene a los santos, y qué debe haber en su lugar?',
    'Efesios 5:4',
    'Efesios 5:4 declara: "ni palabras deshonestas, ni necedades, ni truhanerías, que no convienen, sino antes bien acciones de gracias".',
    10, 'easy', 3, true
),
(
    'q0005001-0004-0000-0000-000000000004',
    'b0000005-0001-0000-0000-000000000001',
    'c0000000-0000-0000-0000-000000000005',
    'true_false',
    'Efesios 5:6 advierte que por causa de la desobediencia moral e inmunda viene la ira de Dios sobre los hijos de desobediencia.',
    'Efesios 5:6',
    'Verdadero. Efesios 5:6 dice: "Nadie os engañe con palabras vanas, porque por estas cosas viene la ira de Dios sobre los hijos de desobediencia".',
    10, 'easy', 4, true
),
(
    'q0005001-0005-0000-0000-000000000005',
    'b0000005-0001-0000-0000-000000000001',
    'c0000000-0000-0000-0000-000000000005',
    'reference_identification',
    '¿En qué versículo se encuentra el mandamiento: "Sed, pues, imitadores de Dios como hijos amados"?',
    'Efesios 5:1',
    'Esta célebre exhortación encabeza el capítulo en Efesios 5:1.',
    10, 'easy', 5, true
),
(
    'q0005001-0006-0000-0000-000000000006',
    'b0000005-0001-0000-0000-000000000001',
    'c0000000-0000-0000-0000-000000000005',
    'multiple_choice',
    '¿Cómo describe Pablo la ofrenda y sacrificio de Cristo a Dios en Efesios 5:2?',
    'Efesios 5:2',
    'Efesios 5:2 lo describe como: "ofrenda y sacrificio a Dios en olor fragante".',
    10, 'medium', 6, true
)
ON CONFLICT (id) DO NOTHING;

-- Opciones Bloque 5.1
INSERT INTO public.question_options (question_id, option_text, is_correct, order_index)
VALUES
-- q1: multiple_choice
('q0005001-0001-0000-0000-000000000001', 'Imitadores de Dios como hijos amados, andando en amor como Cristo nos amó', true, 1),
('q0005001-0001-0000-0000-000000000001', 'Imitadores de los sabios griegos, andando según la filosofía estoica', false, 2),
('q0005001-0001-0000-0000-000000000001', 'Imitadores de los fariseos, andando conforme a los ayunos rituales', false, 3),
('q0005001-0001-0000-0000-000000000001', 'Imitadores de los sacerdotes paganos de Éfeso', false, 4),

-- q2: fill_blank
('q0005001-0002-0000-0000-000000000002', 'idólatra', true, 1),

-- q3: multiple_choice
('q0005001-0003-0000-0000-000000000003', 'Palabras deshonestas, necedades y truhanerías; en su lugar, acciones de gracias', true, 1),
('q0005001-0003-0000-0000-000000000003', 'Cánticos espirituales; en su lugar, discursos políticos', false, 2),
('q0005001-0003-0000-0000-000000000003', 'Salmos e himnos; en su lugar, silencio monástico absoluto', false, 3),
('q0005001-0003-0000-0000-000000000003', 'Lecturas proféticas; en su lugar, poesía romana', false, 4),

-- q4: true_false
('q0005001-0004-0000-0000-000000000004', 'Verdadero', true, 1),
('q0005001-0004-0000-0000-000000000004', 'Falso', false, 2),

-- q5: reference_identification
('q0005001-0005-0000-0000-000000000005', 'Efesios 5:1', true, 1),
('q0005001-0005-0000-0000-000000000005', 'Efesios 5:3', false, 2),
('q0005001-0005-0000-0000-000000000005', 'Efesios 5:5', false, 3),
('q0005001-0005-0000-0000-000000000005', 'Efesios 5:7', false, 4),

-- q6: multiple_choice
('q0005001-0006-0000-0000-000000000006', 'En olor fragante', true, 1),
('q0005001-0006-0000-0000-000000000006', 'Como un tributo de plata terrenal', false, 2),
('q0005001-0006-0000-0000-000000000006', 'Como una ordenanza transitoria del templo', false, 3),
('q0005001-0006-0000-0000-000000000006', 'Como un misterio reservado solo a los ángeles', false, 4)
ON CONFLICT (id) DO NOTHING;

-- Asociar preguntas Bloque 5.1
INSERT INTO public.assessment_questions (assessment_id, question_id, order_index)
VALUES
('e0000005-0001-0000-0000-000000000001', 'q0005001-0001-0000-0000-000000000001', 1),
('e0000005-0001-0000-0000-000000000001', 'q0005001-0002-0000-0000-000000000002', 2),
('e0000005-0001-0000-0000-000000000001', 'q0005001-0003-0000-0000-000000000003', 3),
('e0000005-0001-0000-0000-000000000001', 'q0005001-0004-0000-0000-000000000004', 4),
('e0000005-0001-0000-0000-000000000001', 'q0005001-0005-0000-0000-000000000005', 5),
('e0000005-0001-0000-0000-000000000001', 'q0005001-0006-0000-0000-000000000006', 6)
ON CONFLICT DO NOTHING;

-- PREGUNTAS BLOQUE 5.2 (Efesios 5:8-14)
INSERT INTO public.questions (id, block_id, chapter_id, question_type, prompt, verse_reference, explanation, points, difficulty, order_index, is_active)
VALUES
(
    'q0005002-0001-0000-0000-000000000001',
    'b0000005-0002-0000-0000-000000000005',
    'c0000000-0000-0000-0000-000000000005',
    'multiple_choice',
    'Según Efesios 5:8, ¿qué eran los creyentes en otro tiempo y qué son ahora en el Señor?',
    'Efesios 5:8',
    'Efesios 5:8 dice textualmente: "Porque en otro tiempo erais tinieblas, mas ahora sois luz en el Señor; andad como hijos de luz".',
    10, 'easy', 1, true
),
(
    'q0005002-0002-0000-0000-000000000002',
    'b0000005-0002-0000-0000-000000000005',
    'c0000000-0000-0000-0000-000000000005',
    'multiple_choice',
    '¿En qué consiste el fruto del Espíritu según Efesios 5:9?',
    'Efesios 5:9',
    'Efesios 5:9 declara: "(porque el fruto del Espíritu es en toda bondad, justicia y verdad)".',
    10, 'easy', 2, true
),
(
    'q0005002-0003-0000-0000-000000000003',
    'b0000005-0002-0000-0000-000000000005',
    'c0000000-0000-0000-0000-000000000005',
    'fill_blank',
    'Completa Efesios 5:11: "Y no participéis en las obras infructuosas de las tinieblas, sino más bien ________".',
    'Efesios 5:11',
    'Efesios 5:11 manda: "...sino más bien reprendedlas".',
    10, 'medium', 3, true
),
(
    'q0005002-0004-0000-0000-000000000004',
    'b0000005-0002-0000-0000-000000000005',
    'c0000000-0000-0000-0000-000000000005',
    'true_false',
    'Efesios 5:10 manda al creyente andar "comprobando lo que es agradable al Señor".',
    'Efesios 5:10',
    'Verdadero. El cristiano examina continuamente sus decisiones a la luz de lo que agrada a Dios.',
    10, 'easy', 4, true
),
(
    'q0005002-0005-0000-0000-000000000005',
    'b0000005-0002-0000-0000-000000000005',
    'c0000000-0000-0000-0000-000000000005',
    'reference_identification',
    '¿En qué versículo se encuentra el llamado: "Despiértate, tú que duermes, y levántate de los muertos, y te alumbrará Cristo"?',
    'Efesios 5:14',
    'Este himno espiritual se ubica en Efesios 5:14.',
    10, 'easy', 5, true
),
(
    'q0005002-0006-0000-0000-000000000006',
    'b0000005-0002-0000-0000-000000000005',
    'c0000000-0000-0000-0000-000000000005',
    'multiple_choice',
    '¿Qué efecto tiene la luz sobre las cosas ocultas según Efesios 5:13?',
    'Efesios 5:13',
    'Efesios 5:13 señala: "Mas todas las cosas, cuando son puestas en evidencia por la luz, son hechas manifiestas; porque la luz es lo que manifiesta todo".',
    10, 'medium', 6, true
)
ON CONFLICT (id) DO NOTHING;

-- Opciones Bloque 5.2
INSERT INTO public.question_options (question_id, option_text, is_correct, order_index)
VALUES
-- q1: multiple_choice
('q0005002-0001-0000-0000-000000000001', 'En otro tiempo erais tinieblas, mas ahora sois luz en el Señor', true, 1),
('q0005002-0001-0000-0000-000000000001', 'En otro tiempo erais sabios, mas ahora sois ignorantes', false, 2),
('q0005002-0001-0000-0000-000000000001', 'En otro tiempo erais libres, mas ahora estáis presos bajo la ley', false, 3),
('q0005002-0001-0000-0000-000000000001', 'En otro tiempo erais prósperos, mas ahora sois mendigos', false, 4),

-- q2: multiple_choice
('q0005002-0002-0000-0000-000000000002', 'En toda bondad, justicia y verdad', true, 1),
('q0005002-0002-0000-0000-000000000002', 'En sacrificios, ayunos y vigilias físicas', false, 2),
('q0005002-0002-0000-0000-000000000002', 'En riquezas, honras terrenales y títulos', false, 3),
('q0005002-0002-0000-0000-000000000002', 'En elocuencia oratoria y debates públicos', false, 4),

-- q3: fill_blank
('q0005002-0003-0000-0000-000000000003', 'reprendedlas', true, 1),

-- q4: true_false
('q0005002-0004-0000-0000-000000000004', 'Verdadero', true, 1),
('q0005002-0004-0000-0000-000000000004', 'Falso', false, 2),

-- q5: reference_identification
('q0005002-0005-0000-0000-000000000005', 'Efesios 5:14', true, 1),
('q0005002-0005-0000-0000-000000000005', 'Efesios 5:8', false, 2),
('q0005002-0005-0000-0000-000000000005', 'Efesios 5:10', false, 3),
('q0005002-0005-0000-0000-000000000005', 'Efesios 5:12', false, 4),

-- q6: multiple_choice
('q0005002-0006-0000-0000-000000000006', 'Son puestas en evidencia y hechas manifiestas', true, 1),
('q0005002-0006-0000-0000-000000000006', 'Quedan ocultas bajo la arena del tiempo', false, 2),
('q0005002-0006-0000-0000-000000000006', 'Se confunden con los misterios humanos', false, 3),
('q0005002-0006-0000-0000-000000000006', 'Son justificadas por la debilidad humana', false, 4)
ON CONFLICT (id) DO NOTHING;

-- Asociar preguntas Bloque 5.2
INSERT INTO public.assessment_questions (assessment_id, question_id, order_index)
VALUES
('e0000005-0002-0000-0000-000000000002', 'q0005002-0001-0000-0000-000000000001', 1),
('e0000005-0002-0000-0000-000000000002', 'q0005002-0002-0000-0000-000000000002', 2),
('e0000005-0002-0000-0000-000000000002', 'q0005002-0003-0000-0000-000000000003', 3),
('e0000005-0002-0000-0000-000000000002', 'q0005002-0004-0000-0000-000000000004', 4),
('e0000005-0002-0000-0000-000000000002', 'q0005002-0005-0000-0000-000000000005', 5),
('e0000005-0002-0000-0000-000000000002', 'q0005002-0006-0000-0000-000000000006', 6)
ON CONFLICT DO NOTHING;

-- PREGUNTAS BLOQUE 5.3 (Efesios 5:15-21)
INSERT INTO public.questions (id, block_id, chapter_id, question_type, prompt, verse_reference, explanation, points, difficulty, order_index, is_active)
VALUES
(
    'q0005003-0001-0000-0000-000000000001',
    'b0000005-0003-0000-0000-000000000005',
    'c0000000-0000-0000-0000-000000000005',
    'multiple_choice',
    'Según Efesios 5:15-16, ¿por qué razón deben los creyentes andar con diligencia y redimir el tiempo?',
    'Efesios 5:15-16',
    'Efesios 5:16 explica la causa: "...redimiendo el tiempo, porque los días son malos".',
    10, 'easy', 1, true
),
(
    'q0005003-0002-0000-0000-000000000002',
    'b0000005-0003-0000-0000-000000000005',
    'c0000000-0000-0000-0000-000000000005',
    'fill_blank',
    'Completa Efesios 5:18: "No os embriaguéis con vino, en lo cual hay disolución; antes bien sed ________ del Espíritu".',
    'Efesios 5:18',
    'Efesios 5:18 manda: "...antes bien sed llenos del Espíritu".',
    10, 'easy', 2, true
),
(
    'q0005003-0003-0000-0000-000000000003',
    'b0000005-0003-0000-0000-000000000005',
    'c0000000-0000-0000-0000-000000000005',
    'multiple_choice',
    '¿Con qué expresiones musicales y espirituales deben hablar entre sí los creyentes según Efesios 5:19?',
    'Efesios 5:19',
    'Efesios 5:19 enumera: "hablando entre vosotros con salmos, con himnos y cánticos espirituales, cantando y alabando al Señor en vuestros corazones".',
    10, 'easy', 3, true
),
(
    'q0005003-0004-0000-0000-000000000004',
    'b0000005-0003-0000-0000-000000000005',
    'c0000000-0000-0000-0000-000000000005',
    'true_false',
    'Efesios 5:20 enseña que debemos dar gracias a Dios Padre únicamente cuando las circunstancias terrenales sean prósperas.',
    'Efesios 5:20',
    'Falso. Efesios 5:20 manda: "dando siempre gracias por todo al Dios y Padre, en el nombre de nuestro Señor Jesucristo".',
    10, 'easy', 4, true
),
(
    'q0005003-0005-0000-0000-000000000005',
    'b0000005-0003-0000-0000-000000000005',
    'c0000000-0000-0000-0000-000000000005',
    'reference_identification',
    '¿En qué versículo de Efesios se encuentra la ordenanza: "Someteos unos a otros en el temor de Dios"?',
    'Efesios 5:21',
    'Este versículo de sumisión mutua y temor reverente es Efesios 5:21.',
    10, 'easy', 5, true
),
(
    'q0005003-0006-0000-0000-000000000006',
    'b0000005-0003-0000-0000-000000000005',
    'c0000000-0000-0000-0000-000000000005',
    'multiple_choice',
    '¿Qué exhortación sobre la sabiduría y la voluntad divina da Pablo en Efesios 5:17?',
    'Efesios 5:17',
    'Efesios 5:17 aconseja: "Por tanto, no seáis insensatos, sino entendidos de cuál sea la voluntad del Señor".',
    10, 'medium', 6, true
)
ON CONFLICT (id) DO NOTHING;

-- Opciones Bloque 5.3
INSERT INTO public.question_options (question_id, option_text, is_correct, order_index)
VALUES
-- q1: multiple_choice
('q0005003-0001-0000-0000-000000000001', 'Porque los días son malos', true, 1),
('q0005003-0001-0000-0000-000000000001', 'Porque el imperio romano prohíbe el descanso', false, 2),
('q0005003-0001-0000-0000-000000000001', 'Para ganar riquezas comerciales en Éfeso', false, 3),
('q0005003-0001-0000-0000-000000000001', 'Para competir con los filósofos griegos', false, 4),

-- q2: fill_blank
('q0005003-0002-0000-0000-000000000002', 'llenos', true, 1),

-- q3: multiple_choice
('q0005003-0003-0000-0000-000000000003', 'Con salmos, con himnos y cánticos espirituales', true, 1),
('q0005003-0003-0000-0000-000000000003', 'Con quejas, murmureos y disputas legales', false, 2),
('q0005003-0003-0000-0000-000000000003', 'Con poemas paganos a la diosa Diana', false, 3),
('q0005003-0003-0000-0000-000000000003', 'Con decretos imperiales de Roma', false, 4),

-- q4: true_false
('q0005003-0004-0000-0000-000000000004', 'Verdadero', false, 1),
('q0005003-0004-0000-0000-000000000004', 'Falso', true, 2),

-- q5: reference_identification
('q0005003-0005-0000-0000-000000000005', 'Efesios 5:21', true, 1),
('q0005003-0005-0000-0000-000000000005', 'Efesios 5:15', false, 2),
('q0005003-0005-0000-0000-000000000005', 'Efesios 5:18', false, 3),
('q0005003-0005-0000-0000-000000000005', 'Efesios 5:22', false, 4),

-- q6: multiple_choice
('q0005003-0006-0000-0000-000000000006', 'No seáis insensatos, sino entendidos de cuál sea la voluntad del Señor', true, 1),
('q0005003-0006-0000-0000-000000000006', 'No estudiéis las Escrituras sin permiso sacerdotal', false, 2),
('q0005003-0006-0000-0000-000000000006', 'No participéis en los cultos de la iglesia', false, 3),
('q0005003-0006-0000-0000-000000000006', 'No hagáis preguntas sobre la doctrina', false, 4)
ON CONFLICT (id) DO NOTHING;

-- Asociar preguntas Bloque 5.3
INSERT INTO public.assessment_questions (assessment_id, question_id, order_index)
VALUES
('e0000005-0003-0000-0000-000000000003', 'q0005003-0001-0000-0000-000000000001', 1),
('e0000005-0003-0000-0000-000000000003', 'q0005003-0002-0000-0000-000000000002', 2),
('e0000005-0003-0000-0000-000000000003', 'q0005003-0003-0000-0000-000000000003', 3),
('e0000005-0003-0000-0000-000000000003', 'q0005003-0004-0000-0000-000000000004', 4),
('e0000005-0003-0000-0000-000000000003', 'q0005003-0005-0000-0000-000000000005', 5),
('e0000005-0003-0000-0000-000000000003', 'q0005003-0006-0000-0000-000000000006', 6)
ON CONFLICT DO NOTHING;

-- PREGUNTAS BLOQUE 5.4 (Efesios 5:22-33)
INSERT INTO public.questions (id, block_id, chapter_id, question_type, prompt, verse_reference, explanation, points, difficulty, order_index, is_active)
VALUES
(
    'q0005004-0001-0000-0000-000000000001',
    'b0000005-0004-0000-0000-000000000005',
    'c0000000-0000-0000-0000-000000000005',
    'multiple_choice',
    '¿Cuál es el modelo supremo que Pablo da a los maridos para amar a sus esposas en Efesios 5:25?',
    'Efesios 5:25',
    'Efesios 5:25 ordena: "Maridos, amad a vuestras mujeres, así como Cristo amó a la iglesia, y se entregó a sí mismo por ella".',
    10, 'easy', 1, true
),
(
    'q0005004-0002-0000-0000-000000000002',
    'b0000005-0004-0000-0000-000000000005',
    'c0000000-0000-0000-0000-000000000005',
    'multiple_choice',
    '¿Para qué entregó Cristo su vida por la iglesia según Efesios 5:26-27?',
    'Efesios 5:26-27',
    'Efesios 5:26-27 responde: "para santificarla, habiéndola purificado en el lavamiento del agua por la palabra, a fin de presentársela a sí mismo, una iglesia gloriosa, que no tuviese mancha ni arruga".',
    10, 'medium', 2, true
),
(
    'q0005004-0003-0000-0000-000000000003',
    'b0000004-0004-0000-0000-000000000005',
    'c0000000-0000-0000-0000-000000000005',
    'fill_blank',
    'Completa Efesios 5:32: "Grande es este ________; mas yo digo esto respecto de Cristo y de la iglesia".',
    'Efesios 5:32',
    'Efesios 5:32 declara: "Grande es este misterio; mas yo digo esto respecto de Cristo y de la iglesia".',
    10, 'easy', 3, true
),
(
    'q0005004-0004-0000-0000-000000000004',
    'b0000004-0004-0000-0000-000000000005',
    'c0000000-0000-0000-0000-000000000005',
    'multiple_choice',
    '¿Qué pasaje del Antiguo Testamento cita Pablo en Efesios 5:31 para fundamentar el matrimonio?',
    'Efesios 5:31',
    'Pablo cita Génesis 2:24: "Por esto dejará el hombre a su padre y a su madre, y se unirá a su mujer, y los dos serán una sola carne".',
    10, 'medium', 4, true
),
(
    'q0005004-0005-0000-0000-000000000005',
    'b0000004-0004-0000-0000-000000000005',
    'c0000000-0000-0000-0000-000000000005',
    'true_false',
    'En Efesios 5:23 se establece que el marido es cabeza de la mujer, así como Cristo es cabeza de la iglesia.',
    'Efesios 5:23',
    'Verdadero. Efesios 5:23 establece esta clara analogía teológica.',
    10, 'easy', 5, true
),
(
    'q0005004-0006-0000-0000-000000000006',
    'b0000004-0004-0000-0000-000000000005',
    'c0000000-0000-0000-0000-000000000005',
    'reference_identification',
    '¿En qué versículo se encuentra la orden: "Maridos, amad a vuestras mujeres, así como Cristo amó a la iglesia, y se entregó a sí mismo por ella"?',
    'Efesios 5:25',
    'Esta regla para los esposos se encuentra en Efesios 5:25.',
    10, 'easy', 6, true
),
(
    'q0005004-0007-0000-0000-000000000007',
    'b0000004-0004-0000-0000-000000000005',
    'c0000000-0000-0000-0000-000000000005',
    'multiple_choice',
    '¿Cuál es la doble síntesis práctica con que Pablo concluye el capítulo 5 en el versículo 33?',
    'Efesios 5:33',
    'Efesios 5:33 sintetiza: "cada uno de vosotros ame también a su mujer como a sí mismo; y la mujer respete a su marido".',
    10, 'medium', 7, true
)
ON CONFLICT (id) DO NOTHING;

-- Opciones Bloque 5.4
INSERT INTO public.question_options (question_id, option_text, is_correct, order_index)
VALUES
-- q1: multiple_choice
('q0005004-0001-0000-0000-000000000001', 'Así como Cristo amó a la iglesia, y se entregó a sí mismo por ella', true, 1),
('q0005004-0001-0000-0000-000000000001', 'Según las costumbres patriarcales del imperio romano', false, 2),
('q0005004-0001-0000-0000-000000000001', 'Exigiendo obediencia ciega sin dar nada a cambio', false, 3),
('q0005004-0001-0000-0000-000000000001', 'Conforme al valor de la dote recibida de los suegros', false, 4),

-- q2: multiple_choice
('q0005004-0002-0000-0000-000000000002', 'Para santificarla y presentársela a sí mismo como una iglesia gloriosa sin mancha ni arruga', true, 1),
('q0005004-0002-0000-0000-000000000002', 'Para edificar templos monumentales en Asia Menor', false, 2),
('q0005004-0002-0000-0000-000000000002', 'Para someter a los reinos de la tierra por la fuerza', false, 3),
('q0005004-0002-0000-0000-000000000002', 'Para abolir la institución del matrimonio civil', false, 4),

-- q3: fill_blank
('q0005004-0003-0000-0000-000000000003', 'misterio', true, 1),

-- q4: multiple_choice
('q0005004-0004-0000-0000-000000000004', 'Génesis 2:24 (dejará el hombre a su padre y a su madre...)', true, 1),
('q0005004-0004-0000-0000-000000000004', 'Éxodo 20:12 (honra a tu padre y a tu madre)', false, 2),
('q0005004-0004-0000-0000-000000000004', 'Levítico 19:18 (amarás a tu prójimo)', false, 3),
('q0005004-0004-0000-0000-000000000004', 'Deuteronomio 6:4 (Oye Israel, Jehová nuestro Dios)', false, 4),

-- q5: true_false
('q0005004-0005-0000-0000-000000000005', 'Verdadero', true, 1),
('q0005004-0005-0000-0000-000000000005', 'Falso', false, 2),

-- q6: reference_identification
('q0005004-0006-0000-0000-000000000006', 'Efesios 5:25', true, 1),
('q0005004-0006-0000-0000-000000000006', 'Efesios 5:22', false, 2),
('q0005004-0006-0000-0000-000000000006', 'Efesios 5:28', false, 3),
('q0005004-0006-0000-0000-000000000006', 'Efesios 5:31', false, 4),

-- q7: multiple_choice
('q0005004-0007-0000-0000-000000000007', 'El marido ame a su mujer como a sí mismo; y la mujer respete a su marido', true, 1),
('q0005004-0007-0000-0000-000000000007', 'El marido gobierne con rigor y la mujer guarde silencio fuera del hogar', false, 2),
('q0005004-0007-0000-0000-000000000007', 'Ambos vivan separados para no cometer pecado sexual', false, 3),
('q0005004-0007-0000-0000-000000000007', 'Vivan sin reglas bajo el libre arbitrio de su propia opinión', false, 4)
ON CONFLICT (id) DO NOTHING;

-- Asociar preguntas Bloque 5.4
INSERT INTO public.assessment_questions (assessment_id, question_id, order_index)
VALUES
('e0000005-0004-0000-0000-000000000005', 'q0005004-0001-0000-0000-000000000001', 1),
('e0000005-0004-0000-0000-000000000005', 'q0005004-0002-0000-0000-000000000002', 2),
('e0000005-0004-0000-0000-000000000005', 'q0005004-0003-0000-0000-000000000003', 3),
('e0000005-0004-0000-0000-000000000005', 'q0005004-0004-0000-0000-000000000004', 4),
('e0000005-0004-0000-0000-000000000005', 'q0005004-0005-0000-0000-000000000005', 5),
('e0000005-0004-0000-0000-000000000005', 'q0005004-0006-0000-0000-000000000006', 6),
('e0000005-0004-0000-0000-000000000005', 'q0005004-0007-0000-0000-000000000007', 7)
ON CONFLICT DO NOTHING;


-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
-- ARCHIVO: 006_efesios_capitulo_6.sql
-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

-- ==============================================================================
-- BIBLIONARIO - SEED 006: EFESIOS CAPÍTULO 6 (RVR1960)
-- Explicaciones completas y Evaluaciones de los 4 Bloques (6:1-4, 6:5-9, 6:10-20, 6:21-24)
-- ==============================================================================

-- ------------------------------------------------------------------------------
-- 1. EXPLICACIONES DE LOS 4 BLOQUES DE EFESIOS 6
-- ------------------------------------------------------------------------------

-- Bloque 6.1: Efesios 6:1-4
INSERT INTO public.block_explanations (
    block_id,
    introduction,
    biblical_passage_rvr1960,
    passage_explanation,
    key_concepts,
    central_ideas,
    key_phrases,
    reading_instruction
)
VALUES (
    'b0000006-0001-0000-0000-000000000001',
    'Pablo aborda la relación filial en el hogar cristiano: el deber sagrado de obediencia y honra de los hijos hacia sus padres, y la crianza amorosa y equilibrada que los padres deben impartir sin provocar ira.',
    '1 Hijos, obedeced en el Señor a vuestros padres, porque esto es justo.
2 Honra a tu padre y a tu madre, que es el primer mandamiento con promesa;
3 para que te vaya bien, y seas de larga vida sobre la tierra.
4 Y vosotros, padres, no provoquéis a ira a vuestros hijos, sino criadlos en disciplina y amonestación del Señor.',
    'Pablo traslada la llenura del Espíritu a la vida cotidiana entre padres e hijos:

1. El mandamiento y la promesa para los hijos (v. 1-3):
- "Hijos, obedeced en el Señor a vuestros padres, porque esto es justo":
  La obediencia está enmarcada "en el Señor", reconociendo que honrar a los padres es un acto de adoración y justicia ante Dios.
- Citando el quinto mandamiento del Decálogo (Éxodo 20:12 y Deuteronomio 5:16), Pablo destaca que es "el primer mandamiento con promesa":
  a) "Para que te vaya bien" (bienestar y bendición providencial).
  b) "Y seas de larga vida sobre la tierra" (preservación y fruto de una vida en orden con Dios).
"Honrar" va más allá del acatamiento de órdenes en la niñez; implica respeto profundo, estima y cuidado hacia los progenitores a lo largo de toda la vida.

2. La advertencia y responsabilidad formativa de los padres (v. 4):
Pablo se dirige especialmente a los padres (patres, cabezas de hogar) con un mandato doble:
- Prohibición negativa: "no provoquéis a ira a vuestros hijos".
  Evitar la severidad irrazonable, el maltrato verbal o físico, la arbitrariedad, la humillación o la hipocresía que engendra resentimiento y amargura en el corazón de los hijos.
- Mandato positivo: "sino criadlos en disciplina y amonestación del Señor".
  Nutrirlos amorosamente en:
  a) "Disciplina" (en griego paideia): entrenamiento integral, corrección formativa y hábitos piadosos.
  b) "Amonestación del Señor": instrucción verbal basada en las verdades de la Palabra de Dios.',
    '[
        {"concept": "Obediencia en el Señor", "definition": "Acatar las instrucciones de los padres motivado por el deseo de agradar a Cristo y someterse a su orden soberano."},
        {"concept": "Primer mandamiento con promesa", "definition": "El precepto del Decálogo de honrar a los padres que incluye explícitamente la promesa de bienestar y vida prolongada."},
        {"concept": "No provocar a ira", "definition": "Evitar demandas excesivas, aspereza o injusticias que desanimen o llenen de rebeldía y rencor a los hijos."},
        {"concept": "Disciplina y amonestación", "definition": "Formación integral y corrección paciente guiada por los principios y el carácter del Señor Jesucristo."}
    ]'::jsonb,
    '[
        "Los hijos tienen el deber santo y justo de obedecer y honrar a sus padres bajo la bendición prometida por Dios.",
        "Los padres deben evitar la tiranía y la severidad destructiva que provocan amargura en sus hijos.",
        "La crianza en el hogar cristiano debe fundamentarse en la instrucción, la disciplina y el ejemplo del Señor."
    ]'::jsonb,
    '[
        {"phrase": "Hijos, obedeced en el Señor a vuestros padres, porque esto es justo", "reference": "Efesios 6:1"},
        {"phrase": "Honra a tu padre y a tu madre, que es el primer mandamiento con promesa", "reference": "Efesios 6:2"},
        {"phrase": "No provoquéis a ira a vuestros hijos, sino criadlos en disciplina y amonestación del Señor", "reference": "Efesios 6:4"}
    ]'::jsonb,
    'Lee atentamente Efesios 6:1-4 en tu Biblia Reina-Valera 1960. Al concluir, confirma la lectura para habilitar la evaluación del bloque.'
)
ON CONFLICT (block_id) DO UPDATE SET
    introduction = EXCLUDED.introduction,
    passage_explanation = EXCLUDED.passage_explanation,
    key_concepts = EXCLUDED.key_concepts,
    central_ideas = EXCLUDED.central_ideas,
    key_phrases = EXCLUDED.key_phrases;

-- Bloque 6.2: Efesios 6:5-9
INSERT INTO public.block_explanations (
    block_id,
    introduction,
    biblical_passage_rvr1960,
    passage_explanation,
    key_concepts,
    central_ideas,
    key_phrases,
    reading_instruction
)
VALUES (
    'b0000006-0002-0000-0000-000000000002',
    'Pablo transforma la ética laboral y social: los siervos deben servir de corazón como trabajando para Cristo, y los amos deben tratar con justicia recordando que en el cielo hay un Amo supremo sin acepción de personas.',
    '5 Siervos, obedeced a vuestros amos terrenales con temor y temblor, con sencillez de vuestro corazón, como a Cristo;
6 no sirviendo al ojo, como los que quieren agradar a los hombres, sino como siervos de Cristo, de corazón haciendo la voluntad de Dios;
7 sirviendo de buena voluntad, como al Señor y no a los hombres,
8 sabiendo que el bien que cada uno hiciere, ése recibirá del Señor, sea siervo o sea libre.
9 Y vosotros, amos, haced con ellos lo mismo, dejando las amenazas, sabiendo que el Señor de ellos y vuestro está en los cielos, y que para con él no hay acepción de personas.',
    'Pablo aborda la relación entre siervos (trabajadores) y amos (empleadores), revolucionando la dignidad del trabajo:

1. La actitud y ética del trabajador cristiano (v. 5-8):
- "Con temor y temblor, con sencillez de vuestro corazón, como a Cristo":
  El trabajo diario no se realiza con desgano ni hipocresía, sino con reverencia y honestidad, viendo a Jesús como el verdadero jefe supremo detrás del patrón terrenal.
- "No sirviendo al ojo": condena la actitud de trabajar duro únicamente cuando el supervisor está mirando para aparentar. El cristiano trabaja "de corazón haciendo la voluntad de Dios" en todo momento.
- "Sirviendo de buena voluntad, como al Señor y no a los hombres": el trabajo secular se transforma en un acto de adoración sagrado.
- La certeza de la recompensa divina (v. 8): sea cual sea la posición terrenal, el Señor recompensará con justicia cada obra buena.

2. La advertencia y responsabilidad de los líderes y empleadores (v. 9):
- "Haced con ellos lo mismo": los amos deben tratar a sus subordinados con el mismo respeto, benevolencia e integridad moral.
- "Dejando las amenazas": prohíbe el abuso de poder, la prepotencia y la violencia verbal o física.
- El principio supremo de igualdad: "sabiendo que el Señor de ellos y vuestro está en los cielos, y que para con él no hay acepción de personas". Ambos rendirán cuentas ante el mismo Juez y Amo celestial, quien no se deja impresionar por rangos sociales humanos.',
    '[
        {"concept": "Servir al ojo", "definition": "Aparentar diligencia y esfuerzo únicamente cuando se está bajo la mirada o supervisión directa de los superiores."},
        {"concept": "Sencillez de corazón", "definition": "Integridad, sinceridad y pureza de motivos sin engaño ni dobles intenciones en el cumplimiento del deber."},
        {"concept": "Acepción de personas", "definition": "Favoritismo, parcialidad o discriminación basada en posición social, riqueza o poder terrenal, algo ajeno a Dios."},
        {"concept": "Amo en los cielos", "definition": "El señorío soberano de Cristo sobre todos los seres humanos por igual, amos y siervos."}
    ]'::jsonb,
    '[
        "El trabajo del creyente debe realizarse con excelencia e integridad como una ofrenda directa para Cristo.",
        "La hipocresía laboral de trabajar solo cuando nos vigilan es deshonrosa ante el Señor.",
        "Los jefes y gobernantes están obligados a tratar con justicia y sin amenazas a sus subordinados.",
        "Ante Dios no existe favoritismo terrenal; todos rendirán cuentas ante el mismo Juez celestial."
    ]'::jsonb,
    '[
        {"phrase": "No sirviendo al ojo, como los que quieren agradar a los hombres, sino como siervos de Cristo", "reference": "Efesios 6:6"},
        {"phrase": "Sirviendo de buena voluntad, como al Señor y no a los hombres", "reference": "Efesios 6:7"},
        {"phrase": "El Señor de ellos y vuestro está en los cielos, y para con él no hay acepción de personas", "reference": "Efesios 6:9"}
    ]'::jsonb,
    'Lee con cuidado Efesios 6:5-9 en tu Biblia Reina-Valera 1960. Marca la lectura como completada para realizar la evaluación del bloque.'
)
ON CONFLICT (block_id) DO UPDATE SET
    introduction = EXCLUDED.introduction,
    passage_explanation = EXCLUDED.passage_explanation,
    key_concepts = EXCLUDED.key_concepts,
    central_ideas = EXCLUDED.central_ideas,
    key_phrases = EXCLUDED.key_phrases;

-- Bloque 6.3: Efesios 6:10-20
INSERT INTO public.block_explanations (
    block_id,
    introduction,
    biblical_passage_rvr1960,
    passage_explanation,
    key_concepts,
    central_ideas,
    key_phrases,
    reading_instruction
)
VALUES (
    'b0000006-0003-0000-0000-000000000003',
    'Pablo convoca a la Iglesia a la batalla espiritual: describe la naturaleza invisible del combate y detalla cada pieza de la armadura de Dios, culminando en la oración incesante en el Espíritu.',
    '10 Por lo demás, hermanos míos, fortaleceos en el Señor, y en el poder de su fuerza.
11 Vestíos de toda la armadura de Dios, para que podáis estar firmes contra las asechanzas del diablo.
12 Porque no tenemos lucha contra sangre y carne, sino contra principados, contra potestades, contra los gobernadores de las tinieblas de este siglo, contra huestes espirituales de maldad en las regiones celestes.
13 Por tanto, tomad toda la armadura de Dios, para que podáis resistir en el día malo, y habiendo acabado todo, estar firmes.
14 Estad, pues, firmes, ceñidos vuestros lomos con la verdad, y vestidos con la coraza de justicia,
15 y calzados los pies con el apresto del evangelio de la paz.
16 Sobre todo, tomad el escudo de la fe, con que podáis apagar todos los dardos de fuego del maligno.
17 Y tomad el yelmo de la salvación, y la espada del Espíritu, que es la palabra de Dios;
18 orando en todo tiempo con toda oración y súplica en el Espíritu, y velando en ello con toda perseverancia y súplica por todos los santos;
19 y por mí, a fin de que al abrir mi boca me sea dada palabra para dar a conocer con denuedo el misterio del evangelio,
20 por el cual soy embajador en cadenas; que con denuedo hable de él, como debo hablar.',
    'La gran conclusión de la carta a los efesios describe la guerra espiritual del creyente:

1. El llamamiento a la fortaleza y la naturaleza del enemigo (v. 10-12):
- "Fortaleceos en el Señor, y en el poder de su fuerza": el cristiano no pelea con recursos humanos propios, sino con el poder omnipotente de Cristo.
- "Porque no tenemos lucha contra sangre y carne": los seres humanos (personas difíciles o perseguidores) no son el enemigo real; la verdadera batalla es contra huestes espirituales satánicas organizadas: principados, potestades, gobernadores de las tinieblas y fuerzas de maldad.
- "Para que podáis estar firmes contra las asechanzas del diablo": el enemigo ataca con maquinaciones, engaños y mentiras astutas.

2. Las seis piezas de la armadura de Dios (v. 13-17):
Inspirado por el soldado romano encadenado a él y por profecías mesiánicas de Isaías, Pablo describe la panoplia divina:
a) El cinturón de la verdad (v. 14a): ceñirse con la verdad objetiva de la Palabra y la sinceridad interior.
b) La coraza de justicia (v. 14b): protege el corazón; la justicia imputada de Cristo y una vida diaria de integridad moral.
c) El calzado del apresto del evangelio de la paz (v. 15): pies firmes y dispuestos a proclamar la paz de Cristo.
d) El escudo de la fe (v. 16): el scutum grande que cubría todo el cuerpo para apagar las flechas incendiadas del maligno (dudas, temores, tentaciones impuras).
e) El yelmo de la salvación (v. 17a): protege la mente y los pensamientos con la certeza inamovible de la redención presente y futura.
f) La espada del Espíritu (v. 17b): la única arma ofensiva, "la palabra de Dios" (el rhema específico de la Escritura proclamado con poder, como Jesús hizo en el desierto).

3. La atmósfera de la armadura: la oración incesante (v. 18-20):
La armadura es inútil sin oración constante:
- "Orando en todo tiempo": en toda circunstancia y época.
- "En el Espíritu": bajo la guía e inspiración del Espíritu Santo.
- "Velando con toda perseverancia por todos los santos": intercesión comunitaria vigilante.
- La petición de Pablo (v. 19-20): no pide comodidad ni liberación de la cárcel, sino denuedo (valentía santa) para proclamar el evangelio como "embajador en cadenas".',
    '[
        {"concept": "Armadura de Dios", "definition": "El conjunto de recursos espirituales, verdades y virtudes que Dios provee para la protección y victoria del creyente frente a Satanás."},
        {"concept": "Asechanzas del diablo", "definition": "Estrategias engañosas, trampas intelectuales y mentiras calculadas mediante las cuales el maligno procura derribar la fe."},
        {"concept": "Dardos de fuego", "definition": "Ataques espirituales repentinos de duda, acusación, desánimo, blasfemia o tentación lanzados contra la mente del cristiano."},
        {"concept": "Espada del Espíritu", "definition": "La Palabra de Dios viva, cortante y eficaz inspirada por el Espíritu para derribar las mentiras del enemigo."},
        {"concept": "Embajador en cadenas", "definition": "La dignidad apostólica de Pablo como representante oficial de Cristo ante las naciones a pesar de su prisión terrenal."}
    ]'::jsonb,
    '[
        "La guerra del cristiano no es contra personas físicas, sino contra poderes y maquinaciones espirituales demoníacas.",
        "La armadura provista por Dios es completa e indispensable para permanecer firmes en el día malo.",
        "La fe viva en las promesas de Dios es el escudo eficaz capaz de apagar todas las flechas ardientes de Satanás.",
        "La oración perseverante en el Espíritu y la intercesión por los hermanos es el soporte vital de toda la batalla espiritual."
    ]'::jsonb,
    '[
        {"phrase": "Fortaleceos en el Señor, y en el poder de su fuerza", "reference": "Efesios 6:10"},
        {"phrase": "Porque no tenemos lucha contra sangre y carne", "reference": "Efesios 6:12"},
        {"phrase": "Sobre todo, tomad el escudo de la fe, con que podáis apagar todos los dardos de fuego del maligno", "reference": "Efesios 6:16"},
        {"phrase": "Y la espada del Espíritu, que es la palabra de Dios", "reference": "Efesios 6:17"},
        {"phrase": "Orando en todo tiempo con toda oración y súplica en el Espíritu", "reference": "Efesios 6:18"}
    ]'::jsonb,
    'Lee con profunda reverencia Efesios 6:10-20 en tu Biblia Reina-Valera 1960. Al terminar, marca como leído para comenzar la evaluación.'
)
ON CONFLICT (block_id) DO UPDATE SET
    introduction = EXCLUDED.introduction,
    passage_explanation = EXCLUDED.passage_explanation,
    key_concepts = EXCLUDED.key_concepts,
    central_ideas = EXCLUDED.central_ideas,
    key_phrases = EXCLUDED.key_phrases;

-- Bloque 6.4: Efesios 6:21-24
INSERT INTO public.block_explanations (
    block_id,
    introduction,
    biblical_passage_rvr1960,
    passage_explanation,
    key_concepts,
    central_ideas,
    key_phrases,
    reading_instruction
)
VALUES (
    'b0000006-0004-0000-0000-000000000004',
    'Pablo concluye su gloriosa carta enviando a Tíquico para consolar a los efesios y pronuncia su bendición apostólica final de paz, amor, fe y gracia inalterable.',
    '21 Para que también vosotros sepáis mis asuntos, y lo que hago, todo os lo hará saber Tíquico, hermano amado y fiel ministro en el Señor,
22 el cual envié a vosotros para esto mismo, para que sepáis lo tocante a nosotros, y que consuele vuestros corazones.
23 Paz sea a los hermanos, y amor con fe, de Dios Padre y del Señor Jesucristo.
24 La gracia sea con todos los que aman a nuestro Señor Jesucristo con amor inalterable. Amén.',
    'Los versículos finales sellan la epístola con calidez fraternal y bendición solemne:

1. La encomienda de Tíquico (v. 21-22):
Pablo no viaja solo; está respaldado por compañeros de ministerio de entera confianza:
- Describe a Tíquico con dos hermosos títulos: "hermano amado y fiel ministro en el Señor".
- Su misión pastoral: viajar a Éfeso para informar a la iglesia sobre la situación personal de Pablo y "que consuele vuestros corazones" ante la preocupación por su encarcelamiento.

2. La bendición apostólica final (v. 23-24):
Pablo corona su epístola invocando tres bendiciones sagradas que proceden conjuntamente de "Dios Padre y del Señor Jesucristo":
a) Paz: tranquilidad interior y reconciliación con Dios y los hermanos.
b) Amor con fe: el amor genuino enraizado y sostenido por la confianza inquebrantable en Cristo.
c) Gracia: el favor eterno de Dios reservado para "todos los que aman a nuestro Señor Jesucristo con amor inalterable [incorruptible, imperecedero]". Amén.',
    '[
        {"concept": "Fiel ministro", "definition": "Un siervo de Cristo caracterizado por su lealtad, perseverancia, doctrina sana y confiabilidad en la encomienda del Señor."},
        {"concept": "Consolar los corazones", "definition": "El ministerio pastoral de confortar, alentar y afirmar la fe de los hermanos ante la adversidad."},
        {"concept": "Amor inalterable", "definition": "En griego aphtharsia, un amor incorruptible, inmortal, puro y perpetuo que jamás se marchita ni claudica."}
    ]'::jsonb,
    '[
        "El ministerio apostólico y pastoral se fundamenta en la colaboración de siervos fieles y amados como Tíquico.",
        "La paz, el amor y la fe son dones inseparables que fluyen de Dios Padre y del Señor Jesucristo.",
        "La gracia soberana de Dios reposa sobre todos aquellos cuyo amor hacia Jesucristo permanece incorruptible e inalterable."
    ]'::jsonb,
    '[
        {"phrase": "Tíquico, hermano amado y fiel ministro en el Señor", "reference": "Efesios 6:21"},
        {"phrase": "Paz sea a los hermanos, y amor con fe", "reference": "Efesios 6:23"},
        {"phrase": "La gracia sea con todos los que aman a nuestro Señor Jesucristo con amor inalterable", "reference": "Efesios 6:24"}
    ]'::jsonb,
    'Lee atentamente Efesios 6:21-24 en tu Biblia Reina-Valera 1960. Marca la lectura como completada para realizar la evaluación final del capítulo.'
)
ON CONFLICT (block_id) DO UPDATE SET
    introduction = EXCLUDED.introduction,
    passage_explanation = EXCLUDED.passage_explanation,
    key_concepts = EXCLUDED.key_concepts,
    central_ideas = EXCLUDED.central_ideas,
    key_phrases = EXCLUDED.key_phrases;

-- ------------------------------------------------------------------------------
-- 2. PREGUNTAS Y OPCIONES DE LOS BLOQUES DE EFESIOS 6
-- ------------------------------------------------------------------------------

-- PREGUNTAS BLOQUE 6.1 (Efesios 6:1-4)
INSERT INTO public.questions (id, block_id, chapter_id, question_type, prompt, verse_reference, explanation, points, difficulty, order_index, is_active)
VALUES
(
    'q0006001-0001-0000-0000-000000000001',
    'b0000006-0001-0000-0000-000000000001',
    'c0000000-0000-0000-0000-000000000006',
    'multiple_choice',
    'Según Efesios 6:1, ¿a quién deben obedecer los hijos en el Señor y por qué causa?',
    'Efesios 6:1',
    'Efesios 6:1 dice textualmente: "Hijos, obedeced en el Señor a vuestros padres, porque esto es justo".',
    10, 'easy', 1, true
),
(
    'q0006001-0002-0000-0000-000000000002',
    'b0000006-0001-0000-0000-000000000001',
    'c0000000-0000-0000-0000-000000000006',
    'fill_blank',
    'Completa Efesios 6:2: "Honra a tu padre y a tu madre, que es el primer mandamiento con ________".',
    'Efesios 6:2',
    'Efesios 6:2 afirma: "...que es el primer mandamiento con promesa".',
    10, 'easy', 2, true
),
(
    'q0006001-0003-0000-0000-000000000003',
    'b0000006-0001-0000-0000-000000000001',
    'c0000000-0000-0000-0000-000000000006',
    'multiple_choice',
    '¿Cuál es la doble promesa asociada a honrar a padre y madre según Efesios 6:3?',
    'Efesios 6:3',
    'Efesios 6:3 declara: "para que te vaya bien, y seas de larga vida sobre la tierra".',
    10, 'easy', 3, true
),
(
    'q0006001-0004-0000-0000-000000000004',
    'b0000006-0001-0000-0000-000000000001',
    'c0000000-0000-0000-0000-000000000006',
    'multiple_choice',
    '¿Qué instrucción negativa y qué mandato positivo da Pablo a los padres en Efesios 6:4?',
    'Efesios 6:4',
    'Efesios 6:4 manda: "no provoquéis a ira a vuestros hijos, sino criadlos en disciplina y amonestación del Señor".',
    10, 'medium', 4, true
),
(
    'q0006001-0005-0000-0000-000000000005',
    'b0000006-0001-0000-0000-000000000001',
    'c0000000-0000-0000-0000-000000000006',
    'true_false',
    'Efesios 6:4 permite a los padres ser ásperos y humillar a sus hijos si estos no obedecen sus mandatos.',
    'Efesios 6:4',
    'Falso. Efesios 6:4 prohíbe explícitamente: "no provoquéis a ira a vuestros hijos".',
    10, 'easy', 5, true
),
(
    'q0006001-0006-0000-0000-000000000006',
    'b0000006-0001-0000-0000-000000000001',
    'c0000000-0000-0000-0000-000000000006',
    'reference_identification',
    '¿En qué versículo se encuentra el mandamiento: "Honra a tu padre y a tu madre, que es el primer mandamiento con promesa"?',
    'Efesios 6:2',
    'Este mandamiento se ubica en Efesios 6:2.',
    10, 'easy', 6, true
)
ON CONFLICT (id) DO NOTHING;

-- Opciones Bloque 6.1
INSERT INTO public.question_options (question_id, option_text, is_correct, order_index)
VALUES
-- q1: multiple_choice
('q0006001-0001-0000-0000-000000000001', 'A sus padres, porque esto es justo', true, 1),
('q0006001-0001-0000-0000-000000000001', 'A los magistrados de Éfeso para no pagar impuestos', false, 2),
('q0006001-0001-0000-0000-000000000001', 'A los soldados romanos por miedo al castigo', false, 3),
('q0006001-0001-0000-0000-000000000001', 'A sus amigos para tener popularidad', false, 4),

-- q2: fill_blank
('q0006001-0002-0000-0000-000000000002', 'promesa', true, 1),

-- q3: multiple_choice
('q0006001-0003-0000-0000-000000000003', 'Para que te vaya bien y seas de larga vida sobre la tierra', true, 1),
('q0006001-0003-0000-0000-000000000003', 'Para que heredes tierras de oro en Roma', false, 2),
('q0006001-0003-0000-0000-000000000003', 'Para que nunca experimentes ninguna enfermedad física', false, 3),
('q0006001-0003-0000-0000-000000000003', 'Para que seas nombrado gobernante de tu ciudad', false, 4),

-- q4: multiple_choice
('q0006001-0004-0000-0000-000000000004', 'No provoquéis a ira a vuestros hijos, sino criadlos en disciplina y amonestación del Señor', true, 1),
('q0006001-0004-0000-0000-000000000004', 'Dejad a vuestros hijos en libertad absoluta sin ninguna corrección', false, 2),
('q0006001-0004-0000-0000-000000000004', 'Enviad a vuestros hijos a los cuarteles militares de Roma', false, 3),
('q0006001-0004-0000-0000-000000000004', 'Exigidles que trabajen desde pequeños para enriquecer el hogar', false, 4),

-- q5: true_false
('q0006001-0005-0000-0000-000000000005', 'Verdadero', false, 1),
('q0006001-0005-0000-0000-000000000005', 'Falso', true, 2),

-- q6: reference_identification
('q0006001-0006-0000-0000-000000000006', 'Efesios 6:2', true, 1),
('q0006001-0006-0000-0000-000000000006', 'Efesios 6:1', false, 2),
('q0006001-0006-0000-0000-000000000006', 'Efesios 6:3', false, 3),
('q0006001-0006-0000-0000-000000000006', 'Efesios 6:4', false, 4)
ON CONFLICT (id) DO NOTHING;

-- Asociar preguntas Bloque 6.1
INSERT INTO public.assessment_questions (assessment_id, question_id, order_index)
VALUES
('e0000006-0001-0000-0000-000000000001', 'q0006001-0001-0000-0000-000000000001', 1),
('e0000006-0001-0000-0000-000000000001', 'q0006001-0002-0000-0000-000000000002', 2),
('e0000006-0001-0000-0000-000000000001', 'q0006001-0003-0000-0000-000000000003', 3),
('e0000006-0001-0000-0000-000000000001', 'q0006001-0004-0000-0000-000000000004', 4),
('e0000006-0001-0000-0000-000000000001', 'q0006001-0005-0000-0000-000000000005', 5),
('e0000006-0001-0000-0000-000000000001', 'q0006001-0006-0000-0000-000000000006', 6)
ON CONFLICT DO NOTHING;

-- PREGUNTAS BLOQUE 6.2 (Efesios 6:5-9)
INSERT INTO public.questions (id, block_id, chapter_id, question_type, prompt, verse_reference, explanation, points, difficulty, order_index, is_active)
VALUES
(
    'q0006002-0001-0000-0000-000000000001',
    'b0000006-0002-0000-0000-000000000006',
    'c0000000-0000-0000-0000-000000000006',
    'multiple_choice',
    '¿Cómo deben obedecer los siervos a sus amos terrenales según Efesios 6:5-6?',
    'Efesios 6:5-6',
    'Efesios 6:5-6 indica: "con temor y temblor, con sencillez de vuestro corazón, como a Cristo; no sirviendo al ojo, como los que quieren agradar a los hombres, sino como siervos de Cristo, de corazón haciendo la voluntad de Dios".',
    10, 'easy', 1, true
),
(
    'q0006002-0002-0000-0000-000000000002',
    'b0000006-0002-0000-0000-000000000006',
    'c0000000-0000-0000-0000-000000000006',
    'fill_blank',
    'Completa Efesios 6:7: "sirviendo de buena voluntad, como al ________ y no a los hombres".',
    'Efesios 6:7',
    'Efesios 6:7 dice: "...como al Señor y no a los hombres".',
    10, 'easy', 2, true
),
(
    'q0006002-0003-0000-0000-000000000003',
    'b0000006-0002-0000-0000-000000000006',
    'c0000000-0000-0000-0000-000000000006',
    'multiple_choice',
    '¿Qué deben dejar los amos hacia sus siervos según Efesios 6:9?',
    'Efesios 6:9',
    'Efesios 6:9 manda: "Y vosotros, amos, haced con ellos lo mismo, dejando las amenazas...".',
    10, 'easy', 3, true
),
(
    'q0006002-0004-0000-0000-000000000004',
    'b0000006-0002-0000-0000-000000000006',
    'c0000000-0000-0000-0000-000000000006',
    'true_false',
    'Efesios 6:9 concluye afirmando que para con Dios no hay acepción de personas.',
    'Efesios 6:9',
    'Verdadero. Dios juzga a amos y siervos sin favoritismos terrenales.',
    10, 'easy', 4, true
),
(
    'q0006002-0005-0000-0000-000000000005',
    'b0000006-0002-0000-0000-000000000006',
    'c0000000-0000-0000-0000-000000000006',
    'reference_identification',
    '¿En qué versículo se encuentra la amonestación: "no sirviendo al ojo, como los que quieren agradar a los hombres, sino como siervos de Cristo"?',
    'Efesios 6:6',
    'Esta regla contra la apariencia laboral está en Efesios 6:6.',
    10, 'easy', 5, true
),
(
    'q0006002-0006-0000-0000-000000000006',
    'b0000006-0002-0000-0000-000000000006',
    'c0000000-0000-0000-0000-000000000006',
    'multiple_choice',
    'Según Efesios 6:8, ¿qué certeza tienen tanto el siervo como el libre respecto a sus obras buenas?',
    'Efesios 6:8',
    'Efesios 6:8 afirma: "sabiendo que el bien que cada uno hiciere, ése recibirá del Señor, sea siervo o sea libre".',
    10, 'medium', 6, true
)
ON CONFLICT (id) DO NOTHING;

-- Opciones Bloque 6.2
INSERT INTO public.question_options (question_id, option_text, is_correct, order_index)
VALUES
-- q1: multiple_choice
('q0006002-0001-0000-0000-000000000001', 'Con temor y temblor, con sencillez de corazón, como a Cristo; no sirviendo al ojo', true, 1),
('q0006002-0001-0000-0000-000000000001', 'Con desgano y quejas constantes en el trabajo', false, 2),
('q0006002-0001-0000-0000-000000000001', 'Trabajando únicamente cuando el amo está ausente', false, 3),
('q0006002-0001-0000-0000-000000000001', 'Haciendo huelgas y desórdenes civiles en la ciudad', false, 4),

-- q2: fill_blank
('q0006002-0002-0000-0000-000000000002', 'Señor', true, 1),

-- q3: multiple_choice
('q0006002-0003-0000-0000-000000000003', 'Dejando las amenazas', true, 1),
('q0006002-0003-0000-0000-000000000003', 'Imponiendo más castigos físicos', false, 2),
('q0006002-0003-0000-0000-000000000003', 'Exigiendo jornadas dobles de trabajo', false, 3),
('q0006002-0003-0000-0000-000000000003', 'Reteniendo los alimentos de los siervos', false, 4),

-- q4: true_false
('q0006002-0004-0000-0000-000000000004', 'Verdadero', true, 1),
('q0006002-0004-0000-0000-000000000004', 'Falso', false, 2),

-- q5: reference_identification
('q0006002-0005-0000-0000-000000000005', 'Efesios 6:6', true, 1),
('q0006002-0005-0000-0000-000000000005', 'Efesios 6:5', false, 2),
('q0006002-0005-0000-0000-000000000005', 'Efesios 6:7', false, 3),
('q0006002-0005-0000-0000-000000000005', 'Efesios 6:8', false, 4),

-- q6: multiple_choice
('q0006002-0006-0000-0000-000000000006', 'Que el bien que cada uno hiciere, ése recibirá del Señor', true, 1),
('q0006002-0006-0000-0000-000000000006', 'Que el amo terrenal puede arrebatarle su herencia celestial', false, 2),
('q0006002-0006-0000-0000-000000000006', 'Que los siervos no recibirán ninguna recompensa divina', false, 3),
('q0006002-0006-0000-0000-000000000006', 'Que el trabajo manual carece de valor ante Dios', false, 4)
ON CONFLICT (id) DO NOTHING;

-- Asociar preguntas Bloque 6.2
INSERT INTO public.assessment_questions (assessment_id, question_id, order_index)
VALUES
('e0000006-0002-0000-0000-000000000002', 'q0006002-0001-0000-0000-000000000001', 1),
('e0000006-0002-0000-0000-000000000002', 'q0006002-0002-0000-0000-000000000002', 2),
('e0000006-0002-0000-0000-000000000002', 'q0006002-0003-0000-0000-000000000003', 3),
('e0000006-0002-0000-0000-000000000002', 'q0006002-0004-0000-0000-000000000004', 4),
('e0000006-0002-0000-0000-000000000002', 'q0006002-0005-0000-0000-000000000005', 5),
('e0000006-0002-0000-0000-000000000002', 'q0006002-0006-0000-0000-000000000006', 6)
ON CONFLICT DO NOTHING;

-- PREGUNTAS BLOQUE 6.3 (Efesios 6:10-20)
INSERT INTO public.questions (id, block_id, chapter_id, question_type, prompt, verse_reference, explanation, points, difficulty, order_index, is_active)
VALUES
(
    'q0006003-0001-0000-0000-000000000001',
    'b0000006-0003-0000-0000-000000000006',
    'c0000000-0000-0000-0000-000000000006',
    'multiple_choice',
    'Según Efesios 6:12, ¿contra quiénes NO es nuestra lucha y contra quiénes SÍ es?',
    'Efesios 6:12',
    'Efesios 6:12 afirma: "Porque no tenemos lucha contra sangre y carne, sino contra principados, contra potestades, contra los gobernadores de las tinieblas de este siglo, contra huestes espirituales de maldad en las regiones celestes".',
    10, 'easy', 1, true
),
(
    'q0006003-0002-0000-0000-000000000002',
    'b0000006-0003-0000-0000-000000000006',
    'c0000000-0000-0000-0000-000000000006',
    'multiple_choice',
    '¿Qué pieza de la armadura tiene el poder de apagar todos los dardos de fuego del maligno según Efesios 6:16?',
    'Efesios 6:16',
    'Efesios 6:16 declara: "Sobre todo, tomad el escudo de la fe, con que podáis apagar todos los dardos de fuego del maligno".',
    10, 'easy', 2, true
),
(
    'q0006003-0003-0000-0000-000000000003',
    'b0000006-0003-0000-0000-000000000006',
    'c0000000-0000-0000-0000-000000000006',
    'fill_blank',
    'Completa Efesios 6:17: "Y tomad el yelmo de la salvación, y la espada del Espíritu, que es la ________ de Dios".',
    'Efesios 6:17',
    'Efesios 6:17 dice: "...que es la palabra de Dios".',
    10, 'easy', 3, true
),
(
    'q0006003-0004-0000-0000-000000000004',
    'b0000006-0003-0000-0000-000000000006',
    'c0000000-0000-0000-0000-000000000006',
    'multiple_choice',
    '¿Cuáles son las seis piezas de la armadura de Dios enumeradas en Efesios 6:14-17?',
    'Efesios 6:14-17',
    'Las piezas son: el cinturón de la verdad, la coraza de justicia, el calzado del evangelio de la paz, el escudo de la fe, el yelmo de la salvación y la espada del Espíritu.',
    10, 'medium', 4, true
),
(
    'q0006003-0005-0000-0000-000000000005',
    'b0000006-0003-0000-0000-000000000006',
    'c0000000-0000-0000-0000-000000000006',
    'multiple_choice',
    '¿Cómo debe acompañarse el uso de la armadura espiritual según la exhortación de Efesios 6:18?',
    'Efesios 6:18',
    'Efesios 6:18 ordena: "orando en todo tiempo con toda oración y súplica en el Espíritu, y velando en ello con toda perseverancia y súplica por todos los santos".',
    10, 'easy', 5, true
),
(
    'q0006003-0006-0000-0000-000000000006',
    'b0000006-0003-0000-0000-000000000006',
    'c0000000-0000-0000-0000-000000000006',
    'multiple_choice',
    '¿Qué petición de oración personal hace Pablo para sí mismo en Efesios 6:19-20?',
    'Efesios 6:19-20',
    'Pablo pide: "a fin de que al abrir mi boca me sea dada palabra para dar a conocer con denuedo el misterio del evangelio, por el cual soy embajador en cadenas".',
    10, 'medium', 6, true
),
(
    'q0006003-0007-0000-0000-000000000007',
    'b0000006-0003-0000-0000-000000000006',
    'c0000000-0000-0000-0000-000000000006',
    'true_false',
    'Efesios 6:10 manda al creyente fortalecerse en sus propias capacidades intelectuales y físicas para vencer al enemigo.',
    'Efesios 6:10',
    'Falso. Efesios 6:10 dice expresamente: "fortaleceos en el Señor, y en el poder de su fuerza".',
    10, 'easy', 7, true
),
(
    'q0006003-0008-0000-0000-000000000008',
    'b0000006-0003-0000-0000-000000000006',
    'c0000000-0000-0000-0000-000000000006',
    'reference_identification',
    '¿En qué versículo se encuentra la afirmación: "Porque no tenemos lucha contra sangre y carne, sino contra principados, contra potestades"?',
    'Efesios 6:12',
    'Este versículo sobre la guerra espiritual es Efesios 6:12.',
    10, 'easy', 8, true
)
ON CONFLICT (id) DO NOTHING;

-- Opciones Bloque 6.3
INSERT INTO public.question_options (question_id, option_text, is_correct, order_index)
VALUES
-- q1: multiple_choice
('q0006003-0001-0000-0000-000000000001', 'No es contra sangre y carne, sino contra principados, potestades, gobernadores de las tinieblas y huestes espirituales de maldad', true, 1),
('q0006003-0001-0000-0000-000000000001', 'Es exclusivamente contra los gobernantes políticos del imperio romano', false, 2),
('q0006003-0001-0000-0000-000000000001', 'Es contra los sacerdotes paganos de Éfeso en combates físicos', false, 3),
('q0006003-0001-0000-0000-000000000001', 'Es contra las naciones vecinas por territorios de siembra', false, 4),

-- q2: multiple_choice
('q0006003-0002-0000-0000-000000000002', 'El escudo de la fe', true, 1),
('q0006003-0002-0000-0000-000000000002', 'El cinturón de cuero terrenal', false, 2),
('q0006003-0002-0000-0000-000000000002', 'La lanza de bronce de los soldados romanos', false, 3),
('q0006003-0002-0000-0000-000000000002', 'El carro de guerra de hierro', false, 4),

-- q3: fill_blank
('q0006003-0003-0000-0000-000000000003', 'palabra', true, 1),

-- q4: multiple_choice
('q0006003-0004-0000-0000-000000000004', 'Cinturón de la verdad, coraza de justicia, calzado del evangelio, escudo de la fe, yelmo de la salvación y espada del Espíritu', true, 1),
('q0006003-0004-0000-0000-000000000004', 'Arco de madera, flechas de plata, lanza de hierro, escudo de bronce, manto de lino y sandalias de oro', false, 2),
('q0006003-0004-0000-0000-000000000004', 'Túnica sacerdotal, efod, pectoral de juicio, mitra de oro, cinto y campanillas', false, 3),
('q0006003-0004-0000-0000-000000000004', 'Leyes de Moisés, ordenanzas levíticas, sacrificios, diezmos, fiestas solemnes y ayunos', false, 4),

-- q5: multiple_choice
('q0006003-0005-0000-0000-000000000005', 'Orando en todo tiempo con toda oración y súplica en el Espíritu, velando con perseverancia', true, 1),
('q0006003-0005-0000-0000-000000000005', 'Descansando sin prestar atención al adversario', false, 2),
('q0006003-0005-0000-0000-000000000005', 'Debatiendo con los sofistas griegos en el ágora', false, 3),
('q0006003-0005-0000-0000-000000000005', 'Haciendo penitencias corporales severas', false, 4),

-- q6: multiple_choice
('q0006003-0006-0000-0000-000000000006', 'Que le sea dada palabra para dar a conocer con denuedo el misterio del evangelio como embajador en cadenas', true, 1),
('q0006003-0006-0000-0000-000000000006', 'Que los efesios recolecten dinero para pagar su fianza ante el César', false, 2),
('q0006003-0006-0000-0000-000000000006', 'Que le lleven alimentos y ropa costosa a Roma', false, 3),
('q0006003-0006-0000-0000-000000000006', 'Que la iglesia ataque militarmente la cárcel para liberarlo', false, 4),

-- q7: true_false
('q0006003-0007-0000-0000-000000000004', 'Verdadero', false, 1),
('q0006003-0007-0000-0000-000000000004', 'Falso', true, 2),

-- q8: reference_identification
('q0006003-0008-0000-0000-000000000004', 'Efesios 6:12', true, 1),
('q0006003-0008-0000-0000-000000000004', 'Efesios 6:10', false, 2),
('q0006003-0008-0000-0000-000000000004', 'Efesios 6:14', false, 3),
('q0006003-0008-0000-0000-000000000004', 'Efesios 6:16', false, 4)
ON CONFLICT (id) DO NOTHING;

-- Asociar preguntas Bloque 6.3
INSERT INTO public.assessment_questions (assessment_id, question_id, order_index)
VALUES
('e0000006-0003-0000-0000-000000000003', 'q0006003-0001-0000-0000-000000000001', 1),
('e0000006-0003-0000-0000-000000000003', 'q0006003-0002-0000-0000-000000000002', 2),
('e0000006-0003-0000-0000-000000000003', 'q0006003-0003-0000-0000-000000000003', 3),
('e0000006-0003-0000-0000-000000000003', 'q0006003-0004-0000-0000-000000000004', 4),
('e0000006-0003-0000-0000-000000000003', 'q0006003-0005-0000-0000-000000000005', 5),
('e0000006-0003-0000-0000-000000000003', 'q0006003-0006-0000-0000-000000000006', 6),
('e0000006-0003-0000-0000-000000000003', 'q0006003-0007-0000-0000-000000000007', 7),
('e0000006-0003-0000-0000-000000000003', 'q0006003-0008-0000-0000-000000000008', 8)
ON CONFLICT DO NOTHING;

-- PREGUNTAS BLOQUE 6.4 (Efesios 6:21-24)
INSERT INTO public.questions (id, block_id, chapter_id, question_type, prompt, verse_reference, explanation, points, difficulty, order_index, is_active)
VALUES
(
    'q0006004-0001-0000-0000-000000000001',
    'b0000006-0004-0000-0000-000000000006',
    'c0000000-0000-0000-0000-000000000006',
    'multiple_choice',
    '¿Quién fue enviado por Pablo para hacer saber a los efesios sus asuntos y consolar sus corazones (Efesios 6:21-22)?',
    'Efesios 6:21-22',
    'Efesios 6:21 señala a: "Tíquico, hermano amado y fiel ministro en el Señor".',
    10, 'easy', 1, true
),
(
    'q0006004-0002-0000-0000-000000000002',
    'b0000006-0004-0000-0000-000000000006',
    'c0000000-0000-0000-0000-000000000006',
    'fill_blank',
    'Completa Efesios 6:24: "La gracia sea con todos los que aman a nuestro Señor Jesucristo con amor ________. Amén".',
    'Efesios 6:24',
    'Efesios 6:24 concluye: "...con amor inalterable. Amén".',
    10, 'medium', 2, true
),
(
    'q0006004-0003-0000-0000-000000000003',
    'b0000006-0004-0000-0000-000000000006',
    'c0000000-0000-0000-0000-000000000006',
    'multiple_choice',
    '¿Qué bendiciones conjuntas invoca Pablo sobre los hermanos en Efesios 6:23?',
    'Efesios 6:23',
    'Efesios 6:23 declara: "Paz sea a los hermanos, y amor con fe, de Dios Padre y del Señor Jesucristo".',
    10, 'easy', 3, true
),
(
    'q0006004-0004-0000-0000-000000000004',
    'b0000006-0004-0000-0000-000000000006',
    'c0000000-0000-0000-0000-000000000006',
    'true_false',
    'En Efesios 6:21, Tíquico es llamado por Pablo "hermano amado y fiel ministro en el Señor".',
    'Efesios 6:21',
    'Verdadero. Estos son los dos honrosos títulos que Pablo otorga a su fiel colaborador.',
    10, 'easy', 4, true
),
(
    'q0006004-0005-0000-0000-000000000005',
    'b0000006-0004-0000-0000-000000000006',
    'c0000000-0000-0000-0000-000000000006',
    'reference_identification',
    '¿En qué versículo termina la epístola a los efesios con la bendición de la gracia para los que aman a Cristo con amor inalterable?',
    'Efesios 6:24',
    'El versículo final de la carta es Efesios 6:24.',
    10, 'easy', 5, true
)
ON CONFLICT (id) DO NOTHING;

-- Opciones Bloque 6.4
INSERT INTO public.question_options (question_id, option_text, is_correct, order_index)
VALUES
-- q1: multiple_choice
('q0006004-0001-0000-0000-000000000001', 'Tíquico', true, 1),
('q0006004-0001-0000-0000-000000000001', 'Bernabé', false, 2),
('q0006004-0001-0000-0000-000000000001', 'Apolos', false, 3),
('q0006004-0001-0000-0000-000000000001', 'Filemón', false, 4),

-- q2: fill_blank
('q0006004-0002-0000-0000-000000000002', 'inalterable', true, 1),

-- q3: multiple_choice
('q0006004-0003-0000-0000-000000000003', 'Paz sea a los hermanos, y amor con fe, de Dios Padre y del Señor Jesucristo', true, 1),
('q0006004-0003-0000-0000-000000000003', 'Victorias militares sobre los centuriones romanos', false, 2),
('q0006004-0003-0000-0000-000000000003', 'Riquezas terrenales abundantes en el puerto de Éfeso', false, 3),
('q0006004-0003-0000-0000-000000000003', 'Fama entre todas las escuelas filosóficas de Grecia', false, 4),

-- q4: true_false
('q0006004-0004-0000-0000-000000000004', 'Verdadero', true, 1),
('q0006004-0004-0000-0000-000000000004', 'Falso', false, 2),

-- q5: reference_identification
('q0006004-0005-0000-0000-000000000005', 'Efesios 6:24', true, 1),
('q0006004-0005-0000-0000-000000000005', 'Efesios 6:20', false, 2),
('q0006004-0005-0000-0000-000000000005', 'Efesios 6:22', false, 3),
('q0006004-0005-0000-0000-000000000005', 'Efesios 6:23', false, 4)
ON CONFLICT (id) DO NOTHING;

-- Asociar preguntas Bloque 6.4
INSERT INTO public.assessment_questions (assessment_id, question_id, order_index)
VALUES
('e0000006-0004-0000-0000-000000000004', 'q0006004-0001-0000-0000-000000000001', 1),
('e0000006-0004-0000-0000-000000000004', 'q0006004-0002-0000-0000-000000000002', 2),
('e0000006-0004-0000-0000-000000000004', 'q0006004-0003-0000-0000-000000000003', 3),
('e0000006-0004-0000-0000-000000000004', 'q0006004-0004-0000-0000-000000000004', 4),
('e0000006-0004-0000-0000-000000000004', 'q0006004-0005-0000-0000-000000000005', 5)
ON CONFLICT DO NOTHING;


-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
-- ARCHIVO: 007_efesios_examenes_generales_1_3.sql
-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

-- ==============================================================================
-- BIBLIONARIO - SEED 007: EXÁMENES GENERALES DE CAPÍTULOS 1, 2 Y 3 (NIVEL 3)
-- 25 preguntas por examen (Total: 75 preguntas multitemáticas RVR1960)
-- ==============================================================================

-- ##############################################################################
-- SECCIÓN 1: EFESIOS 1 – EXAMEN GENERAL (25 Preguntas)
-- Assessment ID: a0000001-0000-0000-0000-000000000001
-- Chapter ID:    c0000000-0000-0000-0000-000000000001
-- ##############################################################################

INSERT INTO public.questions (id, chapter_id, question_type, prompt, verse_reference, explanation, points, difficulty, order_index, is_active)
VALUES
-- Pregunta 1 (MC)
(
    'c0010000-0000-0000-0000-000000000001',
    'c0000000-0000-0000-0000-000000000001',
    'multiple_choice',
    '¿Cuál es el origen y fundamento del llamamiento apostólico de Pablo según Efesios 1:1?',
    'Efesios 1:1',
    'Efesios 1:1 señala expresamente: "Pablo, apóstol de Jesucristo por la voluntad de Dios".',
    10, 'easy', 1, true
),
-- Pregunta 2 (MC)
(
    'c0010000-0000-0000-0000-000000000002',
    'c0000000-0000-0000-0000-000000000001',
    'multiple_choice',
    '¿En qué lugar y de qué clase son las bendiciones con las que Dios nos ha bendecido según Efesios 1:3?',
    'Efesios 1:3',
    'El texto dice que Dios "nos bendijo con toda bendición espiritual en los lugares celestiales en Cristo".',
    10, 'easy', 2, true
),
-- Pregunta 3 (MC)
(
    'c0010000-0000-0000-0000-000000000003',
    'c0000000-0000-0000-0000-000000000001',
    'multiple_choice',
    '¿Cuándo fuimos escogidos en Cristo y con qué propósito moral según Efesios 1:4?',
    'Efesios 1:4',
    'Dios "nos escogió en él antes de la fundación del mundo, para que fuésemos santos y sin mancha delante de él".',
    10, 'medium', 3, true
),
-- Pregunta 4 (MC)
(
    'c0010000-0000-0000-0000-000000000004',
    'c0000000-0000-0000-0000-000000000001',
    'multiple_choice',
    '¿Según qué criterio soberano fuimos predestinados para ser adoptados hijos suyos conforme a Efesios 1:5?',
    'Efesios 1:5',
    'Efesios 1:5 enseña que fuimos predestinados "según el puro afecto de su voluntad".',
    10, 'medium', 4, true
),
-- Pregunta 5 (MC)
(
    'c0010000-0000-0000-0000-000000000005',
    'c0000000-0000-0000-0000-000000000001',
    'multiple_choice',
    '¿Cuál fue el precio mediante el cual tenemos redención y perdón de pecados según Efesios 1:7?',
    'Efesios 1:7',
    'Efesios 1:7 declara: "en quien tenemos redención por su sangre, el perdón de pecados según las riquezas de su gracia".',
    10, 'easy', 5, true
),
-- Pregunta 6 (MC)
(
    'c0010000-0000-0000-0000-000000000006',
    'c0000000-0000-0000-0000-000000000001',
    'multiple_choice',
    '¿Cuál es el misterio de la voluntad de Dios revelado en Efesios 1:9-10 en la dispensación del cumplimiento de los tiempos?',
    'Efesios 1:10',
    'El designio divino es "reunir todas las cosas en Cristo, en la dispensación del cumplimiento de los tiempos, así las que están en los cielos, como las que están en la tierra".',
    10, 'hard', 6, true
),
-- Pregunta 7 (MC)
(
    'c0010000-0000-0000-0000-000000000007',
    'c0000000-0000-0000-0000-000000000001',
    'multiple_choice',
    '¿Qué rol cumple el Espíritu Santo respecto a nuestra herencia según Efesios 1:14?',
    'Efesios 1:14',
    'El Espíritu Santo es "las arras de nuestra herencia hasta la redención de la posesión adquirida, para alabanza de su gloria".',
    10, 'medium', 7, true
),
-- Pregunta 8 (MC)
(
    'c0010000-0000-0000-0000-000000000008',
    'c0000000-0000-0000-0000-000000000001',
    'multiple_choice',
    'Según Efesios 1:22-23, ¿qué relación tiene Cristo con todas las cosas y con la iglesia?',
    'Efesios 1:22-23',
    'Dios "sometió todas las cosas bajo sus pies, y lo dio por cabeza sobre todas las cosas a la iglesia, la cual es su cuerpo".',
    10, 'medium', 8, true
),
-- Pregunta 9 (Fill blank)
(
    'c0010000-0000-0000-0000-000000000009',
    'c0000000-0000-0000-0000-000000000001',
    'fill_blank',
    'Completa Efesios 1:2: "________ y paz a vosotros, de Dios nuestro Padre y del Señor Jesucristo".',
    'Efesios 1:2',
    'La palabra textual que abre la bendición de Pablo es "Gracia".',
    10, 'easy', 9, true
),
-- Pregunta 10 (Fill blank)
(
    'c0010000-0000-0000-0000-000000000010',
    'c0000000-0000-0000-0000-000000000001',
    'fill_blank',
    'Completa Efesios 1:7: "En quien tenemos redención por su ________, el perdón de pecados según las riquezas de su gracia".',
    'Efesios 1:7',
    'El rescate y perdón fue obtenido mediante su "sangre".',
    10, 'easy', 10, true
),
-- Pregunta 11 (Fill blank)
(
    'c0010000-0000-0000-0000-000000000011',
    'c0000000-0000-0000-0000-000000000001',
    'fill_blank',
    'Completa Efesios 1:13: "Habiendo creído en él, fuisteis ________ con el Espíritu Santo de la promesa".',
    'Efesios 1:13',
    'El término bíblico para describir la garantía divina es "sellados".',
    10, 'medium', 11, true
),
-- Pregunta 12 (Fill blank)
(
    'c0010000-0000-0000-0000-000000000012',
    'c0000000-0000-0000-0000-000000000001',
    'fill_blank',
    'Completa Efesios 1:14: "Que es las ________ de nuestra herencia hasta la redención de la posesión adquirida".',
    'Efesios 1:14',
    'La garantía o anticipo formal de la herencia son las "arras".',
    10, 'medium', 12, true
),
-- Pregunta 13 (Fill blank)
(
    'c0010000-0000-0000-0000-000000000013',
    'c0000000-0000-0000-0000-000000000001',
    'fill_blank',
    'Completa Efesios 1:17: "El Dios de nuestro Señor Jesucristo, el Padre de gloria, os dé espíritu de sabiduría y de ________ en el conocimiento de él".',
    'Efesios 1:17',
    'Pablo pide en oración espíritu de sabiduría y de "revelación".',
    10, 'medium', 13, true
),
-- Pregunta 14 (Fill blank)
(
    'c0010000-0000-0000-0000-000000000014',
    'c0000000-0000-0000-0000-000000000001',
    'fill_blank',
    'Completa Efesios 1:18: "Alumbrando los ojos de vuestro ________, para que sepáis cuál es la esperanza a que él os ha llamado".',
    'Efesios 1:18',
    'El apóstol ruega que sean alumbrados los ojos de vuestro "entendimiento".',
    10, 'medium', 14, true
),
-- Pregunta 15 (Fill blank)
(
    'c0010000-0000-0000-0000-000000000015',
    'c0000000-0000-0000-0000-000000000001',
    'fill_blank',
    'Completa Efesios 1:22: "Y sometió todas las cosas bajo sus pies, y lo dio por ________ sobre todas las cosas a la iglesia".',
    'Efesios 1:22',
    'Cristo fue dado como "cabeza" soberana sobre todas las cosas a la iglesia.',
    10, 'easy', 15, true
),
-- Pregunta 16 (Fill blank)
(
    'c0010000-0000-0000-0000-000000000016',
    'c0000000-0000-0000-0000-000000000001',
    'fill_blank',
    'Completa Efesios 1:23: "La cual es su cuerpo, la ________ de Aquel que todo lo llena en todo".',
    'Efesios 1:23',
    'La iglesia es definida como la "plenitud" de Cristo.',
    10, 'hard', 16, true
),
-- Pregunta 17 (True/False)
(
    'c0010000-0000-0000-0000-000000000017',
    'c0000000-0000-0000-0000-000000000001',
    'true_false',
    'Según Efesios 1:4, la elección de Dios en Cristo ocurrió después de que el hombre demostró su fidelidad sobre la tierra.',
    'Efesios 1:4',
    'Falso. Efesios 1:4 afirma que nos escogió "antes de la fundación del mundo", con total anterioridad a las obras humanas.',
    10, 'easy', 17, true
),
-- Pregunta 18 (True/False)
(
    'c0010000-0000-0000-0000-000000000018',
    'c0000000-0000-0000-0000-000000000001',
    'true_false',
    'Efesios 1:6 y 1:12 reiteran que el fin primordial de la predestinación y gracia es la alabanza de la gloria de Dios.',
    'Efesios 1:6, 12',
    'Verdadero. Pablo enfatiza como estribillo sagrado: "para alabanza de la gloria de su gracia" y "a fin de que seamos para alabanza de su gloria".',
    10, 'easy', 18, true
),
-- Pregunta 19 (True/False)
(
    'c0010000-0000-0000-0000-000000000019',
    'c0000000-0000-0000-0000-000000000001',
    'true_false',
    'En Efesios 1:13, los creyentes fueron sellados con el Espíritu Santo antes de haber oído y creído el evangelio.',
    'Efesios 1:13',
    'Falso. El texto señala el orden: "habiendo oído la palabra de verdad... y habiendo creído en él, fuisteis sellados".',
    10, 'medium', 19, true
),
-- Pregunta 20 (True/False)
(
    'c0010000-0000-0000-0000-000000000020',
    'c0000000-0000-0000-0000-000000000001',
    'true_false',
    'El poder que resucitó a Cristo de los muertos es el mismo poder que opera para con los que creen según Efesios 1:19-20.',
    'Efesios 1:19-20',
    'Verdadero. Pablo destaca la supereminente grandeza de su poder para con nosotros según la operación del poder de su fuerza que operó en Cristo.',
    10, 'medium', 20, true
),
-- Pregunta 21 (True/False)
(
    'c0010000-0000-0000-0000-000000000021',
    'c0000000-0000-0000-0000-000000000001',
    'true_false',
    'Cristo fue exaltado a la diestra del Padre pero está sujeto a los principados y gobernantes del siglo venidero.',
    'Efesios 1:21',
    'Falso. Efesios 1:21 aclara que está "sobre todo principado y autoridad y poder y señorío, y sobre todo nombre que se nombra, no sólo en este siglo, sino también en el venidero".',
    10, 'easy', 21, true
),
-- Pregunta 22 (True/False)
(
    'c0010000-0000-0000-0000-000000000022',
    'c0000000-0000-0000-0000-000000000001',
    'true_false',
    'Efesios 1 enseña que la redención y el perdón de pecados se conceden según la medida de nuestros sacrificios personales.',
    'Efesios 1:7',
    'Falso. Efesios 1:7 especifica taxativamente: "según las riquezas de su gracia".',
    10, 'easy', 22, true
),
-- Pregunta 23 (Ref Ident)
(
    'c0010000-0000-0000-0000-000000000023',
    'c0000000-0000-0000-0000-000000000001',
    'reference_identification',
    '¿En qué versículo de Efesios 1 se declara: "Nos bendijo con toda bendición espiritual en los lugares celestiales en Cristo"?',
    'Efesios 1:3',
    'Esta célebre doxología y declaración apostólica se ubica textualmente en Efesios 1:3.',
    10, 'medium', 23, true
),
-- Pregunta 24 (Ref Ident)
(
    'c0010000-0000-0000-0000-000000000024',
    'c0000000-0000-0000-0000-000000000001',
    'reference_identification',
    '¿En qué versículo se afirma que el Espíritu Santo es "las arras de nuestra herencia hasta la redención de la posesión adquirida"?',
    'Efesios 1:14',
    'Efesios 1:14 concluye el pasaje de las bendiciones espirituales con la figura de las arras del Espíritu Santo.',
    10, 'medium', 24, true
),
-- Pregunta 25 (Ordering)
(
    'c0010000-0000-0000-0000-000000000025',
    'c0000000-0000-0000-0000-000000000001',
    'ordering',
    'Ordena cronológicamente los acontecimientos y temas teológicos conforme se desarrollan a lo largo de Efesios 1:',
    'Efesios 1:4-22',
    '1. Elección antes de la fundación del mundo (v. 4). 2. Redención y perdón por la sangre de Cristo (v. 7). 3. Escuchar la palabra y ser sellados con el Espíritu Santo (v. 13). 4. Cristo exaltado a la diestra de Dios sobre toda potestad (v. 20-22).',
    10, 'hard', 25, true
);

-- OPCIONES EFESIOS 1
INSERT INTO public.question_options (question_id, option_text, is_correct, order_index)
VALUES
-- q1
('c0010000-0000-0000-0000-000000000001', 'Por la voluntad de Dios', true, 1),
('c0010000-0000-0000-0000-000000000001', 'Por herencia de la tribu de Leví', false, 2),
('c0010000-0000-0000-0000-000000000001', 'Por votación del concilio de Jerusalén', false, 3),
('c0010000-0000-0000-0000-000000000001', 'Por decisión de los creyentes en Éfeso', false, 4),

-- q2
('c0010000-0000-0000-0000-000000000002', 'Bendición espiritual en los lugares celestiales en Cristo', true, 1),
('c0010000-0000-0000-0000-000000000002', 'Bendiciones materiales en la tierra de Canaán', false, 2),
('c0010000-0000-0000-0000-000000000002', 'Poder político y dominio temporal sobre los gentiles', false, 3),
('c0010000-0000-0000-0000-000000000002', 'Riquezas terrenales mediante el cumplimiento de ritos', false, 4),

-- q3
('c0010000-0000-0000-0000-000000000003', 'Antes de la fundación del mundo, para ser santos y sin mancha', true, 1),
('c0010000-0000-0000-0000-000000000003', 'Al momento de bautizarse en agua, para recibir honores', false, 2),
('c0010000-0000-0000-0000-000000000003', 'Cuando Abraham salió de Ur, para gobernar naciones', false, 3),
('c0010000-0000-0000-0000-000000000003', 'Al nacer físicamente, para evitar toda aflicción', false, 4),

-- q4
('c0010000-0000-0000-0000-000000000004', 'Según el puro afecto de su voluntad', true, 1),
('c0010000-0000-0000-0000-000000000004', 'Según las obras meritorias de la ley mosaica', false, 2),
('c0010000-0000-0000-0000-000000000004', 'Según la sabiduría filosófica de los sabios griegos', false, 3),
('c0010000-0000-0000-0000-000000000004', 'Según los votos monásticos de consagración', false, 4),

-- q5
('c0010000-0000-0000-0000-000000000005', 'Por su sangre', true, 1),
('c0010000-0000-0000-0000-000000000005', 'Por sacrificios de animales en el templo', false, 2),
('c0010000-0000-0000-0000-000000000005', 'Por limosnas y penitencias personales', false, 3),
('c0010000-0000-0000-0000-000000000005', 'Por la sabiduría de los maestros de la sinagoga', false, 4),

-- q6
('c0010000-0000-0000-0000-000000000006', 'Reunir todas las cosas en Cristo, en los cielos y en la tierra', true, 1),
('c0010000-0000-0000-0000-000000000006', 'Restaurar el imperio terrenal davídico en Jerusalén', false, 2),
('c0010000-0000-0000-0000-000000000006', 'Condenar a todos los pueblos que no hablaran hebreo', false, 3),
('c0010000-0000-0000-0000-000000000006', 'Dividir eternamente a judíos y gentiles en dos templos', false, 4),

-- q7
('c0010000-0000-0000-0000-000000000007', 'Las arras de nuestra herencia hasta la redención final', true, 1),
('c0010000-0000-0000-0000-000000000007', 'Un juez acusador de nuestros pecados diarios', false, 2),
('c0010000-0000-0000-0000-000000000007', 'Una recompensa temporal que se pierde con el sufrimiento', false, 3),
('c0010000-0000-0000-0000-000000000007', 'Una fuerza impersonal sin propósito definido', false, 4),

-- q8
('c0010000-0000-0000-0000-000000000008', 'Cabeza sobre todas las cosas a la iglesia, que es su cuerpo', true, 1),
('c0010000-0000-0000-0000-000000000008', 'Un profeta más entre los enviados de Dios', false, 2),
('c0010000-0000-0000-0000-000000000008', 'Un rey terrenal sometido al César romano', false, 3),
('c0010000-0000-0000-0000-000000000008', 'Un ángel exaltado entre las legiones celestiales', false, 4),

-- q9: fill_blank
('c0010000-0000-0000-0000-000000000009', 'gracia', true, 1),

-- q10: fill_blank
('c0010000-0000-0000-0000-000000000010', 'sangre', true, 1),

-- q11: fill_blank
('c0010000-0000-0000-0000-000000000011', 'sellados', true, 1),

-- q12: fill_blank
('c0010000-0000-0000-0000-000000000012', 'arras', true, 1),

-- q13: fill_blank
('c0010000-0000-0000-0000-000000000013', 'revelacion', true, 1),

-- q14: fill_blank
('c0010000-0000-0000-0000-000000000014', 'entendimiento', true, 1),

-- q15: fill_blank
('c0010000-0000-0000-0000-000000000015', 'cabeza', true, 1),

-- q16: fill_blank
('c0010000-0000-0000-0000-000000000016', 'plenitud', true, 1),

-- q17: true_false
('c0010000-0000-0000-0000-000000000017', 'Verdadero', false, 1),
('c0010000-0000-0000-0000-000000000017', 'Falso', true, 2),

-- q18: true_false
('c0010000-0000-0000-0000-000000000018', 'Verdadero', true, 1),
('c0010000-0000-0000-0000-000000000018', 'Falso', false, 2),

-- q19: true_false
('c0010000-0000-0000-0000-000000000019', 'Verdadero', false, 1),
('c0010000-0000-0000-0000-000000000019', 'Falso', true, 2),

-- q20: true_false
('c0010000-0000-0000-0000-000000000020', 'Verdadero', true, 1),
('c0010000-0000-0000-0000-000000000020', 'Falso', false, 2),

-- q21: true_false
('c0010000-0000-0000-0000-000000000021', 'Verdadero', false, 1),
('c0010000-0000-0000-0000-000000000021', 'Falso', true, 2),

-- q22: true_false
('c0010000-0000-0000-0000-000000000022', 'Verdadero', false, 1),
('c0010000-0000-0000-0000-000000000022', 'Falso', true, 2),

-- q23: ref
('c0010000-0000-0000-0000-000000000023', 'Efesios 1:3', true, 1),
('c0010000-0000-0000-0000-000000000023', 'Efesios 1:8', false, 2),
('c0010000-0000-0000-0000-000000000023', 'Efesios 1:15', false, 3),
('c0010000-0000-0000-0000-000000000023', 'Efesios 1:21', false, 4),

-- q24: ref
('c0010000-0000-0000-0000-000000000024', 'Efesios 1:14', true, 1),
('c0010000-0000-0000-0000-000000000024', 'Efesios 1:7', false, 2),
('c0010000-0000-0000-0000-000000000024', 'Efesios 1:10', false, 3),
('c0010000-0000-0000-0000-000000000024', 'Efesios 1:18', false, 4),

-- q25: ordering
('c0010000-0000-0000-0000-000000000025', 'Elección en Cristo antes de la fundación del mundo (Ef. 1:4)', true, 1),
('c0010000-0000-0000-0000-000000000025', 'Redención y perdón de pecados por su sangre (Ef. 1:7)', true, 2),
('c0010000-0000-0000-0000-000000000025', 'Oír la palabra de verdad y ser sellados con el Espíritu Santo (Ef. 1:13)', true, 3),
('c0010000-0000-0000-0000-000000000025', 'Cristo exaltado y dado por cabeza sobre todas las cosas a la iglesia (Ef. 1:22)', true, 4)
ON CONFLICT (id) DO NOTHING;

-- Asociar preguntas a Examen General de Efesios 1
INSERT INTO public.assessment_questions (assessment_id, question_id, order_index)
VALUES
('a0000001-0000-0000-0000-000000000001', 'c0010000-0000-0000-0000-000000000001', 1),
('a0000001-0000-0000-0000-000000000001', 'c0010000-0000-0000-0000-000000000002', 2),
('a0000001-0000-0000-0000-000000000001', 'c0010000-0000-0000-0000-000000000003', 3),
('a0000001-0000-0000-0000-000000000001', 'c0010000-0000-0000-0000-000000000004', 4),
('a0000001-0000-0000-0000-000000000001', 'c0010000-0000-0000-0000-000000000005', 5),
('a0000001-0000-0000-0000-000000000001', 'c0010000-0000-0000-0000-000000000006', 6),
('a0000001-0000-0000-0000-000000000001', 'c0010000-0000-0000-0000-000000000007', 7),
('a0000001-0000-0000-0000-000000000001', 'c0010000-0000-0000-0000-000000000008', 8),
('a0000001-0000-0000-0000-000000000001', 'c0010000-0000-0000-0000-000000000009', 9),
('a0000001-0000-0000-0000-000000000001', 'c0010000-0000-0000-0000-000000000010', 10),
('a0000001-0000-0000-0000-000000000001', 'c0010000-0000-0000-0000-000000000011', 11),
('a0000001-0000-0000-0000-000000000001', 'c0010000-0000-0000-0000-000000000012', 12),
('a0000001-0000-0000-0000-000000000001', 'c0010000-0000-0000-0000-000000000013', 13),
('a0000001-0000-0000-0000-000000000001', 'c0010000-0000-0000-0000-000000000014', 14),
('a0000001-0000-0000-0000-000000000001', 'c0010000-0000-0000-0000-000000000015', 15),
('a0000001-0000-0000-0000-000000000001', 'c0010000-0000-0000-0000-000000000016', 16),
('a0000001-0000-0000-0000-000000000001', 'c0010000-0000-0000-0000-000000000017', 17),
('a0000001-0000-0000-0000-000000000001', 'c0010000-0000-0000-0000-000000000018', 18),
('a0000001-0000-0000-0000-000000000001', 'c0010000-0000-0000-0000-000000000019', 19),
('a0000001-0000-0000-0000-000000000001', 'c0010000-0000-0000-0000-000000000020', 20),
('a0000001-0000-0000-0000-000000000001', 'c0010000-0000-0000-0000-000000000021', 21),
('a0000001-0000-0000-0000-000000000001', 'c0010000-0000-0000-0000-000000000022', 22),
('a0000001-0000-0000-0000-000000000001', 'c0010000-0000-0000-0000-000000000023', 23),
('a0000001-0000-0000-0000-000000000001', 'c0010000-0000-0000-0000-000000000024', 24),
('a0000001-0000-0000-0000-000000000001', 'c0010000-0000-0000-0000-000000000025', 25)
ON CONFLICT DO NOTHING;


-- ##############################################################################
-- SECCIÓN 2: EFESIOS 2 – EXAMEN GENERAL (25 Preguntas)
-- Assessment ID: a0000002-0000-0000-0000-000000000002
-- Chapter ID:    c0000000-0000-0000-0000-000000000002
-- ##############################################################################

INSERT INTO public.questions (id, chapter_id, question_type, prompt, verse_reference, explanation, points, difficulty, order_index, is_active)
VALUES
-- Pregunta 1 (MC)
(
    'c0020000-0000-0000-0000-000000000001',
    'c0000000-0000-0000-0000-000000000002',
    'multiple_choice',
    '¿Cuál era la condición espiritual del creyente antes de recibir la vida de Dios según Efesios 2:1?',
    'Efesios 2:1',
    'Efesios 2:1 dice: "Y él os dio vida a vosotros, cuando estabais muertos en vuestros delitos y pecados".',
    10, 'easy', 1, true
),
-- Pregunta 2 (MC)
(
    'c0020000-0000-0000-0000-000000000002',
    'c0000000-0000-0000-0000-000000000002',
    'multiple_choice',
    '¿Cómo describe Efesios 2:2 a la entidad espiritual que opera en los desobedientes?',
    'Efesios 2:2',
    'Pablo lo define como "el príncipe de la potestad del aire, el espíritu que ahora opera en los hijos de desobediencia".',
    10, 'medium', 2, true
),
-- Pregunta 3 (MC)
(
    'c0020000-0000-0000-0000-000000000003',
    'c0000000-0000-0000-0000-000000000002',
    'multiple_choice',
    'Según Efesios 2:4-5, ¿qué movió a Dios a darnos vida juntamente con Cristo?',
    'Efesios 2:4-5',
    'Efesios 2:4-5 afirma que fue "por su gran amor con que nos amó" y porque Dios es "rico en misericordia".',
    10, 'easy', 3, true
),
-- Pregunta 4 (MC)
(
    'c0020000-0000-0000-0000-000000000004',
    'c0000000-0000-0000-0000-000000000002',
    'multiple_choice',
    '¿Por qué la salvación es por gracia por medio de la fe y no por obras según Efesios 2:8-9?',
    'Efesios 2:8-9',
    'El versículo 9 establece expresamente el propósito: "no por obras, para que nadie se gloríe".',
    10, 'easy', 4, true
),
-- Pregunta 5 (MC)
(
    'c0020000-0000-0000-0000-000000000005',
    'c0000000-0000-0000-0000-000000000002',
    'multiple_choice',
    '¿Para qué fuimos creados en Cristo Jesús según declara Efesios 2:10?',
    'Efesios 2:10',
    'Efesios 2:10 señala: "creados en Cristo Jesús para buenas obras, las cuales Dios preparó de antemano para que anduviésemos en ellas".',
    10, 'easy', 5, true
),
-- Pregunta 6 (MC)
(
    'c0020000-0000-0000-0000-000000000006',
    'c0000000-0000-0000-0000-000000000002',
    'multiple_choice',
    '¿Cómo describe Efesios 2:12 la condición de los gentiles en el pasado antes de Cristo?',
    'Efesios 2:12',
    'Estaban "sin Cristo, alejados de la ciudadanía de Israel y ajenos a los pactos de la promesa, sin esperanza y sin Dios en el mundo".',
    10, 'medium', 6, true
),
-- Pregunta 7 (MC)
(
    'c0020000-0000-0000-0000-000000000007',
    'c0000000-0000-0000-0000-000000000002',
    'multiple_choice',
    '¿Qué derribó Cristo en su carne para reconciliar a judíos y gentiles según Efesios 2:14?',
    'Efesios 2:14',
    'Cristo "de ambos pueblos hizo uno, derribando la pared intermedia de separación".',
    10, 'medium', 7, true
),
-- Pregunta 8 (MC)
(
    'c0020000-0000-0000-0000-000000000008',
    'c0000000-0000-0000-0000-000000000002',
    'multiple_choice',
    '¿Sobre qué fundamento está edificada la familia de Dios según Efesios 2:20?',
    'Efesios 2:20',
    'Edificados "sobre el fundamento de los apóstoles y profetas, siendo la principal piedra del ángulo Jesucristo mismo".',
    10, 'medium', 8, true
),
-- Pregunta 9 (Fill blank)
(
    'c0020000-0000-0000-0000-000000000009',
    'c0000000-0000-0000-0000-000000000002',
    'fill_blank',
    'Completa Efesios 2:4: "Pero Dios, que es rico en ________, por su gran amor con que nos amó".',
    'Efesios 2:4',
    'Dios es descrito como rico en "misericordia".',
    10, 'easy', 9, true
),
-- Pregunta 10 (Fill blank)
(
    'c0020000-0000-0000-0000-000000000010',
    'c0000000-0000-0000-0000-000000000002',
    'fill_blank',
    'Completa Efesios 2:8: "Porque por gracia sois salvos por medio de la ________; y esto no de vosotros, pues es don de Dios".',
    'Efesios 2:8',
    'El medio instrumental por el cual se recibe la gracia es la "fe".',
    10, 'easy', 10, true
),
-- Pregunta 11 (Fill blank)
(
    'c0020000-0000-0000-0000-000000000011',
    'c0000000-0000-0000-0000-000000000002',
    'fill_blank',
    'Completa Efesios 2:10: "Porque somos ________ suya, creados en Cristo Jesús para buenas obras".',
    'Efesios 2:10',
    'El término bíblico para obra maestra o creación divina es "hechura".',
    10, 'medium', 11, true
),
-- Pregunta 12 (Fill blank)
(
    'c0020000-0000-0000-0000-000000000012',
    'c0000000-0000-0000-0000-000000000002',
    'fill_blank',
    'Completa Efesios 2:13: "Pero ahora en Cristo Jesús, vosotros que en otro tiempo estabais lejos, habéis sido hechos cercanos por la ________ de Cristo".',
    'Efesios 2:13',
    'La cercanía y comunión fueron compradas por la "sangre" de Cristo.',
    10, 'easy', 12, true
),
-- Pregunta 13 (Fill blank)
(
    'c0020000-0000-0000-0000-000000000013',
    'c0000000-0000-0000-0000-000000000002',
    'fill_blank',
    'Completa Efesios 2:14: "Porque él es nuestra ________, que de ambos pueblos hizo uno".',
    'Efesios 2:14',
    'El versículo define a Cristo mismo diciendo: "él es nuestra paz".',
    10, 'easy', 13, true
),
-- Pregunta 14 (Fill blank)
(
    'c0020000-0000-0000-0000-000000000014',
    'c0000000-0000-0000-0000-000000000002',
    'fill_blank',
    'Completa Efesios 2:18: "Porque por medio de él los unos y los otros tenemos entrada por un mismo ________ al Padre".',
    'Efesios 2:18',
    'El acceso trinitario al Padre se realiza por un mismo "Espiritu".',
    10, 'medium', 14, true
),
-- Pregunta 15 (Fill blank)
(
    'c0020000-0000-0000-0000-000000000015',
    'c0000000-0000-0000-0000-000000000002',
    'fill_blank',
    'Completa Efesios 2:19: "Así que ya no sois extranjeros ni advenedizos, sino ________ de los santos, y miembros de la familia de Dios".',
    'Efesios 2:19',
    'El estatus espiritual concedido es el de "conciudadanos".',
    10, 'medium', 15, true
),
-- Pregunta 16 (Fill blank)
(
    'c0020000-0000-0000-0000-000000000016',
    'c0000000-0000-0000-0000-000000000002',
    'fill_blank',
    'Completa Efesios 2:20: "Edificados sobre el fundamento de los apóstoles y profetas, siendo la principal piedra del ________ Jesucristo mismo".',
    'Efesios 2:20',
    'Jesucristo es la principal piedra del "angulo".',
    10, 'easy', 16, true
),
-- Pregunta 17 (True/False)
(
    'c0020000-0000-0000-0000-000000000017',
    'c0000000-0000-0000-0000-000000000002',
    'true_false',
    'Efesios 2 enseña que los seres humanos nacen espiritualmente vivos y sólo mueren al cometer su primer pecado voluntario.',
    'Efesios 2:1-3',
    'Falso. Efesios 2:1-3 afirma que estábamos muertos en delitos y pecados, siendo por naturaleza hijos de ira.',
    10, 'easy', 17, true
),
-- Pregunta 18 (True/False)
(
    'c0020000-0000-0000-0000-000000000018',
    'c0000000-0000-0000-0000-000000000002',
    'true_false',
    'Las buenas obras en Efesios 2:10 no son la causa de la salvación sino el fruto y propósito para el cual fuimos creados en Cristo.',
    'Efesios 2:8-10',
    'Verdadero. Fuimos salvos no por obras (v. 9), sino creados en Cristo Jesús para buenas obras preparadas de antemano (v. 10).',
    10, 'easy', 18, true
),
-- Pregunta 19 (True/False)
(
    'c0020000-0000-0000-0000-000000000019',
    'c0000000-0000-0000-0000-000000000002',
    'true_false',
    'La circuncisión hecha en la carne por mano de hombre otorgaba verdadera salvación espiritual según Pablo en Efesios 2:11.',
    'Efesios 2:11',
    'Falso. Pablo aclara que era sólo una distinción física externa ("en la carne por mano"), sin poder de vida espiritual.',
    10, 'medium', 19, true
),
-- Pregunta 20 (True/False)
(
    'c0020000-0000-0000-0000-000000000020',
    'c0000000-0000-0000-0000-000000000002',
    'true_false',
    'Cristo abolió en su carne las enemistades para crear en sí mismo de los dos pueblos un solo y nuevo hombre, haciendo la paz.',
    'Efesios 2:15',
    'Verdadero. Efesios 2:15 enseña que unió a judíos y gentiles en una nueva creación espiritual.',
    10, 'easy', 20, true
),
-- Pregunta 21 (True/False)
(
    'c0020000-0000-0000-0000-000000000021',
    'c0000000-0000-0000-0000-000000000002',
    'true_false',
    'En el edificio espiritual de Efesios 2:21-22, la iglesia está destinada a ser morada de Dios en el Espíritu.',
    'Efesios 2:22',
    'Verdadero. Efesios 2:22 afirma: "en quien vosotros también sois juntamente edificados para morada de Dios en el Espíritu".',
    10, 'easy', 21, true
),
-- Pregunta 22 (True/False)
(
    'c0020000-0000-0000-0000-000000000022',
    'c0000000-0000-0000-0000-000000000002',
    'true_false',
    'Los gentiles aún continúan siendo advenedizos y extranjeros dentro de las promesas de Dios después de recibir a Cristo.',
    'Efesios 2:19',
    'Falso. Efesios 2:19 señala explícitamente: "ya no sois extranjeros ni advenedizos, sino conciudadanos de los santos".',
    10, 'easy', 22, true
),
-- Pregunta 23 (Ref Ident)
(
    'c0020000-0000-0000-0000-000000000023',
    'c0000000-0000-0000-0000-000000000002',
    'reference_identification',
    '¿En qué versículos de Efesios 2 se proclama: "Porque por gracia sois salvos por medio de la fe; y esto no de vosotros, pues es don de Dios; no por obras, para que nadie se gloríe"?',
    'Efesios 2:8-9',
    'Este texto fundamental y columna teológica de la justificación por gracia se encuentra en Efesios 2:8-9.',
    10, 'easy', 23, true
),
-- Pregunta 24 (Ref Ident)
(
    'c0020000-0000-0000-0000-000000000024',
    'c0000000-0000-0000-0000-000000000002',
    'reference_identification',
    '¿En qué versículo de Efesios 2 se declara que Jesucristo derribó la pared intermedia de separación?',
    'Efesios 2:14',
    'Efesios 2:14 declara que Cristo es nuestra paz y derribó la pared intermedia de separación.',
    10, 'medium', 24, true
),
-- Pregunta 25 (Ordering)
(
    'c0020000-0000-0000-0000-000000000025',
    'c0000000-0000-0000-0000-000000000002',
    'ordering',
    'Ordena la transición de la salvación y la edificación según la estructura de Efesios 2:',
    'Efesios 2:1-22',
    '1. Muertos en delitos y pecados viviendo según la corriente del mundo (v. 1-3). 2. Resucitados y salvos por gracia por medio de la fe (v. 4-9). 3. Hechos cercanos por la sangre de Cristo y reconciliados en la cruz (v. 13-16). 4. Conciudadanos edificados como morada de Dios en el Espíritu (v. 19-22).',
    10, 'hard', 25, true
);

-- OPCIONES EFESIOS 2
INSERT INTO public.question_options (question_id, option_text, is_correct, order_index)
VALUES
-- q1
('c0020000-0000-0000-0000-000000000001', 'Muertos en delitos y pecados', true, 1),
('c0020000-0000-0000-0000-000000000001', 'Buscadores justos de la santidad divina', false, 2),
('c0020000-0000-0000-0000-000000000001', 'Inocentes sin necesidad de redención', false, 3),
('c0020000-0000-0000-0000-000000000001', 'Sabios según la filosofía terrenal', false, 4),

-- q2
('c0020000-0000-0000-0000-000000000002', 'El príncipe de la potestad del aire', true, 1),
('c0020000-0000-0000-0000-000000000002', 'El ángel custodio de las naciones', false, 2),
('c0020000-0000-0000-0000-000000000002', 'El espíritu de Moisés', false, 3),
('c0020000-0000-0000-0000-000000000002', 'El gobernador civil de la provincia', false, 4),

-- q3
('c0020000-0000-0000-0000-000000000003', 'Su gran amor y riquezas en misericordia', true, 1),
('c0020000-0000-0000-0000-000000000003', 'Las oraciones y penitencias de los apóstoles', false, 2),
('c0020000-0000-0000-0000-000000000003', 'El cumplimiento irreprensible de la ley ceremonial', false, 3),
('c0020000-0000-0000-0000-000000000003', 'El valor intrínseco y bondad del ser humano', false, 4),

-- q4
('c0020000-0000-0000-0000-000000000004', 'Para que nadie se gloríe', true, 1),
('c0020000-0000-0000-0000-000000000004', 'Para que el hombre no necesite arrepentirse', false, 2),
('c0020000-0000-0000-0000-000000000004', 'Para premiar el esfuerzo de los sacerdotes', false, 3),
('c0020000-0000-0000-0000-000000000004', 'Para evitar la predicación del evangelio', false, 4),

-- q5
('c0020000-0000-0000-0000-000000000005', 'Para buenas obras preparadas de antemano', true, 1),
('c0020000-0000-0000-0000-000000000005', 'Para vivir en ociosidad y contemplación aislada', false, 2),
('c0020000-0000-0000-0000-000000000005', 'Para exigir riquezas y prosperidad terrenal', false, 3),
('c0020000-0000-0000-0000-000000000005', 'Para juzgar y condenar a los pecadores', false, 4),

-- q6
('c0020000-0000-0000-0000-000000000006', 'Sin Cristo, alejados de los pactos, sin esperanza y sin Dios en el mundo', true, 1),
('c0020000-0000-0000-0000-000000000006', 'Conocedores de la ley pero sin templo en Éfeso', false, 2),
('c0020000-0000-0000-0000-000000000006', 'Herederos directos de las bendiciones de David', false, 3),
('c0020000-0000-0000-0000-000000000006', 'En paz perfecta con el Creador mediante sacrificios paganos', false, 4),

-- q7
('c0020000-0000-0000-0000-000000000007', 'La pared intermedia de separación y las enemistades', true, 1),
('c0020000-0000-0000-0000-000000000007', 'Los muros de la fortaleza Antonia en Jerusalén', false, 2),
('c0020000-0000-0000-0000-000000000007', 'Las fronteras geográficas del imperio romano', false, 3),
('c0020000-0000-0000-0000-000000000007', 'Las diferencias idiomáticas entre griegos y hebreos', false, 4),

-- q8
('c0020000-0000-0000-0000-000000000008', 'Sobre el fundamento de los apóstoles y profetas, siendo Cristo la piedra del ángulo', true, 1),
('c0020000-0000-0000-0000-000000000008', 'Sobre los ritos ceremoniales y el sacerdocio levítico', false, 2),
('c0020000-0000-0000-0000-000000000008', 'Sobre las doctrinas de los filósofos de Atenas', false, 3),
('c0020000-0000-0000-0000-000000000008', 'Sobre las virtudes humanas y la moral de los emperadores', false, 4),

-- q9: fill_blank
('c0020000-0000-0000-0000-000000000009', 'misericordia', true, 1),

-- q10: fill_blank
('c0020000-0000-0000-0000-000000000010', 'fe', true, 1),

-- q11: fill_blank
('c0020000-0000-0000-0000-000000000011', 'hechura', true, 1),

-- q12: fill_blank
('c0020000-0000-0000-0000-000000000012', 'sangre', true, 1),

-- q13: fill_blank
('c0020000-0000-0000-0000-000000000013', 'paz', true, 1),

-- q14: fill_blank
('c0020000-0000-0000-0000-000000000014', 'espiritu', true, 1),

-- q15: fill_blank
('c0020000-0000-0000-0000-000000000015', 'conciudadanos', true, 1),

-- q16: fill_blank
('c0020000-0000-0000-0000-000000000016', 'angulo', true, 1),

-- q17: true_false
('c0020000-0000-0000-0000-000000000017', 'Verdadero', false, 1),
('c0020000-0000-0000-0000-000000000017', 'Falso', true, 2),

-- q18: true_false
('c0020000-0000-0000-0000-000000000018', 'Verdadero', true, 1),
('c0020000-0000-0000-0000-000000000018', 'Falso', false, 2),

-- q19: true_false
('c0020000-0000-0000-0000-000000000019', 'Verdadero', false, 1),
('c0020000-0000-0000-0000-000000000019', 'Falso', true, 2),

-- q20: true_false
('c0020000-0000-0000-0000-000000000020', 'Verdadero', true, 1),
('c0020000-0000-0000-0000-000000000020', 'Falso', false, 2),

-- q21: true_false
('c0020000-0000-0000-0000-000000000021', 'Verdadero', true, 1),
('c0020000-0000-0000-0000-000000000021', 'Falso', false, 2),

-- q22: true_false
('c0020000-0000-0000-0000-000000000022', 'Verdadero', false, 1),
('c0020000-0000-0000-0000-000000000022', 'Falso', true, 2),

-- q23: ref
('c0020000-0000-0000-0000-000000000023', 'Efesios 2:8-9', true, 1),
('c0020000-0000-0000-0000-000000000023', 'Efesios 2:1-2', false, 2),
('c0020000-0000-0000-0000-000000000023', 'Efesios 2:11-12', false, 3),
('c0020000-0000-0000-0000-000000000023', 'Efesios 2:19-20', false, 4),

-- q24: ref
('c0020000-0000-0000-0000-000000000024', 'Efesios 2:14', true, 1),
('c0020000-0000-0000-0000-000000000024', 'Efesios 2:5', false, 2),
('c0020000-0000-0000-0000-000000000024', 'Efesios 2:10', false, 3),
('c0020000-0000-0000-0000-000000000024', 'Efesios 2:22', false, 4),

-- q25: ordering
('c0020000-0000-0000-0000-000000000025', 'Muertos en delitos y pecados siguiendo al príncipe del aire (Ef. 2:1-2)', true, 1),
('c0020000-0000-0000-0000-000000000025', 'Resucitados con Cristo: salvos por gracia mediante la fe (Ef. 2:4-8)', true, 2),
('c0020000-0000-0000-0000-000000000025', 'Reconciliación en la cruz: derribada la pared intermedia (Ef. 2:14-16)', true, 3),
('c0020000-0000-0000-0000-000000000025', 'Edificados sobre apóstoles y profetas para morada de Dios (Ef. 2:20-22)', true, 4)
ON CONFLICT (id) DO NOTHING;

-- Asociar preguntas a Examen General de Efesios 2
INSERT INTO public.assessment_questions (assessment_id, question_id, order_index)
VALUES
('a0000002-0000-0000-0000-000000000002', 'c0020000-0000-0000-0000-000000000001', 1),
('a0000002-0000-0000-0000-000000000002', 'c0020000-0000-0000-0000-000000000002', 2),
('a0000002-0000-0000-0000-000000000002', 'c0020000-0000-0000-0000-000000000003', 3),
('a0000002-0000-0000-0000-000000000002', 'c0020000-0000-0000-0000-000000000004', 4),
('a0000002-0000-0000-0000-000000000002', 'c0020000-0000-0000-0000-000000000005', 5),
('a0000002-0000-0000-0000-000000000002', 'c0020000-0000-0000-0000-000000000006', 6),
('a0000002-0000-0000-0000-000000000002', 'c0020000-0000-0000-0000-000000000007', 7),
('a0000002-0000-0000-0000-000000000002', 'c0020000-0000-0000-0000-000000000008', 8),
('a0000002-0000-0000-0000-000000000002', 'c0020000-0000-0000-0000-000000000009', 9),
('a0000002-0000-0000-0000-000000000002', 'c0020000-0000-0000-0000-000000000010', 10),
('a0000002-0000-0000-0000-000000000002', 'c0020000-0000-0000-0000-000000000011', 11),
('a0000002-0000-0000-0000-000000000002', 'c0020000-0000-0000-0000-000000000012', 12),
('a0000002-0000-0000-0000-000000000002', 'c0020000-0000-0000-0000-000000000013', 13),
('a0000002-0000-0000-0000-000000000002', 'c0020000-0000-0000-0000-000000000014', 14),
('a0000002-0000-0000-0000-000000000002', 'c0020000-0000-0000-0000-000000000015', 15),
('a0000002-0000-0000-0000-000000000002', 'c0020000-0000-0000-0000-000000000016', 16),
('a0000002-0000-0000-0000-000000000002', 'c0020000-0000-0000-0000-000000000017', 17),
('a0000002-0000-0000-0000-000000000002', 'c0020000-0000-0000-0000-000000000018', 18),
('a0000002-0000-0000-0000-000000000002', 'c0020000-0000-0000-0000-000000000019', 19),
('a0000002-0000-0000-0000-000000000002', 'c0020000-0000-0000-0000-000000000020', 20),
('a0000002-0000-0000-0000-000000000002', 'c0020000-0000-0000-0000-000000000021', 21),
('a0000002-0000-0000-0000-000000000002', 'c0020000-0000-0000-0000-000000000022', 22),
('a0000002-0000-0000-0000-000000000002', 'c0020000-0000-0000-0000-000000000023', 23),
('a0000002-0000-0000-0000-000000000002', 'c0020000-0000-0000-0000-000000000024', 24),
('a0000002-0000-0000-0000-000000000002', 'c0020000-0000-0000-0000-000000000025', 25)
ON CONFLICT DO NOTHING;


-- ##############################################################################
-- SECCIÓN 3: EFESIOS 3 – EXAMEN GENERAL (25 Preguntas)
-- Assessment ID: a0000003-0000-0000-0000-000000000003
-- Chapter ID:    c0000000-0000-0000-0000-000000000003
-- ##############################################################################

INSERT INTO public.questions (id, chapter_id, question_type, prompt, verse_reference, explanation, points, difficulty, order_index, is_active)
VALUES
-- Pregunta 1 (MC)
(
    'c0030000-0000-0000-0000-000000000001',
    'c0000000-0000-0000-0000-000000000003',
    'multiple_choice',
    '¿Por causa de quiénes declara Pablo ser prisionero de Cristo Jesús al abrir Efesios 3:1?',
    'Efesios 3:1',
    'Pablo declara: "Por esta causa yo Pablo, prisionero de Cristo Jesús por vosotros los gentiles".',
    10, 'easy', 1, true
),
-- Pregunta 2 (MC)
(
    'c0030000-0000-0000-0000-000000000002',
    'c0000000-0000-0000-0000-000000000003',
    'multiple_choice',
    '¿Cuál es el contenido del misterio que en otras generaciones no se dio a conocer según Efesios 3:6?',
    'Efesios 3:6',
    'El misterio consiste en "que los gentiles son coherederos y miembros del mismo cuerpo, y copartícipes de la promesa en Cristo Jesús por medio del evangelio".',
    10, 'medium', 2, true
),
-- Pregunta 3 (MC)
(
    'c0030000-0000-0000-0000-000000000003',
    'c0000000-0000-0000-0000-000000000003',
    'multiple_choice',
    '¿Cómo se considera a sí mismo el apóstol Pablo entre el pueblo del Señor en Efesios 3:8?',
    'Efesios 3:8',
    'Efesios 3:8 declara con profunda humildad: "A mí, que soy menos que el más pequeño de todos los santos, me fue dada esta gracia".',
    10, 'medium', 3, true
),
-- Pregunta 4 (MC)
(
    'c0030000-0000-0000-0000-000000000004',
    'c0000000-0000-0000-0000-000000000003',
    'multiple_choice',
    '¿A quiénes se da a conocer la multiforme sabiduría de Dios y por medio de qué entidad según Efesios 3:10?',
    'Efesios 3:10',
    'Se da a conocer "a los principados y potestades en los lugares celestiales... por medio de la iglesia".',
    10, 'hard', 4, true
),
-- Pregunta 5 (MC)
(
    'c0030000-0000-0000-0000-000000000005',
    'c0000000-0000-0000-0000-000000000003',
    'multiple_choice',
    '¿Qué actitud adopta corporalmente el apóstol Pablo al orar en Efesios 3:14?',
    'Efesios 3:14',
    'Pablo expresa su reverencia diciendo: "Por esta causa doblo mis rodillas ante el Padre de nuestro Señor Jesucristo".',
    10, 'easy', 5, true
),
-- Pregunta 6 (MC)
(
    'c0030000-0000-0000-0000-000000000006',
    'c0000000-0000-0000-0000-000000000003',
    'multiple_choice',
    '¿Dónde pide Pablo en oración que los creyentes sean fortalecidos con poder por el Espíritu según Efesios 3:16?',
    'Efesios 3:16',
    'Pide "el ser fortalecidos con poder en el hombre interior por su Espíritu".',
    10, 'medium', 6, true
),
-- Pregunta 7 (MC)
(
    'c0030000-0000-0000-0000-000000000007',
    'c0000000-0000-0000-0000-000000000003',
    'multiple_choice',
    '¿Qué cuatro dimensiones del amor de Cristo desea Pablo que los santos logren comprender según Efesios 3:18?',
    'Efesios 3:18',
    'Efesios 3:18 menciona: "cuál sea la anchura, la longitud, la profundidad y la altura".',
    10, 'medium', 7, true
),
-- Pregunta 8 (MC)
(
    'c0030000-0000-0000-0000-000000000008',
    'c0000000-0000-0000-0000-000000000003',
    'multiple_choice',
    '¿Qué es capaz de hacer Dios según la majestuosa doxología de Efesios 3:20?',
    'Efesios 3:20',
    'Dios "es poderoso para hacer todas las cosas mucho más abundantemente de lo que pedimos o entendemos, según el poder que actúa en nosotros".',
    10, 'easy', 8, true
),
-- Pregunta 9 (Fill blank)
(
    'c0030000-0000-0000-0000-000000000009',
    'c0000000-0000-0000-0000-000000000003',
    'fill_blank',
    'Completa Efesios 3:3: "Que por ________ me fue declarado el misterio, como antes lo he escrito brevemente".',
    'Efesios 3:3',
    'El misterio no provino de raciocinio humano sino por "revelacion".',
    10, 'medium', 9, true
),
-- Pregunta 10 (Fill blank)
(
    'c0030000-0000-0000-0000-000000000010',
    'c0000000-0000-0000-0000-000000000003',
    'fill_blank',
    'Completa Efesios 3:6: "Que los gentiles son ________ y miembros del mismo cuerpo, y copartícipes de la promesa".',
    'Efesios 3:6',
    'Los gentiles participan de la misma herencia como "coherederos".',
    10, 'medium', 10, true
),
-- Pregunta 11 (Fill blank)
(
    'c0030000-0000-0000-0000-000000000011',
    'c0000000-0000-0000-0000-000000000003',
    'fill_blank',
    'Completa Efesios 3:8: "A mí... me fue dada esta gracia de anunciar entre los gentiles el evangelio de las inescrutables ________ de Cristo".',
    'Efesios 3:8',
    'Pablo fue llamado a proclamar las inescrutables "riquezas" de Cristo.',
    10, 'easy', 11, true
),
-- Pregunta 12 (Fill blank)
(
    'c0030000-0000-0000-0000-000000000012',
    'c0000000-0000-0000-0000-000000000003',
    'fill_blank',
    'Completa Efesios 3:10: "Para que la ________ sabiduría de Dios sea ahora dada a conocer por medio de la iglesia".',
    'Efesios 3:10',
    'El adjetivo utilizado para la variada sabiduría divina es "multiforme".',
    10, 'hard', 12, true
),
-- Pregunta 13 (Fill blank)
(
    'c0030000-0000-0000-0000-000000000013',
    'c0000000-0000-0000-0000-000000000003',
    'fill_blank',
    'Completa Efesios 3:17: "Para que habite Cristo por la ________ en vuestros corazones".',
    'Efesios 3:17',
    'Cristo habita activamente en el corazón por medio de la "fe".',
    10, 'easy', 13, true
),
-- Pregunta 14 (Fill blank)
(
    'c0030000-0000-0000-0000-000000000014',
    'c0000000-0000-0000-0000-000000000003',
    'fill_blank',
    'Completa Efesios 3:17: "A fin de que, arraigados y cimentados en ________, seáis plenamente capaces de comprender".',
    'Efesios 3:17',
    'La base y raíz de toda la vida cristiana es el "amor".',
    10, 'easy', 14, true
),
-- Pregunta 15 (Fill blank)
(
    'c0030000-0000-0000-0000-000000000015',
    'c0030000-0000-0000-0000-000000000003',
    'fill_blank',
    'Completa Efesios 3:19: "Y de conocer el amor de Cristo, que excede a todo ________".',
    'Efesios 3:19',
    'El amor sublime de Cristo sobrepasa y excede a todo "conocimiento".',
    10, 'medium', 15, true
),
-- Pregunta 16 (Fill blank)
(
    'c0030000-0000-0000-0000-000000000016',
    'c0030000-0000-0000-0000-000000000003',
    'fill_blank',
    'Completa Efesios 3:21: "A él sea ________ en la iglesia en Cristo Jesús por todas las edades, por los siglos de los siglos. Amén".',
    'Efesios 3:21',
    'La doxología final rinde a Dios toda la "gloria".',
    10, 'easy', 16, true
),
-- Pregunta 17 (True/False)
(
    'c0030000-0000-0000-0000-000000000017',
    'c0030000-0000-0000-0000-000000000003',
    'true_false',
    'Pablo pide a los creyentes en Efesios 3:13 que no desmayen a causa de sus tribulaciones, pues ellas son la gloria de ellos.',
    'Efesios 3:13',
    'Verdadero. Efesios 3:13 dice: "pido que no desmayéis a causa de mis tribulaciones por vosotros, las cuales son vuestra gloria".',
    10, 'medium', 17, true
),
-- Pregunta 18 (True/False)
(
    'c0030000-0000-0000-0000-000000000018',
    'c0030000-0000-0000-0000-000000000003',
    'true_false',
    'El misterio de Cristo mencionado en Efesios 3 había sido revelado con todos sus detalles a los patriarcas en el Antiguo Testamento.',
    'Efesios 3:5',
    'Falso. Efesios 3:5 afirma que "en otras generaciones no se dio a conocer a los hijos de los hombres, como ahora es revelado a sus santos apóstoles y profetas por el Espíritu".',
    10, 'medium', 18, true
),
-- Pregunta 19 (True/False)
(
    'c0030000-0000-0000-0000-000000000019',
    'c0030000-0000-0000-0000-000000000003',
    'true_false',
    'Según Efesios 3:12, en Cristo tenemos seguridad y acceso a Dios con confianza por medio de la fe en él.',
    'Efesios 3:12',
    'Verdadero. Efesios 3:12 afirma: "en quien tenemos seguridad y acceso con confianza por medio de la fe en él".',
    10, 'easy', 19, true
),
-- Pregunta 20 (True/False)
(
    'c0030000-0000-0000-0000-000000000020',
    'c0030000-0000-0000-0000-000000000003',
    'true_false',
    'En Efesios 3:14-15, de Dios Padre toma nombre toda familia en los cielos y en la tierra.',
    'Efesios 3:14-15',
    'Verdadero. Pablo ora ante el Padre "de quien toma nombre toda familia en los cielos y en la tierra".',
    10, 'easy', 20, true
),
-- Pregunta 21 (True/False)
(
    'c0030000-0000-0000-0000-000000000021',
    'c0030000-0000-0000-0000-000000000003',
    'true_false',
    'En Efesios 3:19, Pablo declara que es imposible experimentar el amor de Cristo de ninguna manera práctica.',
    'Efesios 3:19',
    'Falso. Aunque el amor excede a todo conocimiento intelectual pleno, Pablo ruega expresamente "conocer el amor de Cristo".',
    10, 'medium', 21, true
),
-- Pregunta 22 (True/False)
(
    'c0030000-0000-0000-0000-000000000022',
    'c0030000-0000-0000-0000-000000000003',
    'true_false',
    'El poder divino manifestado en Efesios 3:20 actúa exclusivamente fuera del creyente sin obrar en su interior.',
    'Efesios 3:20',
    'Falso. El texto aclara categóricamente: "según el poder que actúa en nosotros".',
    10, 'medium', 22, true
),
-- Pregunta 23 (Ref Ident)
(
    'c0030000-0000-0000-0000-000000000023',
    'c0030000-0000-0000-0000-000000000003',
    'reference_identification',
    '¿En qué versículo declara Pablo: "A mí, que soy menos que el más pequeño de todos los santos, me fue dada esta gracia de anunciar entre los gentiles el evangelio de las inescrutables riquezas de Cristo"?',
    'Efesios 3:8',
    'Esta célebre manifestación apostólica se encuentra en Efesios 3:8.',
    10, 'medium', 23, true
),
-- Pregunta 24 (Ref Ident)
(
    'c0030000-0000-0000-0000-000000000024',
    'c0030000-0000-0000-0000-000000000003',
    'reference_identification',
    '¿En qué versículo se encuentra la doxología: "Y a Aquel que es poderoso para hacer todas las cosas mucho más abundantemente de lo que pedimos o entendemos"?',
    'Efesios 3:20',
    'La gran doxología de clausura de la primera mitad teológica de la carta está en Efesios 3:20.',
    10, 'easy', 24, true
),
-- Pregunta 25 (Ordering)
(
    'c0030000-0000-0000-0000-000000000025',
    'c0030000-0000-0000-0000-000000000003',
    'ordering',
    'Ordena los temas principales de la revelación y oración apostólica en Efesios 3:',
    'Efesios 3:1-21',
    '1. El misterio revelado: gentiles coherederos en un mismo cuerpo (v. 1-6). 2. El anuncio de las inescrutables riquezas de Cristo (v. 8-11). 3. Oración de rodillas pidiendo fortaleza en el hombre interior (v. 14-17). 4. Doxología de gloria a Dios por los siglos en la iglesia y en Cristo (v. 20-21).',
    10, 'hard', 25, true
);

-- OPCIONES EFESIOS 3
INSERT INTO public.question_options (question_id, option_text, is_correct, order_index)
VALUES
-- q1
('c0030000-0000-0000-0000-000000000001', 'Por vosotros los gentiles', true, 1),
('c0030000-0000-0000-0000-000000000001', 'Por delitos políticos contra Roma', false, 2),
('c0030000-0000-0000-0000-000000000001', 'Por desacuerdos con los apóstoles en Jerusalén', false, 3),
('c0030000-0000-0000-0000-000000000001', 'Por deudas personales en Asia Menor', false, 4),

-- q2
('c0030000-0000-0000-0000-000000000002', 'Los gentiles son coherederos y miembros del mismo cuerpo en Cristo', true, 1),
('c0030000-0000-0000-0000-000000000002', 'La ley de Moisés sería impuesta a todo el imperio romano', false, 2),
('c0030000-0000-0000-0000-000000000002', 'El templo de Jerusalén no sería destruido jamás', false, 3),
('c0030000-0000-0000-0000-000000000002', 'Los gentiles debían circuncidarse para poder comer con los santos', false, 4),

-- q3
('c0030000-0000-0000-0000-000000000003', 'Menos que el más pequeño de todos los santos', true, 1),
('c0030000-0000-0000-0000-000000000003', 'El gobernante supremo de todas las iglesias', false, 2),
('c0030000-0000-0000-0000-000000000003', 'El más sabio entre los teólogos de la época', false, 3),
('c0030000-0000-0000-0000-000000000003', 'Un hombre libre sin necesidad de gracia', false, 4),

-- q4
('c0030000-0000-0000-0000-000000000004', 'A los principados y potestades en los lugares celestiales por medio de la iglesia', true, 1),
('c0030000-0000-0000-0000-000000000004', 'Al senado de Roma por medio de embajadores diplomáticos', false, 2),
('c0030000-0000-0000-0000-000000000004', 'A los sacerdotes de los ídolos por medio de prodigios', false, 3),
('c0030000-0000-0000-0000-000000000004', 'A los reyes de oriente a través de visiones astrológicas', false, 4),

-- q5
('c0030000-0000-0000-0000-000000000005', 'Dobla sus rodillas ante el Padre', true, 1),
('c0030000-0000-0000-0000-000000000005', 'Se recuesta en su lecho en silencio', false, 2),
('c0030000-0000-0000-0000-000000000005', 'Se para en las plazas públicas para ser visto', false, 3),
('c0030000-0000-0000-0000-000000000005', 'Ofrece sacrificios de incienso en el altar', false, 4),

-- q6
('c0030000-0000-0000-0000-000000000006', 'En el hombre interior por su Espíritu', true, 1),
('c0030000-0000-0000-0000-000000000006', 'En la fuerza física de los músculos', false, 2),
('c0030000-0000-0000-0000-000000000006', 'En los bienes materiales y posesiones de Éfeso', false, 3),
('c0030000-0000-0000-0000-000000000006', 'En la reputación e influencia ante los gobernantes', false, 4),

-- q7
('c0030000-0000-0000-0000-000000000007', 'Anchura, longitud, profundidad y altura', true, 1),
('c0030000-0000-0000-0000-000000000007', 'Peso, densidad, volumen y tiempo', false, 2),
('c0030000-0000-0000-0000-000000000007', 'Norte, sur, este y oeste', false, 3),
('c0030000-0000-0000-0000-000000000007', 'Principio, medio, término y eternidad', false, 4),

-- q8
('c0030000-0000-0000-0000-000000000008', 'Hacer todas las cosas mucho más abundantemente de lo que pedimos o entendemos', true, 1),
('c0030000-0000-0000-0000-000000000008', 'Otorgar sólo aquello que el hombre merezca por sus méritos', false, 2),
('c0030000-0000-0000-0000-000000000008', 'Responder únicamente a peticiones hechas en el templo físico', false, 3),
('c0030000-0000-0000-0000-000000000008', 'Limitar sus obras a lo que la razón humana logre explicar', false, 4),

-- q9: fill_blank
('c0030000-0000-0000-0000-000000000009', 'revelacion', true, 1),

-- q10: fill_blank
('c0030000-0000-0000-0000-000000000010', 'coherederos', true, 1),

-- q11: fill_blank
('c0030000-0000-0000-0000-000000000011', 'riquezas', true, 1),

-- q12: fill_blank
('c0030000-0000-0000-0000-000000000012', 'multiforme', true, 1),

-- q13: fill_blank
('c0030000-0000-0000-0000-000000000013', 'fe', true, 1),

-- q14: fill_blank
('c0030000-0000-0000-0000-000000000014', 'amor', true, 1),

-- q15: fill_blank
('c0030000-0000-0000-0000-000000000015', 'conocimiento', true, 1),

-- q16: fill_blank
('c0030000-0000-0000-0000-000000000016', 'gloria', true, 1),

-- q17: true_false
('c0030000-0000-0000-0000-000000000017', 'Verdadero', true, 1),
('c0030000-0000-0000-0000-000000000017', 'Falso', false, 2),

-- q18: true_false
('c0030000-0000-0000-0000-000000000018', 'Verdadero', false, 1),
('c0030000-0000-0000-0000-000000000018', 'Falso', true, 2),

-- q19: true_false
('c0030000-0000-0000-0000-000000000019', 'Verdadero', true, 1),
('c0030000-0000-0000-0000-000000000019', 'Falso', false, 2),

-- q20: true_false
('c0030000-0000-0000-0000-000000000020', 'Verdadero', true, 1),
('c0030000-0000-0000-0000-000000000020', 'Falso', false, 2),

-- q21: true_false
('c0030000-0000-0000-0000-000000000021', 'Verdadero', false, 1),
('c0030000-0000-0000-0000-000000000021', 'Falso', true, 2),

-- q22: true_false
('c0030000-0000-0000-0000-000000000022', 'Verdadero', false, 1),
('c0030000-0000-0000-0000-000000000022', 'Falso', true, 2),

-- q23: ref
('c0030000-0000-0000-0000-000000000023', 'Efesios 3:8', true, 1),
('c0030000-0000-0000-0000-000000000023', 'Efesios 3:2', false, 2),
('c0030000-0000-0000-0000-000000000023', 'Efesios 3:15', false, 3),
('c0030000-0000-0000-0000-000000000023', 'Efesios 3:18', false, 4),

-- q24: ref
('c0030000-0000-0000-0000-000000000024', 'Efesios 3:20', true, 1),
('c0030000-0000-0000-0000-000000000024', 'Efesios 3:7', false, 2),
('c0030000-0000-0000-0000-000000000024', 'Efesios 3:11', false, 3),
('c0030000-0000-0000-0000-000000000024', 'Efesios 3:16', false, 4),

-- q25: ordering
('c0030000-0000-0000-0000-000000000025', 'El misterio revelado: gentiles coherederos en un mismo cuerpo (Ef. 3:1-6)', true, 1),
('c0030000-0000-0000-0000-000000000025', 'El anuncio de las inescrutables riquezas de Cristo (Ef. 3:8-11)', true, 2),
('c0030000-0000-0000-0000-000000000025', 'Oración de rodillas pidiendo fortaleza en el hombre interior (Ef. 3:14-17)', true, 3),
('c0030000-0000-0000-0000-000000000025', 'Doxología de gloria a Dios por los siglos en la iglesia y en Cristo (Ef. 3:20-21)', true, 4)
ON CONFLICT (id) DO NOTHING;

-- Asociar preguntas a Examen General de Efesios 3
INSERT INTO public.assessment_questions (assessment_id, question_id, order_index)
VALUES
('a0000003-0000-0000-0000-000000000003', 'c0030000-0000-0000-0000-000000000001', 1),
('a0000003-0000-0000-0000-000000000003', 'c0030000-0000-0000-0000-000000000002', 2),
('a0000003-0000-0000-0000-000000000003', 'c0030000-0000-0000-0000-000000000003', 3),
('a0000003-0000-0000-0000-000000000003', 'c0030000-0000-0000-0000-000000000004', 4),
('a0000003-0000-0000-0000-000000000003', 'c0030000-0000-0000-0000-000000000005', 5),
('a0000003-0000-0000-0000-000000000003', 'c0030000-0000-0000-0000-000000000006', 6),
('a0000003-0000-0000-0000-000000000003', 'c0030000-0000-0000-0000-000000000007', 7),
('a0000003-0000-0000-0000-000000000003', 'c0030000-0000-0000-0000-000000000008', 8),
('a0000003-0000-0000-0000-000000000003', 'c0030000-0000-0000-0000-000000000009', 9),
('a0000003-0000-0000-0000-000000000003', 'c0030000-0000-0000-0000-000000000010', 10),
('a0000003-0000-0000-0000-000000000003', 'c0030000-0000-0000-0000-000000000011', 11),
('a0000003-0000-0000-0000-000000000003', 'c0030000-0000-0000-0000-000000000012', 12),
('a0000003-0000-0000-0000-000000000003', 'c0030000-0000-0000-0000-000000000013', 13),
('a0000003-0000-0000-0000-000000000003', 'c0030000-0000-0000-0000-000000000014', 14),
('a0000003-0000-0000-0000-000000000003', 'c0030000-0000-0000-0000-000000000015', 15),
('a0000003-0000-0000-0000-000000000003', 'c0030000-0000-0000-0000-000000000016', 16),
('a0000003-0000-0000-0000-000000000003', 'c0030000-0000-0000-0000-000000000017', 17),
('a0000003-0000-0000-0000-000000000003', 'c0030000-0000-0000-0000-000000000018', 18),
('a0000003-0000-0000-0000-000000000003', 'c0030000-0000-0000-0000-000000000019', 19),
('a0000003-0000-0000-0000-000000000003', 'c0030000-0000-0000-0000-000000000020', 20),
('a0000003-0000-0000-0000-000000000003', 'c0030000-0000-0000-0000-000000000021', 21),
('a0000003-0000-0000-0000-000000000003', 'c0030000-0000-0000-0000-000000000022', 22),
('a0000003-0000-0000-0000-000000000003', 'c0030000-0000-0000-0000-000000000023', 23),
('a0000003-0000-0000-0000-000000000003', 'c0030000-0000-0000-0000-000000000024', 24),
('a0000003-0000-0000-0000-000000000003', 'c0030000-0000-0000-0000-000000000025', 25)
ON CONFLICT DO NOTHING;

-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
-- ARCHIVO: 008_efesios_examenes_generales_4_6.sql
-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

-- ==============================================================================
-- BIBLIONARIO - SEED 008: EXÁMENES GENERALES DE CAPÍTULOS 4, 5 Y 6 (NIVEL 3)
-- 25 preguntas por examen (Total: 75 preguntas multitemáticas RVR1960)
-- ==============================================================================

-- ##############################################################################
-- SECCIÓN 1: EFESIOS 4 – EXAMEN GENERAL (25 Preguntas)
-- Assessment ID: a0000004-0000-0000-0000-000000000004
-- Chapter ID:    c0000000-0000-0000-0000-000000000004
-- ##############################################################################

INSERT INTO public.questions (id, chapter_id, question_type, prompt, verse_reference, explanation, points, difficulty, order_index, is_active)
VALUES
-- Pregunta 1 (MC)
(
    'c0040000-0000-0000-0000-000000000001',
    'c0000000-0000-0000-0000-000000000004',
    'multiple_choice',
    '¿Con qué actitudes pide Pablo que andemos como es digno de la vocación en Efesios 4:2?',
    'Efesios 4:2',
    'Pablo exhorta a andar "con toda humildad y mansedumbre, soportándoos con paciencia los unos a los otros en amor".',
    10, 'easy', 1, true
),
-- Pregunta 2 (MC)
(
    'c0040000-0000-0000-0000-000000000002',
    'c0000000-0000-0000-0000-000000000004',
    'multiple_choice',
    '¿Cuáles son las siete unidades fundamentales que enumera el apóstol en Efesios 4:4-6?',
    'Efesios 4:4-6',
    'Enumera: un cuerpo, un Espíritu, una misma esperanza, un Señor, una fe, un bautismo, un Dios y Padre de todos.',
    10, 'medium', 2, true
),
-- Pregunta 3 (MC)
(
    'c0040000-0000-0000-0000-000000000003',
    'c0000000-0000-0000-0000-000000000004',
    'multiple_choice',
    '¿Qué ministerios constituyó Cristo para la edificación de su cuerpo según Efesios 4:11?',
    'Efesios 4:11',
    'Cristo constituyó "a unos, apóstoles; a otros, profetas; a otros, evangelistas; a otros, pastores y maestros".',
    10, 'easy', 3, true
),
-- Pregunta 4 (MC)
(
    'c0040000-0000-0000-0000-000000000004',
    'c0000000-0000-0000-0000-000000000004',
    'multiple_choice',
    '¿Cuál es el propósito final del perfeccionamiento de los creyentes en Efesios 4:12-13?',
    'Efesios 4:12-13',
    'El propósito es "para la obra del ministerio, para la edificación del cuerpo de Cristo, hasta que todos lleguemos a la unidad de la fe... a un varón perfecto".',
    10, 'medium', 4, true
),
-- Pregunta 5 (MC)
(
    'c0040000-0000-0000-0000-000000000005',
    'c0000000-0000-0000-0000-000000000004',
    'multiple_choice',
    '¿De qué peligro advierte Pablo a la iglesia en Efesios 4:14 si permanecen como niños fluctuantes?',
    'Efesios 4:14',
    'Advierte de ser "llevados por doquiera de todo viento de doctrina, por estratagema de hombres que para engañar emplean con astucia las artimañas del error".',
    10, 'medium', 5, true
),
-- Pregunta 6 (MC)
(
    'c0040000-0000-0000-0000-000000000006',
    'c0000000-0000-0000-0000-000000000004',
    'multiple_choice',
    '¿Cómo describe Efesios 4:17-18 el estado moral y mental de los gentiles incrédulos?',
    'Efesios 4:17-18',
    'Andan en "la vanidad de su mente, teniendo el entendimiento entenebrecido, ajenos de la vida de Dios por la ignorancia que en ellos hay".',
    10, 'medium', 6, true
),
-- Pregunta 7 (MC)
(
    'c0040000-0000-0000-0000-000000000007',
    'c0000000-0000-0000-0000-000000000004',
    'multiple_choice',
    '¿Qué debe hacer el creyente respecto al viejo y nuevo hombre según Efesios 4:22-24?',
    'Efesios 4:22-24',
    'Debe "despojarse del viejo hombre... renovarse en el espíritu de la mente, y vestirse del nuevo hombre, creado según Dios".',
    10, 'easy', 7, true
),
-- Pregunta 8 (MC)
(
    'c0040000-0000-0000-0000-000000000008',
    'c0000000-0000-0000-0000-000000000004',
    'multiple_choice',
    '¿Cuál es el límite temporal y la advertencia dada respecto al enojo en Efesios 4:26-27?',
    'Efesios 4:26-27',
    'Pablo ordena: "no se ponga el sol sobre vuestro enojo, ni deis lugar al diablo".',
    10, 'easy', 8, true
),
-- Pregunta 9 (Fill blank)
(
    'c0040000-0000-0000-0000-000000000009',
    'c0000000-0000-0000-0000-000000000004',
    'fill_blank',
    'Completa Efesios 4:3: "Solícitos en guardar la unidad del Espíritu en el vínculo de la ________".',
    'Efesios 4:3',
    'El vínculo que mantiene unida a la comunidad es la "paz".',
    10, 'easy', 9, true
),
-- Pregunta 10 (Fill blank)
(
    'c0040000-0000-0000-0000-000000000010',
    'c0000000-0000-0000-0000-000000000004',
    'fill_blank',
    'Completa Efesios 4:8: "Subiendo a lo alto, llevó cautiva la cautividad, y dio ________ a los hombres".',
    'Efesios 4:8',
    'Cristo resucitado y victorioso otorgó "dones" a su iglesia.',
    10, 'easy', 10, true
),
-- Pregunta 11 (Fill blank)
(
    'c0040000-0000-0000-0000-000000000011',
    'c0000000-0000-0000-0000-000000000004',
    'fill_blank',
    'Completa Efesios 4:15: "Sino que siguiendo la ________ en amor, crezcamos en todo en aquel que es la cabeza, esto es, Cristo".',
    'Efesios 4:15',
    'El crecimiento auténtico se logra siguiendo la "verdad" en amor.',
    10, 'easy', 11, true
),
-- Pregunta 12 (Fill blank)
(
    'c0040000-0000-0000-0000-000000000012',
    'c0000000-0000-0000-0000-000000000004',
    'fill_blank',
    'Completa Efesios 4:25: "Por lo cual, desechando la mentira, hablad ________ cada uno con su prójimo".',
    'Efesios 4:25',
    'El nuevo hombre sustituye la falsedad hablando siempre la "verdad".',
    10, 'easy', 12, true
),
-- Pregunta 13 (Fill blank)
(
    'c0040000-0000-0000-0000-000000000013',
    'c0000000-0000-0000-0000-000000000004',
    'fill_blank',
    'Completa Efesios 4:28: "El que hurtaba, no hurte más, sino ________, trabajando con sus manos lo que es bueno".',
    'Efesios 4:28',
    'El mandamiento de redención laboral ordena que "trabaje".',
    10, 'easy', 13, true
),
-- Pregunta 14 (Fill blank)
(
    'c0040000-0000-0000-0000-000000000014',
    'c0000000-0000-0000-0000-000000000004',
    'fill_blank',
    'Completa Efesios 4:29: "Ninguna palabra ________ salga de vuestra boca, sino la que sea buena para la necesaria edificación".',
    'Efesios 4:29',
    'Se prohíbe toda palabra destructiva o "corrompida".',
    10, 'medium', 14, true
),
-- Pregunta 15 (Fill blank)
(
    'c0040000-0000-0000-0000-000000000015',
    'c0000000-0000-0000-0000-000000000004',
    'fill_blank',
    'Completa Efesios 4:30: "Y no ________ al Espíritu Santo de Dios, con el cual fuisteis sellados para el día de la redención".',
    'Efesios 4:30',
    'El texto advierte solemnemente: no "contristeis" al Espíritu.',
    10, 'medium', 15, true
),
-- Pregunta 16 (Fill blank)
(
    'c0040000-0000-0000-0000-000000000016',
    'c0000000-0000-0000-0000-000000000004',
    'fill_blank',
    'Completa Efesios 4:32: "Antes sed benignos unos con otros, misericordiosos, ________ unos a otros, como Dios también os perdonó a vosotros en Cristo".',
    'Efesios 4:32',
    'El mandato supremo de gracia interpersonal es "perdonandoos".',
    10, 'easy', 16, true
),
-- Pregunta 17 (True/False)
(
    'c0040000-0000-0000-0000-000000000017',
    'c0000000-0000-0000-0000-000000000004',
    'true_false',
    'En Efesios 4:5, Pablo enseña que existen múltiples señores y diversos bautismos legítimos para la salvación.',
    'Efesios 4:5',
    'Falso. Efesios 4:5 declara tajantemente: "un Señor, una fe, un bautismo".',
    10, 'easy', 17, true
),
-- Pregunta 18 (True/False)
(
    'c0040000-0000-0000-0000-000000000018',
    'c0000000-0000-0000-0000-000000000004',
    'true_false',
    'Los ministerios dados por Cristo en Efesios 4:11 tienen como finalidad hacer a los miembros dependientes pasivos de los líderes.',
    'Efesios 4:12',
    'Falso. Su fin es "perfeccionar a los santos para la obra del ministerio", capacitando a todos para el servicio activo.',
    10, 'medium', 18, true
),
-- Pregunta 19 (True/False)
(
    'c0040000-0000-0000-0000-000000000019',
    'c0000000-0000-0000-0000-000000000004',
    'true_false',
    'El nuevo hombre en Efesios 4:24 es creado según Dios en la justicia y santidad de la verdad.',
    'Efesios 4:24',
    'Verdadero. Efesios 4:24 describe al nuevo hombre "creado según Dios en la justicia y santidad de la verdad".',
    10, 'easy', 19, true
),
-- Pregunta 20 (True/False)
(
    'c0040000-0000-0000-0000-000000000020',
    'c0000000-0000-0000-0000-000000000004',
    'true_false',
    'Efesios 4:26 permite experimentar indignación justa o ira, pero prohíbe categóricamente pecar y alimentar el rencor.',
    'Efesios 4:26',
    'Verdadero. El texto dice: "Airaos, pero no pequéis; no se ponga el sol sobre vuestro enojo".',
    10, 'medium', 20, true
),
-- Pregunta 21 (True/False)
(
    'c0040000-0000-0000-0000-000000000021',
    'c0000000-0000-0000-0000-000000000004',
    'true_false',
    'Según Efesios 4:28, el propósito de trabajar honradamente es únicamente enriquecerse para comprar lujos personales.',
    'Efesios 4:28',
    'Falso. El propósito expreso es: "para que tenga qué compartir con el que padece necesidad".',
    10, 'easy', 21, true
),
-- Pregunta 22 (True/False)
(
    'c0040000-0000-0000-0000-000000000022',
    'c0000000-0000-0000-0000-000000000004',
    'true_false',
    'Efesios 4:31 ordena erradicar amargura, enojo, ira, gritería, maledicencia y toda malicia.',
    'Efesios 4:31',
    'Verdadero. Efesios 4:31 exige expresamente quitar todas estas conductas pecaminosas destructivas.',
    10, 'easy', 22, true
),
-- Pregunta 23 (Ref Ident)
(
    'c0040000-0000-0000-0000-000000000023',
    'c0000000-0000-0000-0000-000000000004',
    'reference_identification',
    '¿En qué versículo se encuentra el mandamiento: "Airaos, pero no pequéis; no se ponga el sol sobre vuestro enojo"?',
    'Efesios 4:26',
    'Esta conocida regla sobre la gestión del enojo se ubica en Efesios 4:26.',
    10, 'easy', 23, true
),
-- Pregunta 24 (Ref Ident)
(
    'c0040000-0000-0000-0000-000000000024',
    'c0000000-0000-0000-0000-000000000004',
    'reference_identification',
    '¿En qué versículo de Efesios 4 se menciona expresamente la lista de ministerios: apóstoles, profetas, evangelistas, pastores y maestros?',
    'Efesios 4:11',
    'La enumeración de dones ministeriales se encuentra en Efesios 4:11.',
    10, 'easy', 24, true
),
-- Pregunta 25 (Ordering)
(
    'c0040000-0000-0000-0000-000000000025',
    'c0000000-0000-0000-0000-000000000004',
    'ordering',
    'Ordena las enseñanzas prácticas sobre la vida cristiana presentadas en Efesios 4:',
    'Efesios 4:1-32',
    '1. Andar en humildad guardando la unidad del Espíritu en paz (v. 1-3). 2. Dones ministeriales para la edificación y madurez del cuerpo (v. 11-13). 3. Despojarse del viejo hombre y vestirse del nuevo hombre (v. 22-24). 4. Desechar mentira, ira y amargura, perdonando como Cristo perdonó (v. 25-32).',
    10, 'hard', 25, true
);

-- OPCIONES EFESIOS 4
INSERT INTO public.question_options (question_id, option_text, is_correct, order_index)
VALUES
-- q1
('c0040000-0000-0000-0000-000000000001', 'Con toda humildad, mansedumbre, paciencia y amor', true, 1),
('c0040000-0000-0000-0000-000000000001', 'Con orgullo espiritual demostrando superioridad', false, 2),
('c0040000-0000-0000-0000-000000000001', 'Con severidad inflexible hacia las debilidades del prójimo', false, 3),
('c0040000-0000-0000-0000-000000000001', 'Con aislamiento total de la sociedad civil', false, 4),

-- q2
('c0040000-0000-0000-0000-000000000002', 'Un cuerpo, un Espíritu, una esperanza, un Señor, una fe, un bautismo, un Dios y Padre', true, 1),
('c0040000-0000-0000-0000-000000000002', 'Siete templos, siete reyes, siete leyes, siete ritos, siete fiestas, siete sacerdotes, un Dios', false, 2),
('c0040000-0000-0000-0000-000000000002', 'Tres señores, dos bautismos, un cuerpo, cuatro esperanzas y muchos padres', false, 3),
('c0040000-0000-0000-0000-000000000002', 'Un imperio, una cultura, un ejército, una moneda, una ley y dos soberanos', false, 4),

-- q3
('c0040000-0000-0000-0000-000000000003', 'Apóstoles, profetas, evangelistas, pastores y maestros', true, 1),
('c0040000-0000-0000-0000-000000000003', 'Reyes, generales, senadores, tribunos y jueces', false, 2),
('c0040000-0000-0000-0000-000000000003', 'Sumos sacerdotes, levitas, escribas y fariseos', false, 3),
('c0040000-0000-0000-0000-000000000003', 'Filósofos, retóricos, oradores y poetas griegos', false, 4),

-- q4
('c0040000-0000-0000-0000-000000000004', 'Perfeccionar a los santos para la obra del ministerio y la edificación del cuerpo', true, 1),
('c0040000-0000-0000-0000-000000000004', 'Establecer una dinastía familiar de líderes permanentes', false, 2),
('c0040000-0000-0000-0000-000000000004', 'Recaudar tributos obligatorios para la sede central', false, 3),
('c0040000-0000-0000-0000-000000000004', 'Gobernar militarmente las ciudades de Judea y Asia', false, 4),

-- q5
('c0040000-0000-0000-0000-000000000005', 'Ser llevados por doquiera de todo viento de doctrina por estratagema de hombres', true, 1),
('c0040000-0000-0000-0000-000000000005', 'Perder la salvación instantáneamente por una equivocación', false, 2),
('c0040000-0000-0000-0000-000000000005', 'No poder participar en las actividades comerciales de la ciudad', false, 3),
('c0040000-0000-0000-0000-000000000005', 'Ser juzgados por los tribunales del césar romano', false, 4),

-- q6
('c0040000-0000-0000-0000-000000000006', 'Entendimiento entenebrecido, ajenos de la vida de Dios y entregados a la impureza', true, 1),
('c0040000-0000-0000-0000-000000000006', 'Mentes sumamente puras que no necesitaban corrección', false, 2),
('c0040000-0000-0000-0000-000000000006', 'Devotos buscadores del Dios verdadero mediante ídolos de plata', false, 3),
('c0040000-0000-0000-0000-000000000006', 'Víctimas involuntarias sin responsabilidad moral alguna', false, 4),

-- q7
('c0040000-0000-0000-0000-000000000007', 'Despojarse del viejo hombre y vestirse del nuevo hombre creado según Dios', true, 1),
('c0040000-0000-0000-0000-000000000007', 'Conservar las costumbres del viejo hombre mientras se practica la religión', false, 2),
('c0040000-0000-0000-0000-000000000007', 'Cambiar únicamente las vestiduras exteriores y la dieta física', false, 3),
('c0040000-0000-0000-0000-000000000007', 'Reinterpretar los deseos engañosos como virtudes espirituales', false, 4),

-- q8
('c0040000-0000-0000-0000-000000000008', 'No se ponga el sol sobre vuestro enojo, ni deis lugar al diablo', true, 1),
('c0040000-0000-0000-0000-000000000008', 'Guardar el enojo por semanas hasta planear una venganza justa', false, 2),
('c0040000-0000-0000-0000-000000000008', 'Expresar toda la furia verbalmente sin censura para desahogarse', false, 3),
('c0040000-0000-0000-0000-000000000008', 'Ignorar el conflicto fingiendo que el prójimo no existe', false, 4),

-- q9: fill_blank
('c0040000-0000-0000-0000-000000000009', 'paz', true, 1),

-- q10: fill_blank
('c0040000-0000-0000-0000-000000000010', 'dones', true, 1),

-- q11: fill_blank
('c0040000-0000-0000-0000-000000000011', 'verdad', true, 1),

-- q12: fill_blank
('c0040000-0000-0000-0000-000000000012', 'verdad', true, 1),

-- q13: fill_blank
('c0040000-0000-0000-0000-000000000013', 'trabaje', true, 1),

-- q14: fill_blank
('c0040000-0000-0000-0000-000000000014', 'corrompida', true, 1),

-- q15: fill_blank
('c0040000-0000-0000-0000-000000000015', 'contristeis', true, 1),

-- q16: fill_blank
('c0040000-0000-0000-0000-000000000016', 'perdonandoos', true, 1),

-- q17: true_false
('c0040000-0000-0000-0000-000000000017', 'Verdadero', false, 1),
('c0040000-0000-0000-0000-000000000017', 'Falso', true, 2),

-- q18: true_false
('c0040000-0000-0000-0000-000000000018', 'Verdadero', false, 1),
('c0040000-0000-0000-0000-000000000018', 'Falso', true, 2),

-- q19: true_false
('c0040000-0000-0000-0000-000000000019', 'Verdadero', true, 1),
('c0040000-0000-0000-0000-000000000019', 'Falso', false, 2),

-- q20: true_false
('c0040000-0000-0000-0000-000000000020', 'Verdadero', true, 1),
('c0040000-0000-0000-0000-000000000020', 'Falso', false, 2),

-- q21: true_false
('c0040000-0000-0000-0000-000000000021', 'Verdadero', false, 1),
('c0040000-0000-0000-0000-000000000021', 'Falso', true, 2),

-- q22: true_false
('c0040000-0000-0000-0000-000000000022', 'Verdadero', true, 1),
('c0040000-0000-0000-0000-000000000022', 'Falso', false, 2),

-- q23: ref
('c0040000-0000-0000-0000-000000000023', 'Efesios 4:26', true, 1),
('c0040000-0000-0000-0000-000000000023', 'Efesios 4:10', false, 2),
('c0040000-0000-0000-0000-000000000023', 'Efesios 4:18', false, 3),
('c0040000-0000-0000-0000-000000000023', 'Efesios 4:32', false, 4),

-- q24: ref
('c0040000-0000-0000-0000-000000000024', 'Efesios 4:11', true, 1),
('c0040000-0000-0000-0000-000000000024', 'Efesios 4:2', false, 2),
('c0040000-0000-0000-0000-000000000024', 'Efesios 4:7', false, 3),
('c0040000-0000-0000-0000-000000000024', 'Efesios 4:29', false, 4),

-- q25: ordering
('c0040000-0000-0000-0000-000000000025', 'Andar en humildad guardando la unidad del Espíritu en paz (Ef. 4:1-3)', true, 1),
('c0040000-0000-0000-0000-000000000025', 'Dones ministeriales para la edificación y madurez del cuerpo (Ef. 4:11-13)', true, 2),
('c0040000-0000-0000-0000-000000000025', 'Despojarse del viejo hombre y vestirse del nuevo hombre (Ef. 4:22-24)', true, 3),
('c0040000-0000-0000-0000-000000000025', 'Desechar mentira, ira y amargura, perdonando como Cristo perdonó (Ef. 4:25-32)', true, 4)
ON CONFLICT (id) DO NOTHING;

-- Asociar preguntas a Examen General de Efesios 4
INSERT INTO public.assessment_questions (assessment_id, question_id, order_index)
VALUES
('a0000004-0000-0000-0000-000000000004', 'c0040000-0000-0000-0000-000000000001', 1),
('a0000004-0000-0000-0000-000000000004', 'c0040000-0000-0000-0000-000000000002', 2),
('a0000004-0000-0000-0000-000000000004', 'c0040000-0000-0000-0000-000000000003', 3),
('a0000004-0000-0000-0000-000000000004', 'c0040000-0000-0000-0000-000000000004', 4),
('a0000004-0000-0000-0000-000000000004', 'c0040000-0000-0000-0000-000000000005', 5),
('a0000004-0000-0000-0000-000000000004', 'c0040000-0000-0000-0000-000000000006', 6),
('a0000004-0000-0000-0000-000000000004', 'c0040000-0000-0000-0000-000000000007', 7),
('a0000004-0000-0000-0000-000000000004', 'c0040000-0000-0000-0000-000000000008', 8),
('a0000004-0000-0000-0000-000000000004', 'c0040000-0000-0000-0000-000000000009', 9),
('a0000004-0000-0000-0000-000000000004', 'c0040000-0000-0000-0000-000000000010', 10),
('a0000004-0000-0000-0000-000000000004', 'c0040000-0000-0000-0000-000000000011', 11),
('a0000004-0000-0000-0000-000000000004', 'c0040000-0000-0000-0000-000000000012', 12),
('a0000004-0000-0000-0000-000000000004', 'c0040000-0000-0000-0000-000000000013', 13),
('a0000004-0000-0000-0000-000000000004', 'c0040000-0000-0000-0000-000000000014', 14),
('a0000004-0000-0000-0000-000000000004', 'c0040000-0000-0000-0000-000000000015', 15),
('a0000004-0000-0000-0000-000000000004', 'c0040000-0000-0000-0000-000000000016', 16),
('a0000004-0000-0000-0000-000000000004', 'c0040000-0000-0000-0000-000000000017', 17),
('a0000004-0000-0000-0000-000000000004', 'c0040000-0000-0000-0000-000000000018', 18),
('a0000004-0000-0000-0000-000000000004', 'c0040000-0000-0000-0000-000000000019', 19),
('a0000004-0000-0000-0000-000000000004', 'c0040000-0000-0000-0000-000000000020', 20),
('a0000004-0000-0000-0000-000000000004', 'c0040000-0000-0000-0000-000000000021', 21),
('a0000004-0000-0000-0000-000000000004', 'c0040000-0000-0000-0000-000000000022', 22),
('a0000004-0000-0000-0000-000000000004', 'c0040000-0000-0000-0000-000000000023', 23),
('a0000004-0000-0000-0000-000000000004', 'c0040000-0000-0000-0000-000000000024', 24),
('a0000004-0000-0000-0000-000000000004', 'c0040000-0000-0000-0000-000000000025', 25)
ON CONFLICT DO NOTHING;


-- ##############################################################################
-- SECCIÓN 2: EFESIOS 5 – EXAMEN GENERAL (25 Preguntas)
-- Assessment ID: a0000005-0000-0000-0000-000000000005
-- Chapter ID:    c0000000-0000-0000-0000-000000000005
-- ##############################################################################

INSERT INTO public.questions (id, chapter_id, question_type, prompt, verse_reference, explanation, points, difficulty, order_index, is_active)
VALUES
-- Pregunta 1 (MC)
(
    'c0050000-0000-0000-0000-000000000001',
    'c0000000-0000-0000-0000-000000000005',
    'multiple_choice',
    '¿A quiénes se nos llama a imitar y de qué manera en Efesios 5:1?',
    'Efesios 5:1',
    'Efesios 5:1 dice: "Sed, pues, imitadores de Dios como hijos amados".',
    10, 'easy', 1, true
),
-- Pregunta 2 (MC)
(
    'c0050000-0000-0000-0000-000000000002',
    'c0000000-0000-0000-0000-000000000005',
    'multiple_choice',
    '¿Qué tipo de conversación debe sustituir a las palabras deshonestas y truhanerías en Efesios 5:4?',
    'Efesios 5:4',
    'Pablo exhorta a que no haya palabras deshonestas "sino antes bien acciones de gracias".',
    10, 'medium', 2, true
),
-- Pregunta 3 (MC)
(
    'c0050000-0000-0000-0000-000000000003',
    'c0000000-0000-0000-0000-000000000005',
    'multiple_choice',
    '¿Qué advierte solemnemente Efesios 5:5 respecto a los fornicarios, inmundos y avaros?',
    'Efesios 5:5',
    'Declara que ninguno de ellos "tiene herencia en el reino de Cristo y de Dios".',
    10, 'easy', 3, true
),
-- Pregunta 4 (MC)
(
    'c0050000-0000-0000-0000-000000000004',
    'c0000000-0000-0000-0000-000000000005',
    'multiple_choice',
    '¿En qué consiste el fruto del Espíritu (o fruto de la luz) según Efesios 5:9?',
    'Efesios 5:9',
    'Efesios 5:9 declara que es "en toda bondad, justicia y verdad".',
    10, 'easy', 4, true
),
-- Pregunta 5 (MC)
(
    'c0050000-0000-0000-0000-000000000005',
    'c0000000-0000-0000-0000-000000000005',
    'multiple_choice',
    '¿Qué actitud debe tomar el creyente hacia las obras infructuosas de las tinieblas según Efesios 5:11?',
    'Efesios 5:11',
    'Pablo ordena: "Y no participéis en las obras infructuosas de las tinieblas, sino más bien reprendedlas".',
    10, 'medium', 5, true
),
-- Pregunta 6 (MC)
(
    'c0050000-0000-0000-0000-000000000006',
    'c0000000-0000-0000-0000-000000000005',
    'multiple_choice',
    '¿Por qué razón nos manda Efesios 5:16 a aprovechar bien el tiempo?',
    'Efesios 5:16',
    'El versículo añade la razón moral: "aprovechando bien el tiempo, porque los días son malos".',
    10, 'easy', 6, true
),
-- Pregunta 7 (MC)
(
    'c0050000-0000-0000-0000-000000000007',
    'c0000000-0000-0000-0000-000000000005',
    'multiple_choice',
    '¿Cómo purificó y santificó Cristo a su iglesia según Efesios 5:26?',
    'Efesios 5:26',
    'Efesios 5:26 afirma: "habiéndola purificado en el lavamiento del agua por la palabra".',
    10, 'medium', 7, true
),
-- Pregunta 8 (MC)
(
    'c0050000-0000-0000-0000-000000000008',
    'c0000000-0000-0000-0000-000000000005',
    'multiple_choice',
    '¿A qué realidad espiritual suprema aplica Pablo el misterio de la unión matrimonial en Efesios 5:31-32?',
    'Efesios 5:31-32',
    'Pablo declara: "Grande es este misterio; mas yo digo esto respecto de Cristo y de la iglesia".',
    10, 'medium', 8, true
),
-- Pregunta 9 (Fill blank)
(
    'c0050000-0000-0000-0000-000000000009',
    'c0000000-0000-0000-0000-000000000005',
    'fill_blank',
    'Completa Efesios 5:2: "Y andad en ________, como también Cristo nos amó, y se entregó a sí mismo por nosotros".',
    'Efesios 5:2',
    'El camino y norma de la vida cristiana es el "amor".',
    10, 'easy', 9, true
),
-- Pregunta 10 (Fill blank)
(
    'c0050000-0000-0000-0000-000000000010',
    'c0000000-0000-0000-0000-000000000005',
    'fill_blank',
    'Completa Efesios 5:8: "Porque en otro tiempo erais tinieblas, mas ahora sois ________ en el Señor; andad como hijos de luz".',
    'Efesios 5:8',
    'La nueva identidad del creyente en el Señor es la "luz".',
    10, 'easy', 10, true
),
-- Pregunta 11 (Fill blank)
(
    'c0050000-0000-0000-0000-000000000011',
    'c0000000-0000-0000-0000-000000000005',
    'fill_blank',
    'Completa Efesios 5:14: "Por lo cual dice: Despiértate, tú que duermes, y levántate de los muertos, y te alumbrará ________".',
    'Efesios 5:14',
    'Aquel que da luz y vida plena es "Cristo".',
    10, 'easy', 11, true
),
-- Pregunta 12 (Fill blank)
(
    'c0050000-0000-0000-0000-000000000012',
    'c0000000-0000-0000-0000-000000000005',
    'fill_blank',
    'Completa Efesios 5:18: "No os embriaguéis con vino, en lo cual hay disolución; antes bien sed ________ del Espíritu".',
    'Efesios 5:18',
    'El creyente debe ser gobernado y hallarse "lleno" o "llenos" del Espíritu.',
    10, 'easy', 12, true
),
-- Pregunta 13 (Fill blank)
(
    'c0050000-0000-0000-0000-000000000013',
    'c0000000-0000-0000-0000-000000000005',
    'fill_blank',
    'Completa Efesios 5:20: "Dando siempre ________ por todo al Dios y Padre, en el nombre de nuestro Señor Jesucristo".',
    'Efesios 5:20',
    'La actitud continua del adorador es dar "gracias".',
    10, 'easy', 13, true
),
-- Pregunta 14 (Fill blank)
(
    'c0050000-0000-0000-0000-000000000014',
    'c0000000-0000-0000-0000-000000000005',
    'fill_blank',
    'Completa Efesios 5:21: "________ unos a otros en el temor de Dios".',
    'Efesios 5:21',
    'El principio mutuo de convivencia espiritual es "someteos".',
    10, 'medium', 14, true
),
-- Pregunta 15 (Fill blank)
(
    'c0050000-0000-0000-0000-000000000015',
    'c0000000-0000-0000-0000-000000000005',
    'fill_blank',
    'Completa Efesios 5:25: "Maridos, amad a vuestras mujeres, así como Cristo amó a la iglesia, y se ________ a sí mismo por ella".',
    'Efesios 5:25',
    'El amor del esposo se modela en Cristo, quien se "entrego" por la iglesia.',
    10, 'easy', 15, true
),
-- Pregunta 16 (Fill blank)
(
    'c0050000-0000-0000-0000-000000000016',
    'c0000000-0000-0000-0000-000000000005',
    'fill_blank',
    'Completa Efesios 5:27: "A fin de presentársela a sí mismo, una iglesia gloriosa, que no tuviese mancha ni ________ ni cosa semejante".',
    'Efesios 5:27',
    'La perfección de la iglesia redimida es sin mancha ni "arruga".',
    10, 'medium', 16, true
),
-- Pregunta 17 (True/False)
(
    'c0050000-0000-0000-0000-000000000017',
    'c0000000-0000-0000-0000-000000000005',
    'true_false',
    'Efesios 5:3 enseña que pecados como la fornicación y la avaricia ni siquiera deben nombrarse entre los santos.',
    'Efesios 5:3',
    'Verdadero. Efesios 5:3 dice: "Pero fornicación y toda inmundicia, o avaricia, ni aun se nombre entre vosotros, como conviene a santos".',
    10, 'easy', 17, true
),
-- Pregunta 18 (True/False)
(
    'c0050000-0000-0000-0000-000000000018',
    'c0000000-0000-0000-0000-000000000005',
    'true_false',
    'En Efesios 5:5, el apóstol Pablo equipara la avaricia con la idolatría.',
    'Efesios 5:5',
    'Verdadero. Pablo describe al "avaro, que es idólatra", mostrando que el amor al dinero sustituye a Dios.',
    10, 'medium', 18, true
),
-- Pregunta 19 (True/False)
(
    'c0050000-0000-0000-0000-000000000019',
    'c0000000-0000-0000-0000-000000000005',
    'true_false',
    'Efesios 5:15 aconseja vivir sin prestar atención a nuestra conducta moral, confiando en que Dios no mira las obras.',
    'Efesios 5:15',
    'Falso. Efesios 5:15 dice: "Mirad, pues, con diligencia cómo andéis, no como necios sino como sabios".',
    10, 'easy', 19, true
),
-- Pregunta 20 (True/False)
(
    'c0050000-0000-0000-0000-000000000020',
    'c0000000-0000-0000-0000-000000000005',
    'true_false',
    'La llenura del Espíritu Santo en Efesios 5:19 produce comunión cantando y alabando al Señor en los corazones con salmos e himnos.',
    'Efesios 5:19',
    'Verdadero. La adoración gozosa y la gratitud son señales inmediatas de la llenura del Espíritu.',
    10, 'easy', 20, true
),
-- Pregunta 21 (True/False)
(
    'c0050000-0000-0000-0000-000000000021',
    'c0000000-0000-0000-0000-000000000005',
    'true_false',
    'El modelo bíblico para el amor sacrificial del marido hacia su esposa es el amor de Cristo por la iglesia.',
    'Efesios 5:25',
    'Verdadero. Efesios 5:25 establece el amor y sacrificio de Cristo por la iglesia como el estándar conyugal.',
    10, 'easy', 21, true
),
-- Pregunta 22 (True/False)
(
    'c0050000-0000-0000-0000-000000000022',
    'c0000000-0000-0000-0000-000000000005',
    'true_false',
    'En Efesios 5:33, la mujer queda libre de mostrar respeto hacia su marido.',
    'Efesios 5:33',
    'Falso. Efesios 5:33 concluye ordenando: "y la mujer respete a su marido".',
    10, 'easy', 22, true
),
-- Pregunta 23 (Ref Ident)
(
    'c0050000-0000-0000-0000-000000000023',
    'c0000000-0000-0000-0000-000000000005',
    'reference_identification',
    '¿En qué versículo se encuentra la ordenanza: "No os embriaguéis con vino, en lo cual hay disolución; antes bien sed llenos del Espíritu"?',
    'Efesios 5:18',
    'Este conocido contraste entre la embriaguez carnal y el control del Espíritu está en Efesios 5:18.',
    10, 'easy', 23, true
),
-- Pregunta 24 (Ref Ident)
(
    'c0050000-0000-0000-0000-000000000024',
    'c0000000-0000-0000-0000-000000000005',
    'reference_identification',
    '¿En qué versículo afirma el apóstol: "Grande es este misterio; mas yo digo esto respecto de Cristo y de la iglesia"?',
    'Efesios 5:32',
    'La revelación de la unión entre Cristo y su iglesia como el significado profundo del matrimonio está en Efesios 5:32.',
    10, 'medium', 24, true
),
-- Pregunta 25 (Ordering)
(
    'c0050000-0000-0000-0000-000000000025',
    'c0000000-0000-0000-0000-000000000005',
    'ordering',
    'Ordena las enseñanzas morales y familiares de Efesios 5 conforme a su aparición en el texto:',
    'Efesios 5:1-33',
    '1. Andar en amor e imitar a Dios huyendo de toda inmundicia (v. 1-5). 2. Andar como hijos de luz reprobando las tinieblas (v. 8-14). 3. Vivir sabiamente y ser llenos del Espíritu con alabanza continua (v. 15-21). 4. El orden conyugal: el matrimonio como reflejo de Cristo y la iglesia (v. 22-33).',
    10, 'hard', 25, true
);

-- OPCIONES EFESIOS 5
INSERT INTO public.question_options (question_id, option_text, is_correct, order_index)
VALUES
-- q1
('c0050000-0000-0000-0000-000000000001', 'Imitadores de Dios como hijos amados', true, 1),
('c0050000-0000-0000-0000-000000000001', 'Imitadores de los filósofos de Atenas', false, 2),
('c0050000-0000-0000-0000-000000000001', 'Seguidores de las costumbres populares de Éfeso', false, 3),
('c0050000-0000-0000-0000-000000000001', 'Imitadores de los gobernantes de las naciones', false, 4),

-- q2
('c0050000-0000-0000-0000-000000000002', 'Acciones de gracias', true, 1),
('c0050000-0000-0000-0000-000000000002', 'Murmuraciones contra el gobierno', false, 2),
('c0050000-0000-0000-0000-000000000002', 'Chistes mundanos y sarcasmos', false, 3),
('c0050000-0000-0000-0000-000000000002', 'Debates filosóficos interminables', false, 4),

-- q3
('c0050000-0000-0000-0000-000000000003', 'No tienen herencia en el reino de Cristo y de Dios', true, 1),
('c0050000-0000-0000-0000-000000000003', 'Reciben una amonestación pero heredan coronas iguales', false, 2),
('c0050000-0000-0000-0000-000000000003', 'Son absueltos automáticamente sin arrepentimiento', false, 3),
('c0050000-0000-0000-0000-000000000003', 'Pierden sólo privilegios financieros terrenales', false, 4),

-- q4
('c0050000-0000-0000-0000-000000000004', 'En toda bondad, justicia y verdad', true, 1),
('c0050000-0000-0000-0000-000000000004', 'En riquezas terrenales y fama pública', false, 2),
('c0050000-0000-0000-0000-000000000004', 'En prodigios visibles sin santidad de vida', false, 3),
('c0050000-0000-0000-0000-000000000004', 'En austeridad física y sacrificios rigurosos', false, 4),

-- q5
('c0050000-0000-0000-0000-000000000005', 'No participar en ellas sino más bien reprenderlas', true, 1),
('c0050000-0000-0000-0000-000000000005', 'Tolerarlas en silencio para no generar incomodidad', false, 2),
('c0050000-0000-0000-0000-000000000005', 'Participar moderadamente para ganar simpatías', false, 3),
('c0050000-0000-0000-0000-000000000005', 'Celebrarlas públicamente como actos de libertad', false, 4),

-- q6
('c0050000-0000-0000-0000-000000000006', 'Porque los días son malos', true, 1),
('c0050000-0000-0000-0000-000000000006', 'Porque el comercio de Éfeso está cerrando', false, 2),
('c0050000-0000-0000-0000-000000000006', 'Porque el invierno destruirá las cosechas', false, 3),
('c0050000-0000-0000-0000-000000000006', 'Porque los filósofos descansan los sábados', false, 4),

-- q7
('c0050000-0000-0000-0000-000000000007', 'En el lavamiento del agua por la palabra', true, 1),
('c0050000-0000-0000-0000-000000000007', 'Con baños de aceite perfumado en el templo', false, 2),
('c0050000-0000-0000-0000-000000000007', 'Mediante sacrificios de corderos en Jerusalén', false, 3),
('c0050000-0000-0000-0000-000000000007', 'Por ayunos rigurosos sin ingesta de alimentos', false, 4),

-- q8
('c0050000-0000-0000-0000-000000000008', 'Respecto de Cristo y de la iglesia', true, 1),
('c0050000-0000-0000-0000-000000000008', 'Respecto de la alianza entre reyes y gobernantes', false, 2),
('c0050000-0000-0000-0000-000000000008', 'Respecto de la creación del sol y la luna', false, 3),
('c0050000-0000-0000-0000-000000000008', 'Respecto del pacto entre Abraham y Melquisedec', false, 4),

-- q9: fill_blank
('c0050000-0000-0000-0000-000000000009', 'amor', true, 1),

-- q10: fill_blank
('c0050000-0000-0000-0000-000000000010', 'luz', true, 1),

-- q11: fill_blank
('c0050000-0000-0000-0000-000000000011', 'cristo', true, 1),

-- q12: fill_blank
('c0050000-0000-0000-0000-000000000012', 'llenos', true, 1),

-- q13: fill_blank
('c0050000-0000-0000-0000-000000000013', 'gracias', true, 1),

-- q14: fill_blank
('c0050000-0000-0000-0000-000000000014', 'someteos', true, 1),

-- q15: fill_blank
('c0050000-0000-0000-0000-000000000015', 'entrego', true, 1),

-- q16: fill_blank
('c0050000-0000-0000-0000-000000000016', 'arruga', true, 1),

-- q17: true_false
('c0050000-0000-0000-0000-000000000017', 'Verdadero', true, 1),
('c0050000-0000-0000-0000-000000000017', 'Falso', false, 2),

-- q18: true_false
('c0050000-0000-0000-0000-000000000018', 'Verdadero', true, 1),
('c0050000-0000-0000-0000-000000000018', 'Falso', false, 2),

-- q19: true_false
('c0050000-0000-0000-0000-000000000019', 'Verdadero', false, 1),
('c0050000-0000-0000-0000-000000000019', 'Falso', true, 2),

-- q20: true_false
('c0050000-0000-0000-0000-000000000020', 'Verdadero', true, 1),
('c0050000-0000-0000-0000-000000000020', 'Falso', false, 2),

-- q21: true_false
('c0050000-0000-0000-0000-000000000021', 'Verdadero', true, 1),
('c0050000-0000-0000-0000-000000000021', 'Falso', false, 2),

-- q22: true_false
('c0050000-0000-0000-0000-000000000022', 'Verdadero', false, 1),
('c0050000-0000-0000-0000-000000000022', 'Falso', true, 2),

-- q23: ref
('c0050000-0000-0000-0000-000000000023', 'Efesios 5:18', true, 1),
('c0050000-0000-0000-0000-000000000023', 'Efesios 5:6', false, 2),
('c0050000-0000-0000-0000-000000000023', 'Efesios 5:12', false, 3),
('c0050000-0000-0000-0000-000000000023', 'Efesios 5:28', false, 4),

-- q24: ref
('c0050000-0000-0000-0000-000000000024', 'Efesios 5:32', true, 1),
('c0050000-0000-0000-0000-000000000024', 'Efesios 5:7', false, 2),
('c0050000-0000-0000-0000-000000000024', 'Efesios 5:17', false, 3),
('c0050000-0000-0000-0000-000000000024', 'Efesios 5:22', false, 4),

-- q25: ordering
('c0050000-0000-0000-0000-000000000025', 'Andar en amor e imitar a Dios huyendo de toda inmundicia (Ef. 5:1-5)', true, 1),
('c0050000-0000-0000-0000-000000000025', 'Andar como hijos de luz reprobando las tinieblas (Ef. 5:8-14)', true, 2),
('c0050000-0000-0000-0000-000000000025', 'Vivir sabiamente y ser llenos del Espíritu con alabanza continua (Ef. 5:15-21)', true, 3),
('c0050000-0000-0000-0000-000000000025', 'El orden conyugal: el matrimonio como reflejo de Cristo y la iglesia (Ef. 5:22-33)', true, 4)
ON CONFLICT (id) DO NOTHING;

-- Asociar preguntas a Examen General de Efesios 5
INSERT INTO public.assessment_questions (assessment_id, question_id, order_index)
VALUES
('a0000005-0000-0000-0000-000000000005', 'c0050000-0000-0000-0000-000000000001', 1),
('a0000005-0000-0000-0000-000000000005', 'c0050000-0000-0000-0000-000000000002', 2),
('a0000005-0000-0000-0000-000000000005', 'c0050000-0000-0000-0000-000000000003', 3),
('a0000005-0000-0000-0000-000000000005', 'c0050000-0000-0000-0000-000000000004', 4),
('a0000005-0000-0000-0000-000000000005', 'c0050000-0000-0000-0000-000000000005', 5),
('a0000005-0000-0000-0000-000000000005', 'c0050000-0000-0000-0000-000000000006', 6),
('a0000005-0000-0000-0000-000000000005', 'c0050000-0000-0000-0000-000000000007', 7),
('a0000005-0000-0000-0000-000000000005', 'c0050000-0000-0000-0000-000000000008', 8),
('a0000005-0000-0000-0000-000000000005', 'c0050000-0000-0000-0000-000000000009', 9),
('a0000005-0000-0000-0000-000000000005', 'c0050000-0000-0000-0000-000000000010', 10),
('a0000005-0000-0000-0000-000000000005', 'c0050000-0000-0000-0000-000000000011', 11),
('a0000005-0000-0000-0000-000000000005', 'c0050000-0000-0000-0000-000000000012', 12),
('a0000005-0000-0000-0000-000000000005', 'c0050000-0000-0000-0000-000000000013', 13),
('a0000005-0000-0000-0000-000000000005', 'c0050000-0000-0000-0000-000000000014', 14),
('a0000005-0000-0000-0000-000000000005', 'c0050000-0000-0000-0000-000000000015', 15),
('a0000005-0000-0000-0000-000000000005', 'c0050000-0000-0000-0000-000000000016', 16),
('a0000005-0000-0000-0000-000000000005', 'c0050000-0000-0000-0000-000000000017', 17),
('a0000005-0000-0000-0000-000000000005', 'c0050000-0000-0000-0000-000000000018', 18),
('a0000005-0000-0000-0000-000000000005', 'c0050000-0000-0000-0000-000000000019', 19),
('a0000005-0000-0000-0000-000000000005', 'c0050000-0000-0000-0000-000000000020', 20),
('a0000005-0000-0000-0000-000000000005', 'c0050000-0000-0000-0000-000000000021', 21),
('a0000005-0000-0000-0000-000000000005', 'c0050000-0000-0000-0000-000000000022', 22),
('a0000005-0000-0000-0000-000000000005', 'c0050000-0000-0000-0000-000000000023', 23),
('a0000005-0000-0000-0000-000000000005', 'c0050000-0000-0000-0000-000000000024', 24),
('a0000005-0000-0000-0000-000000000005', 'c0050000-0000-0000-0000-000000000025', 25)
ON CONFLICT DO NOTHING;


-- ##############################################################################
-- SECCIÓN 3: EFESIOS 6 – EXAMEN GENERAL (25 Preguntas)
-- Assessment ID: a0000006-0000-0000-0000-000000000006
-- Chapter ID:    c0000000-0000-0000-0000-000000000006
-- ##############################################################################

INSERT INTO public.questions (id, chapter_id, question_type, prompt, verse_reference, explanation, points, difficulty, order_index, is_active)
VALUES
-- Pregunta 1 (MC)
(
    'c0060000-0000-0000-0000-000000000001',
    'c0000000-0000-0000-0000-000000000006',
    'multiple_choice',
    '¿Qué promesa acompaña al mandamiento de honrar a padre y madre según Efesios 6:2-3?',
    'Efesios 6:2-3',
    'La promesa es: "para que te vaya bien, y seas de larga vida sobre la tierra".',
    10, 'easy', 1, true
),
-- Pregunta 2 (MC)
(
    'c0060000-0000-0000-0000-000000000002',
    'c0000000-0000-0000-0000-000000000006',
    'multiple_choice',
    '¿Cómo deben los padres criar a sus hijos según la exhortación de Efesios 6:4?',
    'Efesios 6:4',
    'Pablo ordena: "no provoquéis a ira a vuestros hijos, sino criadlos en disciplina y amonestación del Señor".',
    10, 'easy', 2, true
),
-- Pregunta 3 (MC)
(
    'c0060000-0000-0000-0000-000000000003',
    'c0000000-0000-0000-0000-000000000006',
    'multiple_choice',
    '¿Cómo deben servir los trabajadores o siervos a sus amos según Efesios 6:5-7?',
    'Efesios 6:5-7',
    'Deben servir "no al ojo, como los que quieren agradar a los hombres, sino como siervos de Cristo, de corazón haciendo la voluntad de Dios".',
    10, 'medium', 3, true
),
-- Pregunta 4 (MC)
(
    'c0060000-0000-0000-0000-000000000004',
    'c0000000-0000-0000-0000-000000000006',
    'multiple_choice',
    '¿Qué principio divino recuerda Pablo a los amos en Efesios 6:9?',
    'Efesios 6:9',
    'Les recuerda "sabiendo que el Señor de ellos y vuestro está en los cielos, y que para con él no hay acepción de personas".',
    10, 'medium', 4, true
),
-- Pregunta 5 (MC)
(
    'c0060000-0000-0000-0000-000000000005',
    'c0000000-0000-0000-0000-000000000006',
    'multiple_choice',
    '¿Contra quiénes NO es nuestra lucha espiritual según Efesios 6:12?',
    'Efesios 6:12',
    'Efesios 6:12 aclara expresamente: "Porque no tenemos lucha contra sangre y carne".',
    10, 'easy', 5, true
),
-- Pregunta 6 (MC)
(
    'c0060000-0000-0000-0000-000000000006',
    'c0000000-0000-0000-0000-000000000006',
    'multiple_choice',
    '¿Cuáles son las cuatro entidades espirituales contra las que sí luchamos según Efesios 6:12?',
    'Efesios 6:12',
    'Luchamos "contra principados, contra potestades, contra los gobernadores de las tinieblas de este siglo, contra huestes espirituales de maldad en las regiones celestes".',
    10, 'medium', 6, true
),
-- Pregunta 7 (MC)
(
    'c0060000-0000-0000-0000-000000000007',
    'c0060000-0000-0000-0000-000000000006',
    'multiple_choice',
    '¿Para qué sirve el escudo de la fe según Efesios 6:16?',
    'Efesios 6:16',
    'Sirve "para que podáis apagar todos los dardos de fuego del maligno".',
    10, 'easy', 7, true
),
-- Pregunta 8 (MC)
(
    'c0060000-0000-0000-0000-000000000008',
    'c0060000-0000-0000-0000-000000000006',
    'multiple_choice',
    '¿A quién envía Pablo a Éfeso para informar sobre su estado y consolar los corazones según Efesios 6:21-22?',
    'Efesios 6:21-22',
    'Pablo envía a "Tíquico, hermano amado y fiel ministro en el Señor".',
    10, 'medium', 8, true
),
-- Pregunta 9 (Fill blank)
(
    'c0060000-0000-0000-0000-000000000009',
    'c0000000-0000-0000-0000-000000000006',
    'fill_blank',
    'Completa Efesios 6:1: "Hijos, ________ en el Señor a vuestros padres, porque esto es justo".',
    'Efesios 6:1',
    'El deber de los hijos hacia sus padres es que "obedeced".',
    10, 'easy', 9, true
),
-- Pregunta 10 (Fill blank)
(
    'c0060000-0000-0000-0000-000000000010',
    'c0000000-0000-0000-0000-000000000006',
    'fill_blank',
    'Completa Efesios 6:10: "Por lo demás, hermanos míos, fortaleceos en el Señor, y en el poder de su ________".',
    'Efesios 6:10',
    'Nuestra fortaleza radica en el poder de su "fuerza".',
    10, 'easy', 10, true
),
-- Pregunta 11 (Fill blank)
(
    'c0060000-0000-0000-0000-000000000011',
    'c0000000-0000-0000-0000-000000000006',
    'fill_blank',
    'Completa Efesios 6:11: "Vestíos de toda la ________ de Dios, para que podáis estar firmes contra las asechanzas del diablo".',
    'Efesios 6:11',
    'La vestidura completa de protección es la "armadura".',
    10, 'easy', 11, true
),
-- Pregunta 12 (Fill blank)
(
    'c0060000-0000-0000-0000-000000000012',
    'c0000000-0000-0000-0000-000000000006',
    'fill_blank',
    'Completa Efesios 6:14: "Estad, pues, firmes, ceñidos vuestros lomos con la ________".',
    'Efesios 6:14',
    'El cinto con el que ceñimos los lomos es la "verdad".',
    10, 'easy', 12, true
),
-- Pregunta 13 (Fill blank)
(
    'c0060000-0000-0000-0000-000000000013',
    'c0000000-0000-0000-0000-000000000006',
    'fill_blank',
    'Completa Efesios 6:14: "Y vestidos con la coraza de ________".',
    'Efesios 6:14',
    'La coraza protectora del pecho es la "justicia".',
    10, 'easy', 13, true
),
-- Pregunta 14 (Fill blank)
(
    'c0060000-0000-0000-0000-000000000014',
    'c0000000-0000-0000-0000-000000000006',
    'fill_blank',
    'Completa Efesios 6:17: "Y tomad el yelmo de la ________, y la espada del Espíritu, que es la palabra de Dios".',
    'Efesios 6:17',
    'El yelmo para proteger los pensamientos es la "salvacion".',
    10, 'easy', 14, true
),
-- Pregunta 15 (Fill blank)
(
    'c0060000-0000-0000-0000-000000000015',
    'c0000000-0000-0000-0000-000000000006',
    'fill_blank',
    'Completa Efesios 6:18: "________ en todo tiempo con toda oración y súplica en el Espíritu".',
    'Efesios 6:18',
    'El aliento vital de la armadura es "orando".',
    10, 'easy', 15, true
),
-- Pregunta 16 (Fill blank)
(
    'c0060000-0000-0000-0000-000000000016',
    'c0000000-0000-0000-0000-000000000006',
    'fill_blank',
    'Completa Efesios 6:20: "Por el cual soy ________ en cadenas, que con denuedo hable de él, como debo hablar".',
    'Efesios 6:20',
    'Pablo define su ministerio preso diciendo: soy "embajador" en cadenas.',
    10, 'medium', 16, true
),
-- Pregunta 17 (True/False)
(
    'c0060000-0000-0000-0000-000000000017',
    'c0000000-0000-0000-0000-000000000006',
    'true_false',
    'Efesios 6:2 califica el honrar a los padres como el primer mandamiento con promesa.',
    'Efesios 6:2',
    'Verdadero. Efesios 6:2 afirma explícitamente: "que es el primer mandamiento con promesa".',
    10, 'easy', 17, true
),
-- Pregunta 18 (True/False)
(
    'c0060000-0000-0000-0000-000000000018',
    'c0000000-0000-0000-0000-000000000006',
    'true_false',
    'Según Efesios 6:8, el bien que cada uno hiciere, sea siervo o libre, recibirá recompensa del Señor.',
    'Efesios 6:8',
    'Verdadero. Dios retribuye con perfecta imparcialidad el bien realizado.',
    10, 'easy', 18, true
),
-- Pregunta 19 (True/False)
(
    'c0060000-0000-0000-0000-000000000019',
    'c0000000-0000-0000-0000-000000000006',
    'true_false',
    'En el conflicto espiritual de Efesios 6, los enemigos reales son las personas de carne y hueso con opiniones opuestas.',
    'Efesios 6:12',
    'Falso. Efesios 6:12 aclara: "no tenemos lucha contra sangre y carne", sino contra poderes espirituales del mal.',
    10, 'easy', 19, true
),
-- Pregunta 20 (True/False)
(
    'c0060000-0000-0000-0000-000000000020',
    'c0000000-0000-0000-0000-000000000006',
    'true_false',
    'La espada del Espíritu es identificada explícitamente en Efesios 6:17 como la palabra de Dios.',
    'Efesios 6:17',
    'Verdadero. El texto declara: "la espada del Espíritu, que es la palabra de Dios".',
    10, 'easy', 20, true
),
-- Pregunta 21 (True/False)
(
    'c0060000-0000-0000-0000-000000000021',
    'c0000000-0000-0000-0000-000000000006',
    'true_false',
    'Pablo pide oración en Efesios 6:19-20 para que Dios castigue a los guardias romanos que lo encadenaron.',
    'Efesios 6:19-20',
    'Falso. Pide oración para que "al abrir mi boca me sea dada palabra para dar a conocer con denuedo el misterio del evangelio".',
    10, 'medium', 21, true
),
-- Pregunta 22 (True/False)
(
    'c0060000-0000-0000-0000-000000000022',
    'c0000000-0000-0000-0000-000000000006',
    'true_false',
    'La bendición final de Efesios 6:24 promete la gracia de Dios a todos los que aman a nuestro Señor Jesucristo con amor inalterable.',
    'Efesios 6:24',
    'Verdadero. Efesios 6:24 concluye: "La gracia sea con todos los que aman a nuestro Señor Jesucristo con amor inalterable. Amén".',
    10, 'easy', 22, true
),
-- Pregunta 23 (Ref Ident)
(
    'c0060000-0000-0000-0000-000000000023',
    'c0000000-0000-0000-0000-000000000006',
    'reference_identification',
    '¿En qué versículo se encuentra la advertencia: "Porque no tenemos lucha contra sangre y carne, sino contra principados, contra potestades"?',
    'Efesios 6:12',
    'El versículo cumbre sobre la naturaleza de la guerra espiritual es Efesios 6:12.',
    10, 'easy', 23, true
),
-- Pregunta 24 (Ref Ident)
(
    'c0060000-0000-0000-0000-000000000024',
    'c0000000-0000-0000-0000-000000000006',
    'reference_identification',
    '¿En qué versículo de Efesios 6 se ordena calzar los pies con el apresto del evangelio de la paz?',
    'Efesios 6:15',
    'El calzado del soldado cristiano se describe en Efesios 6:15.',
    10, 'medium', 24, true
),
-- Pregunta 25 (Ordering)
(
    'c0060000-0000-0000-0000-000000000025',
    'c0000000-0000-0000-0000-000000000006',
    'ordering',
    'Ordena las piezas de la armadura de Dios tal como son presentadas en Efesios 6:14-17:',
    'Efesios 6:14-17',
    '1. Cinto de la verdad y coraza de justicia (v. 14). 2. Calzado con el apresto del evangelio de la paz (v. 15). 3. Escudo de la fe para apagar los dardos del maligno (v. 16). 4. Yelmo de la salvación y espada del Espíritu (v. 17).',
    10, 'hard', 25, true
);

-- OPCIONES EFESIOS 6
INSERT INTO public.question_options (question_id, option_text, is_correct, order_index)
VALUES
-- q1
('c0060000-0000-0000-0000-000000000001', 'Para que te vaya bien y seas de larga vida sobre la tierra', true, 1),
('c0060000-0000-0000-0000-000000000001', 'Para que heredes tierras de oro y plata', false, 2),
('c0060000-0000-0000-0000-000000000001', 'Para que nunca tengas que enfrentar adversidades', false, 3),
('c0060000-0000-0000-0000-000000000001', 'Para que seas nombrado gobernante de tu ciudad', false, 4),

-- q2
('c0060000-0000-0000-0000-000000000002', 'En disciplina y amonestación del Señor, sin provocarlos a ira', true, 1),
('c0060000-0000-0000-0000-000000000002', 'Con castigos severos e insultos constantes', false, 2),
('c0060000-0000-0000-0000-000000000002', 'Dejándolos en total permisividad sin ninguna corrección', false, 3),
('c0060000-0000-0000-0000-000000000002', 'Entregándolos a tutores paganos para que aprendan retórica', false, 4),

-- q3
('c0060000-0000-0000-0000-000000000003', 'Como siervos de Cristo, de corazón haciendo la voluntad de Dios', true, 1),
('c0060000-0000-0000-0000-000000000003', 'Únicamente cuando el amo esté vigilando directamente', false, 2),
('c0060000-0000-0000-0000-000000000003', 'Con quejas continuas y desobediencia solapada', false, 4),
('c0060000-0000-0000-0000-000000000003', 'Buscando exclusivamente el aplauso y favores humanos', false, 4),

-- q4
('c0060000-0000-0000-0000-000000000004', 'Que el Señor de todos está en los cielos y no hace acepción de personas', true, 1),
('c0060000-0000-0000-0000-000000000004', 'Que los amos tienen derecho legal divino a amenazar sin freno', false, 2),
('c0060000-0000-0000-0000-000000000004', 'Que la posición social otorga un cielo superior', false, 3),
('c0060000-0000-0000-0000-000000000004', 'Que Dios sólo escucha las oraciones de los hombres libres', false, 4),

-- q5
('c0060000-0000-0000-0000-000000000005', 'Contra sangre y carne', true, 1),
('c0060000-0000-0000-0000-000000000005', 'Contra potestades espirituales', false, 2),
('c0060000-0000-0000-0000-000000000005', 'Contra gobernadores de las tinieblas', false, 3),
('c0060000-0000-0000-0000-000000000005', 'Contra huestes espirituales de maldad', false, 4),

-- q6
('c0060000-0000-0000-0000-000000000006', 'Principados, potestades, gobernadores de tinieblas y huestes espirituales de maldad', true, 1),
('c0060000-0000-0000-0000-000000000006', 'Reyes, soldados, tribunos y jueces humanos', false, 2),
('c0060000-0000-0000-0000-000000000006', 'Animales feroces, tormentas, plagas y sequías', false, 3),
('c0060000-0000-0000-0000-000000000006', 'Filosofías humanas, escuelas de retórica y teatros', false, 4),

-- q7
('c0060000-0000-0000-0000-000000000007', 'Para apagar todos los dardos de fuego del maligno', true, 1),
('c0060000-0000-0000-0000-000000000007', 'Para atacar y herir a otros creyentes en discusiones', false, 2),
('c0060000-0000-0000-0000-000000000007', 'Para protegerse de tributos e impuestos imperiales', false, 3),
('c0060000-0000-0000-0000-000000000007', 'Para asegurar ganancias económicas en el mercado', false, 4),

-- q8
('c0060000-0000-0000-0000-000000000008', 'Tíquico, hermano amado y fiel ministro', true, 1),
('c0060000-0000-0000-0000-000000000008', 'Timoteo, obispo de Filipos', false, 2),
('c0060000-0000-0000-0000-000000000008', 'Silas, compañero de cárcel', false, 3),
('c0060000-0000-0000-0000-000000000008', 'Bernabé, apóstol de Chipre', false, 4),

-- q9: fill_blank
('c0060000-0000-0000-0000-000000000009', 'obedeced', true, 1),

-- q10: fill_blank
('c0060000-0000-0000-0000-000000000010', 'fuerza', true, 1),

-- q11: fill_blank
('c0060000-0000-0000-0000-000000000011', 'armadura', true, 1),

-- q12: fill_blank
('c0060000-0000-0000-0000-000000000012', 'verdad', true, 1),

-- q13: fill_blank
('c0060000-0000-0000-0000-000000000013', 'justicia', true, 1),

-- q14: fill_blank
('c0060000-0000-0000-0000-000000000014', 'salvacion', true, 1),

-- q15: fill_blank
('c0060000-0000-0000-0000-000000000015', 'orando', true, 1),

-- q16: fill_blank
('c0060000-0000-0000-0000-000000000016', 'embajador', true, 1),

-- q17: true_false
('c0060000-0000-0000-0000-000000000017', 'Verdadero', true, 1),
('c0060000-0000-0000-0000-000000000017', 'Falso', false, 2),

-- q18: true_false
('c0060000-0000-0000-0000-000000000018', 'Verdadero', true, 1),
('c0060000-0000-0000-0000-000000000018', 'Falso', false, 2),

-- q19: true_false
('c0060000-0000-0000-0000-000000000019', 'Verdadero', false, 1),
('c0060000-0000-0000-0000-000000000019', 'Falso', true, 2),

-- q20: true_false
('c0060000-0000-0000-0000-000000000020', 'Verdadero', true, 1),
('c0060000-0000-0000-0000-000000000020', 'Falso', false, 2),

-- q21: true_false
('c0060000-0000-0000-0000-000000000021', 'Verdadero', false, 1),
('c0060000-0000-0000-0000-000000000021', 'Falso', true, 2),

-- q22: true_false
('c0060000-0000-0000-0000-000000000022', 'Verdadero', true, 1),
('c0060000-0000-0000-0000-000000000022', 'Falso', false, 2),

-- q23: ref
('c0060000-0000-0000-0000-000000000023', 'Efesios 6:12', true, 1),
('c0060000-0000-0000-0000-000000000023', 'Efesios 6:3', false, 2),
('c0060000-0000-0000-0000-000000000023', 'Efesios 6:7', false, 3),
('c0060000-0000-0000-0000-000000000023', 'Efesios 6:21', false, 4),

-- q24: ref
('c0060000-0000-0000-0000-000000000024', 'Efesios 6:15', true, 1),
('c0060000-0000-0000-0000-000000000024', 'Efesios 6:4', false, 2),
('c0060000-0000-0000-0000-000000000024', 'Efesios 6:9', false, 3),
('c0060000-0000-0000-0000-000000000024', 'Efesios 6:18', false, 4),

-- q25: ordering
('c0060000-0000-0000-0000-000000000025', 'Cinto de la verdad y coraza de justicia (Ef. 6:14)', true, 1),
('c0060000-0000-0000-0000-000000000025', 'Calzado con el apresto del evangelio de la paz (Ef. 6:15)', true, 2),
('c0060000-0000-0000-0000-000000000025', 'Escudo de la fe para apagar los dardos del maligno (Ef. 6:16)', true, 3),
('c0060000-0000-0000-0000-000000000025', 'Yelmo de la salvación y espada del Espíritu (Ef. 6:17)', true, 4)
ON CONFLICT (id) DO NOTHING;

-- Asociar preguntas a Examen General de Efesios 6
INSERT INTO public.assessment_questions (assessment_id, question_id, order_index)
VALUES
('a0000006-0000-0000-0000-000000000006', 'c0060000-0000-0000-0000-000000000001', 1),
('a0000006-0000-0000-0000-000000000006', 'c0060000-0000-0000-0000-000000000002', 2),
('a0000006-0000-0000-0000-000000000006', 'c0060000-0000-0000-0000-000000000003', 3),
('a0000006-0000-0000-0000-000000000006', 'c0060000-0000-0000-0000-000000000004', 4),
('a0000006-0000-0000-0000-000000000006', 'c0060000-0000-0000-0000-000000000005', 5),
('a0000006-0000-0000-0000-000000000006', 'c0060000-0000-0000-0000-000000000006', 6),
('a0000006-0000-0000-0000-000000000006', 'c0060000-0000-0000-0000-000000000007', 7),
('a0000006-0000-0000-0000-000000000006', 'c0060000-0000-0000-0000-000000000008', 8),
('a0000006-0000-0000-0000-000000000006', 'c0060000-0000-0000-0000-000000000009', 9),
('a0000006-0000-0000-0000-000000000006', 'c0060000-0000-0000-0000-000000000010', 10),
('a0000006-0000-0000-0000-000000000006', 'c0060000-0000-0000-0000-000000000011', 11),
('a0000006-0000-0000-0000-000000000006', 'c0060000-0000-0000-0000-000000000012', 12),
('a0000006-0000-0000-0000-000000000006', 'c0060000-0000-0000-0000-000000000013', 13),
('a0000006-0000-0000-0000-000000000006', 'c0060000-0000-0000-0000-000000000014', 14),
('a0000006-0000-0000-0000-000000000006', 'c0060000-0000-0000-0000-000000000015', 15),
('a0000006-0000-0000-0000-000000000006', 'c0060000-0000-0000-0000-000000000016', 16),
('a0000006-0000-0000-0000-000000000006', 'c0060000-0000-0000-0000-000000000017', 17),
('a0000006-0000-0000-0000-000000000006', 'c0060000-0000-0000-0000-000000000018', 18),
('a0000006-0000-0000-0000-000000000006', 'c0060000-0000-0000-0000-000000000019', 19),
('a0000006-0000-0000-0000-000000000006', 'c0060000-0000-0000-0000-000000000020', 20),
('a0000006-0000-0000-0000-000000000006', 'c0060000-0000-0000-0000-000000000021', 21),
('a0000006-0000-0000-0000-000000000006', 'c0060000-0000-0000-0000-000000000022', 22),
('a0000006-0000-0000-0000-000000000006', 'c0060000-0000-0000-0000-000000000023', 23),
('a0000006-0000-0000-0000-000000000006', 'c0060000-0000-0000-0000-000000000024', 24),
('a0000006-0000-0000-0000-000000000006', 'c0060000-0000-0000-0000-000000000025', 25)
ON CONFLICT DO NOTHING;

-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
-- ARCHIVO: 009_efesios_examen_final_libro.sql
-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

-- ==============================================================================
-- BIBLIONARIO - SEED 009: EXAMEN FINAL DEL LIBRO DE EFESIOS (NIVEL 4)
-- 50 Preguntas Integradoras de los 6 Capítulos (RVR1960)
-- Assessment ID: f0000000-0000-0000-0000-000000000001
-- Book ID:       a0000000-0000-0000-0000-000000000001
-- ==============================================================================

INSERT INTO public.questions (id, chapter_id, question_type, prompt, verse_reference, explanation, points, difficulty, order_index, is_active)
VALUES
-- ==============================================================================
-- CAPÍTULO 1 (Preguntas 1 a 8)
-- ==============================================================================
(
    'f0000000-0000-0000-0000-000000000001',
    'c0000000-0000-0000-0000-000000000001',
    'multiple_choice',
    'Según Efesios 1:3, ¿con qué clase de bendiciones bendijo Dios a los creyentes?',
    'Efesios 1:3',
    'Efesios 1:3 declara que Dios "nos bendijo con toda bendición espiritual en los lugares celestiales en Cristo".',
    10, 'easy', 1, true
),
(
    'f0000000-0000-0000-0000-000000000002',
    'c0000000-0000-0000-0000-000000000001',
    'multiple_choice',
    '¿Cuál es la causa o norma soberana de nuestra predestinación para adopción filial según Efesios 1:5?',
    'Efesios 1:5',
    'El texto bíblico afirma: "según el puro afecto de su voluntad".',
    10, 'medium', 2, true
),
(
    'f0000000-0000-0000-0000-000000000003',
    'c0000000-0000-0000-0000-000000000001',
    'fill_blank',
    'Completa Efesios 1:7: "En quien tenemos redención por su ________, el perdón de pecados según las riquezas de su gracia".',
    'Efesios 1:7',
    'El rescate se obtuvo mediante su "sangre".',
    10, 'easy', 3, true
),
(
    'f0000000-0000-0000-0000-000000000004',
    'c0000000-0000-0000-0000-000000000001',
    'fill_blank',
    'Completa Efesios 1:13: "Habiendo creído en él, fuisteis ________ con el Espíritu Santo de la promesa".',
    'Efesios 1:13',
    'El término bíblico es "sellados".',
    10, 'easy', 4, true
),
(
    'f0000000-0000-0000-0000-000000000005',
    'c0000000-0000-0000-0000-000000000001',
    'true_false',
    'En Efesios 1:4, Dios nos escogió en Cristo antes de la fundación del mundo para ser santos y sin mancha.',
    'Efesios 1:4',
    'Verdadero. La elección eterna tiene como propósito la santidad irreprensible del creyente.',
    10, 'easy', 5, true
),
(
    'f0000000-0000-0000-0000-000000000006',
    'c0000000-0000-0000-0000-000000000001',
    'true_false',
    'Según Efesios 1:21, la exaltación de Cristo está limitada únicamente a este siglo y no al venidero.',
    'Efesios 1:21',
    'Falso. Efesios 1:21 afirma que está sobre todo nombre "no sólo en este siglo, sino también en el venidero".',
    10, 'easy', 6, true
),
(
    'f0000000-0000-0000-0000-000000000007',
    'c0000000-0000-0000-0000-000000000001',
    'reference_identification',
    '¿En qué versículo declara Pablo que Dios "lo dio por cabeza sobre todas las cosas a la iglesia, la cual es su cuerpo"?',
    'Efesios 1:22-23',
    'Esta proclamación eclesiológica culmina en Efesios 1:22-23.',
    10, 'medium', 7, true
),
(
    'f0000000-0000-0000-0000-000000000008',
    'c0000000-0000-0000-0000-000000000001',
    'multiple_choice',
    '¿Qué pide Pablo a Dios que dé a los creyentes en su oración de Efesios 1:17?',
    'Efesios 1:17',
    'Ruega que les dé "espíritu de sabiduría y de revelación en el conocimiento de él".',
    10, 'medium', 8, true
),

-- ==============================================================================
-- CAPÍTULO 2 (Preguntas 9 a 17)
-- ==============================================================================
(
    'f0000000-0000-0000-0000-000000000009',
    'c0000000-0000-0000-0000-000000000002',
    'multiple_choice',
    '¿Cómo éramos por naturaleza antes de la salvación según Efesios 2:3?',
    'Efesios 2:3',
    'Efesios 2:3 declara que "éramos por naturaleza hijos de ira, lo mismo que los demás".',
    10, 'easy', 9, true
),
(
    'f0000000-0000-0000-0000-000000000010',
    'c0000000-0000-0000-0000-000000000002',
    'multiple_choice',
    '¿Cuál es la relación bíblica entre la fe, la gracia y las obras en Efesios 2:8-10?',
    'Efesios 2:8-10',
    'Somos salvos por gracia mediante la fe, no por obras, pero creados en Cristo Jesús para buenas obras.',
    10, 'medium', 10, true
),
(
    'f0000000-0000-0000-0000-000000000011',
    'c0000000-0000-0000-0000-000000000002',
    'fill_blank',
    'Completa Efesios 2:8: "Porque por ________ sois salvos por medio de la fe; y esto no de vosotros, pues es don de Dios".',
    'Efesios 2:8',
    'La salvación es por "gracia".',
    10, 'easy', 11, true
),
(
    'f0000000-0000-0000-0000-000000000012',
    'c0000000-0000-0000-0000-000000000002',
    'fill_blank',
    'Completa Efesios 2:14: "Porque él es nuestra ________, que de ambos pueblos hizo uno, derribando la pared intermedia de separación".',
    'Efesios 2:14',
    'Cristo en persona es nuestra "paz".',
    10, 'easy', 12, true
),
(
    'f0000000-0000-0000-0000-000000000013',
    'c0000000-0000-0000-0000-000000000002',
    'fill_blank',
    'Completa Efesios 2:20: "Edificados sobre el fundamento de los apóstoles y profetas, siendo la principal piedra del ________ Jesucristo mismo".',
    'Efesios 2:20',
    'Jesucristo es la principal piedra del "angulo".',
    10, 'easy', 13, true
),
(
    'f0000000-0000-0000-0000-000000000014',
    'c0000000-0000-0000-0000-000000000002',
    'true_false',
    'Efesios 2:12 declara que en el pasado los gentiles estaban sin Cristo, alejados de los pactos y sin Dios en el mundo.',
    'Efesios 2:12',
    'Verdadero. Describe la total alienación y desesperanza de los gentiles antes del evangelio.',
    10, 'easy', 14, true
),
(
    'f0000000-0000-0000-0000-000000000015',
    'c0000000-0000-0000-0000-000000000002',
    'true_false',
    'En Efesios 2:19, los creyentes gentiles siguen siendo considerados advenedizos y de segunda categoría en el pueblo de Dios.',
    'Efesios 2:19',
    'Falso. Efesios 2:19 enseña taxativamente que ya no son extranjeros ni advenedizos sino conciudadanos de los santos.',
    10, 'easy', 15, true
),
(
    'f0000000-0000-0000-0000-000000000016',
    'c0000000-0000-0000-0000-000000000002',
    'reference_identification',
    '¿En qué pasaje se afirma: "No por obras, para que nadie se gloríe. Porque somos hechura suya, creados en Cristo Jesús para buenas obras"?',
    'Efesios 2:9-10',
    'Esta formulación insigne de la gracia y las buenas obras se halla en Efesios 2:9-10.',
    10, 'easy', 16, true
),
(
    'f0000000-0000-0000-0000-000000000017',
    'c0000000-0000-0000-0000-000000000002',
    'multiple_choice',
    '¿Mediante qué acontecimiento reconcilió Cristo con Dios a ambos pueblos en un solo cuerpo según Efesios 2:16?',
    'Efesios 2:16',
    'Efesios 2:16 especifica que fue "mediante la cruz, matando en ella las enemistades".',
    10, 'medium', 17, true
),

-- ==============================================================================
-- CAPÍTULO 3 (Preguntas 18 a 25)
-- ==============================================================================
(
    'f0000000-0000-0000-0000-000000000018',
    'c0000000-0000-0000-0000-000000000003',
    'multiple_choice',
    '¿Cuál es el misterio de Cristo revelado por el Espíritu a sus santos apóstoles y profetas en Efesios 3:6?',
    'Efesios 3:6',
    'Que los gentiles son "coherederos y miembros del mismo cuerpo, y copartícipes de la promesa en Cristo Jesús".',
    10, 'easy', 18, true
),
(
    'f0000000-0000-0000-0000-000000000019',
    'c0000000-0000-0000-0000-000000000003',
    'multiple_choice',
    '¿A quiénes se da a conocer la multiforme sabiduría de Dios por medio de la iglesia según Efesios 3:10?',
    'Efesios 3:10',
    'A "los principados y potestades en los lugares celestiales".',
    10, 'medium', 19, true
),
(
    'f0000000-0000-0000-0000-000000000020',
    'c0000000-0000-0000-0000-000000000003',
    'fill_blank',
    'Completa Efesios 3:16: "Que os dé... el ser fortalecidos con poder en el hombre ________ por su Espíritu".',
    'Efesios 3:16',
    'La fortaleza divina opera en el hombre "interior".',
    10, 'medium', 20, true
),
(
    'f0000000-0000-0000-0000-000000000021',
    'c0000000-0000-0000-0000-000000000003',
    'fill_blank',
    'Completa Efesios 3:19: "Y de conocer el amor de Cristo, que excede a todo ________, para que seáis llenos de toda la plenitud de Dios".',
    'Efesios 3:19',
    'El amor de Cristo excede a todo "conocimiento".',
    10, 'easy', 21, true
),
(
    'f0000000-0000-0000-0000-000000000022',
    'c0000000-0000-0000-0000-000000000003',
    'true_false',
    'En Efesios 3:8, Pablo se jacta de ser el más grande y meritorio entre todos los apóstoles.',
    'Efesios 3:8',
    'Falso. Pablo se describe humildemente como "menos que el más pequeño de todos los santos".',
    10, 'easy', 22, true
),
(
    'f0000000-0000-0000-0000-000000000023',
    'c0000000-0000-0000-0000-000000000003',
    'true_false',
    'Según Efesios 3:12, en Cristo tenemos seguridad y acceso a Dios con confianza por medio de la fe en él.',
    'Efesios 3:12',
    'Verdadero. La fe en Cristo nos concede un acceso íntimo y seguro ante la presencia del Padre.',
    10, 'easy', 23, true
),
(
    'f0000000-0000-0000-0000-000000000024',
    'c0000000-0000-0000-0000-000000000003',
    'reference_identification',
    '¿En qué versículo declara la célebre alabanza: "A Aquel que es poderoso para hacer todas las cosas mucho más abundantemente de lo que pedimos o entendemos"?',
    'Efesios 3:20',
    'Esta gloriosa doxología se ubica en Efesios 3:20.',
    10, 'easy', 24, true
),
(
    'f0000000-0000-0000-0000-000000000025',
    'c0000000-0000-0000-0000-000000000003',
    'multiple_choice',
    '¿Dónde debe ser dada la gloria a Dios por todas las edades y por los siglos de los siglos según Efesios 3:21?',
    'Efesios 3:21',
    'Pablo exclama: "a él sea gloria en la iglesia en Cristo Jesús por todas las edades".',
    10, 'medium', 25, true
),

-- ==============================================================================
-- CAPÍTULO 4 (Preguntas 26 a 33)
-- ==============================================================================
(
    'f0000000-0000-0000-0000-000000000026',
    'c0000000-0000-0000-0000-000000000004',
    'multiple_choice',
    '¿Cómo inicia Pablo la sección práctica de la carta en Efesios 4:1?',
    'Efesios 4:1',
    'Dice: "Yo pues, preso en el Señor, os ruego que andéis como es digno de la vocación con que fuisteis llamados".',
    10, 'easy', 26, true
),
(
    'f0000000-0000-0000-0000-000000000027',
    'c0000000-0000-0000-0000-000000000004',
    'multiple_choice',
    '¿Cuál es la lista completa de ministerios instituidos por Cristo en Efesios 4:11?',
    'Efesios 4:11',
    'Constituyó a "apóstoles, profetas, evangelistas, pastores y maestros".',
    10, 'easy', 27, true
),
(
    'f0000000-0000-0000-0000-000000000028',
    'c0000000-0000-0000-0000-000000000004',
    'fill_blank',
    'Completa Efesios 4:5: "Un Señor, una ________, un bautismo".',
    'Efesios 4:5',
    'La confesión común del pueblo redimido es una sola "fe".',
    10, 'easy', 28, true
),
(
    'f0000000-0000-0000-0000-000000000029',
    'c0000000-0000-0000-0000-000000000004',
    'fill_blank',
    'Completa Efesios 4:26: "Airaos, pero no pequéis; no se ponga el ________ sobre vuestro enojo".',
    'Efesios 4:26',
    'El límite temporal preventivo del enojo es antes de que se ponga el "sol".',
    10, 'easy', 29, true
),
(
    'f0000000-0000-0000-0000-000000000030',
    'c0000000-0000-0000-0000-000000000004',
    'fill_blank',
    'Completa Efesios 4:32: "Sed benignos unos con otros, misericordiosos, perdonándoos unos a otros, como Dios también os perdonó a vosotros en ________".',
    'Efesios 4:32',
    'El fundamento del perdón interpersonal es el perdón recibido en "Cristo".',
    10, 'easy', 30, true
),
(
    'f0000000-0000-0000-0000-000000000031',
    'c0000000-0000-0000-0000-000000000004',
    'true_false',
    'En Efesios 4:14, Pablo exhorta a los creyentes a mantenerse perpetuamente como niños fluctuantes sin convicciones fijas.',
    'Efesios 4:14',
    'Falso. Pablo ordena madurar para "que ya no seamos niños fluctuantes, llevados por doquiera de todo viento de doctrina".',
    10, 'easy', 31, true
),
(
    'f0000000-0000-0000-0000-000000000032',
    'c0000000-0000-0000-0000-000000000004',
    'true_false',
    'Efesios 4:29 prohíbe las palabras corrompidas y manda hablar sólo lo que sea bueno para la edificación.',
    'Efesios 4:29',
    'Verdadero. La boca del creyente debe comunicar palabras que transmitan gracia a los oyentes.',
    10, 'easy', 32, true
),
(
    'f0000000-0000-0000-0000-000000000033',
    'c0000000-0000-0000-0000-000000000004',
    'reference_identification',
    '¿En qué versículo se advierte: "Y no contristéis al Espíritu Santo de Dios, con el cual fuisteis sellados para el día de la redención"?',
    'Efesios 4:30',
    'Esta advertencia pastoral solemne se halla en Efesios 4:30.',
    10, 'easy', 33, true
),

-- ==============================================================================
-- CAPÍTULO 5 (Preguntas 34 a 42)
-- ==============================================================================
(
    'f0000000-0000-0000-0000-000000000034',
    'c0000000-0000-0000-0000-000000000005',
    'multiple_choice',
    '¿Cómo nos amó Cristo y de qué forma se ofreció por nosotros según Efesios 5:2?',
    'Efesios 5:2',
    'Se entregó a sí mismo por nosotros como "ofrenda y sacrificio a Dios en olor fragante".',
    10, 'easy', 34, true
),
(
    'f0000000-0000-0000-0000-000000000035',
    'c0000000-0000-0000-0000-000000000005',
    'multiple_choice',
    '¿Cuáles son las tres virtudes en las que se manifiesta el fruto del Espíritu según Efesios 5:9?',
    'Efesios 5:9',
    'Efesios 5:9 señala que el fruto es "en toda bondad, justicia y verdad".',
    10, 'medium', 35, true
),
(
    'f0000000-0000-0000-0000-000000000036',
    'c0000000-0000-0000-0000-000000000005',
    'multiple_choice',
    '¿Con qué propósito santificó y purificó Cristo a la iglesia según Efesios 5:26-27?',
    'Efesios 5:26-27',
    'Para "presentársela a sí mismo, una iglesia gloriosa, que no tuviese mancha ni arruga ni cosa semejante".',
    10, 'medium', 36, true
),
(
    'f0000000-0000-0000-0000-000000000037',
    'c0000000-0000-0000-0000-000000000005',
    'fill_blank',
    'Completa Efesios 5:18: "No os embriaguéis con vino, en lo cual hay disolución; antes bien sed ________ del Espíritu".',
    'Efesios 5:18',
    'El mandato apostólico es ser "llenos" del Espíritu Santo.',
    10, 'easy', 37, true
),
(
    'f0000000-0000-0000-0000-000000000038',
    'c0000000-0000-0000-0000-000000000005',
    'fill_blank',
    'Completa Efesios 5:25: "Maridos, ________ a vuestras mujeres, así como Cristo amó a la iglesia, y se entregó a sí mismo por ella".',
    'Efesios 5:25',
    'El mandamiento imperativo a los maridos es "amad".',
    10, 'easy', 38, true
),
(
    'f0000000-0000-0000-0000-000000000039',
    'c0000000-0000-0000-0000-000000000005',
    'true_false',
    'Efesios 5:5 enseña que el avaro es idólatra y no tiene herencia en el reino de Cristo y de Dios.',
    'Efesios 5:5',
    'Verdadero. La avaricia sustituye a Dios por las riquezas temporales.',
    10, 'easy', 39, true
),
(
    'f0000000-0000-0000-0000-000000000040',
    'c0000000-0000-0000-0000-000000000005',
    'true_false',
    'En Efesios 5:11, se exhorta a los creyentes a participar activamente en las obras infructuosas de las tinieblas.',
    'Efesios 5:11',
    'Falso. El versículo ordena tajantemente: "no participéis en las obras infructuosas de las tinieblas, sino más bien reprendedlas".',
    10, 'easy', 40, true
),
(
    'f0000000-0000-0000-0000-000000000041',
    'c0000000-0000-0000-0000-000000000005',
    'reference_identification',
    '¿En qué versículo se exhorta: "Mirad, pues, con diligencia cómo andéis, no como necios sino como sabios, aprovechando bien el tiempo, porque los días son malos"?',
    'Efesios 5:15-16',
    'Esta regla de sabiduría para el uso del tiempo se encuentra en Efesios 5:15-16.',
    10, 'easy', 41, true
),
(
    'f0000000-0000-0000-0000-000000000042',
    'c0000000-0000-0000-0000-000000000005',
    'multiple_choice',
    '¿Qué significa en esencia el matrimonio humano a la luz de Efesios 5:31-32?',
    'Efesios 5:31-32',
    'Es una figura terrenal y misterio sagrado que apunta directamente a la unión inseparable entre Cristo y la iglesia.',
    10, 'medium', 42, true
),

-- ==============================================================================
-- CAPÍTULO 6 (Preguntas 43 a 50)
-- ==============================================================================
(
    'f0000000-0000-0000-0000-000000000043',
    'c0000000-0000-0000-0000-000000000006',
    'multiple_choice',
    '¿Qué mandamiento es calificado en Efesios 6:2 como el primer mandamiento con promesa?',
    'Efesios 6:2',
    'Efesios 6:2 cita: "Honra a tu padre y a tu madre, que es el primer mandamiento con promesa".',
    10, 'easy', 43, true
),
(
    'f0000000-0000-0000-0000-000000000044',
    'c0000000-0000-0000-0000-000000000006',
    'multiple_choice',
    '¿Con qué armadura debemos vestirnos y en el poder de quién debemos fortalecernos según Efesios 6:10-11?',
    'Efesios 6:10-11',
    'Debemos fortalecernos "en el Señor, y en el poder de su fuerza" vistiendo "toda la armadura de Dios".',
    10, 'easy', 44, true
),
(
    'f0000000-0000-0000-0000-000000000045',
    'c0000000-0000-0000-0000-000000000006',
    'fill_blank',
    'Completa Efesios 6:16: "Sobre todo, tomad el escudo de la ________, con que podáis apagar todos los dardos de fuego del maligno".',
    'Efesios 6:16',
    'El escudo que extingue los ataques del enemigo es la "fe".',
    10, 'easy', 45, true
),
(
    'f0000000-0000-0000-0000-000000000046',
    'c0000000-0000-0000-0000-000000000006',
    'fill_blank',
    'Completa Efesios 6:17: "Y tomad el yelmo de la salvación, y la espada del Espíritu, que es la ________ de Dios".',
    'Efesios 6:17',
    'La espada ofensiva del creyente es la "palabra" de Dios.',
    10, 'easy', 46, true
),
(
    'f0000000-0000-0000-0000-000000000047',
    'c0000000-0000-0000-0000-000000000006',
    'true_false',
    'En Efesios 6:12, Pablo enseña que la guerra del cristiano es contra las personas físicas que nos difaman o persiguen.',
    'Efesios 6:12',
    'Falso. Efesios 6:12 aclara expresamente: "no tenemos lucha contra sangre y carne", sino contra principados y potestades espirituales.',
    10, 'easy', 47, true
),
(
    'f0000000-0000-0000-0000-000000000006',
    'c0000000-0000-0000-0000-000000000006',
    'true_false',
    'Pablo pide oración en Efesios 6:19 para que al abrir su boca le sea dada palabra para dar a conocer con denuedo el misterio del evangelio.',
    'Efesios 6:19',
    'Verdadero. Pide denuedo pastoral y fidelidad misionera a pesar de hallarse encadenado.',
    10, 'easy', 48, true
),
(
    'f0000000-0000-0000-0000-000000000049',
    'c0000000-0000-0000-0000-000000000006',
    'reference_identification',
    '¿En qué versículo se encuentra el mandamiento: "Hijos, obedeced en el Señor a vuestros padres, porque esto es justo"?',
    'Efesios 6:1',
    'El inicio de los deberes familiares prácticos se ubica en Efesios 6:1.',
    10, 'easy', 49, true
),
(
    'f0000000-0000-0000-0000-000000000050',
    'c0000000-0000-0000-0000-000000000006',
    'ordering',
    'Ordena cronológicamente los seis grandes ejes temáticos que componen los seis capítulos del libro de Efesios:',
    'Efesios 1-6',
    '1. Las bendiciones celestiales y la soberanía de Cristo (Cap. 1). 2. De muerte a vida: salvos por gracia para buenas obras y reconciliados en la cruz (Cap. 2). 3. El misterio revelado de los gentiles coherederos y la sabiduría divina (Cap. 3). 4. La unidad del Espíritu, dones ministeriales y el nuevo hombre (Cap. 4). 5. Andar en luz, llenos del Espíritu y el orden conyugal (Cap. 5). 6. Relaciones familiares, la armadura de Dios y la victoria espiritual (Cap. 6).',
    10, 'hard', 50, true
);

-- OPCIONES EXAMEN FINAL
INSERT INTO public.question_options (question_id, option_text, is_correct, order_index)
VALUES
-- q1
('f0000000-0000-0000-0000-000000000001', 'Toda bendición espiritual en los lugares celestiales en Cristo', true, 1),
('f0000000-0000-0000-0000-000000000001', 'Bienes materiales temporales en la tierra de Canaán', false, 2),
('f0000000-0000-0000-0000-000000000001', 'Triunfo militar sobre los gobernadores de Roma', false, 3),
('f0000000-0000-0000-0000-000000000001', 'Exención perpetua de todo dolor físico', false, 4),

-- q2
('f0000000-0000-0000-0000-000000000002', 'El puro afecto de su voluntad', true, 1),
('f0000000-0000-0000-0000-000000000002', 'Los méritos previos de nuestras obras', false, 2),
('f0000000-0000-0000-0000-000000000002', 'El linaje sanguíneo de la tribu sacerdotal', false, 3),
('f0000000-0000-0000-0000-000000000002', 'El consentimiento de los emperadores terrenales', false, 4),

-- q3: fill_blank
('f0000000-0000-0000-0000-000000000003', 'sangre', true, 1),

-- q4: fill_blank
('f0000000-0000-0000-0000-000000000004', 'sellados', true, 1),

-- q5: true_false
('f0000000-0000-0000-0000-000000000005', 'Verdadero', true, 1),
('f0000000-0000-0000-0000-000000000005', 'Falso', false, 2),

-- q6: true_false
('f0000000-0000-0000-0000-000000000006', 'Verdadero', false, 1),
('f0000000-0000-0000-0000-000000000006', 'Falso', true, 2),

-- q7: ref
('f0000000-0000-0000-0000-000000000007', 'Efesios 1:22-23', true, 1),
('f0000000-0000-0000-0000-000000000007', 'Efesios 1:5-6', false, 2),
('f0000000-0000-0000-0000-000000000007', 'Efesios 1:11-12', false, 3),
('f0000000-0000-0000-0000-000000000007', 'Efesios 1:17-18', false, 4),

-- q8
('f0000000-0000-0000-0000-000000000008', 'Espíritu de sabiduría y de revelación en el conocimiento de él', true, 1),
('f0000000-0000-0000-0000-000000000008', 'Poder político para derrocar a las autoridades de Éfeso', false, 2),
('f0000000-0000-0000-0000-000000000008', 'Riquezas comerciales para expandir el templo', false, 3),
('f0000000-0000-0000-0000-000000000008', 'Visiones astrológicas sobre el porvenir de Asia', false, 4),

-- q9
('f0000000-0000-0000-0000-000000000009', 'Hijos de ira, lo mismo que los demás', true, 1),
('f0000000-0000-0000-0000-000000000009', 'Personas neutrales sin inclinación pecaminosa', false, 2),
('f0000000-0000-0000-0000-000000000009', 'Santos inocentes corrompidos únicamente por la sociedad', false, 3),
('f0000000-0000-0000-0000-000000000009', 'Hijos del pacto con derecho automático al reino', false, 4),

-- q10
('f0000000-0000-0000-0000-000000000010', 'Salvos por gracia mediante la fe, no por obras, para buenas obras preparadas por Dios', true, 1),
('f0000000-0000-0000-0000-000000000010', 'Salvos por buenas obras que compran la gracia divina', false, 2),
('f0000000-0000-0000-0000-000000000010', 'Salvos exclusivamente por ritos de circuncisión física', false, 3),
('f0000000-0000-0000-0000-000000000010', 'Salvos por la sabiduría intelectual griega sin fe en la cruz', false, 4),

-- q11: fill_blank
('f0000000-0000-0000-0000-000000000011', 'gracia', true, 1),

-- q12: fill_blank
('f0000000-0000-0000-0000-000000000012', 'paz', true, 1),

-- q13: fill_blank
('f0000000-0000-0000-0000-000000000013', 'angulo', true, 1),

-- q14: true_false
('f0000000-0000-0000-0000-000000000014', 'Verdadero', true, 1),
('f0000000-0000-0000-0000-000000000014', 'Falso', false, 2),

-- q15: true_false
('f0000000-0000-0000-0000-000000000015', 'Verdadero', false, 1),
('f0000000-0000-0000-0000-000000000015', 'Falso', true, 2),

-- q16: ref
('f0000000-0000-0000-0000-000000000016', 'Efesios 2:9-10', true, 1),
('f0000000-0000-0000-0000-000000000016', 'Efesios 2:1-2', false, 2),
('f0000000-0000-0000-0000-000000000016', 'Efesios 2:15-16', false, 3),
('f0000000-0000-0000-0000-000000000016', 'Efesios 2:21-22', false, 4),

-- q17
('f0000000-0000-0000-0000-000000000017', 'Mediante la cruz, matando en ella las enemistades', true, 1),
('f0000000-0000-0000-0000-000000000017', 'Mediante tratados comerciales de paz', false, 2),
('f0000000-0000-0000-0000-000000000017', 'Mediante la restauración de sacrificios en el templo de Salomón', false, 3),
('f0000000-0000-0000-0000-000000000017', 'Mediante leyes cívicas dictadas por el senado', false, 4),

-- q18
('f0000000-0000-0000-0000-000000000018', 'Los gentiles son coherederos, miembros del mismo cuerpo y copartícipes de la promesa', true, 1),
('f0000000-0000-0000-0000-000000000018', 'El templo de piedra en Jerusalén reinaría eternamente sobre Roma', false, 2),
('f0000000-0000-0000-0000-000000000018', 'Sólo los circuncidados tienen derecho a participar de la cena del Señor', false, 3),
('f0000000-0000-0000-0000-000000000018', 'Los sacrificios levíticos debían ser adoptados en toda Europa', false, 4),

-- q19
('f0000000-0000-0000-0000-000000000019', 'A los principados y potestades en los lugares celestiales', true, 1),
('f0000000-0000-0000-0000-000000000019', 'A los filósofos de la academia de Platón', false, 2),
('f0000000-0000-0000-0000-000000000019', 'A los comandantes del ejército del césar', false, 3),
('f0000000-0000-0000-0000-000000000019', 'A los comerciantes marítimos del mar Egeo', false, 4),

-- q20: fill_blank
('f0000000-0000-0000-0000-000000000020', 'interior', true, 1),

-- q21: fill_blank
('f0000000-0000-0000-0000-000000000021', 'conocimiento', true, 1),

-- q22: true_false
('f0000000-0000-0000-0000-000000000022', 'Verdadero', false, 1),
('f0000000-0000-0000-0000-000000000022', 'Falso', true, 2),

-- q23: true_false
('f0000000-0000-0000-0000-000000000023', 'Verdadero', true, 1),
('f0000000-0000-0000-0000-000000000023', 'Falso', false, 2),

-- q24: ref
('f0000000-0000-0000-0000-000000000024', 'Efesios 3:20', true, 1),
('f0000000-0000-0000-0000-000000000024', 'Efesios 3:5', false, 2),
('f0000000-0000-0000-0000-000000000024', 'Efesios 3:11', false, 3),
('f0000000-0000-0000-0000-000000000024', 'Efesios 3:17', false, 4),

-- q25
('f0000000-0000-0000-0000-000000000025', 'En la iglesia en Cristo Jesús por todas las edades', true, 1),
('f0000000-0000-0000-0000-000000000025', 'En los tribunales humanos de justicia terrenal', false, 2),
('f0000000-0000-0000-0000-000000000025', 'En los templos paganos dedicados a los ídolos', false, 3),
('f0000000-0000-0000-0000-000000000025', 'En los palacios de los reyes de este mundo', false, 4),

-- q26
('f0000000-0000-0000-0000-000000000026', 'Que andéis como es digno de la vocación con que fuisteis llamados', true, 1),
('f0000000-0000-0000-0000-000000000026', 'Que busquéis riquezas para financiar a los apóstoles', false, 2),
('f0000000-0000-0000-0000-000000000026', 'Que abandonéis toda relación con las personas del mundo', false, 3),
('f0000000-0000-0000-0000-000000000026', 'Que fundéis una nueva nación militar en Asia', false, 4),

-- q27
('f0000000-0000-0000-0000-000000000027', 'Apóstoles, profetas, evangelistas, pastores y maestros', true, 1),
('f0000000-0000-0000-0000-000000000027', 'Sacerdotes, levitas, cantores y porteros', false, 2),
('f0000000-0000-0000-0000-000000000027', 'Filósofos, senadores, gobernadores y jueces', false, 3),
('f0000000-0000-0000-0000-000000000027', 'Reyes, generales, capitanes y soldados', false, 4),

-- q28: fill_blank
('f0000000-0000-0000-0000-000000000028', 'fe', true, 1),

-- q29: fill_blank
('f0000000-0000-0000-0000-000000000029', 'sol', true, 1),

-- q30: fill_blank
('f0000000-0000-0000-0000-000000000030', 'cristo', true, 1),

-- q31: true_false
('f0000000-0000-0000-0000-000000000031', 'Verdadero', false, 1),
('f0000000-0000-0000-0000-000000000031', 'Falso', true, 2),

-- q32: true_false
('f0000000-0000-0000-0000-000000000032', 'Verdadero', true, 1),
('f0000000-0000-0000-0000-000000000032', 'Falso', false, 2),

-- q33: ref
('f0000000-0000-0000-0000-000000000033', 'Efesios 4:30', true, 1),
('f0000000-0000-0000-0000-000000000033', 'Efesios 4:10', false, 2),
('f0000000-0000-0000-0000-000000000033', 'Efesios 4:18', false, 3),
('f0000000-0000-0000-0000-000000000033', 'Efesios 4:25', false, 4),

-- q34
('f0000000-0000-0000-0000-000000000034', 'Ofrenda y sacrificio a Dios en olor fragante', true, 1),
('f0000000-0000-0000-0000-000000000034', 'Líder militar victorioso en batallas terrenales', false, 2),
('f0000000-0000-0000-0000-000000000034', 'Filósofo sabio que murió sin sufrir aflicción', false, 3),
('f0000000-0000-0000-0000-000000000034', 'Legislador estricto que impuso nuevas penas', false, 4),

-- q35
('f0000000-0000-0000-0000-000000000035', 'En toda bondad, justicia y verdad', true, 1),
('f0000000-0000-0000-0000-000000000035', 'En riquezas, fama y placeres temporales', false, 2),
('f0000000-0000-0000-0000-000000000035', 'En ayunos visibles para ser alabados por hombres', false, 3),
('f0000000-0000-0000-0000-000000000035', 'En austeridad severa y aislamiento monástico', false, 4),

-- q36
('f0000000-0000-0000-0000-000000000036', 'Presentársela a sí mismo gloriosa, sin mancha ni arruga', true, 1),
('f0000000-0000-0000-0000-000000000036', 'Obtener ganancias financieras mediante diezmos', false, 2),
('f0000000-0000-0000-0000-000000000036', 'Entregar el mando de la iglesia a los procuradores romanos', false, 3),
('f0000000-0000-0000-0000-000000000036', 'Dividir a los creyentes en castas según su posición', false, 4),

-- q37: fill_blank
('f0000000-0000-0000-0000-000000000037', 'llenos', true, 1),

-- q38: fill_blank
('f0000000-0000-0000-0000-000000000038', 'amad', true, 1),

-- q39: true_false
('f0000000-0000-0000-0000-000000000039', 'Verdadero', true, 1),
('f0000000-0000-0000-0000-000000000039', 'Falso', false, 2),

-- q40: true_false
('f0000000-0000-0000-0000-000000000040', 'Verdadero', false, 1),
('f0000000-0000-0000-0000-000000000040', 'Falso', true, 2),

-- q41: ref
('f0000000-0000-0000-0000-000000000041', 'Efesios 5:15-16', true, 1),
('f0000000-0000-0000-0000-000000000041', 'Efesios 5:3-4', false, 2),
('f0000000-0000-0000-0000-000000000041', 'Efesios 5:10', false, 3),
('f0000000-0000-0000-0000-000000000041', 'Efesios 5:28', false, 4),

-- q42
('f0000000-0000-0000-0000-000000000042', 'Apunta a la unión sagrada e inseparable entre Cristo y la iglesia', true, 1),
('f0000000-0000-0000-0000-000000000042', 'Es una simple convención social modificable por leyes civiles', false, 2),
('f0000000-0000-0000-0000-000000000042', 'Es un contrato comercial de conveniencia patrimonial', false, 3),
('f0000000-0000-0000-0000-000000000042', 'Es una práctica pasajera sin relevancia teológica', false, 4),

-- q43
('f0000000-0000-0000-0000-000000000043', 'Honra a tu padre y a tu madre', true, 1),
('f0000000-0000-0000-0000-000000000043', 'No te harás imagen ni ninguna semejanza', false, 2),
('f0000000-0000-0000-0000-000000000043', 'Acuérdate del día de reposo para santificarlo', false, 3),
('f0000000-0000-0000-0000-000000000043', 'No hurtarás', false, 4),

-- q44
('f0000000-0000-0000-0000-000000000044', 'En el Señor y en el poder de su fuerza, vestidos de toda la armadura de Dios', true, 1),
('f0000000-0000-0000-0000-000000000044', 'En las legiones romanas con armamento de bronce', false, 2),
('f0000000-0000-0000-0000-000000000044', 'En los argumentos retóricos de los sabios de Éfeso', false, 3),
('f0000000-0000-0000-0000-000000000044', 'En la fuerza muscular y la disciplina de los juegos olímpicos', false, 4),

-- q45: fill_blank
('f0000000-0000-0000-0000-000000000045', 'fe', true, 1),

-- q46: fill_blank
('f0000000-0000-0000-0000-000000000046', 'palabra', true, 1),

-- q47: true_false
('f0000000-0000-0000-0000-000000000047', 'Verdadero', false, 1),
('f0000000-0000-0000-0000-000000000047', 'Falso', true, 2),

-- q48: true_false
('f0000000-0000-0000-0000-000000000048', 'Verdadero', true, 1),
('f0000000-0000-0000-0000-000000000048', 'Falso', false, 2),

-- q49: ref
('f0000000-0000-0000-0000-000000000049', 'Efesios 6:1', true, 1),
('f0000000-0000-0000-0000-000000000049', 'Efesios 6:5', false, 2),
('f0000000-0000-0000-0000-000000000049', 'Efesios 6:10', false, 3),
('f0000000-0000-0000-0000-000000000049', 'Efesios 6:21', false, 4),

-- q50: ordering
('f0000000-0000-0000-0000-000000000050', 'Bendiciones celestiales y la soberanía de Cristo (Cap. 1)', true, 1),
('f0000000-0000-0000-0000-000000000050', 'De muerte a vida: salvos por gracia y reconciliados en la cruz (Cap. 2)', true, 2),
('f0000000-0000-0000-0000-000000000050', 'El misterio de los gentiles y la multiforme sabiduría de Dios (Cap. 3)', true, 3),
('f0000000-0000-0000-0000-000000000050', 'La armadura de Dios, guerra espiritual y perseverancia (Cap. 6)', true, 4)
ON CONFLICT (id) DO NOTHING;

-- Asociar las 50 preguntas al Examen Final de Efesios
INSERT INTO public.assessment_questions (assessment_id, question_id, order_index)
VALUES
('f0000000-0000-0000-0000-000000000001', 'f0000000-0000-0000-0000-000000000001', 1),
('f0000000-0000-0000-0000-000000000001', 'f0000000-0000-0000-0000-000000000002', 2),
('f0000000-0000-0000-0000-000000000001', 'f0000000-0000-0000-0000-000000000003', 3),
('f0000000-0000-0000-0000-000000000001', 'f0000000-0000-0000-0000-000000000004', 4),
('f0000000-0000-0000-0000-000000000001', 'f0000000-0000-0000-0000-000000000005', 5),
('f0000000-0000-0000-0000-000000000001', 'f0000000-0000-0000-0000-000000000006', 6),
('f0000000-0000-0000-0000-000000000001', 'f0000000-0000-0000-0000-000000000007', 7),
('f0000000-0000-0000-0000-000000000001', 'f0000000-0000-0000-0000-000000000008', 8),
('f0000000-0000-0000-0000-000000000001', 'f0000000-0000-0000-0000-000000000009', 9),
('f0000000-0000-0000-0000-000000000001', 'f0000000-0000-0000-0000-000000000010', 10),
('f0000000-0000-0000-0000-000000000001', 'f0000000-0000-0000-0000-000000000011', 11),
('f0000000-0000-0000-0000-000000000001', 'f0000000-0000-0000-0000-000000000012', 12),
('f0000000-0000-0000-0000-000000000001', 'f0000000-0000-0000-0000-000000000013', 13),
('f0000000-0000-0000-0000-000000000001', 'f0000000-0000-0000-0000-000000000014', 14),
('f0000000-0000-0000-0000-000000000001', 'f0000000-0000-0000-0000-000000000015', 15),
('f0000000-0000-0000-0000-000000000001', 'f0000000-0000-0000-0000-000000000016', 16),
('f0000000-0000-0000-0000-000000000001', 'f0000000-0000-0000-0000-000000000017', 17),
('f0000000-0000-0000-0000-000000000001', 'f0000000-0000-0000-0000-000000000018', 18),
('f0000000-0000-0000-0000-000000000001', 'f0000000-0000-0000-0000-000000000019', 19),
('f0000000-0000-0000-0000-000000000001', 'f0000000-0000-0000-0000-000000000020', 20),
('f0000000-0000-0000-0000-000000000001', 'f0000000-0000-0000-0000-000000000021', 21),
('f0000000-0000-0000-0000-000000000001', 'f0000000-0000-0000-0000-000000000022', 22),
('f0000000-0000-0000-0000-000000000001', 'f0000000-0000-0000-0000-000000000023', 23),
('f0000000-0000-0000-0000-000000000001', 'f0000000-0000-0000-0000-000000000024', 24),
('f0000000-0000-0000-0000-000000000001', 'f0000000-0000-0000-0000-000000000025', 25),
('f0000000-0000-0000-0000-000000000001', 'f0000000-0000-0000-0000-000000000026', 26),
('f0000000-0000-0000-0000-000000000001', 'f0000000-0000-0000-0000-000000000027', 27),
('f0000000-0000-0000-0000-000000000001', 'f0000000-0000-0000-0000-000000000028', 28),
('f0000000-0000-0000-0000-000000000001', 'f0000000-0000-0000-0000-000000000029', 29),
('f0000000-0000-0000-0000-000000000001', 'f0000000-0000-0000-0000-000000000030', 30),
('f0000000-0000-0000-0000-000000000001', 'f0000000-0000-0000-0000-000000000031', 31),
('f0000000-0000-0000-0000-000000000001', 'f0000000-0000-0000-0000-000000000032', 32),
('f0000000-0000-0000-0000-000000000001', 'f0000000-0000-0000-0000-000000000033', 33),
('f0000000-0000-0000-0000-000000000001', 'f0000000-0000-0000-0000-000000000034', 34),
('f0000000-0000-0000-0000-000000000001', 'f0000000-0000-0000-0000-000000000035', 35),
('f0000000-0000-0000-0000-000000000001', 'f0000000-0000-0000-0000-000000000036', 36),
('f0000000-0000-0000-0000-000000000001', 'f0000000-0000-0000-0000-000000000037', 37),
('f0000000-0000-0000-0000-000000000001', 'f0000000-0000-0000-0000-000000000038', 38),
('f0000000-0000-0000-0000-000000000001', 'f0000000-0000-0000-0000-000000000039', 39),
('f0000000-0000-0000-0000-000000000001', 'f0000000-0000-0000-0000-000000000040', 40),
('f0000000-0000-0000-0000-000000000001', 'f0000000-0000-0000-0000-000000000041', 41),
('f0000000-0000-0000-0000-000000000001', 'f0000000-0000-0000-0000-000000000042', 42),
('f0000000-0000-0000-0000-000000000001', 'f0000000-0000-0000-0000-000000000043', 43),
('f0000000-0000-0000-0000-000000000001', 'f0000000-0000-0000-0000-000000000044', 44),
('f0000000-0000-0000-0000-000000000001', 'f0000000-0000-0000-0000-000000000045', 45),
('f0000000-0000-0000-0000-000000000001', 'f0000000-0000-0000-0000-000000000046', 46),
('f0000000-0000-0000-0000-000000000001', 'f0000000-0000-0000-0000-000000000047', 47),
('f0000000-0000-0000-0000-000000000001', 'f0000000-0000-0000-0000-000000000048', 48),
('f0000000-0000-0000-0000-000000000001', 'f0000000-0000-0000-0000-000000000049', 49),
('f0000000-0000-0000-0000-000000000001', 'f0000000-0000-0000-0000-000000000050', 50)
ON CONFLICT DO NOTHING;