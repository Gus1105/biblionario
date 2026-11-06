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
    'Esta célebre alabanza y declaración apostólica se ubica textualmente en Efesios 1:3.',
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
    'order_events',
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
('c0010000-0000-0000-0000-000000000025', 'Elección en Cristo antes de la fundación del mundo', true, 1),
('c0010000-0000-0000-0000-000000000025', 'Redención y perdón de pecados por su sangre', true, 2),
('c0010000-0000-0000-0000-000000000025', 'Oír la palabra de verdad y ser sellados con el Espíritu Santo', true, 3),
('c0010000-0000-0000-0000-000000000025', 'Cristo exaltado y dado por cabeza sobre todas las cosas a la iglesia', true, 4)
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
    'order_events',
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
('c0020000-0000-0000-0000-000000000025', 'Muertos en delitos y pecados siguiendo al príncipe del aire', true, 1),
('c0020000-0000-0000-0000-000000000025', 'Resucitados con Cristo: salvos por gracia mediante la fe', true, 2),
('c0020000-0000-0000-0000-000000000025', 'Reconciliación en la cruz: derribada la pared intermedia', true, 3),
('c0020000-0000-0000-0000-000000000025', 'Edificados sobre apóstoles y profetas para morada de Dios', true, 4)
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
    '¿Qué es capaz de hacer Dios según la hermosa oración de alabanza de Efesios 3:20?',
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
    'c0000000-0000-0000-0000-000000000003',
    'fill_blank',
    'Completa Efesios 3:19: "Y de conocer el amor de Cristo, que excede a todo ________".',
    'Efesios 3:19',
    'El amor sublime de Cristo sobrepasa y excede a todo "conocimiento".',
    10, 'medium', 15, true
),
-- Pregunta 16 (Fill blank)
(
    'c0030000-0000-0000-0000-000000000016',
    'c0000000-0000-0000-0000-000000000003',
    'fill_blank',
    'Completa Efesios 3:21: "A él sea ________ en la iglesia en Cristo Jesús por todas las edades, por los siglos de los siglos. Amén".',
    'Efesios 3:21',
    'La oración final de alabanza rinde a Dios toda la "gloria".',
    10, 'easy', 16, true
),
-- Pregunta 17 (True/False)
(
    'c0030000-0000-0000-0000-000000000017',
    'c0000000-0000-0000-0000-000000000003',
    'true_false',
    'Pablo pide a los creyentes en Efesios 3:13 que no desmayen a causa de sus tribulaciones, pues ellas son la gloria de ellos.',
    'Efesios 3:13',
    'Verdadero. Efesios 3:13 dice: "pido que no desmayéis a causa de mis tribulaciones por vosotros, las cuales son vuestra gloria".',
    10, 'medium', 17, true
),
-- Pregunta 18 (True/False)
(
    'c0030000-0000-0000-0000-000000000018',
    'c0000000-0000-0000-0000-000000000003',
    'true_false',
    'El misterio de Cristo mencionado en Efesios 3 había sido revelado con todos sus detalles a los patriarcas en el Antiguo Testamento.',
    'Efesios 3:5',
    'Falso. Efesios 3:5 afirma que "en otras generaciones no se dio a conocer a los hijos de los hombres, como ahora es revelado a sus santos apóstoles y profetas por el Espíritu".',
    10, 'medium', 18, true
),
-- Pregunta 19 (True/False)
(
    'c0030000-0000-0000-0000-000000000019',
    'c0000000-0000-0000-0000-000000000003',
    'true_false',
    'Según Efesios 3:12, en Cristo tenemos seguridad y acceso a Dios con confianza por medio de la fe en él.',
    'Efesios 3:12',
    'Verdadero. Efesios 3:12 afirma: "en quien tenemos seguridad y acceso con confianza por medio de la fe en él".',
    10, 'easy', 19, true
),
-- Pregunta 20 (True/False)
(
    'c0030000-0000-0000-0000-000000000020',
    'c0000000-0000-0000-0000-000000000003',
    'true_false',
    'En Efesios 3:14-15, de Dios Padre toma nombre toda familia en los cielos y en la tierra.',
    'Efesios 3:14-15',
    'Verdadero. Pablo ora ante el Padre "de quien toma nombre toda familia en los cielos y en la tierra".',
    10, 'easy', 20, true
),
-- Pregunta 21 (True/False)
(
    'c0030000-0000-0000-0000-000000000021',
    'c0000000-0000-0000-0000-000000000003',
    'true_false',
    'En Efesios 3:19, Pablo declara que es imposible experimentar el amor de Cristo de ninguna manera práctica.',
    'Efesios 3:19',
    'Falso. Aunque el amor excede a todo conocimiento intelectual pleno, Pablo ruega expresamente "conocer el amor de Cristo".',
    10, 'medium', 21, true
),
-- Pregunta 22 (True/False)
(
    'c0030000-0000-0000-0000-000000000022',
    'c0000000-0000-0000-0000-000000000003',
    'true_false',
    'El poder divino manifestado en Efesios 3:20 actúa exclusivamente fuera del creyente sin obrar en su interior.',
    'Efesios 3:20',
    'Falso. El texto aclara categóricamente: "según el poder que actúa en nosotros".',
    10, 'medium', 22, true
),
-- Pregunta 23 (Ref Ident)
(
    'c0030000-0000-0000-0000-000000000023',
    'c0000000-0000-0000-0000-000000000003',
    'reference_identification',
    '¿En qué versículo declara Pablo: "A mí, que soy menos que el más pequeño de todos los santos, me fue dada esta gracia de anunciar entre los gentiles el evangelio de las inescrutables riquezas de Cristo"?',
    'Efesios 3:8',
    'Esta célebre manifestación apostólica se encuentra en Efesios 3:8.',
    10, 'medium', 23, true
),
-- Pregunta 24 (Ref Ident)
(
    'c0030000-0000-0000-0000-000000000024',
    'c0000000-0000-0000-0000-000000000003',
    'reference_identification',
    '¿En qué versículo se encuentra la alabanza: "Y a Aquel que es poderoso para hacer todas las cosas mucho más abundantemente de lo que pedimos o entendemos"?',
    'Efesios 3:20',
    'La gran alabanza que cierra la primera parte de la carta está en Efesios 3:20.',
    10, 'easy', 24, true
),
-- Pregunta 25 (Ordering)
(
    'c0030000-0000-0000-0000-000000000025',
    'c0000000-0000-0000-0000-000000000003',
    'order_events',
    'Ordena los temas principales de la revelación y oración apostólica en Efesios 3:',
    'Efesios 3:1-21',
    '1. El misterio revelado: gentiles coherederos en un mismo cuerpo (v. 1-6). 2. El anuncio de las inescrutables riquezas de Cristo (v. 8-11). 3. Oración de rodillas pidiendo fortaleza en el hombre interior (v. 14-17). 4. Alabanza de gloria a Dios por los siglos en la iglesia y en Cristo (v. 20-21).',
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
('c0030000-0000-0000-0000-000000000025', 'El misterio revelado: gentiles coherederos en un mismo cuerpo', true, 1),
('c0030000-0000-0000-0000-000000000025', 'El anuncio de las inescrutables riquezas de Cristo', true, 2),
('c0030000-0000-0000-0000-000000000025', 'Oración de rodillas pidiendo fortaleza en el hombre interior', true, 3),
('c0030000-0000-0000-0000-000000000025', 'Alabanza de gloria a Dios por los siglos en la iglesia y en Cristo', true, 4)
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
