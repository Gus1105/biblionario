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
        {"concept": "Muertos en pecados", "definition": "Estar separados de Dios y sin vida espiritual a causa del pecado, sin poder salvarnos por nuestras propias fuerzas."},
        {"concept": "Gracia", "definition": "El favor inmerecido y generoso de Dios que otorga salvación, vida eterna y bendición a quien merecía juicio."},
        {"concept": "Don de Dios", "definition": "Un regalo soberano y gratuito otorgado por Dios que no puede ser comprado, ganado ni merecido por el hombre."},
        {"concept": "Hechura suya", "definition": "Somos una creación u obra especial de Dios, transformados por medio de Cristo para hacer el bien."}
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
    'd0002001-0001-0000-0000-000000000001',
    'b0000002-0001-0000-0000-000000000001',
    'c0000000-0000-0000-0000-000000000002',
    'multiple_choice',
    'Según Efesios 2:1, ¿en qué condición espiritual se encontraban los creyentes antes de que Dios les diera vida?',
    'Efesios 2:1',
    'Efesios 2:1 afirma textualmente: "...cuando estabais muertos en vuestros delitos y pecados".',
    10, 'easy', 1, true
),
(
    'd0002001-0002-0000-0000-000000000002',
    'b0000002-0001-0000-0000-000000000001',
    'c0000000-0000-0000-0000-000000000002',
    'multiple_choice',
    'De acuerdo con Efesios 2:4-5, ¿por qué razón Dios nos dio vida juntamente con Cristo aun estando muertos en pecados?',
    'Efesios 2:4-5',
    'Efesios 2:4 señala: "Pero Dios, que es rico en misericordia, por su gran amor con que nos amó...".',
    10, 'easy', 2, true
),
(
    'd0002001-0003-0000-0000-000000000003',
    'b0000002-0001-0000-0000-000000000001',
    'c0000000-0000-0000-0000-000000000002',
    'fill_blank',
    'Completa Efesios 2:8: "Porque por gracia sois salvos por medio de la ________; y esto no de vosotros, pues es don de Dios".',
    'Efesios 2:8',
    'La palabra textual que completa la cita es "fe".',
    10, 'easy', 3, true
),
(
    'd0002001-0004-0000-0000-000000000004',
    'b0000002-0001-0000-0000-000000000001',
    'c0000000-0000-0000-0000-000000000002',
    'true_false',
    'Efesios 2:9 enseña que la salvación es por obras humanas para que podamos gloriarnos ante Dios.',
    'Efesios 2:9',
    'Falso. Efesios 2:9 declara explícitamente: "no por obras, para que nadie se gloríe".',
    10, 'easy', 4, true
),
(
    'd0002001-0005-0000-0000-000000000005',
    'b0000002-0001-0000-0000-000000000001',
    'c0000000-0000-0000-0000-000000000002',
    'multiple_choice',
    'Según Efesios 2:10, ¿para qué fuimos creados en Cristo Jesús como hechura de Dios?',
    'Efesios 2:10',
    'Efesios 2:10 explica: "creados en Cristo Jesús para buenas obras, las cuales Dios preparó de antemano para que anduviésemos en ellas".',
    10, 'medium', 5, true
),
(
    'd0002001-0006-0000-0000-000000000006',
    'b0000002-0001-0000-0000-000000000001',
    'c0000000-0000-0000-0000-000000000002',
    'reference_identification',
    '¿En qué versículo de Efesios se encuentra la declaración: "Porque somos hechura suya, creados en Cristo Jesús para buenas obras"?',
    'Efesios 2:10',
    'Esta célebre frase corresponde a Efesios 2:10.',
    10, 'easy', 6, true
),
(
    'd0002001-0007-0000-0000-000000000007',
    'b0000002-0001-0000-0000-000000000001',
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
('d0002001-0001-0000-0000-000000000001', 'Muertos en vuestros delitos y pecados', true, 1, null),
('d0002001-0001-0000-0000-000000000001', 'Enfermos buscando al Señor sinceramente', false, 2, null),
('d0002001-0001-0000-0000-000000000001', 'Justos según la ley de Moisés', false, 3, null),
('d0002001-0001-0000-0000-000000000001', 'Ignorantes pero inocentes de toda culpa', false, 4, null),

-- q2: multiple_choice
('d0002001-0002-0000-0000-000000000002', 'Por su abundante misericordia y por su gran amor', true, 1, null),
('d0002001-0002-0000-0000-000000000002', 'Porque el ser humano decidió obedecer la ley ceremonial', false, 2, null),
('d0002001-0002-0000-0000-000000000002', 'Por los méritos morales acumulados por los efesios', false, 3, null),
('d0002001-0002-0000-0000-000000000002', 'Por una obligación legal que Dios tenía con Adán', false, 4, null),

-- q3: fill_blank
('d0002001-0003-0000-0000-000000000003', 'fe', true, 1, null),

-- q4: true_false
('d0002001-0004-0000-0000-000000000004', 'Verdadero', false, 1, null),
('d0002001-0004-0000-0000-000000000004', 'Falso', true, 2, null),

-- q5: multiple_choice
('d0002001-0005-0000-0000-000000000005', 'Para buenas obras, las cuales Dios preparó de antemano', true, 1, null),
('d0002001-0005-0000-0000-000000000005', 'Para vivir ociosamente sin ningún compromiso moral', false, 2, null),
('d0002001-0005-0000-0000-000000000005', 'Para continuar viviendo conforme a los deseos de la carne', false, 3, null),
('d0002001-0005-0000-0000-000000000005', 'Para ganar la justificación mediante ritos religiosos', false, 4, null),

-- q6: reference_identification
('d0002001-0006-0000-0000-000000000006', 'Efesios 2:10', true, 1, null),
('d0002001-0006-0000-0000-000000000006', 'Efesios 2:1', false, 2, null),
('d0002001-0006-0000-0000-000000000006', 'Efesios 2:5', false, 3, null),
('d0002001-0006-0000-0000-000000000006', 'Efesios 2:8', false, 4, null),

-- q7: order_events
('d0002001-0007-0000-0000-000000000007', 'Estabais muertos en vuestros delitos y pecados', true, 1, 1),
('d0002001-0007-0000-0000-000000000007', 'Dios nos dio vida juntamente con Cristo por su gran amor', true, 2, 2),
('d0002001-0007-0000-0000-000000000007', 'Por gracia sois salvos por medio de la fe; no por obras', true, 3, 3),
('d0002001-0007-0000-0000-000000000007', 'Creados en Cristo Jesús para buenas obras preparadas de antemano', true, 4, 4)
ON CONFLICT (id) DO NOTHING;

-- Asociar preguntas Bloque 2.1
INSERT INTO public.assessment_questions (assessment_id, question_id, order_index)
VALUES
('e0000002-0001-0000-0000-000000000001', 'd0002001-0001-0000-0000-000000000001', 1),
('e0000002-0001-0000-0000-000000000001', 'd0002001-0002-0000-0000-000000000002', 2),
('e0000002-0001-0000-0000-000000000001', 'd0002001-0003-0000-0000-000000000003', 3),
('e0000002-0001-0000-0000-000000000001', 'd0002001-0004-0000-0000-000000000004', 4),
('e0000002-0001-0000-0000-000000000001', 'd0002001-0005-0000-0000-000000000005', 5),
('e0000002-0001-0000-0000-000000000001', 'd0002001-0006-0000-0000-000000000006', 6),
('e0000002-0001-0000-0000-000000000001', 'd0002001-0007-0000-0000-000000000007', 7)
ON CONFLICT DO NOTHING;

-- PREGUNTAS BLOQUE 2.2 (Efesios 2:11-13)
INSERT INTO public.questions (id, block_id, chapter_id, question_type, prompt, verse_reference, explanation, points, difficulty, order_index, is_active)
VALUES
(
    'd0002002-0001-0000-0000-000000000001',
    'b0000002-0002-0000-0000-000000000002',
    'c0000000-0000-0000-0000-000000000002',
    'multiple_choice',
    'Según Efesios 2:12, ¿cuáles eran las condiciones en que se encontraban los gentiles en aquel tiempo antes de Cristo?',
    'Efesios 2:12',
    'Efesios 2:12 resume: "sin Cristo, alejados de la ciudadanía de Israel y ajenos a los pactos de la promesa, sin esperanza y sin Dios en el mundo".',
    10, 'easy', 1, true
),
(
    'd0002002-0002-0000-0000-000000000002',
    'b0000002-0002-0000-0000-000000000002',
    'c0000000-0000-0000-0000-000000000002',
    'fill_blank',
    'Completa Efesios 2:13: "vosotros que en otro tiempo estabais lejos, habéis sido hechos cercanos por la ________ de Cristo".',
    'Efesios 2:13',
    'Efesios 2:13 afirma: "...habéis sido hechos cercanos por la sangre de Cristo".',
    10, 'easy', 2, true
),
(
    'd0002002-0003-0000-0000-000000000003',
    'b0000002-0002-0000-0000-000000000002',
    'c0000000-0000-0000-0000-000000000002',
    'true_false',
    'En Efesios 2:11, Pablo recuerda que los gentiles eran llamados incircuncisión por la llamada circuncisión hecha con mano en la carne.',
    'Efesios 2:11',
    'Verdadero. Efesios 2:11 alude a esta distinción étnica y ritual del pasado.',
    10, 'easy', 3, true
),
(
    'd0002002-0004-0000-0000-000000000004',
    'b0000002-0002-0000-0000-000000000002',
    'c0000000-0000-0000-0000-000000000002',
    'multiple_choice',
    '¿Qué significa que los gentiles estaban "sin esperanza y sin Dios en el mundo" (Efesios 2:12)?',
    'Efesios 2:12',
    'Significa que carecían de la revelación redentora del Dios verdadero y no tenían una expectativa segura de salvación y vida eterna.',
    10, 'medium', 4, true
),
(
    'd0002002-0005-0000-0000-000000000005',
    'b0000002-0002-0000-0000-000000000002',
    'c0000000-0000-0000-0000-000000000002',
    'reference_identification',
    '¿En qué versículo de Efesios se declara que los que estaban lejos fueron hechos cercanos por la sangre de Cristo?',
    'Efesios 2:13',
    'Esta afirmación se encuentra en Efesios 2:13.',
    10, 'easy', 5, true
),
(
    'd0002002-0006-0000-0000-000000000006',
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
('d0002002-0001-0000-0000-000000000001', 'Sin Cristo, alejados de la ciudadanía de Israel, ajenos a los pactos, sin esperanza y sin Dios', true, 1),
('d0002002-0001-0000-0000-000000000001', 'Prósperos y justos gracias a la filosofía griega', false, 2),
('d0002002-0001-0000-0000-000000000001', 'Guardando los mandamientos de la ley en secreto', false, 3),
('d0002002-0001-0000-0000-000000000001', 'Gobernando espiritualmente sobre los judíos', false, 4),

-- q2: fill_blank
('d0002002-0002-0000-0000-000000000002', 'sangre', true, 1),

-- q3: true_false
('d0002002-0003-0000-0000-000000000003', 'Verdadero', true, 1),
('d0002002-0003-0000-0000-000000000003', 'Falso', false, 2),

-- q4: multiple_choice
('d0002002-0004-0000-0000-000000000004', 'Carecían de la revelación del Dios verdadero y de la promesa cierta de gloria eterna', true, 1),
('d0002002-0004-0000-0000-000000000004', 'No tenían templos paganos en Éfeso', false, 2),
('d0002002-0004-0000-0000-000000000004', 'Eran pobres materialmente', false, 3),
('d0002002-0004-0000-0000-000000000004', 'Carecían de ejército militar', false, 4),

-- q5: reference_identification
('d0002002-0005-0000-0000-000000000005', 'Efesios 2:13', true, 1),
('d0002002-0005-0000-0000-000000000005', 'Efesios 2:11', false, 2),
('d0002002-0005-0000-0000-000000000005', 'Efesios 2:12', false, 3),
('d0002002-0005-0000-0000-000000000005', 'Efesios 2:14', false, 4),

-- q6: multiple_choice
('d0002002-0006-0000-0000-000000000006', 'A los pactos de la promesa', true, 1),
('d0002002-0006-0000-0000-000000000006', 'A los tratados comerciales romanos', false, 2),
('d0002002-0006-0000-0000-000000000006', 'A las ordenanzas sacerdotales de Diana', false, 3),
('d0002002-0006-0000-0000-000000000006', 'A los votos de los nazareos', false, 4)
ON CONFLICT (id) DO NOTHING;

-- Asociar preguntas Bloque 2.2
INSERT INTO public.assessment_questions (assessment_id, question_id, order_index)
VALUES
('e0000002-0002-0000-0000-000000000002', 'd0002002-0001-0000-0000-000000000001', 1),
('e0000002-0002-0000-0000-000000000002', 'd0002002-0002-0000-0000-000000000002', 2),
('e0000002-0002-0000-0000-000000000002', 'd0002002-0003-0000-0000-000000000003', 3),
('e0000002-0002-0000-0000-000000000002', 'd0002002-0004-0000-0000-000000000004', 4),
('e0000002-0002-0000-0000-000000000002', 'd0002002-0005-0000-0000-000000000005', 5),
('e0000002-0002-0000-0000-000000000002', 'd0002002-0006-0000-0000-000000000006', 6)
ON CONFLICT DO NOTHING;

-- PREGUNTAS BLOQUE 2.3 (Efesios 2:14-18)
INSERT INTO public.questions (id, block_id, chapter_id, question_type, prompt, verse_reference, explanation, points, difficulty, order_index, is_active)
VALUES
(
    'd0002003-0001-0000-0000-000000000001',
    'b0000002-0003-0000-0000-000000000003',
    'c0000000-0000-0000-0000-000000000002',
    'multiple_choice',
    'Según Efesios 2:14, ¿qué hizo Cristo con los dos pueblos (judíos y gentiles) y qué derribó?',
    'Efesios 2:14',
    'Efesios 2:14 declara: "Porque él es nuestra paz, que de ambos pueblos hizo uno, derribando la pared intermedia de separación".',
    10, 'easy', 1, true
),
(
    'd0002003-0002-0000-0000-000000000002',
    'b0000002-0003-0000-0000-000000000003',
    'c0000000-0000-0000-0000-000000000002',
    'fill_blank',
    'Completa Efesios 2:15: "para crear en sí mismo de los dos un solo y ________ hombre, haciendo la paz".',
    'Efesios 2:15',
    'Efesios 2:15 dice textualmente: "...un solo y nuevo hombre, haciendo la paz".',
    10, 'medium', 2, true
),
(
    'd0002003-0003-0000-0000-000000000003',
    'b0000002-0003-0000-0000-000000000003',
    'c0000000-0000-0000-0000-000000000002',
    'multiple_choice',
    '¿A través de qué instrumento reconcilió Cristo con Dios a ambos pueblos en un solo cuerpo según Efesios 2:16?',
    'Efesios 2:16',
    'Efesios 2:16 afirma: "y mediante la cruz reconciliar con Dios a ambos en un solo cuerpo, matando en ella las enemistades".',
    10, 'easy', 3, true
),
(
    'd0002003-0004-0000-0000-000000000004',
    'b0000002-0003-0000-0000-000000000003',
    'c0000000-0000-0000-0000-000000000002',
    'true_false',
    'Efesios 2:18 afirma que por medio de Cristo tanto judíos como gentiles tenemos entrada por un mismo Espíritu al Padre.',
    'Efesios 2:18',
    'Verdadero. Efesios 2:18 expone claramente el acceso trinitario de ambos pueblos al Padre.',
    10, 'easy', 4, true
),
(
    'd0002003-0005-0000-0000-000000000005',
    'b0000002-0003-0000-0000-000000000003',
    'c0000000-0000-0000-0000-000000000002',
    'reference_identification',
    '¿En qué versículo de Efesios se declara: "Porque él es nuestra paz, que de ambos pueblos hizo uno"?',
    'Efesios 2:14',
    'Esta afirmación se encuentra en Efesios 2:14.',
    10, 'easy', 5, true
),
(
    'd0002003-0006-0000-0000-000000000006',
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
('d0002003-0001-0000-0000-000000000001', 'De ambos pueblos hizo uno, derribando la pared intermedia de separación', true, 1),
('d0002003-0001-0000-0000-000000000001', 'Estableció dos iglesias separadas por idioma', false, 2),
('d0002003-0001-0000-0000-000000000001', 'Edificó una muralla más alta para proteger a los judíos', false, 3),
('d0002003-0001-0000-0000-000000000001', 'Obligó a los gentiles a guardar la pascua judía', false, 4),

-- q2: fill_blank
('d0002003-0002-0000-0000-000000000002', 'nuevo', true, 1),

-- q3: multiple_choice
('d0002003-0003-0000-0000-000000000003', 'Mediante la cruz', true, 1),
('d0002003-0003-0000-0000-000000000003', 'Mediante tratados políticos en Roma', false, 2),
('d0002003-0003-0000-0000-000000000003', 'Por medio del sacerdocio levítico', false, 3),
('d0002003-0003-0000-0000-000000000003', 'A través de sacrificios en el templo de Jerusalén', false, 4),

-- q4: true_false
('d0002003-0004-0000-0000-000000000004', 'Verdadero', true, 1),
('d0002003-0004-0000-0000-000000000004', 'Falso', false, 2),

-- q5: reference_identification
('d0002003-0005-0000-0000-000000000005', 'Efesios 2:14', true, 1),
('d0002003-0005-0000-0000-000000000005', 'Efesios 2:15', false, 2),
('d0002003-0005-0000-0000-000000000005', 'Efesios 2:16', false, 3),
('d0002003-0005-0000-0000-000000000005', 'Efesios 2:18', false, 4),

-- q6: multiple_choice
('d0002003-0006-0000-0000-000000000006', 'La ley de los mandamientos expresados en ordenanzas', true, 1),
('d0002003-0006-0000-0000-000000000006', 'El mandamiento moral de amar al prójimo', false, 2),
('d0002003-0006-0000-0000-000000000006', 'El conocimiento de las profecías mesiánicas', false, 3),
('d0002003-0006-0000-0000-000000000006', 'Los diez mandamientos dados en el Sinaí', false, 4)
ON CONFLICT (id) DO NOTHING;

-- Asociar preguntas Bloque 2.3
INSERT INTO public.assessment_questions (assessment_id, question_id, order_index)
VALUES
('e0000002-0003-0000-0000-000000000003', 'd0002003-0001-0000-0000-000000000001', 1),
('e0000002-0003-0000-0000-000000000003', 'd0002003-0002-0000-0000-000000000002', 2),
('e0000002-0003-0000-0000-000000000003', 'd0002003-0003-0000-0000-000000000003', 3),
('e0000002-0003-0000-0000-000000000003', 'd0002003-0004-0000-0000-000000000004', 4),
('e0000002-0003-0000-0000-000000000003', 'd0002003-0005-0000-0000-000000000005', 5),
('e0000002-0003-0000-0000-000000000003', 'd0002003-0006-0000-0000-000000000006', 6)
ON CONFLICT DO NOTHING;

-- PREGUNTAS BLOQUE 2.4 (Efesios 2:19-22)
INSERT INTO public.questions (id, block_id, chapter_id, question_type, prompt, verse_reference, explanation, points, difficulty, order_index, is_active)
VALUES
(
    'd0002004-0001-0000-0000-000000000001',
    'b0000002-0004-0000-0000-000000000004',
    'c0000000-0000-0000-0000-000000000002',
    'multiple_choice',
    'Según Efesios 2:19, ¿qué ya no son los creyentes gentiles y qué son ahora?',
    'Efesios 2:19',
    'Efesios 2:19 dice: "ya no sois extranjeros ni advenedizos, sino conciudadanos de los santos, y miembros de la familia de Dios".',
    10, 'easy', 1, true
),
(
    'd0002004-0002-0000-0000-000000000002',
    'b0000002-0004-0000-0000-000000000004',
    'c0000000-0000-0000-0000-000000000002',
    'multiple_choice',
    'De acuerdo con Efesios 2:20, ¿sobre qué fundamento está edificada la iglesia y quién es la principal piedra del ángulo?',
    'Efesios 2:20',
    'Efesios 2:20 indica: "edificados sobre el fundamento de los apóstoles y profetas, siendo la principal piedra del ángulo Jesucristo mismo".',
    10, 'easy', 2, true
),
(
    'd0002004-0003-0000-0000-000000000003',
    'b0000002-0004-0000-0000-000000000004',
    'c0000000-0000-0000-0000-000000000002',
    'fill_blank',
    'Completa Efesios 2:22: "en quien vosotros también sois juntamente edificados para ________ de Dios en el Espíritu".',
    'Efesios 2:22',
    'Efesios 2:22 concluye: "para morada de Dios en el Espíritu".',
    10, 'medium', 3, true
),
(
    'd0002004-0004-0000-0000-000000000004',
    'b0000002-0004-0000-0000-000000000004',
    'c0000000-0000-0000-0000-000000000002',
    'true_false',
    'Efesios 2:21 afirma que todo el edificio de la iglesia, bien coordinado en Cristo, va creciendo para ser un templo santo en el Señor.',
    'Efesios 2:21',
    'Verdadero. El versículo 21 describe el crecimiento orgánico y santo del templo espiritual.',
    10, 'easy', 4, true
),
(
    'd0002004-0005-0000-0000-000000000005',
    'b0000002-0004-0000-0000-000000000004',
    'c0000000-0000-0000-0000-000000000002',
    'reference_identification',
    '¿En qué versículo de Efesios encontramos la frase: "siendo la principal piedra del ángulo Jesucristo mismo"?',
    'Efesios 2:20',
    'Esta definición cristológica se ubica en Efesios 2:20.',
    10, 'easy', 5, true
),
(
    'd0002004-0006-0000-0000-000000000006',
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
('d0002004-0001-0000-0000-000000000001', 'Ya no sois extranjeros ni advenedizos, sino conciudadanos de los santos y miembros de la familia de Dios', true, 1),
('d0002004-0001-0000-0000-000000000001', 'Ya no sois sabios en el mundo, sino siervos del templo romano', false, 2),
('d0002004-0001-0000-0000-000000000001', 'Ahora sois gobernadores políticos de la provincia de Asia', false, 3),
('d0002004-0001-0000-0000-000000000001', 'Sois forasteros tolerados en el atrio de los gentiles', false, 4),

-- q2: multiple_choice
('d0002004-0002-0000-0000-000000000002', 'Sobre el fundamento de los apóstoles y profetas, siendo Jesucristo mismo la principal piedra del ángulo', true, 1),
('d0002004-0002-0000-0000-000000000002', 'Sobre las doctrinas de los filósofos de Éfeso', false, 2),
('d0002004-0002-0000-0000-000000000002', 'Sobre el templo de Salomón y sus leyes ceremoniales', false, 3),
('d0002004-0002-0000-0000-000000000002', 'Sobre la tradición oral de los escribas y fariseos', false, 4),

-- q3: fill_blank
('d0002004-0003-0000-0000-000000000003', 'morada', true, 1),

-- q4: true_false
('d0002004-0004-0000-0000-000000000004', 'Verdadero', true, 1),
('d0002004-0004-0000-0000-000000000004', 'Falso', false, 2),

-- q5: reference_identification
('d0002004-0005-0000-0000-000000000005', 'Efesios 2:20', true, 1),
('d0002004-0005-0000-0000-000000000005', 'Efesios 2:19', false, 2),
('d0002004-0005-0000-0000-000000000005', 'Efesios 2:21', false, 3),
('d0002004-0005-0000-0000-000000000005', 'Efesios 2:22', false, 4),

-- q6: multiple_choice
('d0002004-0006-0000-0000-000000000006', 'Extranjeros ni advenedizos', true, 1),
('d0002004-0006-0000-0000-000000000006', 'Soldados ni centuriones', false, 2),
('d0002004-0006-0000-0000-000000000006', 'Esclavos ni libertos', false, 3),
('d0002004-0006-0000-0000-000000000006', 'Griegos ni bárbaros', false, 4)
ON CONFLICT (id) DO NOTHING;

-- Asociar preguntas Bloque 2.4
INSERT INTO public.assessment_questions (assessment_id, question_id, order_index)
VALUES
('e0000002-0004-0000-0000-000000000004', 'd0002004-0001-0000-0000-000000000001', 1),
('e0000002-0004-0000-0000-000000000004', 'd0002004-0002-0000-0000-000000000002', 2),
('e0000002-0004-0000-0000-000000000004', 'd0002004-0003-0000-0000-000000000003', 3),
('e0000002-0004-0000-0000-000000000004', 'd0002004-0004-0000-0000-000000000004', 4),
('e0000002-0004-0000-0000-000000000004', 'd0002004-0005-0000-0000-000000000005', 5),
('e0000002-0004-0000-0000-000000000004', 'd0002004-0006-0000-0000-000000000006', 6)
ON CONFLICT DO NOTHING;
