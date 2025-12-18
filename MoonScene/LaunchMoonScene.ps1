<#
    LaunchMoonScene.ps1
    Opens a new PowerShell window and runs MoonScene.ps1.
#>

$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$moonScenePath = Join-Path $scriptDir 'MoonScene.ps1'

# Launch directly with DirectLaunch flag to prevent relaunch loop
Start-Process conhost.exe -ArgumentList "powershell.exe -ExecutionPolicy Bypass -File `"$moonScenePath`" -DirectLaunch"
