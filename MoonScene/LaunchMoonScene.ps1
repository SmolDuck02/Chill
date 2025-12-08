<#
    LaunchMoonScene.ps1
    Opens a new PowerShell window and runs MoonScene.ps1.
#>

$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$moonScenePath = Join-Path $scriptDir 'MoonScene.ps1'

Start-Process powershell -ArgumentList '-ExecutionPolicy', 'Bypass', '-File', $moonScenePath

