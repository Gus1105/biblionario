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
b) "Miembros del mismo cuerpo": formamos una sola familia espiritual unida en Cristo, sin división ni superioridad entre unos y otros.
c) "Copartícipes de la promesa": reciben el cumplimiento pleno del Espíritu y la vida eterna en Cristo por medio del evangelio.

3. El ministerio de la gracia y las inescrutables riquezas (v. 7-9):
Con profunda humildad, Pablo se describe como "menos que el más pequeño de todos los santos", reconociendo que su apostolado es puro don. Su comisión es proclamar "las inescrutables riquezas de Cristo" (riquezas insondables e inagotables).

4. La multiforme sabiduría de Dios y los ángeles (v. 10-13):
La Iglesia tiene un propósito maravilloso en el plan de Dios: ser el escenario donde "la multiforme sabiduría de Dios" (su sabiduría de múltiples matices y riquezas) es exhibida ante los principados y potestades celestiales (las jerarquías angelicales).
En Cristo, el creyente posee "seguridad y acceso con confianza por medio de la fe en él".',
    '[
        {"concept": "Misterio de Cristo", "definition": "El plan eterno de Dios antes oculto, revelado en el evangelio: que los gentiles son integrados en absoluta igualdad con los creyentes judíos en un solo cuerpo."},
        {"concept": "Coherederos y miembros del mismo cuerpo", "definition": "Plena igualdad espiritual y de derechos eternos entre gentiles y judíos en la Iglesia de Cristo."},
        {"concept": "Inescrutables riquezas", "definition": "Las bendiciones, gracia y atributos de Cristo que sobrepasan todo entendimiento y jamás pueden agotarse."},
        {"concept": "Multiforme sabiduría", "definition": "La inmensa y variada sabiduría de Dios, mostrada de muchas maneras hermosas a través de la salvación de la Iglesia."}
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
    'Pablo se arrodilla en una hermosa oración, pidiendo a Dios que fortalezca el corazón de los creyentes y terminando con una gran alabanza de gloria a Dios.',
    '14 Por esta causa doblo mis rodillas ante el Padre de nuestro Señor Jesucristo,
15 de quien toma nombre toda familia en los cielos y en la tierra,
16 para que os dé, conforme a las riquezas de su gloria, el ser fortalecidos con poder en el hombre interior por su Espíritu;
17 para que habite Cristo por la fe en vuestros corazones, a fin de que, arraigados y cimentados en amor,
18 seáis plenamente capaces de comprender con todos los santos cuál sea la anchura, la longitud, la profundidad y la altura,
19 y de conocer el amor de Cristo, que excede a todo conocimiento, para que seáis llenos de toda la plenitud de Dios.
20 Y a Aquel que es poderoso para hacer todas las cosas mucho más abundantemente de lo que pedimos o entendemos, según el poder que actúa en nosotros,
21 a él sea gloria en la iglesia en Cristo Jesús por todas las edades, por los siglos de los siglos. Amén.',
    'Esta oración pastoral y apostólica nos muestra la profundidad de la vida espiritual:

1. Postura de reverencia y oración (v. 14-15):
Pablo se arrodilla ante Dios con respeto y humildad. Reconoce a Dios como el Padre de quien procede toda familia en el cielo y en la tierra.

2. Las peticiones de Pablo para los creyentes (v. 16-19):
a) Fortaleza interior: que el Espíritu Santo dé poder a nuestro corazón para mantenernos firmes.
b) La presencia de Cristo: que Jesús viva y more en nuestros corazones por medio de la fe.
c) Firmeza en el amor: estar bien arraigados y cimentados en el amor de Dios.
d) Conocer el amor inmenso de Cristo: comprender lo ancho, largo, profundo y alto de su amor, que supera todo conocimiento humano, para ser llenos de la presencia de Dios.

3. Una gran alabanza final a Dios (v. 20-21):
Pablo concluye con una alabanza conmovedora a Dios, quien tiene el poder de hacer muchísimo más de lo que pedimos o podemos imaginar, según el poder que actúa en nosotros. A Él sea toda la gloria en la Iglesia y en Cristo Jesús por siempre.',
    '[
        {"concept": "Hombre interior", "definition": "El corazón y la vida espiritual del creyente, fortalecidos por el Espíritu Santo."},
        {"concept": "Arraigados y cimentados", "definition": "Estar firmes y seguros en el amor de Dios, como un árbol con raíces profundas o una casa con buenos cimientos."},
        {"concept": "El amor de Cristo", "definition": "El amor incondicional y sacrificado de Jesús, tan grande que supera todo entendimiento humano."},
        {"concept": "Alabanza de gloria", "definition": "Expresión sincera de adoración que reconoce la grandeza y el poder supremo de Dios."}
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
    'd0003001-0001-0000-0000-000000000001',
    'b0000003-0001-0000-0000-000000000001',
    'c0000000-0000-0000-0000-000000000003',
    'multiple_choice',
    '¿Cuál es el misterio que antes no se dio a conocer pero que ahora fue revelado a los apóstoles y profetas (Efesios 3:5-6)?',
    'Efesios 3:5-6',
    'Efesios 3:6 especifica: "que los gentiles son coherederos y miembros del mismo cuerpo, y copartícipes de la promesa en Cristo Jesús por medio del evangelio".',
    10, 'easy', 1, true
),
(
    'd0003001-0002-0000-0000-000000000002',
    'b0000003-0001-0000-0000-000000000001',
    'c0000000-0000-0000-0000-000000000003',
    'fill_blank',
    'Completa Efesios 3:8: "A mí, que soy menos que el más pequeño de todos los santos, me fue dada esta gracia de anunciar entre los gentiles el evangelio de las ________ riquezas de Cristo".',
    'Efesios 3:8',
    'La palabra textual que califica las riquezas en Efesios 3:8 es "inescrutables".',
    10, 'medium', 2, true
),
(
    'd0003001-0003-0000-0000-000000000003',
    'b0000003-0001-0000-0000-000000000001',
    'c0000000-0000-0000-0000-000000000003',
    'multiple_choice',
    'Según Efesios 3:10, ¿por medio de qué entidad es dada a conocer la multiforme sabiduría de Dios a los principados y potestades celestiales?',
    'Efesios 3:10',
    'Efesios 3:10 afirma: "...sea ahora dada a conocer por medio de la iglesia a los principados y potestades en los lugares celestiales".',
    10, 'easy', 3, true
),
(
    'd0003001-0004-0000-0000-000000000004',
    'b0000003-0001-0000-0000-000000000001',
    'c0000000-0000-0000-0000-000000000003',
    'true_false',
    'En Efesios 3:1, Pablo se describe a sí mismo como prisionero del emperador romano Nerón por su rebelión civil.',
    'Efesios 3:1',
    'Falso. Pablo se describe como "prisionero de Cristo Jesús por vosotros los gentiles".',
    10, 'easy', 4, true
),
(
    'd0003001-0005-0000-0000-000000000005',
    'b0000003-0001-0000-0000-000000000001',
    'c0000000-0000-0000-0000-000000000003',
    'reference_identification',
    '¿En qué versículo de Efesios se declara que en Cristo "tenemos seguridad y acceso con confianza por medio de la fe en él"?',
    'Efesios 3:12',
    'Esta afirmación se encuentra en Efesios 3:12.',
    10, 'easy', 5, true
),
(
    'd0003001-0006-0000-0000-000000000006',
    'b0000003-0001-0000-0000-000000000001',
    'c0000000-0000-0000-0000-000000000003',
    'multiple_choice',
    '¿Qué adjetivo emplea Pablo en Efesios 3:10 para calificar la infinita sabiduría de Dios manifestada en la iglesia?',
    'Efesios 3:10',
    'Efesios 3:10 utiliza la expresión: "la multiforme sabiduría de Dios".',
    10, 'medium', 6, true
),
(
    'd0003001-0007-0000-0000-000000000007',
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
('d0003001-0001-0000-0000-000000000001', 'Que los gentiles son coherederos y miembros del mismo cuerpo, y copartícipes de la promesa en Cristo', true, 1),
('d0003001-0001-0000-0000-000000000001', 'Que la ley mosaica debía imponerse obligatoriamente a todas las naciones', false, 2),
('d0003001-0001-0000-0000-000000000001', 'Que los ángeles gobernarían las iglesias de Asia Menor', false, 3),
('d0003001-0001-0000-0000-000000000001', 'Que el templo de Jerusalén sería reconstruido con oro físico', false, 4),

-- q2: fill_blank
('d0003001-0002-0000-0000-000000000002', 'inescrutables', true, 1),

-- q3: multiple_choice
('d0003001-0003-0000-0000-000000000003', 'Por medio de la iglesia', true, 1),
('d0003001-0003-0000-0000-000000000003', 'Por medio del senado romano', false, 2),
('d0003001-0003-0000-0000-000000000003', 'A través de las leyes de la naturaleza visible', false, 3),
('d0003001-0003-0000-0000-000000000003', 'Por medio de los sacerdotes levitas del templo', false, 4),

-- q4: true_false
('d0003001-0004-0000-0000-000000000004', 'Verdadero', false, 1),
('d0003001-0004-0000-0000-000000000004', 'Falso', true, 2),

-- q5: reference_identification
('d0003001-0005-0000-0000-000000000005', 'Efesios 3:12', true, 1),
('d0003001-0005-0000-0000-000000000005', 'Efesios 3:1', false, 2),
('d0003001-0005-0000-0000-000000000005', 'Efesios 3:6', false, 3),
('d0003001-0005-0000-0000-000000000005', 'Efesios 3:10', false, 4),

-- q6: multiple_choice
('d0003001-0006-0000-0000-000000000006', 'Multiforme', true, 1),
('d0003001-0006-0000-0000-000000000006', 'Oculta para siempre', false, 2),
('d0003001-0006-0000-0000-000000000006', 'Filosófica y humana', false, 3),
('d0003001-0006-0000-0000-000000000006', 'Temporal y mutable', false, 4),

-- q7: multiple_choice
('d0003001-0007-0000-0000-000000000007', 'Porque sus tribulaciones son la gloria de los creyentes', true, 1),
('d0003001-0007-0000-0000-000000000007', 'Porque pronto saldría de la cárcel con riquezas', false, 2),
('d0003001-0007-0000-0000-000000000007', 'Porque los guardias se habían convertido todos', false, 3),
('d0003001-0007-0000-0000-000000000007', 'Porque los efesios tenían ejércitos para defenderlo', false, 4)
ON CONFLICT (id) DO NOTHING;

-- Asociar preguntas Bloque 3.1
INSERT INTO public.assessment_questions (assessment_id, question_id, order_index)
VALUES
('e0000003-0001-0000-0000-000000000001', 'd0003001-0001-0000-0000-000000000001', 1),
('e0000003-0001-0000-0000-000000000001', 'd0003001-0002-0000-0000-000000000002', 2),
('e0000003-0001-0000-0000-000000000001', 'd0003001-0003-0000-0000-000000000003', 3),
('e0000003-0001-0000-0000-000000000001', 'd0003001-0004-0000-0000-000000000004', 4),
('e0000003-0001-0000-0000-000000000001', 'd0003001-0005-0000-0000-000000000005', 5),
('e0000003-0001-0000-0000-000000000001', 'd0003001-0006-0000-0000-000000000006', 6),
('e0000003-0001-0000-0000-000000000001', 'd0003001-0007-0000-0000-000000000007', 7)
ON CONFLICT DO NOTHING;

-- PREGUNTAS BLOQUE 3.2 (Efesios 3:14-21)
INSERT INTO public.questions (id, block_id, chapter_id, question_type, prompt, verse_reference, explanation, points, difficulty, order_index, is_active)
VALUES
(
    'd0003002-0001-0000-0000-000000000001',
    'b0000003-0002-0000-0000-000000000002',
    'c0000000-0000-0000-0000-000000000003',
    'multiple_choice',
    '¿Qué postura de reverencia adopta Pablo al orar en Efesios 3:14?',
    'Efesios 3:14',
    'Efesios 3:14 dice: "Por esta causa doblo mis rodillas ante el Padre de nuestro Señor Jesucristo".',
    10, 'easy', 1, true
),
(
    'd0003002-0002-0000-0000-000000000002',
    'b0000003-0002-0000-0000-000000000002',
    'c0000000-0000-0000-0000-000000000003',
    'fill_blank',
    'Completa Efesios 3:16: "el ser fortalecidos con poder en el hombre ________ por su Espíritu".',
    'Efesios 3:16',
    'Efesios 3:16 dice: "el ser fortalecidos con poder en el hombre interior por su Espíritu".',
    10, 'medium', 2, true
),
(
    'd0003002-0003-0000-0000-000000000003',
    'b0000003-0002-0000-0000-000000000002',
    'c0000000-0000-0000-0000-000000000003',
    'multiple_choice',
    'Según Efesios 3:17-19, ¿en qué deben estar arraigados y cimentados los creyentes para conocer el amor de Cristo?',
    'Efesios 3:17-19',
    'Efesios 3:17 declara: "arraigados y cimentados en amor".',
    10, 'easy', 3, true
),
(
    'd0003002-0004-0000-0000-000000000004',
    'b0000003-0002-0000-0000-000000000002',
    'c0000000-0000-0000-0000-000000000003',
    'true_false',
    'En Efesios 3:19, Pablo afirma que el amor de Cristo puede ser comprendido plenamente y agotado por el conocimiento humano.',
    'Efesios 3:19',
    'Falso. Efesios 3:19 dice expresamente: "...y de conocer el amor de Cristo, que excede a todo conocimiento".',
    10, 'easy', 4, true
),
(
    'd0003002-0005-0000-0000-000000000005',
    'b0000003-0002-0000-0000-000000000002',
    'c0000000-0000-0000-0000-000000000003',
    'reference_identification',
    '¿En qué versículo se encuentra la hermosa alabanza: "Y a Aquel que es poderoso para hacer todas las cosas mucho más abundantemente de lo que pedimos o entendemos"?',
    'Efesios 3:20',
    'Esta gloriosa alabanza se ubica en Efesios 3:20.',
    10, 'easy', 5, true
),
(
    'd0003002-0006-0000-0000-000000000006',
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
('d0003002-0001-0000-0000-000000000001', 'Doblo mis rodillas ante el Padre de nuestro Señor Jesucristo', true, 1),
('d0003002-0001-0000-0000-000000000001', 'Me pongo de pie mirando hacia el oriente', false, 2),
('d0003002-0001-0000-0000-000000000001', 'Me siento a debatir con los sabios de Éfeso', false, 3),
('d0003002-0001-0000-0000-000000000001', 'Me postro exclusivamente ante los apóstoles de Jerusalén', false, 4),

-- q2: fill_blank
('d0003002-0002-0000-0000-000000000002', 'interior', true, 1),

-- q3: multiple_choice
('d0003002-0003-0000-0000-000000000003', 'En amor', true, 1),
('d0003002-0003-0000-0000-000000000003', 'En ritos externos', false, 2),
('d0003002-0003-0000-0000-000000000003', 'En argumentos filosóficos', false, 3),
('d0003002-0003-0000-0000-000000000003', 'En leyes civiles de Roma', false, 4),

-- q4: true_false
('d0003002-0004-0000-0000-000000000004', 'Verdadero', false, 1),
('d0003002-0004-0000-0000-000000000004', 'Falso', true, 2),

-- q5: reference_identification
('d0003002-0005-0000-0000-000000000005', 'Efesios 3:20', true, 1),
('d0003002-0005-0000-0000-000000000005', 'Efesios 3:14', false, 2),
('d0003002-0005-0000-0000-000000000005', 'Efesios 3:16', false, 3),
('d0003002-0005-0000-0000-000000000005', 'Efesios 3:18', false, 4),

-- q6: multiple_choice
('d0003002-0006-0000-0000-000000000006', 'La anchura, la longitud, la profundidad y la altura', true, 1),
('d0003002-0006-0000-0000-000000000006', 'El pasado, el presente, el futuro y la eternidad', false, 2),
('d0003002-0006-0000-0000-000000000006', 'La fe, la esperanza, el amor y la paciencia', false, 3),
('d0003002-0006-0000-0000-000000000006', 'El cielo, la tierra, el mar y los abismos', false, 4)
ON CONFLICT (id) DO NOTHING;

-- Asociar preguntas Bloque 3.2
INSERT INTO public.assessment_questions (assessment_id, question_id, order_index)
VALUES
('e0000003-0002-0000-0000-000000000002', 'd0003002-0001-0000-0000-000000000001', 1),
('e0000003-0002-0000-0000-000000000002', 'd0003002-0002-0000-0000-000000000002', 2),
('e0000003-0002-0000-0000-000000000002', 'd0003002-0003-0000-0000-000000000003', 3),
('e0000003-0002-0000-0000-000000000002', 'd0003002-0004-0000-0000-000000000004', 4),
('e0000003-0002-0000-0000-000000000002', 'd0003002-0005-0000-0000-000000000005', 5),
('e0000003-0002-0000-0000-000000000002', 'd0003002-0006-0000-0000-000000000006', 6)
ON CONFLICT DO NOTHING;

