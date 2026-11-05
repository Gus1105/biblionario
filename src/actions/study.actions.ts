"use server";

import { createClient } from "@/lib/supabase/server";
import { revalidatePath } from "next/cache";

export async function markBlockAsReadAction(blockId: string): Promise<{ success: boolean; error?: string }> {
  const supabase = await createClient();

  const {
    data: { user },
  } = await supabase.auth.getUser();

  if (!user) {
    return { success: false, error: "Debes iniciar sesión para registrar tu lectura." };
  }

  // Upsert en user_block_progress
  const { error } = await supabase
    .from("user_block_progress")
    .upsert(
      {
        user_id: user.id,
        block_id: blockId,
        reading_completed: true,
        last_studied_at: new Date().toISOString(),
      } as any,
      { onConflict: "user_id, block_id" }
    );

  if (error) {
    return { success: false, error: error.message };
  }

  revalidatePath(`/libros/[slug]/capitulos/[num]/bloques/${blockId}`);
  return { success: true };
}
