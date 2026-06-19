'use client'

import { useState } from 'react'
import { useRouter } from 'next/navigation'
import { createClient } from '@/lib/supabase/client'
import { Pencil } from 'lucide-react'
import { Button } from '@/components/ui/button'
import { Input } from '@/components/ui/input'
import { Label } from '@/components/ui/label'
import { Dialog, DialogContent, DialogHeader, DialogTitle, DialogTrigger } from '@/components/ui/dialog'
import { Select, SelectContent, SelectItem, SelectTrigger } from '@/components/ui/select'
import { STATUS_OPTIONS, STATUS_LABELS } from '@/lib/status'
import { cn } from '@/lib/utils'
import type { Project, ProjectStatus } from '@/types'

interface EditProjectDialogProps {
  project: Project
  iconOnly?: boolean
}

export function EditProjectDialog({ project, iconOnly = false }: EditProjectDialogProps) {
  const [open, setOpen] = useState(false)
  const [name, setName] = useState(project.name)
  const [client, setClient] = useState(project.client)
  const [status, setStatus] = useState<ProjectStatus>(project.status)
  const [figmaUrl, setFigmaUrl] = useState(project.figma_url ?? '')
  const [stagingUrl, setStagingUrl] = useState(project.staging_url ?? '')
  const [productionUrl, setProductionUrl] = useState(project.production_url ?? '')
  const [loading, setLoading] = useState(false)
  const router = useRouter()

  function resetForm() {
    setName(project.name)
    setClient(project.client)
    setStatus(project.status)
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
      status,
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
          variant="ghost"
          className={cn(
            iconOnly
              ? 'flex size-9 items-center justify-center rounded-[6px] border border-black/5 bg-white/80 text-[#8a8a8f] shadow-[0_8px_24px_rgba(0,0,0,0.08)] backdrop-blur hover:bg-white hover:text-[#1d1d1f]'
              : 'h-10 w-full justify-start rounded-[6px] border border-black/5 bg-white/70 px-4 text-sm font-medium text-[#515154] hover:bg-white hover:text-[#1d1d1f]'
          )}
        />
      }>
        {iconOnly ? <Pencil className="size-4" aria-hidden="true" /> : '✎ 案件情報を編集'}
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
            <Label>ステータス</Label>
            <Select value={status} onValueChange={(v) => v && setStatus(v as ProjectStatus)}>
              <SelectTrigger><span>{STATUS_LABELS[status]}</span></SelectTrigger>
              <SelectContent>
                {STATUS_OPTIONS.map((opt) => (
                  <SelectItem key={opt.value} value={opt.value}>{opt.label}</SelectItem>
                ))}
              </SelectContent>
            </Select>
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
