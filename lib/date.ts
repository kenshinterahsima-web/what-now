export function formatDateShortJP(dateString: string) {
  const date = new Date(dateString)
  if (Number.isNaN(date.getTime())) return dateString

  const month = date.getMonth() + 1
  const day = date.getDate()
  const hour = String(date.getHours()).padStart(2, '0')
  const minute = String(date.getMinutes()).padStart(2, '0')

  return `${month}月${day}日 ${hour}:${minute}`
}

export function formatDateLongJP(dateString: string) {
  const date = new Date(dateString)
  if (Number.isNaN(date.getTime())) return dateString

  const year = date.getFullYear()
  const month = date.getMonth() + 1
  const day = date.getDate()
  const hour = String(date.getHours()).padStart(2, '0')
  const minute = String(date.getMinutes()).padStart(2, '0')

  return `${year}年${month}月${day}日 ${hour}:${minute}`
}
