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
  a) "Disciplina": enseñanza con amor, corrección paciente y buen ejemplo en los caminos del Señor.
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
Inspirado por el soldado romano encadenado a él y por profecías mesiánicas de Isaías, Pablo describe la armadura completa de Dios:
a) El cinturón de la verdad (v. 14a): ceñirse con la verdad objetiva de la Palabra y la sinceridad interior.
b) La coraza de justicia (v. 14b): protege el corazón; la justicia imputada de Cristo y una vida diaria de integridad moral.
c) El calzado del apresto del evangelio de la paz (v. 15): pies firmes y dispuestos a proclamar la paz de Cristo.
d) El escudo de la fe (v. 16): el gran escudo que cubría todo el cuerpo para apagar las flechas incendiadas del maligno (dudas, temores, tentaciones impuras).
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
        {"concept": "Amor inalterable", "definition": "Un amor sincero, puro y constante hacia nuestro Señor Jesucristo, que nunca se apaga."}
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
    'd0006001-0001-0000-0000-000000000001',
    'b0000006-0001-0000-0000-000000000001',
    'c0000000-0000-0000-0000-000000000006',
    'multiple_choice',
    'Según Efesios 6:1, ¿a quién deben obedecer los hijos en el Señor y por qué causa?',
    'Efesios 6:1',
    'Efesios 6:1 dice textualmente: "Hijos, obedeced en el Señor a vuestros padres, porque esto es justo".',
    10, 'easy', 1, true
),
(
    'd0006001-0002-0000-0000-000000000002',
    'b0000006-0001-0000-0000-000000000001',
    'c0000000-0000-0000-0000-000000000006',
    'fill_blank',
    'Completa Efesios 6:2: "Honra a tu padre y a tu madre, que es el primer mandamiento con ________".',
    'Efesios 6:2',
    'Efesios 6:2 afirma: "...que es el primer mandamiento con promesa".',
    10, 'easy', 2, true
),
(
    'd0006001-0003-0000-0000-000000000003',
    'b0000006-0001-0000-0000-000000000001',
    'c0000000-0000-0000-0000-000000000006',
    'multiple_choice',
    '¿Cuál es la doble promesa asociada a honrar a padre y madre según Efesios 6:3?',
    'Efesios 6:3',
    'Efesios 6:3 declara: "para que te vaya bien, y seas de larga vida sobre la tierra".',
    10, 'easy', 3, true
),
(
    'd0006001-0004-0000-0000-000000000004',
    'b0000006-0001-0000-0000-000000000001',
    'c0000000-0000-0000-0000-000000000006',
    'multiple_choice',
    '¿Qué instrucción negativa y qué mandato positivo da Pablo a los padres en Efesios 6:4?',
    'Efesios 6:4',
    'Efesios 6:4 manda: "no provoquéis a ira a vuestros hijos, sino criadlos en disciplina y amonestación del Señor".',
    10, 'medium', 4, true
),
(
    'd0006001-0005-0000-0000-000000000005',
    'b0000006-0001-0000-0000-000000000001',
    'c0000000-0000-0000-0000-000000000006',
    'true_false',
    'Efesios 6:4 permite a los padres ser ásperos y humillar a sus hijos si estos no obedecen sus mandatos.',
    'Efesios 6:4',
    'Falso. Efesios 6:4 prohíbe explícitamente: "no provoquéis a ira a vuestros hijos".',
    10, 'easy', 5, true
),
(
    'd0006001-0006-0000-0000-000000000006',
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
('d0006001-0001-0000-0000-000000000001', 'A sus padres, porque esto es justo', true, 1),
('d0006001-0001-0000-0000-000000000001', 'A los magistrados de Éfeso para no pagar impuestos', false, 2),
('d0006001-0001-0000-0000-000000000001', 'A los soldados romanos por miedo al castigo', false, 3),
('d0006001-0001-0000-0000-000000000001', 'A sus amigos para tener popularidad', false, 4),

-- q2: fill_blank
('d0006001-0002-0000-0000-000000000002', 'promesa', true, 1),

-- q3: multiple_choice
('d0006001-0003-0000-0000-000000000003', 'Para que te vaya bien y seas de larga vida sobre la tierra', true, 1),
('d0006001-0003-0000-0000-000000000003', 'Para que heredes tierras de oro en Roma', false, 2),
('d0006001-0003-0000-0000-000000000003', 'Para que nunca experimentes ninguna enfermedad física', false, 3),
('d0006001-0003-0000-0000-000000000003', 'Para que seas nombrado gobernante de tu ciudad', false, 4),

-- q4: multiple_choice
('d0006001-0004-0000-0000-000000000004', 'No provoquéis a ira a vuestros hijos, sino criadlos en disciplina y amonestación del Señor', true, 1),
('d0006001-0004-0000-0000-000000000004', 'Dejad a vuestros hijos en libertad absoluta sin ninguna corrección', false, 2),
('d0006001-0004-0000-0000-000000000004', 'Enviad a vuestros hijos a los cuarteles militares de Roma', false, 3),
('d0006001-0004-0000-0000-000000000004', 'Exigidles que trabajen desde pequeños para enriquecer el hogar', false, 4),

-- q5: true_false
('d0006001-0005-0000-0000-000000000005', 'Verdadero', false, 1),
('d0006001-0005-0000-0000-000000000005', 'Falso', true, 2),

-- q6: reference_identification
('d0006001-0006-0000-0000-000000000006', 'Efesios 6:2', true, 1),
('d0006001-0006-0000-0000-000000000006', 'Efesios 6:1', false, 2),
('d0006001-0006-0000-0000-000000000006', 'Efesios 6:3', false, 3),
('d0006001-0006-0000-0000-000000000006', 'Efesios 6:4', false, 4)
ON CONFLICT (id) DO NOTHING;

-- Asociar preguntas Bloque 6.1
INSERT INTO public.assessment_questions (assessment_id, question_id, order_index)
VALUES
('e0000006-0001-0000-0000-000000000001', 'd0006001-0001-0000-0000-000000000001', 1),
('e0000006-0001-0000-0000-000000000001', 'd0006001-0002-0000-0000-000000000002', 2),
('e0000006-0001-0000-0000-000000000001', 'd0006001-0003-0000-0000-000000000003', 3),
('e0000006-0001-0000-0000-000000000001', 'd0006001-0004-0000-0000-000000000004', 4),
('e0000006-0001-0000-0000-000000000001', 'd0006001-0005-0000-0000-000000000005', 5),
('e0000006-0001-0000-0000-000000000001', 'd0006001-0006-0000-0000-000000000006', 6)
ON CONFLICT DO NOTHING;

-- PREGUNTAS BLOQUE 6.2 (Efesios 6:5-9)
INSERT INTO public.questions (id, block_id, chapter_id, question_type, prompt, verse_reference, explanation, points, difficulty, order_index, is_active)
VALUES
(
    'd0006002-0001-0000-0000-000000000001',
    'b0000006-0002-0000-0000-000000000002',
    'c0000000-0000-0000-0000-000000000006',
    'multiple_choice',
    '¿Cómo deben obedecer los siervos a sus amos terrenales según Efesios 6:5-6?',
    'Efesios 6:5-6',
    'Efesios 6:5-6 indica: "con temor y temblor, con sencillez de vuestro corazón, como a Cristo; no sirviendo al ojo, como los que quieren agradar a los hombres, sino como siervos de Cristo, de corazón haciendo la voluntad de Dios".',
    10, 'easy', 1, true
),
(
    'd0006002-0002-0000-0000-000000000002',
    'b0000006-0002-0000-0000-000000000002',
    'c0000000-0000-0000-0000-000000000006',
    'fill_blank',
    'Completa Efesios 6:7: "sirviendo de buena voluntad, como al ________ y no a los hombres".',
    'Efesios 6:7',
    'Efesios 6:7 dice: "...como al Señor y no a los hombres".',
    10, 'easy', 2, true
),
(
    'd0006002-0003-0000-0000-000000000003',
    'b0000006-0002-0000-0000-000000000002',
    'c0000000-0000-0000-0000-000000000006',
    'multiple_choice',
    '¿Qué deben dejar los amos hacia sus siervos según Efesios 6:9?',
    'Efesios 6:9',
    'Efesios 6:9 manda: "Y vosotros, amos, haced con ellos lo mismo, dejando las amenazas...".',
    10, 'easy', 3, true
),
(
    'd0006002-0004-0000-0000-000000000004',
    'b0000006-0002-0000-0000-000000000002',
    'c0000000-0000-0000-0000-000000000006',
    'true_false',
    'Efesios 6:9 concluye afirmando que para con Dios no hay acepción de personas.',
    'Efesios 6:9',
    'Verdadero. Dios juzga a amos y siervos sin favoritismos terrenales.',
    10, 'easy', 4, true
),
(
    'd0006002-0005-0000-0000-000000000005',
    'b0000006-0002-0000-0000-000000000002',
    'c0000000-0000-0000-0000-000000000006',
    'reference_identification',
    '¿En qué versículo se encuentra la amonestación: "no sirviendo al ojo, como los que quieren agradar a los hombres, sino como siervos de Cristo"?',
    'Efesios 6:6',
    'Esta regla contra la apariencia laboral está en Efesios 6:6.',
    10, 'easy', 5, true
),
(
    'd0006002-0006-0000-0000-000000000006',
    'b0000006-0002-0000-0000-000000000002',
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
('d0006002-0001-0000-0000-000000000001', 'Con temor y temblor, con sencillez de corazón, como a Cristo; no sirviendo al ojo', true, 1),
('d0006002-0001-0000-0000-000000000001', 'Con desgano y quejas constantes en el trabajo', false, 2),
('d0006002-0001-0000-0000-000000000001', 'Trabajando únicamente cuando el amo está ausente', false, 3),
('d0006002-0001-0000-0000-000000000001', 'Haciendo huelgas y desórdenes civiles en la ciudad', false, 4),

-- q2: fill_blank
('d0006002-0002-0000-0000-000000000002', 'Señor', true, 1),

-- q3: multiple_choice
('d0006002-0003-0000-0000-000000000003', 'Dejando las amenazas', true, 1),
('d0006002-0003-0000-0000-000000000003', 'Imponiendo más castigos físicos', false, 2),
('d0006002-0003-0000-0000-000000000003', 'Exigiendo jornadas dobles de trabajo', false, 3),
('d0006002-0003-0000-0000-000000000003', 'Reteniendo los alimentos de los siervos', false, 4),

-- q4: true_false
('d0006002-0004-0000-0000-000000000004', 'Verdadero', true, 1),
('d0006002-0004-0000-0000-000000000004', 'Falso', false, 2),

-- q5: reference_identification
('d0006002-0005-0000-0000-000000000005', 'Efesios 6:6', true, 1),
('d0006002-0005-0000-0000-000000000005', 'Efesios 6:5', false, 2),
('d0006002-0005-0000-0000-000000000005', 'Efesios 6:7', false, 3),
('d0006002-0005-0000-0000-000000000005', 'Efesios 6:8', false, 4),

-- q6: multiple_choice
('d0006002-0006-0000-0000-000000000006', 'Que el bien que cada uno hiciere, ése recibirá del Señor', true, 1),
('d0006002-0006-0000-0000-000000000006', 'Que el amo terrenal puede arrebatarle su herencia celestial', false, 2),
('d0006002-0006-0000-0000-000000000006', 'Que los siervos no recibirán ninguna recompensa divina', false, 3),
('d0006002-0006-0000-0000-000000000006', 'Que el trabajo manual carece de valor ante Dios', false, 4)
ON CONFLICT (id) DO NOTHING;

-- Asociar preguntas Bloque 6.2
INSERT INTO public.assessment_questions (assessment_id, question_id, order_index)
VALUES
('e0000006-0002-0000-0000-000000000002', 'd0006002-0001-0000-0000-000000000001', 1),
('e0000006-0002-0000-0000-000000000002', 'd0006002-0002-0000-0000-000000000002', 2),
('e0000006-0002-0000-0000-000000000002', 'd0006002-0003-0000-0000-000000000003', 3),
('e0000006-0002-0000-0000-000000000002', 'd0006002-0004-0000-0000-000000000004', 4),
('e0000006-0002-0000-0000-000000000002', 'd0006002-0005-0000-0000-000000000005', 5),
('e0000006-0002-0000-0000-000000000002', 'd0006002-0006-0000-0000-000000000006', 6)
ON CONFLICT DO NOTHING;

-- PREGUNTAS BLOQUE 6.3 (Efesios 6:10-20)
INSERT INTO public.questions (id, block_id, chapter_id, question_type, prompt, verse_reference, explanation, points, difficulty, order_index, is_active)
VALUES
(
    'd0006003-0001-0000-0000-000000000001',
    'b0000006-0003-0000-0000-000000000003',
    'c0000000-0000-0000-0000-000000000006',
    'multiple_choice',
    'Según Efesios 6:12, ¿contra quiénes NO es nuestra lucha y contra quiénes SÍ es?',
    'Efesios 6:12',
    'Efesios 6:12 afirma: "Porque no tenemos lucha contra sangre y carne, sino contra principados, contra potestades, contra los gobernadores de las tinieblas de este siglo, contra huestes espirituales de maldad en las regiones celestes".',
    10, 'easy', 1, true
),
(
    'd0006003-0002-0000-0000-000000000002',
    'b0000006-0003-0000-0000-000000000003',
    'c0000000-0000-0000-0000-000000000006',
    'multiple_choice',
    '¿Qué pieza de la armadura tiene el poder de apagar todos los dardos de fuego del maligno según Efesios 6:16?',
    'Efesios 6:16',
    'Efesios 6:16 declara: "Sobre todo, tomad el escudo de la fe, con que podáis apagar todos los dardos de fuego del maligno".',
    10, 'easy', 2, true
),
(
    'd0006003-0003-0000-0000-000000000003',
    'b0000006-0003-0000-0000-000000000003',
    'c0000000-0000-0000-0000-000000000006',
    'fill_blank',
    'Completa Efesios 6:17: "Y tomad el yelmo de la salvación, y la espada del Espíritu, que es la ________ de Dios".',
    'Efesios 6:17',
    'Efesios 6:17 dice: "...que es la palabra de Dios".',
    10, 'easy', 3, true
),
(
    'd0006003-0004-0000-0000-000000000004',
    'b0000006-0003-0000-0000-000000000003',
    'c0000000-0000-0000-0000-000000000006',
    'multiple_choice',
    '¿Cuáles son las seis piezas de la armadura de Dios enumeradas en Efesios 6:14-17?',
    'Efesios 6:14-17',
    'Las piezas son: el cinturón de la verdad, la coraza de justicia, el calzado del evangelio de la paz, el escudo de la fe, el yelmo de la salvación y la espada del Espíritu.',
    10, 'medium', 4, true
),
(
    'd0006003-0005-0000-0000-000000000005',
    'b0000006-0003-0000-0000-000000000003',
    'c0000000-0000-0000-0000-000000000006',
    'multiple_choice',
    '¿Cómo debe acompañarse el uso de la armadura espiritual según la exhortación de Efesios 6:18?',
    'Efesios 6:18',
    'Efesios 6:18 ordena: "orando en todo tiempo con toda oración y súplica en el Espíritu, y velando en ello con toda perseverancia y súplica por todos los santos".',
    10, 'easy', 5, true
),
(
    'd0006003-0006-0000-0000-000000000006',
    'b0000006-0003-0000-0000-000000000003',
    'c0000000-0000-0000-0000-000000000006',
    'multiple_choice',
    '¿Qué petición de oración personal hace Pablo para sí mismo en Efesios 6:19-20?',
    'Efesios 6:19-20',
    'Pablo pide: "a fin de que al abrir mi boca me sea dada palabra para dar a conocer con denuedo el misterio del evangelio, por el cual soy embajador en cadenas".',
    10, 'medium', 6, true
),
(
    'd0006003-0007-0000-0000-000000000007',
    'b0000006-0003-0000-0000-000000000003',
    'c0000000-0000-0000-0000-000000000006',
    'true_false',
    'Efesios 6:10 manda al creyente fortalecerse en sus propias capacidades intelectuales y físicas para vencer al enemigo.',
    'Efesios 6:10',
    'Falso. Efesios 6:10 dice expresamente: "fortaleceos en el Señor, y en el poder de su fuerza".',
    10, 'easy', 7, true
),
(
    'd0006003-0008-0000-0000-000000000008',
    'b0000006-0003-0000-0000-000000000003',
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
('d0006003-0001-0000-0000-000000000001', 'No es contra sangre y carne, sino contra principados, potestades, gobernadores de las tinieblas y huestes espirituales de maldad', true, 1),
('d0006003-0001-0000-0000-000000000001', 'Es exclusivamente contra los gobernantes políticos del imperio romano', false, 2),
('d0006003-0001-0000-0000-000000000001', 'Es contra los sacerdotes paganos de Éfeso en combates físicos', false, 3),
('d0006003-0001-0000-0000-000000000001', 'Es contra las naciones vecinas por territorios de siembra', false, 4),

-- q2: multiple_choice
('d0006003-0002-0000-0000-000000000002', 'El escudo de la fe', true, 1),
('d0006003-0002-0000-0000-000000000002', 'El cinturón de cuero terrenal', false, 2),
('d0006003-0002-0000-0000-000000000002', 'La lanza de bronce de los soldados romanos', false, 3),
('d0006003-0002-0000-0000-000000000002', 'El carro de guerra de hierro', false, 4),

-- q3: fill_blank
('d0006003-0003-0000-0000-000000000003', 'palabra', true, 1),

-- q4: multiple_choice
('d0006003-0004-0000-0000-000000000004', 'Cinturón de la verdad, coraza de justicia, calzado del evangelio, escudo de la fe, yelmo de la salvación y espada del Espíritu', true, 1),
('d0006003-0004-0000-0000-000000000004', 'Arco de madera, flechas de plata, lanza de hierro, escudo de bronce, manto de lino y sandalias de oro', false, 2),
('d0006003-0004-0000-0000-000000000004', 'Túnica sacerdotal, efod, pectoral de juicio, mitra de oro, cinto y campanillas', false, 3),
('d0006003-0004-0000-0000-000000000004', 'Leyes de Moisés, ordenanzas levíticas, sacrificios, diezmos, fiestas solemnes y ayunos', false, 4),

-- q5: multiple_choice
('d0006003-0005-0000-0000-000000000005', 'Orando en todo tiempo con toda oración y súplica en el Espíritu, velando con perseverancia', true, 1),
('d0006003-0005-0000-0000-000000000005', 'Descansando sin prestar atención al adversario', false, 2),
('d0006003-0005-0000-0000-000000000005', 'Debatiendo con los sofistas griegos en el ágora', false, 3),
('d0006003-0005-0000-0000-000000000005', 'Haciendo penitencias corporales severas', false, 4),

-- q6: multiple_choice
('d0006003-0006-0000-0000-000000000006', 'Que le sea dada palabra para dar a conocer con denuedo el misterio del evangelio como embajador en cadenas', true, 1),
('d0006003-0006-0000-0000-000000000006', 'Que los efesios recolecten dinero para pagar su fianza ante el César', false, 2),
('d0006003-0006-0000-0000-000000000006', 'Que le lleven alimentos y ropa costosa a Roma', false, 3),
('d0006003-0006-0000-0000-000000000006', 'Que la iglesia ataque militarmente la cárcel para liberarlo', false, 4),

-- q7: true_false
('d0006003-0007-0000-0000-000000000007', 'Verdadero', false, 1),
('d0006003-0007-0000-0000-000000000007', 'Falso', true, 2),

-- q8: reference_identification
('d0006003-0008-0000-0000-000000000008', 'Efesios 6:12', true, 1),
('d0006003-0008-0000-0000-000000000008', 'Efesios 6:10', false, 2),
('d0006003-0008-0000-0000-000000000008', 'Efesios 6:14', false, 3),
('d0006003-0008-0000-0000-000000000008', 'Efesios 6:16', false, 4)
ON CONFLICT (id) DO NOTHING;

-- Asociar preguntas Bloque 6.3
INSERT INTO public.assessment_questions (assessment_id, question_id, order_index)
VALUES
('e0000006-0003-0000-0000-000000000003', 'd0006003-0001-0000-0000-000000000001', 1),
('e0000006-0003-0000-0000-000000000003', 'd0006003-0002-0000-0000-000000000002', 2),
('e0000006-0003-0000-0000-000000000003', 'd0006003-0003-0000-0000-000000000003', 3),
('e0000006-0003-0000-0000-000000000003', 'd0006003-0004-0000-0000-000000000004', 4),
('e0000006-0003-0000-0000-000000000003', 'd0006003-0005-0000-0000-000000000005', 5),
('e0000006-0003-0000-0000-000000000003', 'd0006003-0006-0000-0000-000000000006', 6),
('e0000006-0003-0000-0000-000000000003', 'd0006003-0007-0000-0000-000000000007', 7),
('e0000006-0003-0000-0000-000000000003', 'd0006003-0008-0000-0000-000000000008', 8)
ON CONFLICT DO NOTHING;

-- PREGUNTAS BLOQUE 6.4 (Efesios 6:21-24)
INSERT INTO public.questions (id, block_id, chapter_id, question_type, prompt, verse_reference, explanation, points, difficulty, order_index, is_active)
VALUES
(
    'd0006004-0001-0000-0000-000000000001',
    'b0000006-0004-0000-0000-000000000004',
    'c0000000-0000-0000-0000-000000000006',
    'multiple_choice',
    '¿Quién fue enviado por Pablo para hacer saber a los efesios sus asuntos y consolar sus corazones (Efesios 6:21-22)?',
    'Efesios 6:21-22',
    'Efesios 6:21 señala a: "Tíquico, hermano amado y fiel ministro en el Señor".',
    10, 'easy', 1, true
),
(
    'd0006004-0002-0000-0000-000000000002',
    'b0000006-0004-0000-0000-000000000004',
    'c0000000-0000-0000-0000-000000000006',
    'fill_blank',
    'Completa Efesios 6:24: "La gracia sea con todos los que aman a nuestro Señor Jesucristo con amor ________. Amén".',
    'Efesios 6:24',
    'Efesios 6:24 concluye: "...con amor inalterable. Amén".',
    10, 'medium', 2, true
),
(
    'd0006004-0003-0000-0000-000000000003',
    'b0000006-0004-0000-0000-000000000004',
    'c0000000-0000-0000-0000-000000000006',
    'multiple_choice',
    '¿Qué bendiciones conjuntas invoca Pablo sobre los hermanos en Efesios 6:23?',
    'Efesios 6:23',
    'Efesios 6:23 declara: "Paz sea a los hermanos, y amor con fe, de Dios Padre y del Señor Jesucristo".',
    10, 'easy', 3, true
),
(
    'd0006004-0004-0000-0000-000000000004',
    'b0000006-0004-0000-0000-000000000004',
    'c0000000-0000-0000-0000-000000000006',
    'true_false',
    'En Efesios 6:21, Tíquico es llamado por Pablo "hermano amado y fiel ministro en el Señor".',
    'Efesios 6:21',
    'Verdadero. Estos son los dos honrosos títulos que Pablo otorga a su fiel colaborador.',
    10, 'easy', 4, true
),
(
    'd0006004-0005-0000-0000-000000000005',
    'b0000006-0004-0000-0000-000000000004',
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
('d0006004-0001-0000-0000-000000000001', 'Tíquico', true, 1),
('d0006004-0001-0000-0000-000000000001', 'Bernabé', false, 2),
('d0006004-0001-0000-0000-000000000001', 'Apolos', false, 3),
('d0006004-0001-0000-0000-000000000001', 'Filemón', false, 4),

-- q2: fill_blank
('d0006004-0002-0000-0000-000000000002', 'inalterable', true, 1),

-- q3: multiple_choice
('d0006004-0003-0000-0000-000000000003', 'Paz sea a los hermanos, y amor con fe, de Dios Padre y del Señor Jesucristo', true, 1),
('d0006004-0003-0000-0000-000000000003', 'Victorias militares sobre los centuriones romanos', false, 2),
('d0006004-0003-0000-0000-000000000003', 'Riquezas terrenales abundantes en el puerto de Éfeso', false, 3),
('d0006004-0003-0000-0000-000000000003', 'Fama entre todas las escuelas filosóficas de Grecia', false, 4),

-- q4: true_false
('d0006004-0004-0000-0000-000000000004', 'Verdadero', true, 1),
('d0006004-0004-0000-0000-000000000004', 'Falso', false, 2),

-- q5: reference_identification
('d0006004-0005-0000-0000-000000000005', 'Efesios 6:24', true, 1),
('d0006004-0005-0000-0000-000000000005', 'Efesios 6:20', false, 2),
('d0006004-0005-0000-0000-000000000005', 'Efesios 6:22', false, 3),
('d0006004-0005-0000-0000-000000000005', 'Efesios 6:23', false, 4)
ON CONFLICT (id) DO NOTHING;

-- Asociar preguntas Bloque 6.4
INSERT INTO public.assessment_questions (assessment_id, question_id, order_index)
VALUES
('e0000006-0004-0000-0000-000000000004', 'd0006004-0001-0000-0000-000000000001', 1),
('e0000006-0004-0000-0000-000000000004', 'd0006004-0002-0000-0000-000000000002', 2),
('e0000006-0004-0000-0000-000000000004', 'd0006004-0003-0000-0000-000000000003', 3),
('e0000006-0004-0000-0000-000000000004', 'd0006004-0004-0000-0000-000000000004', 4),
('e0000006-0004-0000-0000-000000000004', 'd0006004-0005-0000-0000-000000000005', 5)
ON CONFLICT DO NOTHING;
