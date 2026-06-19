import type { Project } from '@/types'
import { ProjectCard } from '@/components/projects/ProjectCard'
import { EditProjectDialog } from '@/components/projects/EditProjectDialog'

interface ProjectBoardProps {
  activeProjects: Project[]
  doneProjects: Project[]
}

export function ProjectBoard({ activeProjects, doneProjects }: ProjectBoardProps) {
  const active = activeProjects
  const done = doneProjects

  return (
    <div className="space-y-12">
      <section className="space-y-5">
        <div className="space-y-1">
          <p className="text-[11px] font-medium uppercase tracking-[0.18em] text-[#8a8a8f]">Active Projects</p>
          <h2 className="text-xl font-semibold tracking-[-0.02em] text-[#1d1d1f] sm:text-2xl">進行中</h2>
          <p className="text-sm leading-6 text-[#6e6e73]">{active.length}件の案件を進行中です</p>
        </div>
        {active.length === 0 ? (
          <div className="rounded-[6px] border border-black/5 bg-white/65 px-6 py-10 text-sm text-[#8a8a8f] shadow-[0_18px_60px_rgba(0,0,0,0.04)]">
            進行中の案件はありません
          </div>
        ) : (
          <div className="grid grid-cols-1 gap-4 sm:grid-cols-2 lg:grid-cols-3">
            {active.map((project) => (
              <ProjectCard
                key={project.id}
                project={project}
                editButton={<EditProjectDialog project={project} iconOnly />}
              />
            ))}
          </div>
        )}
      </section>
      {done.length > 0 && (
        <section className="space-y-5">
          <div className="space-y-1">
            <p className="text-[11px] font-medium uppercase tracking-[0.18em] text-[#8a8a8f]">Completed</p>
            <h2 className="text-xl font-semibold tracking-[-0.02em] text-[#1d1d1f] sm:text-2xl">完了</h2>
            <p className="text-sm leading-6 text-[#6e6e73]">{done.length}件の案件が完了しています</p>
          </div>
          <div className="grid grid-cols-1 gap-4 opacity-55 sm:grid-cols-2 lg:grid-cols-3">
            {done.map((project) => (
              <ProjectCard
                key={project.id}
                project={project}
                editButton={<EditProjectDialog project={project} iconOnly />}
              />
            ))}
          </div>
        </section>
      )}
    </div>
  )
}
