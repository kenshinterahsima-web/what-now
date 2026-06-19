'use client'

import { useState, useEffect, useRef } from 'react'
import { useRouter } from 'next/navigation'
import type { Log } from '@/types'
import { deleteLog, toggleLogDone } from '@/app/actions/logs'
import { formatDateLongJP } from '@/lib/date'

export function LogList({ logs: initialLogs, projectId }: { logs: Log[]; projectId: string }) {
  const [logs, setLogs] = useState(initialLogs)
  const [pendingLogIds, setPendingLogIds] = useState<string[]>([])
  const pendingLogIdsRef = useRef<string[]>([])
  const router = useRouter()

  function updatePendingLogIds(updater: (ids: string[]) => string[]) {
    setPendingLogIds((ids) => {
      const nextIds = updater(ids)
      pendingLogIdsRef.current = nextIds
      return nextIds
    })
  }

  useEffect(() => {
    setLogs((currentLogs) => {
      const currentPendingLogIds = pendingLogIdsRef.current
      const pendingLogs = new Map(
        currentLogs.filter((log) => currentPendingLogIds.includes(log.id)).map((log) => [log.id, log]),
      )
      return initialLogs.map((log) => pendingLogs.get(log.id) ?? log)
    })
  }, [initialLogs])

  async function handleToggle(id: string, current: boolean) {
    const nextDone = !current
    updatePendingLogIds((ids) => [...ids, id])
    setLogs((currentLogs) => currentLogs.map((log) => (log.id === id ? { ...log, done: nextDone } : log)))

    try {
      await toggleLogDone(id, nextDone, projectId)
      router.refresh()
    } catch (error) {
      console.error(error)
      setLogs((currentLogs) => currentLogs.map((log) => (log.id === id ? { ...log, done: current } : log)))
      window.alert('チェック状態を更新できませんでした。時間をおいて再度お試しください。')
    } finally {
      updatePendingLogIds((ids) => ids.filter((pendingId) => pendingId !== id))
    }
  }

  async function handleDelete(id: string) {
    const previousLogs = logs
    updatePendingLogIds((ids) => [...ids, id])
    setLogs((currentLogs) => currentLogs.filter((log) => log.id !== id))

    try {
      await deleteLog(id, projectId)
      router.refresh()
    } catch (error) {
      console.error(error)
      setLogs(previousLogs)
      window.alert('ログを削除できませんでした。時間をおいて再度お試しください。')
    } finally {
      updatePendingLogIds((ids) => ids.filter((pendingId) => pendingId !== id))
    }
  }

  if (logs.length === 0) {
    return (
      <div className="rounded-[6px] border border-black/5 bg-white/65 px-6 py-10 text-sm text-[#8a8a8f] shadow-[0_18px_60px_rgba(0,0,0,0.04)]">
        まだログがありません
      </div>
    )
  }

  return (
    <div className="space-y-3">
      {logs.map((log) => {
        const isPending = pendingLogIds.includes(log.id)

        return (
          <div
            key={log.id}
            className="relative overflow-hidden rounded-[6px] border border-black/5 bg-white/72 shadow-[0_18px_60px_rgba(0,0,0,0.045)] backdrop-blur transition hover:bg-white hover:shadow-[0_24px_70px_rgba(0,0,0,0.08)]"
            style={{ borderLeft: '4px solid #A259FF' }}
          >
            {log.done && (
              <div className="pointer-events-none absolute inset-0 z-10 rounded-[6px] bg-[#f5f5f7]/80" />
            )}
            <div className="flex items-start gap-3 p-5">
              <button
                type="button"
                onClick={() => handleToggle(log.id, log.done)}
                disabled={isPending}
                aria-label={log.done ? 'ログを未完了にする' : 'ログを完了にする'}
                className="mt-0.5 flex size-5 shrink-0 items-center justify-center rounded-[6px] border-2 transition-colors disabled:cursor-wait disabled:opacity-70"
                style={{
                  borderColor: log.done ? '#0ACF83' : '#d1d5db',
                  backgroundColor: log.done ? '#0ACF83' : 'white',
                }}
              >
                {log.done && (
                  <svg width="10" height="8" viewBox="0 0 10 8" fill="none">
                    <path d="M1 4L3.5 6.5L9 1" stroke="white" strokeWidth="1.8" strokeLinecap="round" strokeLinejoin="round" />
                  </svg>
                )}
              </button>

              <div className="min-w-0 flex-1">
                <div className="mb-1 flex items-center justify-between gap-2">
                  <span className="text-sm font-semibold text-[#1d1d1f]">{log.author}</span>
                  <div className="flex shrink-0 items-center gap-2">
                    <span className="text-xs font-medium text-[#8a8a8f]">{formatDateLongJP(log.created_at)}</span>
                    <button
                      type="button"
                      onClick={() => handleDelete(log.id)}
                      disabled={isPending}
                      className="rounded-[6px] p-1 text-[#b4b4b8] transition-colors hover:bg-[#f5f5f7] hover:text-red-400 disabled:cursor-wait disabled:opacity-50"
                      title="削除"
                    >
                      <svg width="14" height="14" viewBox="0 0 14 14" fill="none">
                        <path d="M1.75 3.5H12.25M5.25 3.5V2.625C5.25 2.141 5.641 1.75 6.125 1.75H7.875C8.359 1.75 8.75 2.141 8.75 2.625V3.5M10.5 3.5L10.0625 10.7327C10.0272 11.2173 9.62382 11.5833 9.1381 11.5833H4.8619C4.37618 11.5833 3.97278 11.2173 3.9375 10.7327L3.5 3.5" stroke="currentColor" strokeWidth="1.2" strokeLinecap="round" strokeLinejoin="round" />
                      </svg>
                    </button>
                  </div>
                </div>
                <p
                  className="whitespace-pre-wrap text-sm leading-relaxed"
                  style={{
                    color: log.done ? '#9ca3af' : '#515154',
                    textDecoration: log.done ? 'line-through' : 'none',
                  }}
                >
                  {log.content}
                </p>
              </div>
            </div>
          </div>
        )
      })}
    </div>
  )
}
