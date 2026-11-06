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
    'Pablo muestra el gran contraste entre la luz y la oscuridad:

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
- "Aprovechando bien el tiempo": usar cada momento y oportunidad con sabiduría para hacer el bien y honrar a Dios en medio de un mundo difícil.
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
    'd0005001-0001-0000-0000-000000000001',
    'b0000005-0001-0000-0000-000000000001',
    'c0000000-0000-0000-0000-000000000005',
    'multiple_choice',
    'Según Efesios 5:1-2, ¿a quién debemos imitar y cómo debemos andar?',
    'Efesios 5:1-2',
    'Efesios 5:1-2 manda: "Sed, pues, imitadores de Dios como hijos amados. Y andad en amor, como también Cristo nos amó...".',
    10, 'easy', 1, true
),
(
    'd0005001-0002-0000-0000-000000000002',
    'b0000005-0001-0000-0000-000000000001',
    'c0000000-0000-0000-0000-000000000005',
    'fill_blank',
    'Completa Efesios 5:5: "ningún fornicario, o inmundo, o avaro, que es ________, tiene herencia en el reino de Cristo y de Dios".',
    'Efesios 5:5',
    'Efesios 5:5 identifica al avaro como "idólatra".',
    10, 'medium', 2, true
),
(
    'd0005001-0003-0000-0000-000000000003',
    'b0000005-0001-0000-0000-000000000001',
    'c0000000-0000-0000-0000-000000000005',
    'multiple_choice',
    '¿Qué tipo de lenguaje señala Pablo en Efesios 5:4 que no conviene a los santos, y qué debe haber en su lugar?',
    'Efesios 5:4',
    'Efesios 5:4 declara: "ni palabras deshonestas, ni necedades, ni truhanerías, que no convienen, sino antes bien acciones de gracias".',
    10, 'easy', 3, true
),
(
    'd0005001-0004-0000-0000-000000000004',
    'b0000005-0001-0000-0000-000000000001',
    'c0000000-0000-0000-0000-000000000005',
    'true_false',
    'Efesios 5:6 advierte que por causa de la desobediencia moral e inmunda viene la ira de Dios sobre los hijos de desobediencia.',
    'Efesios 5:6',
    'Verdadero. Efesios 5:6 dice: "Nadie os engañe con palabras vanas, porque por estas cosas viene la ira de Dios sobre los hijos de desobediencia".',
    10, 'easy', 4, true
),
(
    'd0005001-0005-0000-0000-000000000005',
    'b0000005-0001-0000-0000-000000000001',
    'c0000000-0000-0000-0000-000000000005',
    'reference_identification',
    '¿En qué versículo se encuentra el mandamiento: "Sed, pues, imitadores de Dios como hijos amados"?',
    'Efesios 5:1',
    'Esta célebre exhortación encabeza el capítulo en Efesios 5:1.',
    10, 'easy', 5, true
),
(
    'd0005001-0006-0000-0000-000000000006',
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
('d0005001-0001-0000-0000-000000000001', 'Imitadores de Dios como hijos amados, andando en amor como Cristo nos amó', true, 1),
('d0005001-0001-0000-0000-000000000001', 'Imitadores de los sabios griegos, andando según la filosofía estoica', false, 2),
('d0005001-0001-0000-0000-000000000001', 'Imitadores de los fariseos, andando conforme a los ayunos rituales', false, 3),
('d0005001-0001-0000-0000-000000000001', 'Imitadores de los sacerdotes paganos de Éfeso', false, 4),

-- q2: fill_blank
('d0005001-0002-0000-0000-000000000002', 'idólatra', true, 1),

-- q3: multiple_choice
('d0005001-0003-0000-0000-000000000003', 'Palabras deshonestas, necedades y truhanerías; en su lugar, acciones de gracias', true, 1),
('d0005001-0003-0000-0000-000000000003', 'Cánticos espirituales; en su lugar, discursos políticos', false, 2),
('d0005001-0003-0000-0000-000000000003', 'Salmos e himnos; en su lugar, silencio monástico absoluto', false, 3),
('d0005001-0003-0000-0000-000000000003', 'Lecturas proféticas; en su lugar, poesía romana', false, 4),

-- q4: true_false
('d0005001-0004-0000-0000-000000000004', 'Verdadero', true, 1),
('d0005001-0004-0000-0000-000000000004', 'Falso', false, 2),

-- q5: reference_identification
('d0005001-0005-0000-0000-000000000005', 'Efesios 5:1', true, 1),
('d0005001-0005-0000-0000-000000000005', 'Efesios 5:3', false, 2),
('d0005001-0005-0000-0000-000000000005', 'Efesios 5:5', false, 3),
('d0005001-0005-0000-0000-000000000005', 'Efesios 5:7', false, 4),

-- q6: multiple_choice
('d0005001-0006-0000-0000-000000000006', 'En olor fragante', true, 1),
('d0005001-0006-0000-0000-000000000006', 'Como un tributo de plata terrenal', false, 2),
('d0005001-0006-0000-0000-000000000006', 'Como una ordenanza transitoria del templo', false, 3),
('d0005001-0006-0000-0000-000000000006', 'Como un misterio reservado solo a los ángeles', false, 4)
ON CONFLICT (id) DO NOTHING;

-- Asociar preguntas Bloque 5.1
INSERT INTO public.assessment_questions (assessment_id, question_id, order_index)
VALUES
('e0000005-0001-0000-0000-000000000001', 'd0005001-0001-0000-0000-000000000001', 1),
('e0000005-0001-0000-0000-000000000001', 'd0005001-0002-0000-0000-000000000002', 2),
('e0000005-0001-0000-0000-000000000001', 'd0005001-0003-0000-0000-000000000003', 3),
('e0000005-0001-0000-0000-000000000001', 'd0005001-0004-0000-0000-000000000004', 4),
('e0000005-0001-0000-0000-000000000001', 'd0005001-0005-0000-0000-000000000005', 5),
('e0000005-0001-0000-0000-000000000001', 'd0005001-0006-0000-0000-000000000006', 6)
ON CONFLICT DO NOTHING;

-- PREGUNTAS BLOQUE 5.2 (Efesios 5:8-14)
INSERT INTO public.questions (id, block_id, chapter_id, question_type, prompt, verse_reference, explanation, points, difficulty, order_index, is_active)
VALUES
(
    'd0005002-0001-0000-0000-000000000001',
    'b0000005-0002-0000-0000-000000000002',
    'c0000000-0000-0000-0000-000000000005',
    'multiple_choice',
    'Según Efesios 5:8, ¿qué eran los creyentes en otro tiempo y qué son ahora en el Señor?',
    'Efesios 5:8',
    'Efesios 5:8 dice textualmente: "Porque en otro tiempo erais tinieblas, mas ahora sois luz en el Señor; andad como hijos de luz".',
    10, 'easy', 1, true
),
(
    'd0005002-0002-0000-0000-000000000002',
    'b0000005-0002-0000-0000-000000000002',
    'c0000000-0000-0000-0000-000000000005',
    'multiple_choice',
    '¿En qué consiste el fruto del Espíritu según Efesios 5:9?',
    'Efesios 5:9',
    'Efesios 5:9 declara: "(porque el fruto del Espíritu es en toda bondad, justicia y verdad)".',
    10, 'easy', 2, true
),
(
    'd0005002-0003-0000-0000-000000000003',
    'b0000005-0002-0000-0000-000000000002',
    'c0000000-0000-0000-0000-000000000005',
    'fill_blank',
    'Completa Efesios 5:11: "Y no participéis en las obras infructuosas de las tinieblas, sino más bien ________".',
    'Efesios 5:11',
    'Efesios 5:11 manda: "...sino más bien reprendedlas".',
    10, 'medium', 3, true
),
(
    'd0005002-0004-0000-0000-000000000004',
    'b0000005-0002-0000-0000-000000000002',
    'c0000000-0000-0000-0000-000000000005',
    'true_false',
    'Efesios 5:10 manda al creyente andar "comprobando lo que es agradable al Señor".',
    'Efesios 5:10',
    'Verdadero. El cristiano examina continuamente sus decisiones a la luz de lo que agrada a Dios.',
    10, 'easy', 4, true
),
(
    'd0005002-0005-0000-0000-000000000005',
    'b0000005-0002-0000-0000-000000000002',
    'c0000000-0000-0000-0000-000000000005',
    'reference_identification',
    '¿En qué versículo se encuentra el llamado: "Despiértate, tú que duermes, y levántate de los muertos, y te alumbrará Cristo"?',
    'Efesios 5:14',
    'Este himno espiritual se ubica en Efesios 5:14.',
    10, 'easy', 5, true
),
(
    'd0005002-0006-0000-0000-000000000006',
    'b0000005-0002-0000-0000-000000000002',
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
('d0005002-0001-0000-0000-000000000001', 'En otro tiempo erais tinieblas, mas ahora sois luz en el Señor', true, 1),
('d0005002-0001-0000-0000-000000000001', 'En otro tiempo erais sabios, mas ahora sois ignorantes', false, 2),
('d0005002-0001-0000-0000-000000000001', 'En otro tiempo erais libres, mas ahora estáis presos bajo la ley', false, 3),
('d0005002-0001-0000-0000-000000000001', 'En otro tiempo erais prósperos, mas ahora sois mendigos', false, 4),

-- q2: multiple_choice
('d0005002-0002-0000-0000-000000000002', 'En toda bondad, justicia y verdad', true, 1),
('d0005002-0002-0000-0000-000000000002', 'En sacrificios, ayunos y vigilias físicas', false, 2),
('d0005002-0002-0000-0000-000000000002', 'En riquezas, honras terrenales y títulos', false, 3),
('d0005002-0002-0000-0000-000000000002', 'En elocuencia oratoria y debates públicos', false, 4),

-- q3: fill_blank
('d0005002-0003-0000-0000-000000000003', 'reprendedlas', true, 1),

-- q4: true_false
('d0005002-0004-0000-0000-000000000004', 'Verdadero', true, 1),
('d0005002-0004-0000-0000-000000000004', 'Falso', false, 2),

-- q5: reference_identification
('d0005002-0005-0000-0000-000000000005', 'Efesios 5:14', true, 1),
('d0005002-0005-0000-0000-000000000005', 'Efesios 5:8', false, 2),
('d0005002-0005-0000-0000-000000000005', 'Efesios 5:10', false, 3),
('d0005002-0005-0000-0000-000000000005', 'Efesios 5:12', false, 4),

-- q6: multiple_choice
('d0005002-0006-0000-0000-000000000006', 'Son puestas en evidencia y hechas manifiestas', true, 1),
('d0005002-0006-0000-0000-000000000006', 'Quedan ocultas bajo la arena del tiempo', false, 2),
('d0005002-0006-0000-0000-000000000006', 'Se confunden con los misterios humanos', false, 3),
('d0005002-0006-0000-0000-000000000006', 'Son justificadas por la debilidad humana', false, 4)
ON CONFLICT (id) DO NOTHING;

-- Asociar preguntas Bloque 5.2
INSERT INTO public.assessment_questions (assessment_id, question_id, order_index)
VALUES
('e0000005-0002-0000-0000-000000000002', 'd0005002-0001-0000-0000-000000000001', 1),
('e0000005-0002-0000-0000-000000000002', 'd0005002-0002-0000-0000-000000000002', 2),
('e0000005-0002-0000-0000-000000000002', 'd0005002-0003-0000-0000-000000000003', 3),
('e0000005-0002-0000-0000-000000000002', 'd0005002-0004-0000-0000-000000000004', 4),
('e0000005-0002-0000-0000-000000000002', 'd0005002-0005-0000-0000-000000000005', 5),
('e0000005-0002-0000-0000-000000000002', 'd0005002-0006-0000-0000-000000000006', 6)
ON CONFLICT DO NOTHING;

-- PREGUNTAS BLOQUE 5.3 (Efesios 5:15-21)
INSERT INTO public.questions (id, block_id, chapter_id, question_type, prompt, verse_reference, explanation, points, difficulty, order_index, is_active)
VALUES
(
    'd0005003-0001-0000-0000-000000000001',
    'b0000005-0003-0000-0000-000000000003',
    'c0000000-0000-0000-0000-000000000005',
    'multiple_choice',
    'Según Efesios 5:15-16, ¿por qué razón deben los creyentes andar con diligencia y redimir el tiempo?',
    'Efesios 5:15-16',
    'Efesios 5:16 explica la causa: "...redimiendo el tiempo, porque los días son malos".',
    10, 'easy', 1, true
),
(
    'd0005003-0002-0000-0000-000000000002',
    'b0000005-0003-0000-0000-000000000003',
    'c0000000-0000-0000-0000-000000000005',
    'fill_blank',
    'Completa Efesios 5:18: "No os embriaguéis con vino, en lo cual hay disolución; antes bien sed ________ del Espíritu".',
    'Efesios 5:18',
    'Efesios 5:18 manda: "...antes bien sed llenos del Espíritu".',
    10, 'easy', 2, true
),
(
    'd0005003-0003-0000-0000-000000000003',
    'b0000005-0003-0000-0000-000000000003',
    'c0000000-0000-0000-0000-000000000005',
    'multiple_choice',
    '¿Con qué expresiones musicales y espirituales deben hablar entre sí los creyentes según Efesios 5:19?',
    'Efesios 5:19',
    'Efesios 5:19 enumera: "hablando entre vosotros con salmos, con himnos y cánticos espirituales, cantando y alabando al Señor en vuestros corazones".',
    10, 'easy', 3, true
),
(
    'd0005003-0004-0000-0000-000000000004',
    'b0000005-0003-0000-0000-000000000003',
    'c0000000-0000-0000-0000-000000000005',
    'true_false',
    'Efesios 5:20 enseña que debemos dar gracias a Dios Padre únicamente cuando las circunstancias terrenales sean prósperas.',
    'Efesios 5:20',
    'Falso. Efesios 5:20 manda: "dando siempre gracias por todo al Dios y Padre, en el nombre de nuestro Señor Jesucristo".',
    10, 'easy', 4, true
),
(
    'd0005003-0005-0000-0000-000000000005',
    'b0000005-0003-0000-0000-000000000003',
    'c0000000-0000-0000-0000-000000000005',
    'reference_identification',
    '¿En qué versículo de Efesios se encuentra la ordenanza: "Someteos unos a otros en el temor de Dios"?',
    'Efesios 5:21',
    'Este versículo de sumisión mutua y temor reverente es Efesios 5:21.',
    10, 'easy', 5, true
),
(
    'd0005003-0006-0000-0000-000000000006',
    'b0000005-0003-0000-0000-000000000003',
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
('d0005003-0001-0000-0000-000000000001', 'Porque los días son malos', true, 1),
('d0005003-0001-0000-0000-000000000001', 'Porque el imperio romano prohíbe el descanso', false, 2),
('d0005003-0001-0000-0000-000000000001', 'Para ganar riquezas comerciales en Éfeso', false, 3),
('d0005003-0001-0000-0000-000000000001', 'Para competir con los filósofos griegos', false, 4),

-- q2: fill_blank
('d0005003-0002-0000-0000-000000000002', 'llenos', true, 1),

-- q3: multiple_choice
('d0005003-0003-0000-0000-000000000003', 'Con salmos, con himnos y cánticos espirituales', true, 1),
('d0005003-0003-0000-0000-000000000003', 'Con quejas, murmureos y disputas legales', false, 2),
('d0005003-0003-0000-0000-000000000003', 'Con poemas paganos a la diosa Diana', false, 3),
('d0005003-0003-0000-0000-000000000003', 'Con decretos imperiales de Roma', false, 4),

-- q4: true_false
('d0005003-0004-0000-0000-000000000004', 'Verdadero', false, 1),
('d0005003-0004-0000-0000-000000000004', 'Falso', true, 2),

-- q5: reference_identification
('d0005003-0005-0000-0000-000000000005', 'Efesios 5:21', true, 1),
('d0005003-0005-0000-0000-000000000005', 'Efesios 5:15', false, 2),
('d0005003-0005-0000-0000-000000000005', 'Efesios 5:18', false, 3),
('d0005003-0005-0000-0000-000000000005', 'Efesios 5:22', false, 4),

-- q6: multiple_choice
('d0005003-0006-0000-0000-000000000006', 'No seáis insensatos, sino entendidos de cuál sea la voluntad del Señor', true, 1),
('d0005003-0006-0000-0000-000000000006', 'No estudiéis las Escrituras sin permiso sacerdotal', false, 2),
('d0005003-0006-0000-0000-000000000006', 'No participéis en los cultos de la iglesia', false, 3),
('d0005003-0006-0000-0000-000000000006', 'No hagáis preguntas sobre la doctrina', false, 4)
ON CONFLICT (id) DO NOTHING;

-- Asociar preguntas Bloque 5.3
INSERT INTO public.assessment_questions (assessment_id, question_id, order_index)
VALUES
('e0000005-0003-0000-0000-000000000003', 'd0005003-0001-0000-0000-000000000001', 1),
('e0000005-0003-0000-0000-000000000003', 'd0005003-0002-0000-0000-000000000002', 2),
('e0000005-0003-0000-0000-000000000003', 'd0005003-0003-0000-0000-000000000003', 3),
('e0000005-0003-0000-0000-000000000003', 'd0005003-0004-0000-0000-000000000004', 4),
('e0000005-0003-0000-0000-000000000003', 'd0005003-0005-0000-0000-000000000005', 5),
('e0000005-0003-0000-0000-000000000003', 'd0005003-0006-0000-0000-000000000006', 6)
ON CONFLICT DO NOTHING;

-- PREGUNTAS BLOQUE 5.4 (Efesios 5:22-33)
INSERT INTO public.questions (id, block_id, chapter_id, question_type, prompt, verse_reference, explanation, points, difficulty, order_index, is_active)
VALUES
(
    'd0005004-0001-0000-0000-000000000001',
    'b0000005-0004-0000-0000-000000000004',
    'c0000000-0000-0000-0000-000000000005',
    'multiple_choice',
    '¿Cuál es el modelo supremo que Pablo da a los maridos para amar a sus esposas en Efesios 5:25?',
    'Efesios 5:25',
    'Efesios 5:25 ordena: "Maridos, amad a vuestras mujeres, así como Cristo amó a la iglesia, y se entregó a sí mismo por ella".',
    10, 'easy', 1, true
),
(
    'd0005004-0002-0000-0000-000000000002',
    'b0000005-0004-0000-0000-000000000004',
    'c0000000-0000-0000-0000-000000000005',
    'multiple_choice',
    '¿Para qué entregó Cristo su vida por la iglesia según Efesios 5:26-27?',
    'Efesios 5:26-27',
    'Efesios 5:26-27 responde: "para santificarla, habiéndola purificado en el lavamiento del agua por la palabra, a fin de presentársela a sí mismo, una iglesia gloriosa, que no tuviese mancha ni arruga".',
    10, 'medium', 2, true
),
(
    'd0005004-0003-0000-0000-000000000003',
    'b0000005-0004-0000-0000-000000000004',
    'c0000000-0000-0000-0000-000000000005',
    'fill_blank',
    'Completa Efesios 5:32: "Grande es este ________; mas yo digo esto respecto de Cristo y de la iglesia".',
    'Efesios 5:32',
    'Efesios 5:32 declara: "Grande es este misterio; mas yo digo esto respecto de Cristo y de la iglesia".',
    10, 'easy', 3, true
),
(
    'd0005004-0004-0000-0000-000000000004',
    'b0000005-0004-0000-0000-000000000004',
    'c0000000-0000-0000-0000-000000000005',
    'multiple_choice',
    '¿Qué pasaje del Antiguo Testamento cita Pablo en Efesios 5:31 para fundamentar el matrimonio?',
    'Efesios 5:31',
    'Pablo cita Génesis 2:24: "Por esto dejará el hombre a su padre y a su madre, y se unirá a su mujer, y los dos serán una sola carne".',
    10, 'medium', 4, true
),
(
    'd0005004-0005-0000-0000-000000000005',
    'b0000005-0004-0000-0000-000000000004',
    'c0000000-0000-0000-0000-000000000005',
    'true_false',
    'En Efesios 5:23 se establece que el marido es cabeza de la mujer, así como Cristo es cabeza de la iglesia.',
    'Efesios 5:23',
    'Verdadero. Efesios 5:23 establece esta clara analogía teológica.',
    10, 'easy', 5, true
),
(
    'd0005004-0006-0000-0000-000000000006',
    'b0000005-0004-0000-0000-000000000004',
    'c0000000-0000-0000-0000-000000000005',
    'reference_identification',
    '¿En qué versículo se encuentra la orden: "Maridos, amad a vuestras mujeres, así como Cristo amó a la iglesia, y se entregó a sí mismo por ella"?',
    'Efesios 5:25',
    'Esta regla para los esposos se encuentra en Efesios 5:25.',
    10, 'easy', 6, true
),
(
    'd0005004-0007-0000-0000-000000000007',
    'b0000005-0004-0000-0000-000000000004',
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
('d0005004-0001-0000-0000-000000000001', 'Así como Cristo amó a la iglesia, y se entregó a sí mismo por ella', true, 1),
('d0005004-0001-0000-0000-000000000001', 'Según las costumbres patriarcales del imperio romano', false, 2),
('d0005004-0001-0000-0000-000000000001', 'Exigiendo obediencia ciega sin dar nada a cambio', false, 3),
('d0005004-0001-0000-0000-000000000001', 'Conforme al valor de la dote recibida de los suegros', false, 4),

-- q2: multiple_choice
('d0005004-0002-0000-0000-000000000002', 'Para santificarla y presentársela a sí mismo como una iglesia gloriosa sin mancha ni arruga', true, 1),
('d0005004-0002-0000-0000-000000000002', 'Para edificar templos monumentales en Asia Menor', false, 2),
('d0005004-0002-0000-0000-000000000002', 'Para someter a los reinos de la tierra por la fuerza', false, 3),
('d0005004-0002-0000-0000-000000000002', 'Para abolir la institución del matrimonio civil', false, 4),

-- q3: fill_blank
('d0005004-0003-0000-0000-000000000003', 'misterio', true, 1),

-- q4: multiple_choice
('d0005004-0004-0000-0000-000000000004', 'Génesis 2:24 (dejará el hombre a su padre y a su madre...)', true, 1),
('d0005004-0004-0000-0000-000000000004', 'Éxodo 20:12 (honra a tu padre y a tu madre)', false, 2),
('d0005004-0004-0000-0000-000000000004', 'Levítico 19:18 (amarás a tu prójimo)', false, 3),
('d0005004-0004-0000-0000-000000000004', 'Deuteronomio 6:4 (Oye Israel, Jehová nuestro Dios)', false, 4),

-- q5: true_false
('d0005004-0005-0000-0000-000000000005', 'Verdadero', true, 1),
('d0005004-0005-0000-0000-000000000005', 'Falso', false, 2),

-- q6: reference_identification
('d0005004-0006-0000-0000-000000000006', 'Efesios 5:25', true, 1),
('d0005004-0006-0000-0000-000000000006', 'Efesios 5:22', false, 2),
('d0005004-0006-0000-0000-000000000006', 'Efesios 5:28', false, 3),
('d0005004-0006-0000-0000-000000000006', 'Efesios 5:31', false, 4),

-- q7: multiple_choice
('d0005004-0007-0000-0000-000000000007', 'El marido ame a su mujer como a sí mismo; y la mujer respete a su marido', true, 1),
('d0005004-0007-0000-0000-000000000007', 'El marido gobierne con rigor y la mujer guarde silencio fuera del hogar', false, 2),
('d0005004-0007-0000-0000-000000000007', 'Ambos vivan separados para no cometer pecado sexual', false, 3),
('d0005004-0007-0000-0000-000000000007', 'Vivan sin reglas bajo el libre arbitrio de su propia opinión', false, 4)
ON CONFLICT (id) DO NOTHING;

-- Asociar preguntas Bloque 5.4
INSERT INTO public.assessment_questions (assessment_id, question_id, order_index)
VALUES
('e0000005-0004-0000-0000-000000000004', 'd0005004-0001-0000-0000-000000000001', 1),
('e0000005-0004-0000-0000-000000000004', 'd0005004-0002-0000-0000-000000000002', 2),
('e0000005-0004-0000-0000-000000000004', 'd0005004-0003-0000-0000-000000000003', 3),
('e0000005-0004-0000-0000-000000000004', 'd0005004-0004-0000-0000-000000000004', 4),
('e0000005-0004-0000-0000-000000000004', 'd0005004-0005-0000-0000-000000000005', 5),
('e0000005-0004-0000-0000-000000000004', 'd0005004-0006-0000-0000-000000000006', 6),
('e0000005-0004-0000-0000-000000000004', 'd0005004-0007-0000-0000-000000000007', 7)
ON CONFLICT DO NOTHING;
