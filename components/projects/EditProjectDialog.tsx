'use client'

import { useState } from 'react'
import { useRouter } from 'next/navigation'
import { createClient } from '@/lib/supabase/client'
import { Button } from '@/components/ui/button'
import { Input } from '@/components/ui/input'
import { Label } from '@/components/ui/label'
import { Dialog, DialogContent, DialogHeader, DialogTitle, DialogTrigger } from '@/components/ui/dialog'
import type { Project } from '@/types'

interface EditProjectDialogProps {
  project: Project
}

export function EditProjectDialog({ project }: EditProjectDialogProps) {
  const [open, setOpen] = useState(false)
  const [name, setName] = useState(project.name)
  const [client, setClient] = useState(project.client)
  const [figmaUrl, setFigmaUrl] = useState(project.figma_url ?? '')
  const [stagingUrl, setStagingUrl] = useState(project.staging_url ?? '')
  const [productionUrl, setProductionUrl] = useState(project.production_url ?? '')
  const [loading, setLoading] = useState(false)
  const router = useRouter()

  function resetForm() {
    setName(project.name)
    setClient(project.client)
    setFigmaUrl(project.figma_url ?? '')
    setStagingUrl(project.staging_url ?? '')
    setProductionUrl(project.production_url ?? '')
  }

  async function handleSubmit(e: React.FormEvent) {
    e.preventDefault()
    setLoading(true)
    const supabase = createClient()
    await supabase.from('projects').update({
      name,
      client,
      figma_url: figmaUrl || null,
      staging_url: stagingUrl || null,
      production_url: productionUrl || null,
      updated_at: new Date().toISOString(),
    }).eq('id', project.id)
    setLoading(false)
    setOpen(false)
    router.refresh()
  }

  return (
    <Dialog open={open} onOpenChange={(o) => { setOpen(o); if (!o) resetForm() }}>
      <DialogTrigger render={
        <Button
          variant="outline"
          className="h-10 w-full justify-start rounded-[6px] border-black/5 bg-white/70 px-4 text-sm font-medium text-[#515154] hover:bg-white hover:text-[#1d1d1f]"
        />
      }>
        ✎ 案件情報を編集
      </DialogTrigger>
      <DialogContent className="max-w-md">
        <DialogHeader>
          <DialogTitle>案件情報を編集</DialogTitle>
        </DialogHeader>
        <form onSubmit={handleSubmit} className="mt-2 space-y-4">
          <div className="space-y-2">
            <Label htmlFor="edit-name">案件名 *</Label>
            <Input id="edit-name" value={name} onChange={(e) => setName(e.target.value)} required />
          </div>
          <div className="space-y-2">
            <Label htmlFor="edit-client">クライアント名 *</Label>
            <Input id="edit-client" value={client} onChange={(e) => setClient(e.target.value)} required />
          </div>
          <div className="space-y-2">
            <Label htmlFor="edit-figma">Figma URL</Label>
            <Input id="edit-figma" type="url" value={figmaUrl} onChange={(e) => setFigmaUrl(e.target.value)} placeholder="https://figma.com/..." />
          </div>
          <div className="space-y-2">
            <Label htmlFor="edit-staging">Staging URL</Label>
            <Input id="edit-staging" type="url" value={stagingUrl} onChange={(e) => setStagingUrl(e.target.value)} placeholder="https://..." />
          </div>
          <div className="space-y-2">
            <Label htmlFor="edit-production">本番 URL</Label>
            <Input id="edit-production" type="url" value={productionUrl} onChange={(e) => setProductionUrl(e.target.value)} placeholder="https://..." />
          </div>
          <div className="flex justify-end gap-2 pt-2">
            <Button type="button" variant="outline" onClick={() => setOpen(false)}>キャンセル</Button>
            <Button type="submit" disabled={loading}>{loading ? '保存中...' : '保存'}</Button>
          </div>
        </form>
      </DialogContent>
    </Dialog>
  )
}
