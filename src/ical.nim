# A tolerant, minimal iCalendar reader & writer for Nim.
#
#   (c) 2024 George Lemon | MIT license
#       Made by Humans from OpenPeeps
#       https://github.com/openpeeps/ical

import std/[strutils, tables, times]
import pkg/uuid4

type
  CalendarEventStatus* = enum # VEVENT
    eventTentative = "TENTATIVE"
    eventConfirmed = "CONFIRMED"
    eventCanceled = "CANCELED"

  CalendarTodoStatus* = enum # VTODO
    todoNeedsAction = "NEEDS-ACTION"
    todoCompleted = "COMPLETED"
    todoInProcess = "IN-PROCESS"
    todoCanceled = "CANCELED"

  CalendarJournalStatus* = enum # VJOURNAL
    journalDraft = "DRAFT"
    journalFinal = "FINAL"
    journalCanceled = "CANCELED"

  CalendarType* = enum
    calendarTypeEvent = "VEVENT"
    calendarTypeTodo = "VTODO"
    calendarTypeJournal = "VJOURNAL"

  CalendarEvent* = object
    id: Uuid
    case calendarType: CalendarType
    of calendarTypeEvent:
      eventStatus: CalendarEventStatus
      eventStartDate, eventEndDate: DateTime
    else: discard # todo

  Calendar* = object
    id: string
    locale: string = "EN"
    events: OrderedTable[string, CalendarEvent]

const
  # https://github.com/peterbraden/ical.js/blob/master/examples/example_rrule.ics
  # https://icalendar.org/iCalendar-RFC-5545/4-icalendar-object-examples.html
  propProdid = "PRODID:-//$1//$2\n"
  propBegin = "BEGIN:$1\n"
  propEnd = "END:$1\n"
  propVersion = "VERSION:$1\n"
  propScale = "CALSCALE:GREGORIAN\n"
  propMethod = "METHOD:$1\n"
  propUuid = "UID:$1\n"
  propDTStart = "DTSTART:$1\n"
  propStatus = "STATUS:$1\n"
  propDTEnd = "DTEND:$1\n"
  propDTStamp = "DTSTAMP:$1\n"
  propLastModified = "LAST-MODIFIED:$1\n"

proc initCalendar*(id: string): Calendar =
  Calendar(id: id)

proc event*(cal: var Calendar, startDate, endDate: DateTime,
    status: CalendarEventStatus = eventConfirmed) =
  let id = uuid4()
  cal.events[$id] = CalendarEvent(id: id,
    eventStartDate: startDate,
    eventEndDate: endDate,
    eventStatus: status,
    calendarType: CalendarType.calendarTypeEvent
  )

proc `$`*(cal: Calendar): string =
  result = propBegin % ["VCALENDAR"]
  add result, propVersion % "2.0"
  add result, propProdid % [cal.id, cal.locale]
  add result, propMethod % "PUBLISH"
  for id, ev in cal.events:
    add result, propBegin % $(ev.calendarType)
    add result, propDTStamp % format(now(), "yyyyMMdd'T'HHmmss")
    add result, propUuid % id
    case ev.calendarType
    of calendarTypeEvent:
      add result, propStatus % $(ev.eventStatus)
      add result, propDTStart % format(ev.eventStartDate, "yyyyMMdd")
      add result, propDTEND % format(ev.eventEndDate, "yyyyMMdd")
    else: discard # todo
    add result, propEnd % $(ev.calendarType)
  add result, propEnd % ["VCALENDAR"]
