import unittest, times
import ical

test "can add":
  var cal = initCalendar("GOODCORP")
  cal.event(now() + 1.days, now() + 2.days)
  cal.event(now() + 4.days, now() + 10.days)
  echo cal