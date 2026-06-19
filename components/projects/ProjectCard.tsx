import Link from 'next/link'
import type { ReactNode } from 'react'
import type { Project } from '@/types'
import { StatusBadge } from './StatusBadge'
import { Card, CardContent, CardHeader } from '@/components/ui/card'
import { cn } from '@/lib/utils'
import { formatDateShortJP } from '@/lib/date'

interface ProjectCardProps {
  project: Project
  editButton?: ReactNode
}

export function ProjectCard({ project, editButton }: ProjectCardProps) {
  return (
    <Card className="group relative h-full cursor-pointer overflow-hidden rounded-[6px] border border-black/5 bg-white/72 shadow-[0_18px_60px_rgba(0,0,0,0.045)] backdrop-blur transition-all duration-200 hover:-translate-y-0.5 hover:bg-white hover:shadow-[0_24px_70px_rgba(0,0,0,0.08)]">
      <Link href={`/projects/${project.id}`} className="absolute inset-0 z-0" aria-label={`${project.name}の詳細へ`} />
      <div className="pointer-events-none relative z-10 flex h-full min-h-[220px] flex-col">
        <CardHeader className="px-5 pb-3 pt-5">
          <StatusBadge status={project.status} />
          <h3 className="mt-5 line-clamp-2 pr-9 text-xl font-semibold leading-tight tracking-[-0.02em] text-[#1d1d1f]" title={project.name}>{project.name}</h3>
          <p className="mt-2 line-clamp-1 text-sm leading-6 text-[#6e6e73]" title={project.client}>{project.client}</p>
        </CardHeader>
        <CardContent className="mt-auto px-5 pb-5">
          <div className="mt-3 h-px bg-black/[0.06]" />
          <p className="mt-4 text-xs font-medium text-[#8a8a8f]">更新: {formatDateShortJP(project.updated_at)}</p>
          <div className="mt-4 flex flex-wrap gap-2">
            {project.figma_url && (
              <a
                href={project.figma_url}
                target="_blank"
                rel="noopener noreferrer"
                className="pointer-events-auto inline-flex items-center gap-1.5 py-1 text-xs font-medium text-[#515154] transition hover:text-[#8a8a8f] hover:opacity-80"
                aria-label={`${project.name}のFigmaを開く`}
              >
                <img src="/figma-logo.svg" alt="" className="size-3.5" aria-hidden="true" />
                <span>Figma</span>
                <img src="/link.svg" alt="" className="size-3" aria-hidden="true" />
              </a>
            )}
            {project.staging_url && <span className="rounded-[6px] border border-black/5 bg-[#f5f5f7] px-2.5 py-1 text-xs font-medium text-[#515154]">Staging</span>}
            {project.production_url && (
              <a
                href={project.production_url}
                target="_blank"
                rel="noopener noreferrer"
                className="pointer-events-auto inline-flex items-center gap-1.5 py-1 text-xs font-medium text-[#515154] transition hover:text-[#8a8a8f] hover:opacity-80"
                aria-label={`${project.name}の本番サイトを開く`}
              >
                <span>本番URL</span>
                <img src="/link.svg" alt="" className="size-3" aria-hidden="true" />
              </a>
            )}
          </div>
        </CardContent>
      </div>
      {editButton && (
        <div className="absolute right-4 top-4 z-10">
          {editButton}
        </div>
      )}
    </Card>
  )
}
