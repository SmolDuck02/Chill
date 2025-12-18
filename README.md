# 🌙 MoonScene - Cosmic Chill Reminder

A beautiful ASCII art cosmic scene that pops up to remind you to **keep it chill**. Features a stunning ringed planet with twinkling stars and a stylish "KEEP IT CHILL" message.

![PowerShell](https://img.shields.io/badge/PowerShell-5.1%2B-blue)
![Platform](https://img.shields.io/badge/Platform-Windows-lightgrey)
![License](https://img.shields.io/badge/License-MIT-green)

## ✨ Features

- 🪐 Beautiful ASCII art ringed planet inspired by Saturn
- ⭐ Twinkling stars across a cosmic void
- 🎨 Rainbow gradient "KEEP IT CHILL" text
- ⏰ Configurable reminder intervals
- 🖥️ Auto-resizing terminal window
- ⚙️ Easy configuration file for customization

## 🚀 Quick Start

### One-time Display
```powershell
.\MoonScene\MoonScene.ps1
```

### Hourly Reminder (runs in background)
```powershell
.\MoonScene\StartMoonReminder.ps1
```
This will show the scene immediately, then pop up at your configured interval. Minimize the window and let it run. Press `Ctrl+C` to stop.

### Launch in New Window
```powershell
.\MoonScene\LaunchMoonScene.ps1
```

## 📁 Project Structure

```
MoonGreeting/
├── README.md
├── .gitignore
└── MoonScene/
    ├── config.ps1              # ⚙️ CONFIGURATION FILE - Edit this!
    ├── MoonScene.ps1           # Main cosmic scene display
    ├── LaunchMoonScene.ps1     # Opens scene in new terminal
    └── StartMoonReminder.ps1   # Reminder loop
```

## ⚙️ Configuration

All customizable settings are in **`MoonScene/config.ps1`**:

### Window Settings
```powershell
WindowWidth  = 200    # Terminal width in characters
WindowHeight = 40     # Terminal height in lines
```

### Reminder Interval
```powershell
ReminderIntervalSeconds = 3600    # 3600 = 1 hour, 1800 = 30 min, 300 = 5 min
```

### Color Scheme
```powershell
# Available colors: Black, DarkBlue, DarkGreen, DarkCyan, DarkRed,
# DarkMagenta, DarkYellow, Gray, DarkGray, Blue, Green, Cyan,
# Red, Magenta, Yellow, White

BackgroundColor = 'Black'      # Background color

# Stars (gradient from top)
StarsColor1 = 'DarkBlue'
StarsColor2 = 'DarkCyan'
StarsColor3 = 'Cyan'

# Planet rings
RingGlow   = 'DarkYellow'
RingBright = 'Yellow'

# Planet body
PlanetHighlight = 'White'
PlanetMid       = 'Gray'
PlanetDark      = 'DarkGray'

# "KEEP IT CHILL" text (rainbow gradient)
TextColor1 = 'Red'
TextColor2 = 'DarkYellow'
TextColor3 = 'Yellow'
TextColor4 = 'Green'
TextColor5 = 'Cyan'
TextColor6 = 'Blue'
TextColor7 = 'Magenta'

# Footer
FooterColor = 'DarkCyan'
```

## 🎮 Controls

- Press **Enter** to close the scene
- Press **Ctrl+C** in the reminder window to stop reminders

## ⚙️ Requirements

- Windows 10/11
- PowerShell 5.1 or later (comes pre-installed on Windows)

## 📜 License

MIT License - feel free to use, modify, and share!

## 🌟 Credits

Created with ✨ cosmic vibes ✨

---

*Keep it chill* 🌙
