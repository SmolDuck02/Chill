<#
    StartMoonReminder.ps1
    Launches the MoonScene at configured intervals.
    Run this once and it will keep reminding you to chill!
    
    To stop it: Close this PowerShell window or press Ctrl+C
#>

# Load configuration
$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$configPath = Join-Path $scriptDir 'config.ps1'
$ConfigData = & $configPath
$Config = $ConfigData.Config

$moonScenePath = Join-Path $scriptDir 'MoonScene.ps1'
$intervalSeconds = $Config.ReminderIntervalSeconds
$intervalMinutes = [Math]::Round($intervalSeconds / 60)

Write-Host ""
Write-Host "  *  Moon Reminder Started  *" -ForegroundColor Cyan
Write-Host ""
Write-Host "  The cosmic reminder will appear every $intervalMinutes minutes." -ForegroundColor DarkCyan
Write-Host "  Keep this window open (you can minimize it)." -ForegroundColor DarkCyan
Write-Host "  Press Ctrl+C to stop the reminders." -ForegroundColor DarkGray
Write-Host ""

# Function to launch scene safely
function Launch-MoonScene {
    # Launch directly in conhost with DirectLaunch flag
    Start-Process conhost.exe -ArgumentList "powershell.exe -ExecutionPolicy Bypass -File `"$moonScenePath`" -DirectLaunch"
}

# Show it immediately the first time
Launch-MoonScene

# Then loop at configured interval
while ($true) {
    $nextTime = (Get-Date).AddMinutes($intervalMinutes).ToString('HH:mm:ss')

    Write-Host "   Next reminder in $intervalMinutes minutes... ($nextTime)" -ForegroundColor DarkGray
    Start-Sleep -Seconds $intervalSeconds
    Launch-MoonScene
}
