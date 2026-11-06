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
    'Pablo inicia su carta presentándose como apóstol llamado por la voluntad de Dios, y saluda con cariño a los creyentes de Éfeso, deseándoles la gracia y la paz del Señor.',
    '1 Pablo, apóstol de Jesucristo por la voluntad de Dios, a los santos y fieles en Cristo Jesús que están en Éfeso:
2 Gracia y paz a vosotros, de Dios nuestro Padre y del Señor Jesucristo.',
    'En estos dos primeros versículos encontramos tres verdades sencillas e importantes:

1. El llamamiento de Pablo (v. 1):
Pablo no se nombró apóstol a sí mismo ni fue elegido por hombres, sino por la voluntad de Dios. Esto le da a su mensaje la autoridad de parte de Dios y del Espíritu Santo.

2. A quiénes escribe (v. 1):
Escribe a los creyentes de Éfeso, a quienes llama:
- "Santos": apartados para Dios por medio de la salvación en Jesús.
- "Fieles en Cristo Jesús": personas que confían firmemente en el Salvador y perseveran en su fe día a día.
Estar "en Cristo" significa vivir en una relación personal, segura y cercana con Jesús.

3. El saludo de bendición (v. 2):
Pablo les desea "gracia y paz" de parte de Dios nuestro Padre y del Señor Jesucristo. La gracia es el amor inmerecido de Dios que nos salva, y la paz es la tranquilidad y reconciliación con Dios que recibimos gracias a ese amor.',
    '[
        {"concept": "Apóstol", "definition": "Mensajero o enviado especial comisionado con la autoridad de Dios."},
        {"concept": "Santos", "definition": "Personas apartadas para Dios gracias al perdón y la obra de Jesucristo."},
        {"concept": "En Cristo Jesús", "definition": "Expresión que enseña nuestra unión y relación cercana con Jesucristo."},
        {"concept": "Gracia y Paz", "definition": "El favor inmerecido de Dios (gracia) y la profunda tranquilidad en el corazón (paz) que Él nos da."}
    ]'::jsonb,
    '[
        "El ministerio de Pablo proviene de la voluntad de Dios y no de decisiones humanas.",
        "Los creyentes son santos por pertenecer a Dios y fieles por perseverar en su fe en Cristo.",
        "La gracia y el amor de Dios siempre traen verdadera paz a nuestra vida."
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
    'Pablo alaba a Dios Padre con alegría por su plan eterno: habernos bendecido con toda clase de bendiciones espirituales en Cristo y habernos elegido desde antes de la creación del mundo para vivir en santidad.',
    '3 Bendito sea el Dios y Padre de nuestro Señor Jesucristo, que nos bendijo con toda bendición espiritual en los lugares celestiales en Cristo,
4 según nos escogió en él antes de la fundación del mundo, para que fuésemos santos y sin mancha delante de él,
5 en amor habiéndonos predestinado para ser adoptados hijos suyos por medio de Jesucristo, según el puro afecto de su voluntad,
6 para alabanza de la gloria de su gracia, con la cual nos hizo aceptos en el Amado,',
    'Este pasaje explica las grandes bendiciones que Dios preparó para nosotros desde el principio:

1. Alabanza a Dios por sus bendiciones (v. 3):
Pablo comienza alabando y dando gracias a Dios porque Él ya nos ha dado toda bendición espiritual en Cristo. No se trata de cosas materiales temporales, sino de bendiciones eternas que vienen del cielo y nos dan vida espiritual.

2. Dios nos eligió por amor antes de la creación (v. 4):
Antes de crear el mundo, Dios ya pensó en nosotros y nos eligió en Cristo. Su deseo es que vivamos una vida limpia, santa y sin mancha delante de Él.

3. Fuimos adoptados como hijos suyos (v. 5):
Por puro amor y porque así lo quiso, Dios decidió adoptarnos como sus propios hijos por medio de Jesucristo. Esto significa que ahora pertenecemos a su familia y tenemos todos los privilegios y el cuidado de un Padre celestial.

4. El propósito final: Dar gloria a Dios (v. 6):
Todo este maravilloso plan tiene un objetivo: que reconozcamos y alabemos la grandeza del amor y la gracia de Dios, quien nos recibió y aceptó con los brazos abiertos por medio de su amado Hijo Jesús.',
    '[
        {"concept": "Lugares celestiales", "definition": "El reino celestial donde Cristo reina y desde donde Dios nos regala sus bendiciones espirituales."},
        {"concept": "Elección de Dios", "definition": "La decisión llena de amor con la que Dios nos escogió en Cristo antes de crear el mundo."},
        {"concept": "Adopción como hijos", "definition": "El regalo de gracia por el cual Dios nos recibe en su propia familia como sus verdaderos hijos."},
        {"concept": "El Amado", "definition": "Nombre que se refiere a Jesucristo, el Hijo amado en quien el Padre se complace."}
    ]'::jsonb,
    '[
        "Dios ya nos bendijo con toda clase de bendiciones espirituales y eternas en Cristo.",
        "Dios nos eligió antes de crear el mundo para que vivamos en santidad y amor.",
        "Fuimos adoptados como hijos de Dios por su propio amor y voluntad, no por nuestras obras.",
        "El propósito de salvarnos es alabar la maravillosa gracia y bondad de Dios."
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
    'Pablo nos enseña cómo Jesús nos rescató mediante su sangre y cómo el Espíritu Santo asegura nuestra salvación para siempre.',
    '7 en quien tenemos redención por su sangre, el perdón de pecados según las riquezas de su gracia,
8 que hizo sobreabundar para con nosotros en toda sabiduría e inteligencia,
9 dándonos a conocer el misterio de su voluntad, según su beneplácito, el cual se había propuesto en sí mismo,
10 de reunir todas las cosas en Cristo, en la dispensación del cumplimiento de los tiempos, así las que están en los cielos, como las que están en la tierra.
11 En él asimismo tuvimos herencia, habiendo sido predestinados conforme al propósito del que hace todas las cosas según el designio de su voluntad,
12 a fin de que seamos para alabanza de su gloria, nosotros los que primeramente esperábamos en Cristo.
13 En él también vosotros, habiendo oído la palabra de verdad, el evangelio de vuestra salvación, y habiendo creído en él, fuisteis sellados con el Espíritu Santo de la promesa,
14 que es las arras de nuestra herencia hasta la redención de la posesión adquirida, para alabanza de su gloria.',
    'Este pasaje nos muestra las bendiciones prácticas de la salvación en Cristo:

1. El perdón y el rescate por la sangre de Jesús (v. 7-8):
Nuestra libertad del pecado se pagó con la sangre de Cristo en la cruz, recibiendo el perdón de todas nuestras faltas. Dios nos dio este perdón con gran abundancia y sabiduría.

2. El gran plan de Dios para toda la creación (v. 9-10):
Dios nos dio a conocer el secreto de su plan: que en el momento indicado, Él unirá bajo la autoridad y el amor de Cristo todas las cosas, tanto las que están en el cielo como en la tierra.

3. Nuestra herencia eterna (v. 11-12):
En Cristo tenemos una herencia prometida. Dios realiza todas las cosas según su sabio y perfecto plan, para que nuestras vidas sirvan para alabar su gloria.

4. El sello y la promesa del Espíritu Santo (v. 13-14):
Pablo describe los pasos de nuestra salvación:
1) Escuchar el mensaje de la verdad, el evangelio.
2) Creer de corazón en Cristo.
3) Recibir el Espíritu Santo como un sello que confirma que somos de Dios.
El Espíritu Santo es la garantía que Dios nos da de que completará nuestra salvación eterna.',
    '[
        {"concept": "Redención", "definition": "Liberación del pecado y de la condenación, pagada por Cristo con su propia sangre en la cruz."},
        {"concept": "El plan de su voluntad", "definition": "El propósito de Dios revelado en el evangelio: unir y gobernar todas las cosas por medio de Cristo."},
        {"concept": "Sello del Espíritu Santo", "definition": "La marca espiritual de pertenencia, protección y seguridad que Dios pone en el creyente al creer."},
        {"concept": "Arras (Garantía)", "definition": "El anticipo o garantía divina que nos asegura que recibiremos la herencia eterna prometida."}
    ]'::jsonb,
    '[
        "El perdón de nuestros pecados fue pagado con la sangre de Jesucristo.",
        "El propósito supremo de Dios es unir y gobernar todas las cosas bajo Cristo.",
        "Al creer en el evangelio, todo cristiano recibe el Espíritu Santo como sello de que pertenece a Dios.",
        "El Espíritu Santo es la garantía segura de nuestra salvación eterna."
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
    'Pablo ora de corazón para que los creyentes conozcan en su propia vida el inmenso poder de Dios, y declara la autoridad de Cristo sobre todo el universo y sobre la Iglesia.',
    '15 Por esta causa también yo, habiendo oído de vuestra fe en el Señor Jesús, y de vuestro amor para con todos los santos,
16 no ceso de dar gracias por vosotros, haciendo memoria de vosotros en mis oraciones,
17 para que el Dios de nuestro Señor Jesucristo, el Padre de gloria, os dé espíritu de sabiduría y de revelación en el conocimiento de él,
18 alumbrando los ojos de vuestro entendimiento, para que sepáis cuál es la esperanza a que él os ha llamado, y cuáles las riquezas de la gloria de su herencia en los santos,
19 y cuál la supereminente grandeza de su poder para con nosotros los que creemos, según la operación del poder de su fuerza,
20 la cual operó en Cristo, resucitándole de los muertos y sentándole a su diestra en los lugares celestiales,
21 sobre todo principado y autoridad y poder y señorío, y sobre todo nombre que se nombra, no sólo en este siglo, sino también en el venidero;
22 y sometió todas las cosas bajo sus pies, y lo dio por cabeza sobre todas las cosas a la iglesia,
23 la cual es su cuerpo, la plenitud de Aquel que todo lo llena en todo.',
    'Esta hermosa oración muestra lo que Pablo más deseaba para los creyentes:

1. Gratitud por su fe y amor (v. 15-16):
Pablo da gracias a Dios por dos cosas que demuestran una fe viva: la confianza sincera en Jesús y el amor hacia todos los hermanos en la fe.

2. Petición de sabiduría y entendimiento (v. 17-18):
Pablo pide a Dios que abra los ojos de nuestro corazón para que comprendamos:
a) La gloriosa esperanza a la que nos ha llamado.
b) Lo valiosos que somos para Él como su herencia.
c) La grandeza incomparable de su poder a favor de los que creemos.

3. El poder demostrado en la resurrección de Jesús (v. 19-21):
El poder de Dios que actúa en nosotros es el mismo gran poder con el que resucitó a Jesús y lo sentó a su derecha en el cielo, dándole autoridad sobre todo poder, gobierno o título en este mundo o en el venidero.

4. Cristo es la cabeza de la Iglesia (v. 22-23):
Dios puso todo bajo los pies de Jesús y lo nombró cabeza sobre todas las cosas para bien de la Iglesia. La Iglesia es su cuerpo, llena del amor y la presencia de Cristo.',
    '[
        {"concept": "Espíritu de sabiduría", "definition": "La ayuda del Espíritu Santo para entender la verdad de Dios y conocerlo cada día mejor."},
        {"concept": "Ojos del entendimiento", "definition": "La capacidad del corazón para comprender las verdades espirituales de Dios."},
        {"concept": "La grandeza de su poder", "definition": "El inmenso poder de Dios a favor de los creyentes, demostrado al resucitar a Cristo."},
        {"concept": "Cabeza de la Iglesia", "definition": "La posición de máxima autoridad, amor y cuidado que Jesucristo ejerce sobre su Iglesia."}
    ]'::jsonb,
    '[
        "La fe sincera en Jesús se demuestra amando a los demás creyentes.",
        "Para conocer a Dios necesitamos que el Espíritu Santo ilumine y guíe nuestro corazón.",
        "El mismo poder que resucitó a Jesús de los muertos actúa hoy a favor de los creyentes.",
        "Cristo tiene autoridad suprema sobre todas las cosas y cuida con amor a su Iglesia."
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
    'd0001001-0001-0000-0000-000000000001',
    'b0000001-0001-0000-0000-000000000001',
    'c0000000-0000-0000-0000-000000000001',
    'multiple_choice',
    'Según Efesios 1:1, ¿por qué causa o principio fue Pablo apóstol de Jesucristo?',
    'Efesios 1:1',
    'Efesios 1:1 declara explícitamente: "Pablo, apóstol de Jesucristo por la voluntad de Dios". No fue por mérito ni por elección de hombres.',
    10, 'easy', 1, true
),
(
    'd0001001-0002-0000-0000-000000000002',
    'b0000001-0001-0000-0000-000000000001',
    'c0000000-0000-0000-0000-000000000001',
    'multiple_choice',
    '¿Qué dos calificativos utiliza el apóstol Pablo para describir a los destinatarios de su carta en Efesios 1:1?',
    'Efesios 1:1',
    'Pablo se dirige a "los santos y fieles en Cristo Jesús que están en Éfeso".',
    10, 'easy', 2, true
),
(
    'd0001001-0003-0000-0000-000000000003',
    'b0000001-0001-0000-0000-000000000001',
    'c0000000-0000-0000-0000-000000000001',
    'fill_blank',
    'Completa el saludo de Efesios 1:2: "________ y paz a vosotros, de Dios nuestro Padre y del Señor Jesucristo".',
    'Efesios 1:2',
    'El saludo bíblico textual comienza con "Gracia" ("Gracia y paz a vosotros...").',
    10, 'easy', 3, true
),
(
    'd0001001-0004-0000-0000-000000000004',
    'b0000001-0001-0000-0000-000000000001',
    'c0000000-0000-0000-0000-000000000001',
    'true_false',
    'En el saludo apostólico de Efesios 1:2, la paz y la gracia proceden de Dios nuestro Padre y del Señor Jesucristo.',
    'Efesios 1:2',
    'Verdadero. Efesios 1:2 afirma: "...de Dios nuestro Padre y del Señor Jesucristo", colocando a ambos como fuente de la bendición.',
    10, 'easy', 4, true
),
(
    'd0001001-0005-0000-0000-000000000005',
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
('d0001001-0001-0000-0000-000000000001', 'Por la voluntad de Dios', true, 1),
('d0001001-0001-0000-0000-000000000001', 'Por decisión del concilio de Jerusalén', false, 2),
('d0001001-0001-0000-0000-000000000001', 'Por sus propios méritos fariseos', false, 3),
('d0001001-0001-0000-0000-000000000001', 'Por elección de la iglesia de Éfeso', false, 4),

-- q2: multiple_choice
('d0001001-0002-0000-0000-000000000002', 'A los santos y fieles en Cristo Jesús', true, 1),
('d0001001-0002-0000-0000-000000000002', 'A los sabios y entendidos de Asia', false, 2),
('d0001001-0002-0000-0000-000000000002', 'A los discípulos y ancianos de Éfeso', false, 3),
('d0001001-0002-0000-0000-000000000002', 'A los justos y gobernantes de la ciudad', false, 4),

-- q3: fill_blank
('d0001001-0003-0000-0000-000000000003', 'Gracia', true, 1),

-- q4: true_false
('d0001001-0004-0000-0000-000000000004', 'Verdadero', true, 1),
('d0001001-0004-0000-0000-000000000004', 'Falso', false, 2),

-- q5: reference_identification
('d0001001-0005-0000-0000-000000000005', 'Efesios 1:1', true, 1),
('d0001001-0005-0000-0000-000000000005', 'Efesios 1:2', false, 2),
('d0001001-0005-0000-0000-000000000005', 'Efesios 1:3', false, 3),
('d0001001-0005-0000-0000-000000000005', 'Efesios 1:7', false, 4)
ON CONFLICT (id) DO NOTHING;

-- Asociar preguntas de Bloque 1.1 con su evaluación
INSERT INTO public.assessment_questions (assessment_id, question_id, order_index)
VALUES
('e0000001-0001-0000-0000-000000000001', 'd0001001-0001-0000-0000-000000000001', 1),
('e0000001-0001-0000-0000-000000000001', 'd0001001-0002-0000-0000-000000000002', 2),
('e0000001-0001-0000-0000-000000000001', 'd0001001-0003-0000-0000-000000000003', 3),
('e0000001-0001-0000-0000-000000000001', 'd0001001-0004-0000-0000-000000000004', 4),
('e0000001-0001-0000-0000-000000000001', 'd0001001-0005-0000-0000-000000000005', 5)
ON CONFLICT DO NOTHING;

-- PREGUNTAS BLOQUE 1.2 (Efesios 1:3-6)
INSERT INTO public.questions (id, block_id, chapter_id, question_type, prompt, verse_reference, explanation, points, difficulty, order_index, is_active)
VALUES
(
    'd0001002-0001-0000-0000-000000000001',
    'b0000001-0002-0000-0000-000000000002',
    'c0000000-0000-0000-0000-000000000001',
    'multiple_choice',
    'Según Efesios 1:3, ¿con qué clase de bendiciones nos ha bendecido Dios y en qué ámbito?',
    'Efesios 1:3',
    'Efesios 1:3 señala que nos bendijo con "toda bendición espiritual en los lugares celestiales en Cristo".',
    10, 'easy', 1, true
),
(
    'd0001002-0002-0000-0000-000000000002',
    'b0000001-0002-0000-0000-000000000002',
    'c0000000-0000-0000-0000-000000000001',
    'multiple_choice',
    '¿Cuándo escogió Dios a los creyentes en Cristo según Efesios 1:4?',
    'Efesios 1:4',
    'El texto declara: "según nos escogió en él antes de la fundación del mundo".',
    10, 'easy', 2, true
),
(
    'd0001002-0003-0000-0000-000000000003',
    'b0000001-0002-0000-0000-000000000002',
    'c0000000-0000-0000-0000-000000000001',
    'fill_blank',
    'Completa el versículo de Efesios 1:4: "para que fuésemos santos y sin ________ delante de él".',
    'Efesios 1:4',
    'Efesios 1:4 dice: "para que fuésemos santos y sin mancha delante de él".',
    10, 'medium', 3, true
),
(
    'd0001002-0004-0000-0000-000000000004',
    'b0000001-0002-0000-0000-000000000002',
    'c0000000-0000-0000-0000-000000000001',
    'multiple_choice',
    'De acuerdo con Efesios 1:5, ¿para qué fuimos predestinados en amor y según qué criterio?',
    'Efesios 1:5',
    'Efesios 1:5 indica: "para ser adoptados hijos suyos por medio de Jesucristo, según el puro afecto de su voluntad".',
    10, 'medium', 4, true
),
(
    'd0001002-0005-0000-0000-000000000005',
    'b0000001-0002-0000-0000-000000000002',
    'c0000000-0000-0000-0000-000000000001',
    'true_false',
    'Efesios 1:6 enseña que fuimos hechos aceptos en el Amado para alabanza de la gloria de su gracia.',
    'Efesios 1:6',
    'Verdadero. Efesios 1:6 afirma textualmente: "para alabanza de la gloria de su gracia, con la cual nos hizo aceptos en el Amado".',
    10, 'easy', 5, true
),
(
    'd0001002-0006-0000-0000-000000000006',
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
('d0001002-0001-0000-0000-000000000001', 'Con toda bendición espiritual en los lugares celestiales en Cristo', true, 1),
('d0001002-0001-0000-0000-000000000001', 'Con riquezas materiales en la tierra prometida', false, 2),
('d0001002-0001-0000-0000-000000000001', 'Con bendiciones temporales según la ley de Moisés', false, 3),
('d0001002-0001-0000-0000-000000000001', 'Con honra terrenal y poder sobre las naciones', false, 4),

-- q2: multiple_choice
('d0001002-0002-0000-0000-000000000002', 'Antes de la fundación del mundo', true, 1),
('d0001002-0002-0000-0000-000000000002', 'Al momento de bautizarnos en agua', false, 2),
('d0001002-0002-0000-0000-000000000002', 'Cuando el hombre demostró hacer buenas obras', false, 3),
('d0001002-0002-0000-0000-000000000002', 'Durante el ministerio terrenal de los apóstoles', false, 4),

-- q3: fill_blank
('d0001002-0003-0000-0000-000000000003', 'mancha', true, 1),

-- q4: multiple_choice
('d0001002-0004-0000-0000-000000000004', 'Para ser adoptados hijos suyos por medio de Jesucristo, según el puro afecto de su voluntad', true, 1),
('d0001002-0004-0000-0000-000000000004', 'Para ser siervos bajo el yugo de la condenación legal', false, 2),
('d0001002-0004-0000-0000-000000000004', 'Para gobernar Éfeso según las leyes del imperio romano', false, 3),
('d0001002-0004-0000-0000-000000000004', 'Para recibir dones sin necesidad de santidad', false, 4),

-- q5: true_false
('d0001002-0005-0000-0000-000000000005', 'Verdadero', true, 1),
('d0001002-0005-0000-0000-000000000005', 'Falso', false, 2),

-- q6: reference_identification
('d0001002-0006-0000-0000-000000000006', 'Efesios 1:6', true, 1),
('d0001002-0006-0000-0000-000000000006', 'Efesios 1:3', false, 2),
('d0001002-0006-0000-0000-000000000006', 'Efesios 1:4', false, 3),
('d0001002-0006-0000-0000-000000000006', 'Efesios 1:5', false, 4)
ON CONFLICT (id) DO NOTHING;

-- Asociar preguntas Bloque 1.2
INSERT INTO public.assessment_questions (assessment_id, question_id, order_index)
VALUES
('e0000001-0002-0000-0000-000000000002', 'd0001002-0001-0000-0000-000000000001', 1),
('e0000001-0002-0000-0000-000000000002', 'd0001002-0002-0000-0000-000000000002', 2),
('e0000001-0002-0000-0000-000000000002', 'd0001002-0003-0000-0000-000000000003', 3),
('e0000001-0002-0000-0000-000000000002', 'd0001002-0004-0000-0000-000000000004', 4),
('e0000001-0002-0000-0000-000000000002', 'd0001002-0005-0000-0000-000000000005', 5),
('e0000001-0002-0000-0000-000000000002', 'd0001002-0006-0000-0000-000000000006', 6)
ON CONFLICT DO NOTHING;

-- PREGUNTAS BLOQUE 1.3 (Efesios 1:7-14)
INSERT INTO public.questions (id, block_id, chapter_id, question_type, prompt, verse_reference, explanation, points, difficulty, order_index, is_active)
VALUES
(
    'd0001003-0001-0000-0000-000000000001',
    'b0000001-0003-0000-0000-000000000003',
    'c0000000-0000-0000-0000-000000000001',
    'multiple_choice',
    'Según Efesios 1:7, ¿a través de qué medio tenemos redención y el perdón de pecados?',
    'Efesios 1:7',
    'Efesios 1:7 afirma: "en quien tenemos redención por su sangre, el perdón de pecados según las riquezas de su gracia".',
    10, 'easy', 1, true
),
(
    'd0001003-0002-0000-0000-000000000002',
    'b0000001-0003-0000-0000-000000000003',
    'c0000000-0000-0000-0000-000000000001',
    'multiple_choice',
    '¿Cuál es el misterio de la voluntad de Dios que se propuso para la dispensación del cumplimiento de los tiempos (Efesios 1:9-10)?',
    'Efesios 1:9-10',
    'Efesios 1:10 declara: "de reunir todas las cosas en Cristo... así las que están en los cielos, como las que están en la tierra".',
    10, 'medium', 2, true
),
(
    'd0001003-0003-0000-0000-000000000003',
    'b0000001-0003-0000-0000-000000000003',
    'c0000000-0000-0000-0000-000000000001',
    'fill_blank',
    'Completa Efesios 1:13: "y habiendo creído en él, fuisteis ________ con el Espíritu Santo de la promesa".',
    'Efesios 1:13',
    'Efesios 1:13 dice textualmente: "...fuisteis sellados con el Espíritu Santo de la promesa".',
    10, 'medium', 3, true
),
(
    'd0001003-0004-0000-0000-000000000004',
    'b0000001-0003-0000-0000-000000000003',
    'c0000000-0000-0000-0000-000000000001',
    'multiple_choice',
    '¿Qué función cumple el Espíritu Santo respecto a nuestra herencia según Efesios 1:14?',
    'Efesios 1:14',
    'Efesios 1:14 enseña que el Espíritu Santo "es las arras de nuestra herencia hasta la redención de la posesión adquirida".',
    10, 'medium', 4, true
),
(
    'd0001003-0005-0000-0000-000000000005',
    'b0000001-0003-0000-0000-000000000003',
    'c0000000-0000-0000-0000-000000000001',
    'true_false',
    'Según Efesios 1:13, el sello del Espíritu Santo se recibe después de haber oído la palabra de verdad y haber creído en Cristo.',
    'Efesios 1:13',
    'Verdadero. El texto dice: "habiendo oído la palabra de verdad... y habiendo creído en él, fuisteis sellados...".',
    10, 'easy', 5, true
),
(
    'd0001003-0006-0000-0000-000000000006',
    'b0000001-0003-0000-0000-000000000003',
    'c0000000-0000-0000-0000-000000000001',
    'reference_identification',
    '¿En qué versículo se encuentra la afirmación "en quien tenemos redención por su sangre, el perdón de pecados"?',
    'Efesios 1:7',
    'Esta afirmación central de la expiación se ubica en Efesios 1:7.',
    10, 'easy', 6, true
),
(
    'd0001003-0007-0000-0000-000000000007',
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
('d0001003-0001-0000-0000-000000000001', 'Por su sangre', true, 1, null),
('d0001003-0001-0000-0000-000000000001', 'Por nuestras buenas obras', false, 2, null),
('d0001003-0001-0000-0000-000000000001', 'Por sacrificios de la ley ceremonial', false, 3, null),
('d0001003-0001-0000-0000-000000000001', 'Por cumplir las tradiciones religiosas', false, 4, null),

-- q2: multiple_choice
('d0001003-0002-0000-0000-000000000002', 'Reunir todas las cosas en Cristo, en los cielos y en la tierra', true, 1, null),
('d0001003-0002-0000-0000-000000000002', 'Restaurar el templo material de Jerusalén', false, 2, null),
('d0001003-0002-0000-0000-000000000002', 'Destruir a todas las naciones gentiles', false, 3, null),
('d0001003-0002-0000-0000-000000000002', 'Separar a los creyentes en dos pueblos distintos', false, 4, null),

-- q3: fill_blank
('d0001003-0003-0000-0000-000000000003', 'sellados', true, 1, null),

-- q4: multiple_choice
('d0001003-0004-0000-0000-000000000004', 'Es las arras de nuestra herencia hasta la redención de la posesión adquirida', true, 1, null),
('d0001003-0004-0000-0000-000000000004', 'Un testigo acusador de nuestras faltas diarias', false, 2, null),
('d0001003-0004-0000-0000-000000000004', 'Una señal visible temporal que caduca en la muerte', false, 3, null),
('d0001003-0004-0000-0000-000000000004', 'Un premio exclusivo para los apóstoles', false, 4, null),

-- q5: true_false
('d0001003-0005-0000-0000-000000000005', 'Verdadero', true, 1, null),
('d0001003-0005-0000-0000-000000000005', 'Falso', false, 2, null),

-- q6: reference_identification
('d0001003-0006-0000-0000-000000000006', 'Efesios 1:7', true, 1, null),
('d0001003-0006-0000-0000-000000000006', 'Efesios 1:11', false, 2, null),
('d0001003-0006-0000-0000-000000000006', 'Efesios 1:13', false, 3, null),
('d0001003-0006-0000-0000-000000000006', 'Efesios 1:15', false, 4, null),

-- q7: order_events
('d0001003-0007-0000-0000-000000000007', 'Habiendo oído la palabra de verdad (el evangelio)', true, 1, 1),
('d0001003-0007-0000-0000-000000000007', 'Habiendo creído en Cristo', true, 2, 2),
('d0001003-0007-0000-0000-000000000007', 'Fuisteis sellados con el Espíritu Santo de la promesa', true, 3, 3)
ON CONFLICT (id) DO NOTHING;

-- Asociar preguntas Bloque 1.3
INSERT INTO public.assessment_questions (assessment_id, question_id, order_index)
VALUES
('e0000001-0003-0000-0000-000000000003', 'd0001003-0001-0000-0000-000000000001', 1),
('e0000001-0003-0000-0000-000000000003', 'd0001003-0002-0000-0000-000000000002', 2),
('e0000001-0003-0000-0000-000000000003', 'd0001003-0003-0000-0000-000000000003', 3),
('e0000001-0003-0000-0000-000000000003', 'd0001003-0004-0000-0000-000000000004', 4),
('e0000001-0003-0000-0000-000000000003', 'd0001003-0005-0000-0000-000000000005', 5),
('e0000001-0003-0000-0000-000000000003', 'd0001003-0006-0000-0000-000000000006', 6),
('e0000001-0003-0000-0000-000000000003', 'd0001003-0007-0000-0000-000000000007', 7)
ON CONFLICT DO NOTHING;

-- PREGUNTAS BLOQUE 1.4 (Efesios 1:15-23)
INSERT INTO public.questions (id, block_id, chapter_id, question_type, prompt, verse_reference, explanation, points, difficulty, order_index, is_active)
VALUES
(
    'd0001004-0001-0000-0000-000000000001',
    'b0000001-0004-0000-0000-000000000004',
    'c0000000-0000-0000-0000-000000000001',
    'multiple_choice',
    '¿Por qué dos virtudes de los efesios Pablo no cesa de dar gracias a Dios en Efesios 1:15-16?',
    'Efesios 1:15-16',
    'Efesios 1:15 menciona: "habiendo oído de vuestra fe en el Señor Jesús, y de vuestro amor para con todos los santos".',
    10, 'easy', 1, true
),
(
    'd0001004-0002-0000-0000-000000000002',
    'b0000001-0004-0000-0000-000000000004',
    'c0000000-0000-0000-0000-000000000001',
    'multiple_choice',
    '¿Qué pide Pablo que Dios dé a los creyentes según Efesios 1:17?',
    'Efesios 1:17',
    'Efesios 1:17 ruega: "os dé espíritu de sabiduría y de revelación en el conocimiento de él".',
    10, 'medium', 2, true
),
(
    'd0001004-0003-0000-0000-000000000003',
    'b0000001-0004-0000-0000-000000000004',
    'c0000000-0000-0000-0000-000000000001',
    'fill_blank',
    'Completa Efesios 1:18: "alumbrando los ojos de vuestro ________, para que sepáis cuál es la esperanza a que él os ha llamado".',
    'Efesios 1:18',
    'El texto bíblico dice textualmente: "alumbrando los ojos de vuestro entendimiento...".',
    10, 'medium', 3, true
),
(
    'd0001004-0004-0000-0000-000000000004',
    'b0000001-0004-0000-0000-000000000004',
    'c0000000-0000-0000-0000-000000000001',
    'multiple_choice',
    '¿En qué acontecimiento histórico supremo operó Dios la supereminente grandeza de su poder según Efesios 1:20?',
    'Efesios 1:20',
    'Efesios 1:20 declara: "la cual operó en Cristo, resucitándole de los muertos y sentándole a su diestra en los lugares celestiales".',
    10, 'medium', 4, true
),
(
    'd0001004-0005-0000-0000-000000000005',
    'b0000001-0004-0000-0000-000000000004',
    'c0000000-0000-0000-0000-000000000001',
    'multiple_choice',
    'Según Efesios 1:22, ¿a quién dio Dios por cabeza sobre todas las cosas y para qué entidad?',
    'Efesios 1:22',
    'Efesios 1:22 dice: "y sometió todas las cosas bajo sus pies, y lo dio por cabeza sobre todas las cosas a la iglesia".',
    10, 'easy', 5, true
),
(
    'd0001004-0006-0000-0000-000000000004',
    'b0000001-0004-0000-0000-000000000004',
    'c0000000-0000-0000-0000-000000000001',
    'true_false',
    'Efesios 1:23 define a la iglesia como el cuerpo de Cristo, la plenitud de Aquel que todo lo llena en todo.',
    'Efesios 1:23',
    'Verdadero. Efesios 1:23 concluye diciendo: "la cual es su cuerpo, la plenitud de Aquel que todo lo llena en todo".',
    10, 'easy', 6, true
),
(
    'd0001004-0007-0000-0000-000000000004',
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
('d0001004-0001-0000-0000-000000000001', 'De su fe en el Señor Jesús y de su amor para con todos los santos', true, 1),
('d0001004-0001-0000-0000-000000000001', 'De sus riquezas y de su posición social en Éfeso', false, 2),
('d0001004-0001-0000-0000-000000000001', 'De su habilidad retórica y conocimiento filosófico', false, 3),
('d0001004-0001-0000-0000-000000000001', 'De la cantidad de miembros que asistían a sus reuniones', false, 4),

-- q2: multiple_choice
('d0001004-0002-0000-0000-000000000002', 'Espíritu de sabiduría y de revelación en el conocimiento de él', true, 1),
('d0001004-0002-0000-0000-000000000002', 'Bienes materiales para no padecer necesidad', false, 2),
('d0001004-0002-0000-0000-000000000002', 'Poder político para derrotar a los gobernantes romanos', false, 3),
('d0001004-0002-0000-0000-000000000002', 'Visión profética sobre el fin de Éfeso', false, 4),

-- q3: fill_blank
('d0001004-0003-0000-0000-000000000003', 'entendimiento', true, 1),

-- q4: multiple_choice
('d0001004-0004-0000-0000-000000000004', 'Resucitándole de los muertos y sentándole a su diestra en los lugares celestiales', true, 1),
('d0001004-0004-0000-0000-000000000004', 'Multiplicando los panes y los peces en Galilea', false, 2),
('d0001004-0004-0000-0000-000000000004', 'Derribando los muros de Jericó', false, 3),
('d0001004-0004-0000-0000-000000000004', 'Abriendo el mar Rojo ante Moisés', false, 4),

-- q5: multiple_choice
('d0001004-0005-0000-0000-000000000005', 'A Cristo, como cabeza sobre todas las cosas a la iglesia', true, 1),
('d0001004-0005-0000-0000-000000000005', 'A Pedro, como cabeza universal de la cristiandad', false, 2),
('d0001004-0005-0000-0000-000000000005', 'A los ángeles, como gobernantes de las iglesias locales', false, 3),
('d0001004-0005-0000-0000-000000000005', 'Al emperador de Roma, como protector de la religión', false, 4),

-- q6: true_false
('d0001004-0006-0000-0000-000000000004', 'Verdadero', true, 1),
('d0001004-0006-0000-0000-000000000004', 'Falso', false, 2),

-- q7: reference_identification
('d0001004-0007-0000-0000-000000000004', 'Efesios 1:21', true, 1),
('d0001004-0007-0000-0000-000000000004', 'Efesios 1:16', false, 2),
('d0001004-0007-0000-0000-000000000004', 'Efesios 1:18', false, 3),
('d0001004-0007-0000-0000-000000000004', 'Efesios 1:19', false, 4)
ON CONFLICT (id) DO NOTHING;

-- Asociar preguntas Bloque 1.4
INSERT INTO public.assessment_questions (assessment_id, question_id, order_index)
VALUES
('e0000001-0004-0000-0000-000000000004', 'd0001004-0001-0000-0000-000000000001', 1),
('e0000001-0004-0000-0000-000000000004', 'd0001004-0002-0000-0000-000000000002', 2),
('e0000001-0004-0000-0000-000000000004', 'd0001004-0003-0000-0000-000000000003', 3),
('e0000001-0004-0000-0000-000000000004', 'd0001004-0004-0000-0000-000000000004', 4),
('e0000001-0004-0000-0000-000000000004', 'd0001004-0005-0000-0000-000000000005', 5),
('e0000001-0004-0000-0000-000000000004', 'd0001004-0006-0000-0000-000000000004', 6),
('e0000001-0004-0000-0000-000000000004', 'd0001004-0007-0000-0000-000000000004', 7)
ON CONFLICT DO NOTHING;
