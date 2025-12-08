<#
    StartMoonReminder.ps1
    Launches the MoonScene every hour in a new terminal.
    Run this once and it will keep reminding you to chill!
    
    To stop it: Close this PowerShell window or press Ctrl+C
#>

$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$moonScenePath = Join-Path $scriptDir 'MoonScene.ps1'

Write-Host ""
Write-Host "  *  Moon Reminder Started  *" -ForegroundColor Cyan
Write-Host ""
Write-Host "  The cosmic reminder will appear every hour." -ForegroundColor DarkCyan
Write-Host "  Keep this window open (you can minimize it)." -ForegroundColor DarkCyan
Write-Host "  Press Ctrl+C to stop the reminders." -ForegroundColor DarkGray
Write-Host ""

# Show it immediately the first time
Start-Process powershell -ArgumentList '-ExecutionPolicy', 'Bypass', '-File', $moonScenePath

# Then loop every 1 hour (3600 seconds)
while ($true) {
    Start-Sleep -Seconds 3600
    Start-Process powershell -ArgumentList '-ExecutionPolicy', 'Bypass', '-File', $moonScenePath
}
