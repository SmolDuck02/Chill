<#
    MoonScene.ps1
    Displays a beautiful cosmic scene with a ringed planet and twinkling stars.
#>

# Load configuration
$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
if (-not $scriptDir) { $scriptDir = Get-Location }
$configPath = Join-Path $scriptDir 'config.ps1'
$Config = & $configPath

# If launched without proper size, relaunch in a correctly sized conhost window
if (-not $env:MOONSCENE_LAUNCHED) {
    $env:MOONSCENE_LAUNCHED = "1"
    $scriptPath = $MyInvocation.MyCommand.Path
    if (-not $scriptPath) {
        $scriptPath = Join-Path $scriptDir 'MoonScene.ps1'
    }
    
    # Launch in conhost with specific size
    Start-Process conhost.exe -ArgumentList "powershell.exe -ExecutionPolicy Bypass -File `"$scriptPath`"" -Wait
    exit
}

function Show-MoonScene {
    # Get colors from config
    $bg = $Config.BackgroundColor
    $s1 = $Config.StarsColor1
    $s2 = $Config.StarsColor2
    $s3 = $Config.StarsColor3
    $rg = $Config.RingGlow
    $rb = $Config.RingBright
    $ph = $Config.PlanetHighlight
    $pm = $Config.PlanetMid
    $pd = $Config.PlanetDark
    $t1 = $Config.TextColor1
    $t2 = $Config.TextColor2
    $t3 = $Config.TextColor3
    $t4 = $Config.TextColor4
    $t5 = $Config.TextColor5
    $t6 = $Config.TextColor6
    $t7 = $Config.TextColor7
    $fc = $Config.FooterColor

    # Try to resize window
    try {
        $width = $Config.WindowWidth
        $height = $Config.WindowHeight
        $rawUi = $Host.UI.RawUI
        $bufferSize = $rawUi.BufferSize
        $bufferSize.Width = [Math]::Max($bufferSize.Width, $width)
        $bufferSize.Height = [Math]::Max($bufferSize.Height, 500)
        $rawUi.BufferSize = $bufferSize
        $windowSize = $rawUi.WindowSize
        $windowSize.Width = [Math]::Min($width, $rawUi.MaxWindowSize.Width)
        $windowSize.Height = [Math]::Min($height, $rawUi.MaxWindowSize.Height)
        $rawUi.WindowSize = $windowSize
    } catch {}

    $Host.UI.RawUI.BackgroundColor = $bg
    Clear-Host
    
    Write-Host ""
    Write-Host "                                                        .  *  .      +         . *" -ForegroundColor $s1
    Write-Host "        *    .        .              +                        .    *         ." -ForegroundColor $s1
    Write-Host "    .            +          *    .        .   *      .                  *" -ForegroundColor $s2
    Write-Host "          .  *       .                          .         +       .        ." -ForegroundColor $s2
    Write-Host "   +            .        *     .      " -NoNewline -ForegroundColor $s3
    Write-Host ".:*~~~~~~~*:." -NoNewline -ForegroundColor $rg
    Write-Host "           .     *    ." -ForegroundColor $s3
    Write-Host "      *       .               " -NoNewline -ForegroundColor $s3
    Write-Host ".:*~~~~~~~~~~~~~~~*:." -NoNewline -ForegroundColor $rg
    Write-Host "      +          ." -ForegroundColor $s3
    Write-Host "  .        +      .       " -NoNewline -ForegroundColor $s2
    Write-Host "*~~" -NoNewline -ForegroundColor $rg
    Write-Host "~~~~~~~~~~~~~~~~~~~" -NoNewline -ForegroundColor $rb
    Write-Host "~~*" -NoNewline -ForegroundColor $rg
    Write-Host "    .      *" -ForegroundColor $s2
    Write-Host "          *    .        " -NoNewline -ForegroundColor $s2
    Write-Host "~~" -NoNewline -ForegroundColor $rg
    Write-Host "~~~~~~~~~~~~~~~~~~~~~~~~~" -NoNewline -ForegroundColor $rb
    Write-Host "~~" -NoNewline -ForegroundColor $rg
    Write-Host "      ." -ForegroundColor $s2
    Write-Host "    .              .    " -NoNewline -ForegroundColor $s3
    Write-Host "~" -NoNewline -ForegroundColor $rg
    Write-Host "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" -NoNewline -ForegroundColor $rb
    Write-Host "~" -NoNewline -ForegroundColor $rg
    Write-Host "  +    *" -ForegroundColor $s3
    Write-Host "       +            " -NoNewline -ForegroundColor $s2
    Write-Host "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" -NoNewline -ForegroundColor $rb
    Write-Host "       ." -ForegroundColor $s2
    Write-Host "   *      .     " -NoNewline -ForegroundColor $s3
    Write-Host "~~~~~~~~~~~~~~~~~~~~~" -NoNewline -ForegroundColor $rb
    Write-Host "((###))" -NoNewline -ForegroundColor $ph
    Write-Host "~~~~~~~~~~~~~~~~~~~~~" -NoNewline -ForegroundColor $rb
    Write-Host "   *" -ForegroundColor $s3
    Write-Host "        .       " -NoNewline -ForegroundColor $s2
    Write-Host "~~~~~~~~~~~~~~~~~~~~" -NoNewline -ForegroundColor $rb
    Write-Host "(((" -NoNewline -ForegroundColor $pm
    Write-Host "***" -NoNewline -ForegroundColor $ph
    Write-Host ")))" -NoNewline -ForegroundColor $pm
    Write-Host "~~~~~~~~~~~~~~~~~~~~" -NoNewline -ForegroundColor $rb
    Write-Host "    ." -ForegroundColor $s2
    Write-Host "     +      .  " -NoNewline -ForegroundColor $s3
    Write-Host "~~~~~~~~~~~~~~~~~~~" -NoNewline -ForegroundColor $rb
    Write-Host "((((" -NoNewline -ForegroundColor $pm
    Write-Host "ooooooo" -NoNewline -ForegroundColor $pd
    Write-Host "))))" -NoNewline -ForegroundColor $pm
    Write-Host "~~~~~~~~~~~~~~~~~~~" -NoNewline -ForegroundColor $rb
    Write-Host "  +     *" -ForegroundColor $s3
    Write-Host "    *        " -NoNewline -ForegroundColor $s2
    Write-Host "~~~~~~~~~~~~~~~~~~" -NoNewline -ForegroundColor $rb
    Write-Host "(((((" -NoNewline -ForegroundColor $pm
    Write-Host "ooooooooooo" -NoNewline -ForegroundColor $pd
    Write-Host ")))))" -NoNewline -ForegroundColor $pm
    Write-Host "~~~~~~~~~~~~~~~~~~" -NoNewline -ForegroundColor $rb
    Write-Host "     ." -ForegroundColor $s2
    Write-Host "  .      +    " -NoNewline -ForegroundColor $s3
    Write-Host "~~~~~~~~~~~~~~~~~" -NoNewline -ForegroundColor $rb
    Write-Host "((((((" -NoNewline -ForegroundColor $pm
    Write-Host "ooooooooooooo" -NoNewline -ForegroundColor $pd
    Write-Host "))))))" -NoNewline -ForegroundColor $pm
    Write-Host "~~~~~~~~~~~~~~~~~" -NoNewline -ForegroundColor $rb
    Write-Host "   *    ." -ForegroundColor $s3
    Write-Host "       .      " -NoNewline -ForegroundColor $s2
    Write-Host "~~~~~~~~~~~~~~~~" -NoNewline -ForegroundColor $rb
    Write-Host "(((((((((((((((((((((((" -NoNewline -ForegroundColor $pm
    Write-Host "~~~~~~~~~~~~~~~~" -NoNewline -ForegroundColor $rb
    Write-Host "       +" -ForegroundColor $s2
    Write-Host "   +          " -NoNewline -ForegroundColor $s3
    Write-Host "~~~~~~~~~~~~~~~" -NoNewline -ForegroundColor $rb
    Write-Host "(((((((((((((((((((((((((" -NoNewline -ForegroundColor $pm
    Write-Host "~~~~~~~~~~~~~~~" -NoNewline -ForegroundColor $rb
    Write-Host "  .      *" -ForegroundColor $s3
    Write-Host "      *    .  " -NoNewline -ForegroundColor $s2
    Write-Host "~~~~~~~~~~~~~~" -NoNewline -ForegroundColor $rb
    Write-Host "(((((((((((((((((((((((((((" -NoNewline -ForegroundColor $pm
    Write-Host "~~~~~~~~~~~~~~" -NoNewline -ForegroundColor $rb
    Write-Host "    +    ." -ForegroundColor $s2
    Write-Host "  .          " -NoNewline -ForegroundColor $s3
    Write-Host ":*~~~~~~~~~~" -NoNewline -ForegroundColor $rb
    Write-Host "(((((((((((((((((((((((((((((((" -NoNewline -ForegroundColor $pm
    Write-Host "~~~~~~~~~~*:" -NoNewline -ForegroundColor $rb
    Write-Host "        *" -ForegroundColor $s3
    Write-Host "        +      " -NoNewline -ForegroundColor $s2
    Write-Host "**~~~~~~" -NoNewline -ForegroundColor $rb
    Write-Host "(((((((((((((((((((((((((((((((((((" -NoNewline -ForegroundColor $pm
    Write-Host "~~~~~~**" -NoNewline -ForegroundColor $rb
    Write-Host "   .      ." -ForegroundColor $s2
    Write-Host "     *    .      " -NoNewline -ForegroundColor $s3
    Write-Host "***" -NoNewline -ForegroundColor $rb
    Write-Host "(((((((((((((((((((((((((((((((((((((((" -NoNewline -ForegroundColor $pm
    Write-Host "***" -NoNewline -ForegroundColor $rb
    Write-Host "      +    *" -ForegroundColor $s3
    Write-Host "   .             " -NoNewline -ForegroundColor $s1
    Write-Host "*" -NoNewline -ForegroundColor $rb
    Write-Host "(((((((((((((((((((((((((((((((((((((((((((" -NoNewline -ForegroundColor $pm
    Write-Host "*" -NoNewline -ForegroundColor $rb
    Write-Host "  .       ." -ForegroundColor $s1
    Write-Host "        *   .       " -NoNewline -ForegroundColor $s1
    Write-Host "(((((((((((((((((((((((((((((((((((((((((((((" -NoNewline -ForegroundColor $pd
    Write-Host "     +     *" -ForegroundColor $s1
    Write-Host "    +           .        " -NoNewline -ForegroundColor $s1
    Write-Host "******************************" -NoNewline -ForegroundColor $rg
    Write-Host "      .        ." -ForegroundColor $s1
    Write-Host "  .      *         +              .    *        .          *       +" -ForegroundColor $s1
    Write-Host ""
    Write-Host " ___  __    _______   _______   ________        ___  _________        ________  ___  ___  ___  ___       ___" -ForegroundColor $t1
    Write-Host "|\  \|\  \ |\  ___ \ |\  ___ \ |\   __  \      |\  \|\___   ___\     |\   ____\|\  \|\  \|\  \|\  \     |\  \" -ForegroundColor $t2
    Write-Host "\ \  \/  /|\ \   __/|\ \   __/|\ \  \|\  \     \ \  \|___ \  \_|     \ \  \___|\ \  \\\  \ \  \ \  \    \ \  \" -ForegroundColor $t3
    Write-Host " \ \   ___  \ \  \_|/_\ \  \_|/_\ \   ____\     \ \  \   \ \  \       \ \  \    \ \   __  \ \  \ \  \    \ \  \" -ForegroundColor $t4
    Write-Host "  \ \  \\ \  \ \  \_|\ \ \  \_|\ \ \  \___|      \ \  \   \ \  \       \ \  \____\ \  \ \  \ \  \ \  \____\ \  \____" -ForegroundColor $t5
    Write-Host "   \ \__\\ \__\ \_______\ \_______\ \__\          \ \__\   \ \__\       \ \_______\ \__\ \__\ \__\ \_______\ \_______\" -ForegroundColor $t6
    Write-Host "    \|__| \|__|\|_______|\|_______|\|__|           \|__|    \|__|        \|_______|\|__|\|__|\|__|\|_______|\|_______|" -ForegroundColor $t7
    Write-Host ""
    Write-Host "                                        *  Welcome to the cosmos  *" -ForegroundColor $fc
    Write-Host ""
    Read-Host -Prompt "                                        Press Enter to close"
    exit
}

Show-MoonScene
