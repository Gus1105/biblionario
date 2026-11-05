const { createClient } = require('@supabase/supabase-js');

const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL;
const serviceKey = process.env.SUPABASE_SERVICE_ROLE_KEY;

if (!supabaseUrl || !serviceKey) {
  console.error("Faltan variables NEXT_PUBLIC_SUPABASE_URL o SUPABASE_SERVICE_ROLE_KEY");
  process.exit(1);
}

const supabase = createClient(supabaseUrl, serviceKey, {
  auth: {
    autoRefreshToken: false,
    persistSession: false
  }
});

async function createOrPromoteAdmin(email, password, fullName = 'Administrador Biblionario') {
  console.log(`Buscando usuario con email: ${email}...`);
  const { data: { users }, error: listErr } = await supabase.auth.admin.listUsers();
  
  if (listErr) {
    console.error("Error al listar usuarios:", listErr);
    process.exit(1);
  }

  let user = users.find(u => u.email.toLowerCase() === email.toLowerCase());

  if (!user) {
    console.log(`Usuario no encontrado. Creando usuario ${email} directamente...`);
    const { data: newUser, error: createErr } = await supabase.auth.admin.createUser({
      email,
      password,
      email_confirm: true,
      user_metadata: {
        full_name: fullName
      }
    });

    if (createErr) {
      console.error("Error al crear usuario:", createErr);
      process.exit(1);
    }

    user = newUser.user;
    console.log(`Usuario creado exitosamente con ID: ${user.id}`);
  } else {
    console.log(`Usuario encontrado con ID: ${user.id}`);
    if (password) {
      console.log("Actualizando contraseña...");
      await supabase.auth.admin.updateUserById(user.id, { password, email_confirm: true });
    }
  }

  // Asegurar que existe en profiles
  const { data: profile } = await supabase
    .from('profiles')
    .select('id')
    .eq('id', user.id)
    .maybeSingle();

  if (!profile) {
    console.log("Insertando en tabla profiles...");
    await supabase.from('profiles').insert({
      id: user.id,
      email: user.email,
      full_name: fullName
    });
  }

  // Asignar o actualizar rol en user_roles a 'admin'
  console.log("Asignando rol de 'admin' en user_roles...");
  await supabase.from('user_roles').delete().eq('user_id', user.id);
  const { error: roleErr } = await supabase
    .from('user_roles')
    .insert({
      user_id: user.id,
      role: 'admin'
    });

  if (roleErr) {
    console.error("Error al asignar rol de admin:", roleErr);
    process.exit(1);
  }

  console.log("\n========================================================");
  console.log("¡PERFIL DE ADMINISTRADOR CONFIGURADO CON ÉXITO!");
  console.log(`- Email:    ${email}`);
  console.log(`- Rol:      admin`);
  console.log(`- Acceso:   Directo a /admin y /dashboard`);
  console.log("========================================================\n");
}

const args = process.argv.slice(2);
const email = args[0] || 'admin@biblionario.com';
const password = args[1] || 'Biblionario2026!';
const fullName = args[2] || 'Administrador Principal';

createOrPromoteAdmin(email, password, fullName);
