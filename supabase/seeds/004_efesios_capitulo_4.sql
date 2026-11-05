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
    'd0004001-0001-0000-0000-000000000001',
    'b0000004-0001-0000-0000-000000000001',
    'c0000000-0000-0000-0000-000000000004',
    'multiple_choice',
    '¿Qué virtudes menciona Pablo en Efesios 4:2 como necesarias para andar como es digno de nuestra vocación?',
    'Efesios 4:2',
    'Efesios 4:2 dice: "con toda humildad y mansedumbre, soportándoos con paciencia los unos a los otros en amor".',
    10, 'easy', 1, true
),
(
    'd0004001-0002-0000-0000-000000000002',
    'b0000004-0001-0000-0000-000000000001',
    'c0000000-0000-0000-0000-000000000004',
    'fill_blank',
    'Completa Efesios 4:3: "solícitos en guardar la unidad del Espíritu en el vínculo de la ________".',
    'Efesios 4:3',
    'Efesios 4:3 concluye: "...en el vínculo de la paz".',
    10, 'easy', 2, true
),
(
    'd0004001-0003-0000-0000-000000000003',
    'b0000004-0001-0000-0000-000000000001',
    'c0000000-0000-0000-0000-000000000004',
    'multiple_choice',
    '¿Cuáles son las tres realidades unificadas que Pablo junta en Efesios 4:5?',
    'Efesios 4:5',
    'Efesios 4:5 declara textualmente: "un Señor, una fe, un bautismo".',
    10, 'easy', 3, true
),
(
    'd0004001-0004-0000-0000-000000000004',
    'b0000004-0001-0000-0000-000000000001',
    'c0000000-0000-0000-0000-000000000004',
    'true_false',
    'Según Efesios 4:6, Dios el Padre es sobre todos, y por todos, y en todos.',
    'Efesios 4:6',
    'Verdadero. Efesios 4:6 expresa la soberanía, acción y presencia de Dios Padre sobre toda su creación redimida.',
    10, 'easy', 4, true
),
(
    'd0004001-0005-0000-0000-000000000005',
    'b0000004-0001-0000-0000-000000000001',
    'c0000000-0000-0000-0000-000000000004',
    'reference_identification',
    '¿En qué versículo de Efesios se encuentra la expresión "un Señor, una fe, un bautismo"?',
    'Efesios 4:5',
    'Esta declaración fundamental se encuentra en Efesios 4:5.',
    10, 'easy', 5, true
),
(
    'd0004001-0006-0000-0000-000000000006',
    'b0000004-0001-0000-0000-000000000001',
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
('d0004001-0001-0000-0000-000000000001', 'Con toda humildad y mansedumbre, soportándoos con paciencia los unos a los otros en amor', true, 1),
('d0004001-0001-0000-0000-000000000001', 'Con elocuencia, riquezas materiales y sabiduría humana', false, 2),
('d0004001-0001-0000-0000-000000000001', 'Con imposición de autoridad militar y fuerza física', false, 3),
('d0004001-0001-0000-0000-000000000001', 'Con aislamiento de la sociedad en conventos', false, 4),

-- q2: fill_blank
('d0004001-0002-0000-0000-000000000002', 'paz', true, 1),

-- q3: multiple_choice
('d0004001-0003-0000-0000-000000000003', 'Un Señor, una fe, un bautismo', true, 1),
('d0004001-0003-0000-0000-000000000003', 'Un templo, un sacerdote, un altar', false, 2),
('d0004001-0003-0000-0000-000000000003', 'Un líder, una nación, un idioma', false, 3),
('d0004001-0003-0000-0000-000000000003', 'Un día de reposo, un sacrificio, una ofrenda', false, 4),

-- q4: true_false
('d0004001-0004-0000-0000-000000000004', 'Verdadero', true, 1),
('d0004001-0004-0000-0000-000000000004', 'Falso', false, 2),

-- q5: reference_identification
('d0004001-0005-0000-0000-000000000005', 'Efesios 4:5', true, 1),
('d0004001-0005-0000-0000-000000000005', 'Efesios 4:1', false, 2),
('d0004001-0005-0000-0000-000000000005', 'Efesios 4:3', false, 3),
('d0004001-0005-0000-0000-000000000005', 'Efesios 4:7', false, 4),

-- q6: multiple_choice
('d0004001-0006-0000-0000-000000000006', 'Preso en el Señor', true, 1),
('d0004001-0006-0000-0000-000000000006', 'Gobernador en Asia', false, 2),
('d0004001-0006-0000-0000-000000000006', 'Profeta de las naciones', false, 3),
('d0004001-0006-0000-0000-000000000006', 'Doctor de la ley judía', false, 4)
ON CONFLICT (id) DO NOTHING;

-- Asociar preguntas Bloque 4.1
INSERT INTO public.assessment_questions (assessment_id, question_id, order_index)
VALUES
('e0000004-0001-0000-0000-000000000001', 'd0004001-0001-0000-0000-000000000001', 1),
('e0000004-0001-0000-0000-000000000001', 'd0004001-0002-0000-0000-000000000002', 2),
('e0000004-0001-0000-0000-000000000001', 'd0004001-0003-0000-0000-000000000003', 3),
('e0000004-0001-0000-0000-000000000001', 'd0004001-0004-0000-0000-000000000004', 4),
('e0000004-0001-0000-0000-000000000001', 'd0004001-0005-0000-0000-000000000005', 5),
('e0000004-0001-0000-0000-000000000001', 'd0004001-0006-0000-0000-000000000006', 6)
ON CONFLICT DO NOTHING;

-- PREGUNTAS BLOQUE 4.2 (Efesios 4:7-16)
INSERT INTO public.questions (id, block_id, chapter_id, question_type, prompt, verse_reference, explanation, points, difficulty, order_index, is_active)
VALUES
(
    'd0004002-0001-0000-0000-000000000001',
    'b0000004-0002-0000-0000-000000000002',
    'c0000000-0000-0000-0000-000000000004',
    'multiple_choice',
    '¿Cuáles son los ministerios que Cristo mismo constituyó en la iglesia según Efesios 4:11?',
    'Efesios 4:11',
    'Efesios 4:11 enumera: "apóstoles, profetas, evangelistas, pastores y maestros".',
    10, 'easy', 1, true
),
(
    'd0004002-0002-0000-0000-000000000002',
    'b0000004-0002-0000-0000-000000000002',
    'c0000000-0000-0000-0000-000000000004',
    'multiple_choice',
    'De acuerdo con Efesios 4:12, ¿cuál es el propósito primordial de los dones ministeriales?',
    'Efesios 4:12',
    'Efesios 4:12 señala: "a fin de perfeccionar a los santos para la obra del ministerio, para la edificación del cuerpo de Cristo".',
    10, 'medium', 2, true
),
(
    'd0004002-0003-0000-0000-000000000003',
    'b0000004-0002-0000-0000-000000000002',
    'c0000000-0000-0000-0000-000000000004',
    'fill_blank',
    'Completa Efesios 4:13: "hasta que todos lleguemos a la unidad de la fe... a la medida de la estatura de la ________ de Cristo".',
    'Efesios 4:13',
    'Efesios 4:13 dice textualmente: "...a la medida de la estatura de la plenitud de Cristo".',
    10, 'medium', 3, true
),
(
    'd0004002-0004-0000-0000-000000000004',
    'b0000004-0002-0000-0000-000000000002',
    'c0000000-0000-0000-0000-000000000004',
    'multiple_choice',
    '¿Qué peligro advierte Pablo que sufrirán quienes permanecen como "niños fluctuantes" según Efesios 4:14?',
    'Efesios 4:14',
    'Advierte que serán "llevados por doquiera de todo viento de doctrina, por estratagema de hombres que para engañar emplean con astucia las artimañas del error".',
    10, 'medium', 4, true
),
(
    'd0004002-0005-0000-0000-000000000005',
    'b0000004-0002-0000-0000-000000000002',
    'c0000000-0000-0000-0000-000000000004',
    'true_false',
    'Efesios 4:15 enseña que el crecimiento del creyente se produce siguiendo la verdad en amor para crecer en Cristo.',
    'Efesios 4:15',
    'Verdadero. Efesios 4:15 declara: "sino que siguiendo la verdad en amor, crezcamos en todo en aquel que es la cabeza, esto es, Cristo".',
    10, 'easy', 5, true
),
(
    'd0004002-0006-0000-0000-000000000006',
    'b0000004-0002-0000-0000-000000000002',
    'c0000000-0000-0000-0000-000000000004',
    'reference_identification',
    '¿En qué versículo de Efesios se encuentra la lista de los cinco ministerios (apóstoles, profetas, evangelistas, pastores y maestros)?',
    'Efesios 4:11',
    'Esta mención se ubica en Efesios 4:11.',
    10, 'easy', 6, true
),
(
    'd0004002-0007-0000-0000-000000000007',
    'b0000004-0002-0000-0000-000000000002',
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
('d0004002-0001-0000-0000-000000000001', 'Apóstoles, profetas, evangelistas, pastores y maestros', true, 1),
('d0004002-0001-0000-0000-000000000001', 'Reyes, generales, sacerdotes y escribas', false, 2),
('d0004002-0001-0000-0000-000000000001', 'Filósofos, oradores, jueces y magistrados', false, 3),
('d0004002-0001-0000-0000-000000000001', 'Levitas, cantores y porteros del templo', false, 4),

-- q2: multiple_choice
('d0004002-0002-0000-0000-000000000002', 'Perfeccionar a los santos para la obra del ministerio, para la edificación del cuerpo de Cristo', true, 1),
('d0004002-0002-0000-0000-000000000002', 'Concentrar todo el gobierno en una sola jerarquía sacerdotal', false, 2),
('d0004002-0002-0000-0000-000000000002', 'Recaudar tributos civiles para la ciudad de Éfeso', false, 3),
('d0004002-0002-0000-0000-000000000002', 'Sustituir la lectura personal de la Biblia por discursos humanos', false, 4),

-- q3: fill_blank
('d0004002-0003-0000-0000-000000000003', 'plenitud', true, 1),

-- q4: multiple_choice
('d0004002-0004-0000-0000-000000000004', 'Ser llevados por doquiera de todo viento de doctrina por artimañas del error', true, 1),
('d0004002-0004-0000-0000-000000000004', 'Perder sus posesiones materiales en el mercado de Éfeso', false, 2),
('d0004002-0004-0000-0000-000000000004', 'Olvidar cómo orar en público', false, 3),
('d0004002-0004-0000-0000-000000000004', 'Enfermar físicamente por falta de alimentos', false, 4),

-- q5: true_false
('d0004002-0005-0000-0000-000000000005', 'Verdadero', true, 1),
('d0004002-0005-0000-0000-000000000005', 'Falso', false, 2),

-- q6: reference_identification
('d0004002-0006-0000-0000-000000000006', 'Efesios 4:11', true, 1),
('d0004002-0006-0000-0000-000000000006', 'Efesios 4:7', false, 2),
('d0004002-0006-0000-0000-000000000006', 'Efesios 4:13', false, 3),
('d0004002-0006-0000-0000-000000000006', 'Efesios 4:16', false, 4),

-- q7: multiple_choice
('d0004002-0007-0000-0000-000000000007', 'Llevó cautiva la cautividad y dio dones a los hombres', true, 1),
('d0004002-0007-0000-0000-000000000007', 'Condenó a todos los habitantes de la tierra', false, 2),
('d0004002-0007-0000-0000-000000000007', 'Exigió ofrendas de oro a los emperadores', false, 3),
('d0004002-0007-0000-0000-000000000007', 'Estableció un ejército terrenal invencible', false, 4)
ON CONFLICT (id) DO NOTHING;

-- Asociar preguntas Bloque 4.2
INSERT INTO public.assessment_questions (assessment_id, question_id, order_index)
VALUES
('e0000004-0002-0000-0000-000000000002', 'd0004002-0001-0000-0000-000000000001', 1),
('e0000004-0002-0000-0000-000000000002', 'd0004002-0002-0000-0000-000000000002', 2),
('e0000004-0002-0000-0000-000000000002', 'd0004002-0003-0000-0000-000000000003', 3),
('e0000004-0002-0000-0000-000000000002', 'd0004002-0004-0000-0000-000000000004', 4),
('e0000004-0002-0000-0000-000000000002', 'd0004002-0005-0000-0000-000000000005', 5),
('e0000004-0002-0000-0000-000000000002', 'd0004002-0006-0000-0000-000000000006', 6),
('e0000004-0002-0000-0000-000000000002', 'd0004002-0007-0000-0000-000000000007', 7)
ON CONFLICT DO NOTHING;

-- PREGUNTAS BLOQUE 4.3 (Efesios 4:17-24)
INSERT INTO public.questions (id, block_id, chapter_id, question_type, prompt, verse_reference, explanation, points, difficulty, order_index, is_active)
VALUES
(
    'd0004003-0001-0000-0000-000000000001',
    'b0000004-0003-0000-0000-000000000003',
    'c0000000-0000-0000-0000-000000000004',
    'multiple_choice',
    'Según Efesios 4:17-18, ¿cómo andan los otros gentiles y qué caracteriza su entendimiento?',
    'Efesios 4:17-18',
    'Efesios 4:17-18 dice: "en la vanidad de su mente, teniendo el entendimiento entenebrecido, ajenos de la vida de Dios por la ignorancia que en ellos hay, por la dureza de su corazón".',
    10, 'easy', 1, true
),
(
    'd0004003-0002-0000-0000-000000000002',
    'b0000004-0003-0000-0000-000000000003',
    'c0000000-0000-0000-0000-000000000004',
    'multiple_choice',
    'De acuerdo con Efesios 4:22, ¿de qué debe despojarse el creyente en cuanto a su pasada manera de vivir?',
    'Efesios 4:22',
    'Efesios 4:22 declara: "despojaos del viejo hombre, que está viciado conforme a los deseos engañosos".',
    10, 'easy', 2, true
),
(
    'd0004003-0003-0000-0000-000000000003',
    'b0000004-0003-0000-0000-000000000003',
    'c0000000-0000-0000-0000-000000000004',
    'fill_blank',
    'Completa Efesios 4:24: "y vestíos del nuevo hombre, creado según Dios en la justicia y ________ de la verdad".',
    'Efesios 4:24',
    'Efesios 4:24 concluye: "...en la justicia y santidad de la verdad".',
    10, 'medium', 3, true
),
(
    'd0004003-0004-0000-0000-000000000004',
    'b0000004-0003-0000-0000-000000000003',
    'c0000000-0000-0000-0000-000000000004',
    'true_false',
    'Efesios 4:23 manda al creyente: "y renovaos en el espíritu de vuestra mente".',
    'Efesios 4:23',
    'Verdadero. La transformación del creyente involucra la renovación interior de sus pensamientos por el Espíritu Santo.',
    10, 'easy', 4, true
),
(
    'd0004003-0005-0000-0000-000000000005',
    'b0000004-0003-0000-0000-000000000003',
    'c0000000-0000-0000-0000-000000000004',
    'reference_identification',
    '¿En qué versículo de Efesios se encuentra la expresión: "despojaos del viejo hombre, que está viciado conforme a los deseos engañosos"?',
    'Efesios 4:22',
    'Esta exhortación se encuentra en Efesios 4:22.',
    10, 'easy', 5, true
),
(
    'd0004003-0006-0000-0000-000000000006',
    'b0000004-0003-0000-0000-000000000003',
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
('d0004003-0001-0000-0000-000000000001', 'En la vanidad de su mente, teniendo el entendimiento entenebrecido y ajenos de la vida de Dios', true, 1),
('d0004003-0001-0000-0000-000000000001', 'En profunda devoción piadosa buscando la verdad', false, 2),
('d0004003-0001-0000-0000-000000000001', 'Guardando los diez mandamientos con rigor moral', false, 3),
('d0004003-0001-0000-0000-000000000001', 'Esperando la redención de Israel con ayunos', false, 4),

-- q2: multiple_choice
('d0004003-0002-0000-0000-000000000002', 'Del viejo hombre, que está viciado conforme a los deseos engañosos', true, 1),
('d0004003-0002-0000-0000-000000000002', 'De sus bienes terrenales y vestiduras físicas', false, 2),
('d0004003-0002-0000-0000-000000000002', 'De sus deberes familiares y laborales', false, 3),
('d0004003-0002-0000-0000-000000000002', 'De sus amistades cristianas en la iglesia', false, 4),

-- q3: fill_blank
('d0004003-0003-0000-0000-000000000003', 'santidad', true, 1),

-- q4: true_false
('d0004003-0004-0000-0000-000000000004', 'Verdadero', true, 1),
('d0004003-0004-0000-0000-000000000004', 'Falso', false, 2),

-- q5: reference_identification
('d0004003-0005-0000-0000-000000000005', 'Efesios 4:22', true, 1),
('d0004003-0005-0000-0000-000000000005', 'Efesios 4:17', false, 2),
('d0004003-0005-0000-0000-000000000005', 'Efesios 4:20', false, 3),
('d0004003-0005-0000-0000-000000000005', 'Efesios 4:24', false, 4),

-- q6: multiple_choice
('d0004003-0006-0000-0000-000000000006', 'Se entregaron a la lascivia para cometer con avidez toda clase de impureza', true, 1),
('d0004003-0006-0000-0000-000000000006', 'Construyeron templos monásticos de retiro', false, 2),
('d0004003-0006-0000-0000-000000000006', 'Buscaron la ayuda de los profetas de Jerusalén', false, 3),
('d0004003-0006-0000-0000-000000000006', 'Decidieron no pecar más por fuerza de voluntad', false, 4)
ON CONFLICT (id) DO NOTHING;

-- Asociar preguntas Bloque 4.3
INSERT INTO public.assessment_questions (assessment_id, question_id, order_index)
VALUES
('e0000004-0003-0000-0000-000000000003', 'd0004003-0001-0000-0000-000000000001', 1),
('e0000004-0003-0000-0000-000000000003', 'd0004003-0002-0000-0000-000000000002', 2),
('e0000004-0003-0000-0000-000000000003', 'd0004003-0003-0000-0000-000000000003', 3),
('e0000004-0003-0000-0000-000000000003', 'd0004003-0004-0000-0000-000000000004', 4),
('e0000004-0003-0000-0000-000000000003', 'd0004003-0005-0000-0000-000000000005', 5),
('e0000004-0003-0000-0000-000000000003', 'd0004003-0006-0000-0000-000000000006', 6)
ON CONFLICT DO NOTHING;

-- PREGUNTAS BLOQUE 4.4 (Efesios 4:25-32)
INSERT INTO public.questions (id, block_id, chapter_id, question_type, prompt, verse_reference, explanation, points, difficulty, order_index, is_active)
VALUES
(
    'd0004004-0001-0000-0000-000000000001',
    'b0000004-0004-0000-0000-000000000004',
    'c0000000-0000-0000-0000-000000000004',
    'multiple_choice',
    'Según Efesios 4:25, ¿por qué razón debemos desechar la mentira y hablar verdad con el prójimo?',
    'Efesios 4:25',
    'Efesios 4:25 responde explícitamente: "...porque somos miembros los unos de los otros".',
    10, 'easy', 1, true
),
(
    'd0004004-0002-0000-0000-000000000002',
    'b0000004-0004-0000-0000-000000000004',
    'c0000000-0000-0000-0000-000000000004',
    'fill_blank',
    'Completa Efesios 4:26: "Airaos, pero no pequéis; no se ponga el ________ sobre vuestro enojo".',
    'Efesios 4:26',
    'Efesios 4:26 dice: "...no se ponga el sol sobre vuestro enojo".',
    10, 'easy', 2, true
),
(
    'd0004004-0003-0000-0000-000000000003',
    'b0000004-0004-0000-0000-000000000004',
    'c0000000-0000-0000-0000-000000000004',
    'multiple_choice',
    '¿Qué debe hacer el que hurtaba según la instrucción redentora de Efesios 4:28?',
    'Efesios 4:28',
    'Efesios 4:28 enseña: "no hurte más, sino trabaje, haciendo con sus manos lo que es bueno, para que tenga qué compartir con el que padece necesidad".',
    10, 'easy', 3, true
),
(
    'd0004004-0004-0000-0000-000000000004',
    'b0000004-0004-0000-0000-000000000004',
    'c0000000-0000-0000-0000-000000000004',
    'multiple_choice',
    '¿Qué advertencia solemne hace Pablo en Efesios 4:30 respecto a la Tercera Persona de la Trinidad?',
    'Efesios 4:30',
    'Efesios 4:30 exhorta: "Y no contristéis al Espíritu Santo de Dios, con el cual fuisteis sellados para el día de la redención".',
    10, 'medium', 4, true
),
(
    'd0004004-0005-0000-0000-000000000005',
    'b0000004-0004-0000-0000-000000000004',
    'c0000000-0000-0000-0000-000000000004',
    'true_false',
    'En Efesios 4:32, el estándar para perdonarnos unos a otros es: "como Dios también os perdonó a vosotros en Cristo".',
    'Efesios 4:32',
    'Verdadero. Ese es el modelo supremo y perfecto de perdón cristiano.',
    10, 'easy', 5, true
),
(
    'd0004004-0006-0000-0000-000000000006',
    'b0000004-0004-0000-0000-000000000004',
    'c0000000-0000-0000-0000-000000000004',
    'reference_identification',
    '¿En qué versículo se encuentra el mandato: "Ninguna palabra corrompida salga de vuestra boca, sino la que sea buena para la necesaria edificación"?',
    'Efesios 4:29',
    'Este principio ético de las palabras se halla en Efesios 4:29.',
    10, 'easy', 6, true
),
(
    'd0004004-0007-0000-0000-000000000007',
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
('d0004004-0001-0000-0000-000000000001', 'Porque somos miembros los unos de los otros', true, 1),
('d0004004-0001-0000-0000-000000000001', 'Para evitar multas de las autoridades civiles', false, 2),
('d0004004-0001-0000-0000-000000000001', 'Porque la mentira disminuye las ventas en el comercio', false, 3),
('d0004004-0001-0000-0000-000000000001', 'Para ganar fama de intelectuales honestos', false, 4),

-- q2: fill_blank
('d0004004-0002-0000-0000-000000000002', 'sol', true, 1),

-- q3: multiple_choice
('d0004004-0003-0000-0000-000000000003', 'No hurte más, sino trabaje con sus manos para tener qué compartir con el necesitado', true, 1),
('d0004004-0003-0000-0000-000000000003', 'Pida limosna en las puertas de la iglesia', false, 2),
('d0004004-0003-0000-0000-000000000003', 'Huya de la ciudad de Éfeso para no ser arrestado', false, 3),
('d0004004-0003-0000-0000-000000000003', 'Haga sacrificios de animales para expiar su culpa', false, 4),

-- q4: multiple_choice
('d0004004-0004-0000-0000-000000000004', 'No contristéis al Espíritu Santo de Dios', true, 1),
('d0004004-0004-0000-0000-000000000004', 'No descuidéis el templo material de Jerusalén', false, 2),
('d0004004-0004-0000-0000-000000000004', 'No discuta con los filósofos griegos', false, 3),
('d0004004-0004-0000-0000-000000000004', 'No viaje en días de tormenta marina', false, 4),

-- q5: true_false
('d0004004-0005-0000-0000-000000000005', 'Verdadero', true, 1),
('d0004004-0005-0000-0000-000000000005', 'Falso', false, 2),

-- q6: reference_identification
('d0004004-0006-0000-0000-000000000006', 'Efesios 4:29', true, 1),
('d0004004-0006-0000-0000-000000000006', 'Efesios 4:25', false, 2),
('d0004004-0006-0000-0000-000000000006', 'Efesios 4:27', false, 3),
('d0004004-0006-0000-0000-000000000006', 'Efesios 4:31', false, 4),

-- q7: multiple_choice
('d0004004-0007-0000-0000-000000000007', 'Toda amargura, enojo, ira, gritería y maledicencia, y toda malicia', true, 1),
('d0004004-0007-0000-0000-000000000007', 'Todo trabajo físico y esfuerzo manual', false, 2),
('d0004004-0007-0000-0000-000000000007', 'Toda conversación con personas inconversas', false, 3),
('d0004004-0007-0000-0000-000000000007', 'Toda alabanza musical en la congregación', false, 4)
ON CONFLICT (id) DO NOTHING;

-- Asociar preguntas Bloque 4.4
INSERT INTO public.assessment_questions (assessment_id, question_id, order_index)
VALUES
('e0000004-0004-0000-0000-000000000004', 'd0004004-0001-0000-0000-000000000001', 1),
('e0000004-0004-0000-0000-000000000004', 'd0004004-0002-0000-0000-000000000002', 2),
('e0000004-0004-0000-0000-000000000004', 'd0004004-0003-0000-0000-000000000003', 3),
('e0000004-0004-0000-0000-000000000004', 'd0004004-0004-0000-0000-000000000004', 4),
('e0000004-0004-0000-0000-000000000004', 'd0004004-0005-0000-0000-000000000005', 5),
('e0000004-0004-0000-0000-000000000004', 'd0004004-0006-0000-0000-000000000006', 6),
('e0000004-0004-0000-0000-000000000004', 'd0004004-0007-0000-0000-000000000007', 7)
ON CONFLICT DO NOTHING;
