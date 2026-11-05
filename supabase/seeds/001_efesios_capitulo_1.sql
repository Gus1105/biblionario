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
