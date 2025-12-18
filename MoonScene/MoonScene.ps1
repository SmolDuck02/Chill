<#
    MoonScene.ps1
    Displays a beautiful cosmic scene with randomized ASCII art and fonts.
    - Art: Ringed planet OR one of 16 galaxy arts from ascii.txt
    - Font: One of 11 fonts from fonts.txt
#>

param(
    [switch]$DirectLaunch
)

# --- FORCE FOCUS BLOCK ---
$signature = @"
[DllImport("user32.dll")]
public static extern bool SetForegroundWindow(IntPtr hWnd);
[DllImport("kernel32.dll")]
public static extern IntPtr GetConsoleWindow();
"@

# Load the Win32 API
if (-not ([System.Management.Automation.PSTypeName]'Win32Focus').Type) {
    $win32 = Add-Type -MemberDefinition $signature -Name "Win32Focus" -Namespace Win32Functions -PassThru
} else {
    $win32 = [Win32Functions.Win32Focus]
}

# Grab the handle of the current console window and force it to the front
$handle = $win32::GetConsoleWindow()
$win32::SetForegroundWindow($handle) | Out-Null
# -------------------------



# Load configuration
$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
if (-not $scriptDir) { $scriptDir = Get-Location }
$configPath = Join-Path $scriptDir 'config.ps1'
$configData = & $configPath
$Config = $configData.Config
$AsciiArtCollection = $configData.AsciiArtCollection
$AsciiArtWidths = $configData.AsciiArtWidths
$TextStyleCollection = $configData.TextStyleCollection
$TextStyleWidths = $configData.TextStyleWidths

# If launched without proper size, relaunch in a correctly sized conhost window
# Skip relaunch if DirectLaunch flag is set (already launched by another script)
if (-not $DirectLaunch -and -not $env:MOONSCENE_LAUNCHED) {
    $env:MOONSCENE_LAUNCHED = "1"
    $scriptPath = $MyInvocation.MyCommand.Path
    if (-not $scriptPath) {
        $scriptPath = Join-Path $scriptDir 'MoonScene.ps1'
    }
    
    # Launch in conhost with specific size
    Start-Process conhost.exe -ArgumentList "powershell.exe -ExecutionPolicy Bypass -File `"$scriptPath`"" -Wait
    exit
}

# Global variable to track the centering offset
$script:CenterOffset = 0
$script:LineStarted = $false

# Function to override Write-Host and center all output
function Write-CenteredHost {
    param(
        [Parameter(ValueFromRemainingArguments=$true)]
        $Args
    )
    
    # Find the text parameter (first non-named parameter or -Object parameter)
    $text = ""
    $otherParams = @{}
    $hasNoNewline = $false
    $i = 0
    while ($i -lt $Args.Count) {
        if ($Args[$i] -is [string] -and -not $Args[$i].StartsWith("-")) {
            if ($text -eq "") {
                $text = $Args[$i]
            }
        } elseif ($Args[$i] -eq "-NoNewline") {
            $otherParams["NoNewline"] = $true
            $hasNoNewline = $true
        } elseif ($Args[$i] -eq "-ForegroundColor" -and ($i + 1) -lt $Args.Count) {
            $otherParams["ForegroundColor"] = $Args[$i + 1]
            $i++
        } elseif ($Args[$i] -eq "-BackgroundColor" -and ($i + 1) -lt $Args.Count) {
            $otherParams["BackgroundColor"] = $Args[$i + 1]
            $i++
        } elseif ($Args[$i] -eq "-Object" -and ($i + 1) -lt $Args.Count) {
            $text = $Args[$i + 1]
            $i++
        }
        $i++
    }
    
    # Apply centering only at the start of a new line
    if ($text -ne "") {
        if (-not $script:LineStarted) {
            # Start of a new line - apply centering (preserve existing spaces)
            $centeredText = (' ' * $script:CenterOffset) + $text
            Microsoft.PowerShell.Utility\Write-Host $centeredText @otherParams
            $script:LineStarted = $hasNoNewline
        } else {
            # Continuation of current line - no trimming or centering
            Microsoft.PowerShell.Utility\Write-Host $text @otherParams
            $script:LineStarted = $hasNoNewline
        }
    } else {
        Microsoft.PowerShell.Utility\Write-Host @otherParams
        $script:LineStarted = $false
    }
}

function Show-MoonScene {
    $bg = $Config.BackgroundColor
    $fc = $Config.FooterColor
    
    # Move console window to top-left corner using Windows API
    try {
        Add-Type @"
            using System;
            using System.Runtime.InteropServices;
            public class WindowPosition {
                [DllImport("kernel32.dll")]
                public static extern IntPtr GetConsoleWindow();
                
                [DllImport("user32.dll")]
                public static extern bool SetWindowPos(IntPtr hWnd, IntPtr hWndInsertAfter, int X, int Y, int cx, int cy, uint uFlags);
                
                public static void MoveWindow(int x, int y) {
                    IntPtr handle = GetConsoleWindow();
                    SetWindowPos(handle, IntPtr.Zero, x, y, 0, 0, 0x0001 | 0x0004); // SWP_NOSIZE | SWP_NOZORDER
                }
            }
"@
        [WindowPosition]::MoveWindow(0, 0)
    } catch {}
    
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
        
        # Also try PowerShell's built-in positioning (buffer position)
        $windowPosition = $rawUi.WindowPosition
        $windowPosition.X = 0
        $windowPosition.Y = 0
        $rawUi.WindowPosition = $windowPosition
    } catch {}

    $Host.UI.RawUI.BackgroundColor = $bg
    Clear-Host
    
    $actualWidth = $Host.UI.RawUI.WindowSize.Width

    # Eligible arts based on current window width
    # Note: Art 0 is the ringed planet (width 120), Arts 1-16 are galaxy scenes (width 140)
    $artCandidates = @()
    for ($i = 0; $i -lt $AsciiArtCollection.Count; $i++) {
        if ($AsciiArtWidths[$i] -le ($actualWidth - 2)) { $artCandidates += $i }
    }
    if (-not $artCandidates -or $artCandidates.Count -eq 0) { $artCandidates = @(0) } # Fallback to ringed planet
    $randomArtIndex = Get-Random -InputObject $artCandidates

    # Eligible fonts based on current window width
    $fontCandidates = @()
    for ($i = 0; $i -lt $TextStyleCollection.Count; $i++) {
        if ($TextStyleWidths[$i] -le ($actualWidth - 2)) { $fontCandidates += $i }
    }
    if (-not $fontCandidates -or $fontCandidates.Count -eq 0) { $fontCandidates = @(2,6) } # small fallbacks
    $randomFontIndex = Get-Random -InputObject $fontCandidates
    
    # Calculate the center offset based on the widest content
    $artWidth = $AsciiArtWidths[$randomArtIndex]
    $fontWidth = $TextStyleWidths[$randomFontIndex]
    
    # Find the maximum width and center based on that
    $maxContentWidth = [Math]::Max($artWidth, $fontWidth)
    $script:CenterOffset = [Math]::Max(0, [Math]::Floor(($actualWidth - $maxContentWidth) / 2))
    
    # Override Write-Host for centered output
    Set-Alias -Name Write-Host -Value Write-CenteredHost -Scope Script -Force
    
    # Display the selected ASCII art (includes ringed planet at index 0 and galaxy arts at indices 1-16)
    Write-Host ""
    $artBlock = $AsciiArtCollection[$randomArtIndex]
    & $artBlock $Config
    
    Write-Host ""
    Write-Host ""
    Write-Host ""
    
    # Display the selected font (KEEP IT CHILL) with centering
    $fontBlock = $TextStyleCollection[$randomFontIndex]
    & $fontBlock $Config
    
    # Remove the alias to use normal Write-Host for footer
    Remove-Item Alias:Write-Host -Force
    
    Write-Host ""
    Write-Host ""
    
    # Center the footer messages based on the same center offset
    $welcomeMsg = "*  Welcome to the cosmos  *"
    $promptMsg = "Press Enter to close"
    $welcomePadding = $script:CenterOffset + [Math]::Floor((($maxContentWidth - 30) - $welcomeMsg.Length) / 2)
    $promptPadding = $script:CenterOffset + [Math]::Floor((($maxContentWidth - 30) - $promptMsg.Length) / 2)
    
    Microsoft.PowerShell.Utility\Write-Host (' ' * $welcomePadding + $welcomeMsg) -ForegroundColor $fc
    Write-Host ""
    Read-Host -Prompt (' ' * $promptPadding + $promptMsg)
    exit
}

Show-MoonScene
