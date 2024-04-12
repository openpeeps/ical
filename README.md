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


## Examples
```nim
import pkg/ical
var cal = initCalendar("GOODCORP")
cal.event(now() + 1.days, now() + 2.days)
echo cal
```

### ❤ Contributions & Support
- 🐛 Found a bug? [Create a new Issue](https://github.com/openpeeps/ical/issues)
- 👋 Wanna help? [Fork it!](https://github.com/openpeeps/ical/fork)
- 😎 [Get €20 in cloud credits from Hetzner](https://hetzner.cloud/?ref=Hm0mYGM9NxZ4)
- 🥰 [Donate via PayPal address](https://www.paypal.com/donate/?hosted_button_id=RJK3ZTDWPL55C)

### 🎩 License
MIT license. [Made by Humans from OpenPeeps](https://github.com/openpeeps).<br>
Copyright &copy; 2024 OpenPeeps & Contributors &mdash; All rights reserved.
