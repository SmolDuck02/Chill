<#
    MoonScene.ps1
    Displays a beautiful cosmic scene with a ringed planet and twinkling stars.
#>

# If launched without proper size, relaunch in a correctly sized conhost window
if (-not $env:MOONSCENE_LAUNCHED) {
    $env:MOONSCENE_LAUNCHED = "1"
    $scriptPath = $MyInvocation.MyCommand.Path
    if (-not $scriptPath) {
        $scriptPath = Join-Path (Get-Location) 'MoonScene.ps1'
    }
    
    # Launch in conhost with specific size (columns x lines)
    Start-Process conhost.exe -ArgumentList "powershell.exe -ExecutionPolicy Bypass -File `"$scriptPath`"" -Wait
    exit
}

function Show-MoonScene {
    # Try to resize (works in conhost)
    try {
        $width = 150
        $height = 40
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

    $Host.UI.RawUI.BackgroundColor = 'Black'
    Clear-Host
    
    Write-Host ""
    Write-Host "                                                        .  *  .      +         . *" -ForegroundColor DarkBlue
    Write-Host "        *    .        .              +                        .    *         ." -ForegroundColor DarkBlue
    Write-Host "    .            +          *    .        .   *      .                  *" -ForegroundColor DarkCyan
    Write-Host "          .  *       .                          .         +       .        ." -ForegroundColor DarkCyan
    Write-Host "   +            .        *     .      " -NoNewline -ForegroundColor Cyan
    Write-Host ".:*~~~~~~~*:." -NoNewline -ForegroundColor DarkYellow
    Write-Host "           .     *    ." -ForegroundColor Cyan
    Write-Host "      *       .               " -NoNewline -ForegroundColor Cyan
    Write-Host ".:*~~~~~~~~~~~~~~~*:." -NoNewline -ForegroundColor DarkYellow
    Write-Host "      +          ." -ForegroundColor Cyan
    Write-Host "  .        +      .       " -NoNewline -ForegroundColor DarkCyan
    Write-Host "*~~" -NoNewline -ForegroundColor DarkYellow
    Write-Host "~~~~~~~~~~~~~~~~~~~" -NoNewline -ForegroundColor Yellow
    Write-Host "~~*" -NoNewline -ForegroundColor DarkYellow
    Write-Host "    .      *" -ForegroundColor DarkCyan
    Write-Host "          *    .        " -NoNewline -ForegroundColor DarkCyan
    Write-Host "~~" -NoNewline -ForegroundColor DarkYellow
    Write-Host "~~~~~~~~~~~~~~~~~~~~~~~~~" -NoNewline -ForegroundColor Yellow
    Write-Host "~~" -NoNewline -ForegroundColor DarkYellow
    Write-Host "      ." -ForegroundColor DarkCyan
    Write-Host "    .              .    " -NoNewline -ForegroundColor Cyan
    Write-Host "~" -NoNewline -ForegroundColor DarkYellow
    Write-Host "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" -NoNewline -ForegroundColor Yellow
    Write-Host "~" -NoNewline -ForegroundColor DarkYellow
    Write-Host "  +    *" -ForegroundColor Cyan
    Write-Host "       +            " -NoNewline -ForegroundColor DarkCyan
    Write-Host "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" -NoNewline -ForegroundColor Yellow
    Write-Host "       ." -ForegroundColor DarkCyan
    Write-Host "   *      .     " -NoNewline -ForegroundColor Cyan
    Write-Host "~~~~~~~~~~~~~~~~~~~~~" -NoNewline -ForegroundColor Yellow
    Write-Host "((###))" -NoNewline -ForegroundColor White
    Write-Host "~~~~~~~~~~~~~~~~~~~~~" -NoNewline -ForegroundColor Yellow
    Write-Host "   *" -ForegroundColor Cyan
    Write-Host "        .       " -NoNewline -ForegroundColor DarkCyan
    Write-Host "~~~~~~~~~~~~~~~~~~~~" -NoNewline -ForegroundColor Yellow
    Write-Host "(((" -NoNewline -ForegroundColor Gray
    Write-Host "***" -NoNewline -ForegroundColor White
    Write-Host ")))" -NoNewline -ForegroundColor Gray
    Write-Host "~~~~~~~~~~~~~~~~~~~~" -NoNewline -ForegroundColor Yellow
    Write-Host "    ." -ForegroundColor DarkCyan
    Write-Host "     +      .  " -NoNewline -ForegroundColor Cyan
    Write-Host "~~~~~~~~~~~~~~~~~~~" -NoNewline -ForegroundColor Yellow
    Write-Host "((((" -NoNewline -ForegroundColor Gray
    Write-Host "ooooooo" -NoNewline -ForegroundColor DarkGray
    Write-Host "))))" -NoNewline -ForegroundColor Gray
    Write-Host "~~~~~~~~~~~~~~~~~~~" -NoNewline -ForegroundColor Yellow
    Write-Host "  +     *" -ForegroundColor Cyan
    Write-Host "    *        " -NoNewline -ForegroundColor DarkCyan
    Write-Host "~~~~~~~~~~~~~~~~~~" -NoNewline -ForegroundColor Yellow
    Write-Host "(((((" -NoNewline -ForegroundColor Gray
    Write-Host "ooooooooooo" -NoNewline -ForegroundColor DarkGray
    Write-Host ")))))" -NoNewline -ForegroundColor Gray
    Write-Host "~~~~~~~~~~~~~~~~~~" -NoNewline -ForegroundColor Yellow
    Write-Host "     ." -ForegroundColor DarkCyan
    Write-Host "  .      +    " -NoNewline -ForegroundColor Cyan
    Write-Host "~~~~~~~~~~~~~~~~~" -NoNewline -ForegroundColor Yellow
    Write-Host "((((((" -NoNewline -ForegroundColor Gray
    Write-Host "ooooooooooooo" -NoNewline -ForegroundColor DarkGray
    Write-Host "))))))" -NoNewline -ForegroundColor Gray
    Write-Host "~~~~~~~~~~~~~~~~~" -NoNewline -ForegroundColor Yellow
    Write-Host "   *    ." -ForegroundColor Cyan
    Write-Host "       .      " -NoNewline -ForegroundColor DarkCyan
    Write-Host "~~~~~~~~~~~~~~~~" -NoNewline -ForegroundColor Yellow
    Write-Host "(((((((((((((((((((((((" -NoNewline -ForegroundColor Gray
    Write-Host "~~~~~~~~~~~~~~~~" -NoNewline -ForegroundColor Yellow
    Write-Host "       +" -ForegroundColor DarkCyan
    Write-Host "   +          " -NoNewline -ForegroundColor Cyan
    Write-Host "~~~~~~~~~~~~~~~" -NoNewline -ForegroundColor Yellow
    Write-Host "(((((((((((((((((((((((((" -NoNewline -ForegroundColor Gray
    Write-Host "~~~~~~~~~~~~~~~" -NoNewline -ForegroundColor Yellow
    Write-Host "  .      *" -ForegroundColor Cyan
    Write-Host "      *    .  " -NoNewline -ForegroundColor DarkCyan
    Write-Host "~~~~~~~~~~~~~~" -NoNewline -ForegroundColor Yellow
    Write-Host "(((((((((((((((((((((((((((" -NoNewline -ForegroundColor Gray
    Write-Host "~~~~~~~~~~~~~~" -NoNewline -ForegroundColor Yellow
    Write-Host "    +    ." -ForegroundColor DarkCyan
    Write-Host "  .          " -NoNewline -ForegroundColor Cyan
    Write-Host ":*~~~~~~~~~~" -NoNewline -ForegroundColor Yellow
    Write-Host "(((((((((((((((((((((((((((((((" -NoNewline -ForegroundColor Gray
    Write-Host "~~~~~~~~~~*:" -NoNewline -ForegroundColor Yellow
    Write-Host "        *" -ForegroundColor Cyan
    Write-Host "        +      " -NoNewline -ForegroundColor DarkCyan
    Write-Host "**~~~~~~" -NoNewline -ForegroundColor Yellow
    Write-Host "(((((((((((((((((((((((((((((((((((" -NoNewline -ForegroundColor Gray
    Write-Host "~~~~~~**" -NoNewline -ForegroundColor Yellow
    Write-Host "   .      ." -ForegroundColor DarkCyan
    Write-Host "     *    .      " -NoNewline -ForegroundColor Cyan
    Write-Host "***" -NoNewline -ForegroundColor Yellow
    Write-Host "(((((((((((((((((((((((((((((((((((((((" -NoNewline -ForegroundColor Gray
    Write-Host "***" -NoNewline -ForegroundColor Yellow
    Write-Host "      +    *" -ForegroundColor Cyan
    Write-Host "   .             " -NoNewline -ForegroundColor DarkBlue
    Write-Host "*" -NoNewline -ForegroundColor Yellow
    Write-Host "(((((((((((((((((((((((((((((((((((((((((((" -NoNewline -ForegroundColor Gray
    Write-Host "*" -NoNewline -ForegroundColor Yellow
    Write-Host "  .       ." -ForegroundColor DarkBlue
    Write-Host "        *   .       " -NoNewline -ForegroundColor DarkBlue
    Write-Host "(((((((((((((((((((((((((((((((((((((((((((((" -NoNewline -ForegroundColor DarkGray
    Write-Host "     +     *" -ForegroundColor DarkBlue
    Write-Host "    +           .        " -NoNewline -ForegroundColor DarkBlue
    Write-Host "******************************" -NoNewline -ForegroundColor DarkYellow
    Write-Host "      .        ." -ForegroundColor DarkBlue
    Write-Host "  .      *         +              .    *        .          *       +" -ForegroundColor DarkBlue
    Write-Host ""
    Write-Host " ___  __    _______   _______   ________        ___  _________        ________  ___  ___  ___  ___       ___" -ForegroundColor Red
    Write-Host "|\  \|\  \ |\  ___ \ |\  ___ \ |\   __  \      |\  \|\___   ___\     |\   ____\|\  \|\  \|\  \|\  \     |\  \" -ForegroundColor DarkYellow
    Write-Host "\ \  \/  /|\ \   __/|\ \   __/|\ \  \|\  \     \ \  \|___ \  \_|     \ \  \___|\ \  \\\  \ \  \ \  \    \ \  \" -ForegroundColor Yellow
    Write-Host " \ \   ___  \ \  \_|/_\ \  \_|/_\ \   ____\     \ \  \   \ \  \       \ \  \    \ \   __  \ \  \ \  \    \ \  \" -ForegroundColor Green
    Write-Host "  \ \  \\ \  \ \  \_|\ \ \  \_|\ \ \  \___|      \ \  \   \ \  \       \ \  \____\ \  \ \  \ \  \ \  \____\ \  \____" -ForegroundColor Cyan
    Write-Host "   \ \__\\ \__\ \_______\ \_______\ \__\          \ \__\   \ \__\       \ \_______\ \__\ \__\ \__\ \_______\ \_______\" -ForegroundColor Blue
    Write-Host "    \|__| \|__|\|_______|\|_______|\|__|           \|__|    \|__|        \|_______|\|__|\|__|\|__|\|_______|\|_______|" -ForegroundColor Magenta
    Write-Host ""
    Write-Host "                                        *  Welcome to the cosmos  *" -ForegroundColor DarkCyan
    Write-Host ""
    Read-Host -Prompt "                                        Press Enter to close"
    exit
}

Show-MoonScene
