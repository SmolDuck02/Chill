# 🌙 MoonScene - Cosmic Chill Reminder

A beautiful ASCII art cosmic scene that pops up to remind you to **keep it chill**. Features a stunning ringed planet with twinkling stars and a stylish "KEEP IT CHILL" message.

![PowerShell](https://img.shields.io/badge/PowerShell-5.1%2B-blue)
![Platform](https://img.shields.io/badge/Platform-Windows-lightgrey)
![License](https://img.shields.io/badge/License-MIT-green)

## ✨ Features

- 🪐 Beautiful ASCII art ringed planet inspired by Saturn
- ⭐ Twinkling stars across a cosmic void
- 🎨 Rainbow gradient "KEEP IT CHILL" text
- ⏰ Optional hourly reminder mode
- 🖥️ Auto-resizing terminal window

## 🚀 Quick Start

### One-time Display
```powershell
.\MoonScene\MoonScene.ps1
```

### Hourly Reminder (runs in background)
```powershell
.\MoonScene\StartMoonReminder.ps1
```
This will show the scene immediately, then pop up every hour. Minimize the window and let it run. Press `Ctrl+C` to stop.

### Launch in New Window
```powershell
.\MoonScene\LaunchMoonScene.ps1
```

## 📁 Project Structure

```
MoonGreeting/
├── README.md
├── MoonScene/
│   ├── MoonScene.ps1           # Main cosmic scene display
│   ├── LaunchMoonScene.ps1     # Opens scene in new terminal
│   └── StartMoonReminder.ps1   # Hourly reminder loop
```

## 🎮 Controls

- Press **Enter** to close the scene
- Press **Ctrl+C** in the reminder window to stop hourly reminders

## ⚙️ Requirements

- Windows 10/11
- PowerShell 5.1 or later (comes pre-installed on Windows)

## 🛠️ Customization

Edit `MoonScene.ps1` to customize:
- Change colors (look for `-ForegroundColor` parameters)
- Modify the ASCII art
- Adjust window size (change `$width` and `$height` variables)

Edit `StartMoonReminder.ps1` to change reminder interval:
- Default: `3600` seconds (1 hour)
- Change `Start-Sleep -Seconds 3600` to your preferred interval

## 📜 License

MIT License - feel free to use, modify, and share!

## 🌟 Credits

Created with ✨ cosmic vibes ✨

---

*Keep it chill* 🌙

