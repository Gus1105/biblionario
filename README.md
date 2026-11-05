# Biblionario – Plataforma Interactiva de Aprendizaje Bíblico

**Biblionario** es una plataforma educativa web de alta fidelidad bíblica diseñada para el estudio progresivo, sistemático y evaluativo de las Sagradas Escrituras, basada estrictamente en la versión **Reina-Valera 1960 (RVR1960)**.

A diferencia de los juegos de trivia superficiales, Biblionario implementa una metodología pedagógica de **cuatro niveles** orientada a la comprensión profunda, retención textual y asimilación teológica del texto bíblico, iniciando con el libro completo de **Efesios (sus 6 capítulos en 22 bloques temáticos continuos con 340 preguntas)**.

---

## Características Principales

- **Metodología de 4 Niveles de Aprendizaje Progresivo**:
  1. **Nivel 1 (Estudio y Comprensión)**: Bloques temáticos de estudio continuo (sin omitir versículos) con introducción, explicación versículo a versículo diferenciando texto bíblico de interpretación, conceptos clave, ideas centrales, frases bíblicas para memorizar, indicación explícita de lectura en la Biblia física y confirmación de lectura para desbloquear la evaluación.
  2. **Nivel 2 (Evaluación por Bloque)**: Evaluaciones automáticas con 5 tipos de reactivos:
     - Selección múltiple
     - Memoria bíblica (completar texto con normalización inteligente)
     - Identificación de referencias cruzadas
     - Verdadero o Falso
     - Ordenamiento cronológico o conceptual
  3. **Nivel 3 (Examen General de Capítulo)**: Exámenes de 25 preguntas que integran todos los temas y bloques del capítulo, desbloqueados tras aprobar los bloques correspondientes.
  4. **Nivel 4 (Examen Final del Libro)**: Evaluación integradora de 50 preguntas que abarca de forma equilibrada los 6 capítulos de Efesios, desbloqueada al aprobar los 6 capítulos.
- **Sistema de Puntuación Real**: Sin vidas, monedas ni gamificación artificial. Mide el conocimiento real con porcentajes, aciertos, fallos y retroalimentación pedagógica detallada.
- **Seguridad Anti-Cheating**: Políticas de Row Level Security (RLS) en Supabase impiden que el cliente consulte respuestas correctas o explicaciones en el frontend. La corrección se efectúa de manera exclusiva y segura en el servidor mediante Server Actions.
- **Panel Administrativo (CMS)**: Interfaz para crear, editar y moderar preguntas bíblicas y supervisar el progreso de los participantes.
- **Diseño Moderno y Responsivo**: Interfaz minimalista con Tailwind CSS, modo oscuro/claro y componentes accesibles en escritorio, tablets y móviles.

---

## Tecnologías Utilizadas

- **Frontend & Backend**: Next.js 16 (App Router) con React 19 y Server Actions.
- **Lenguaje**: TypeScript estricto con validaciones mediante Zod.
- **Estilos & UI**: Tailwind CSS v4 con Lucide React.
- **Base de Datos & Auth**: Supabase PostgreSQL con RLS, Triggers y RPCs.
- **Despliegue**: Optimizado para Vercel.

---

## Estructura de la Base de Datos

El sistema cuenta con un esquema relacional de 15 tablas:
- `profiles` y `user_roles`: Perfiles de usuario y control de acceso (rol `admin` y `participant`).
- `books`, `chapters`, `blocks` y `block_explanations`: Jerarquía de contenido bíblico.
- `assessments`, `questions`, `question_options` y `assessment_questions`: Motor de evaluaciones y reactivos.
- `user_block_progress`, `user_chapter_progress` y `user_book_progress`: Desbloqueo progresivo automatizado.
- `assessment_attempts` y `attempt_answers`: Historial de intentos y corrección de respuestas.

---

## Guía de Configuración y Puesta en Marcha

### 1. Clonar el Repositorio e Instalar Dependencias

```bash
cd c:/xampp/htdocs/biblionario
npm install
```

### 2. Configurar el Proyecto en Supabase

1. Crea una cuenta y un nuevo proyecto en [Supabase](https://supabase.com).
2. Ve a la sección **Project Settings > API** y copia:
   - **Project URL**
   - **anon / public key**
   - **service_role key** (clave secreta de servidor)
3. Crea un archivo `.env.local` en la raíz del proyecto tomando como base [.env.example](.env.example):

```env
NEXT_PUBLIC_SUPABASE_URL=https://tu-proyecto.supabase.co
NEXT_PUBLIC_SUPABASE_ANON_KEY=tu-anon-key-publica
SUPABASE_SERVICE_ROLE_KEY=tu-service-role-key-secreta
NEXT_PUBLIC_APP_URL=http://localhost:3000
```

### 3. Ejecutar las Migraciones SQL en Supabase

En el panel de Supabase, ve a **SQL Editor** y ejecuta los archivos en el siguiente orden:

1. **Migraciones de Esquema y Seguridad**:
   - Ejecuta el archivo consolidado `supabase/migrations/migration_all.sql` (crea las 15 tablas, activa RLS con políticas anti-cheating, triggers y funciones automáticas de desbloqueo).
   - *(O si prefieres ejecutarlas una a una)*:
     1. `supabase/migrations/001_initial_schema.sql`
     2. `supabase/migrations/002_rls_policies.sql`
     3. `supabase/migrations/003_functions_and_triggers.sql`

2. **Carga de Contenido Bíblico de Efesios**:
   - Ejecuta el archivo consolidado `supabase/seeds/seed_all.sql` (contiene la estructura de Efesios, los 6 capítulos, 22 bloques con explicaciones teológicas completas RVR1960 y las 340 preguntas con opciones).
   - *(O si prefieres ejecutarlas por capítulo)*:
     1. `000_book_and_chapters.sql`
     2. `001_efesios_capitulo_1.sql`
     3. `002_efesios_capitulo_2.sql`
     4. `003_efesios_capitulo_3.sql`
     5. `004_efesios_capitulo_4.sql`
     6. `005_efesios_capitulo_5.sql`
     7. `006_efesios_capitulo_6.sql`
     8. `007_efesios_examenes_generales_1_3.sql`
     9. `008_efesios_examenes_generales_4_6.sql`
     10. `009_efesios_examen_final_libro.sql`

### 4. Asignar el Rol de Administrador

Cuando te registres por primera vez en la aplicación (`/register`), tu usuario se creará por defecto con rol `participant`. Para convertirlo en Administrador:

En el **SQL Editor** de Supabase, ejecuta:

```sql
-- Reemplaza con el correo con el que te registraste
INSERT INTO public.user_roles (user_id, role)
SELECT id, 'admin'
FROM auth.users
WHERE email = 'tu_correo@ejemplo.com'
ON CONFLICT (user_id) DO UPDATE SET role = 'admin';
```

Al iniciar sesión, verás habilitado el botón **Panel Admin** en la barra superior.

---

## Ejecución en Entorno Local

```bash
# Servidor de desarrollo
npm run dev

# Verificación de tipos TypeScript
npx tsc --noEmit

# Compilación de producción
npm run build

# Iniciar servidor compilado
npm run start
```

---

## Despliegue en Vercel

1. Sube tu código a un repositorio en **GitHub**, **GitLab** o **Bitbucket**.
2. Conecta el repositorio en [Vercel](https://vercel.com/new).
3. En la sección **Environment Variables**, añade:
   - `NEXT_PUBLIC_SUPABASE_URL`
   - `NEXT_PUBLIC_SUPABASE_ANON_KEY`
   - `SUPABASE_SERVICE_ROLE_KEY`
   - `NEXT_PUBLIC_APP_URL` (la URL final provista por Vercel, ej: `https://biblionario.vercel.app`)
4. En el panel de Supabase (**Authentication > URL Configuration**):
   - Configura el **Site URL** con tu dominio de Vercel.
   - Añade en **Redirect URLs**: `https://tu-dominio.vercel.app/api/auth/callback`
5. Haz clic en **Deploy**. ¡Tu plataforma Biblionario estará 100% activa en internet!

---

## Estructura del Código

```
biblionario/
├── src/
│   ├── actions/                  # Server Actions (auth, estudio, evaluaciones, admin)
│   ├── app/                      # App Router de Next.js
│   │   ├── (auth)/               # Login y Registro
│   │   ├── (dashboard)/          # Dashboard, Libros, Capítulos, Bloques, Evaluaciones, Historial
│   │   ├── admin/                # Panel CMS Administrativo (Preguntas, Participantes)
│   │   └── api/auth/callback/    # Manejador de redirección de autenticación Supabase
│   ├── components/               # Componentes modulares
│   │   ├── assessment/           # Motor de exámenes interactivos
│   │   ├── study/                # Visor de estudio versículo a versículo
│   │   ├── admin/                # Gestor de preguntas del CMS
│   │   ├── layout/               # Navbar y Footer
│   │   └── ui/                   # Button, Card, Badge, Progress
│   ├── lib/
│   │   ├── supabase/             # Clientes SSR, Browser y Admin
│   │   └── validations/          # Esquemas de validación Zod
│   ├── services/                 # Capa de datos y lógica de negocio
│   └── types/                    # Tipado estricto TypeScript
├── supabase/
│   ├── migrations/               # Esquema de base de datos, RLS, Triggers
│   └── seeds/                    # Contenido bíblico completo de Efesios (340 preguntas)
```

---

## Licencia

Desarrollado con excelencia para la edificación y el estudio bíblico fiel de la Palabra de Dios.
