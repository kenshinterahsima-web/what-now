'use server'

import { createClient } from '@/lib/supabase/server'
import { revalidatePath } from 'next/cache'

export async function deleteLog(id: string, projectId: string) {
  const supabase = await createClient()
  const { error } = await supabase.from('logs').delete().eq('id', id)

  if (error) {
    throw new Error(error.message)
  }

  revalidatePath(`/projects/${projectId}`)
}

export async function toggleLogDone(id: string, done: boolean, projectId: string) {
  const supabase = await createClient()
  const { data, error } = await supabase
    .from('logs')
    .update({ done })
    .eq('id', id)
    .select('id')
    .single()

  if (error) {
    throw new Error(error.message)
  }

  if (!data) {
    throw new Error('更新対象のログが見つかりませんでした')
  }

  revalidatePath(`/projects/${projectId}`)
}
