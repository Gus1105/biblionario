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
    'order_events',
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
    'order_events',
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
    'c0000000-0000-0000-0000-000000000006',
    'multiple_choice',
    '¿Para qué sirve el escudo de la fe según Efesios 6:16?',
    'Efesios 6:16',
    'Sirve "para que podáis apagar todos los dardos de fuego del maligno".',
    10, 'easy', 7, true
),
-- Pregunta 8 (MC)
(
    'c0060000-0000-0000-0000-000000000008',
    'c0000000-0000-0000-0000-000000000006',
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
    'order_events',
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
