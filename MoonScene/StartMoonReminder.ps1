<#
    StartMoonReminder.ps1
    Launches the MoonScene at configured intervals.
    Run this once and it will keep reminding you to chill!
    
    To stop it: Close this PowerShell window or press Ctrl+C
#>

# Load configuration
$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$configPath = Join-Path $scriptDir 'config.ps1'
$Config = & $configPath

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

# Show it immediately the first time
Start-Process powershell -ArgumentList '-ExecutionPolicy', 'Bypass', '-File', $moonScenePath

# Then loop at configured interval
while ($true) {
    Start-Sleep -Seconds $intervalSeconds
    Start-Process powershell -ArgumentList '-ExecutionPolicy', 'Bypass', '-File', $moonScenePath
}
