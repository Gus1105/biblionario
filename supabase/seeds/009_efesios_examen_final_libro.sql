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
    'Esta gloriosa alabanza se ubica en Efesios 3:20.',
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
    'f0000000-0000-0000-0000-000000000048',
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
    'order_events',
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
('f0000000-0000-0000-0000-000000000050', 'Bendiciones celestiales y la soberanía de Cristo', true, 1),
('f0000000-0000-0000-0000-000000000050', 'De muerte a vida: salvos por gracia y reconciliados en la cruz', true, 2),
('f0000000-0000-0000-0000-000000000050', 'El misterio de los gentiles y la multiforme sabiduría de Dios', true, 3),
('f0000000-0000-0000-0000-000000000050', 'La armadura de Dios, guerra espiritual y perseverancia', true, 4)
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
