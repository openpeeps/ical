<p align="center">
  <img src="https://github.com/openpeeps/ical/blob/main/.github/logo.png" width="90px"><br>
  A tolerant, minimal iCalendar reader & writer for Nim 👑
</p>

<p align="center">
  <code>nimble install ical</code>
</p>

<p align="center">
  <a href="https://github.com/">API reference</a><br>
  <img src="https://github.com/openpeeps/ical/workflows/test/badge.svg" alt="Github Actions">  <img src="https://github.com/openpeeps/ical/workflows/docs/badge.svg" alt="Github Actions">
</p>

## 😍 Key Features
- Read/Write iCals, what else?

## Examples
```nim
import pkg/ical
var cal = initCalendar("GOODCORP")
cal.event(now() + 1.days, now() + 2.days)
echo cal
```

Output:
```
BEGIN:VCALENDAR
VERSION:2.0
PRODID:-//GOODCORP//EN
METHOD:PUBLISH
BEGIN:VEVENT
DTSTAMP:20240412T171548
UID:cee166eb-7408-4d2f-83aa-2b1ef33f4a1a
STATUS:CONFIRMED
DTSTART:20240413
DTEND:20240414
END:VEVENT
BEGIN:VEVENT
DTSTAMP:20240412T171548
UID:a2c0fde2-0037-4e66-b472-2263d0b1b717
STATUS:CONFIRMED
DTSTART:20240416
DTEND:20240422
END:VEVENT
END:VCALENDAR
```

### ❤ Contributions & Support
- 🐛 Found a bug? [Create a new Issue](https://github.com/openpeeps/ical/issues)
- 👋 Wanna help? [Fork it!](https://github.com/openpeeps/ical/fork)
- 😎 [Get €20 in cloud credits from Hetzner](https://hetzner.cloud/?ref=Hm0mYGM9NxZ4)
- 🥰 [Donate via PayPal address](https://www.paypal.com/donate/?hosted_button_id=RJK3ZTDWPL55C)

### 🎩 License
MIT license. [Made by Humans from OpenPeeps](https://github.com/openpeeps).<br>
Copyright &copy; 2024 OpenPeeps & Contributors &mdash; All rights reserved.
