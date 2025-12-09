<#
    config.ps1
    ═══════════════════════════════════════════════════════════════
    MOONSCENE CONFIGURATION FILE
    ═══════════════════════════════════════════════════════════════
    
    Edit the values below to customize your cosmic experience!
    After editing, save the file and run MoonScene.ps1 again.
#>

# ─────────────────────────────────────────────────────────────────
# WINDOW SETTINGS
# ─────────────────────────────────────────────────────────────────
$Config = @{
    # Terminal window size (characters)
    WindowWidth  = 150
    WindowHeight = 40

    # ─────────────────────────────────────────────────────────────
    # REMINDER SETTINGS
    # ─────────────────────────────────────────────────────────────
    # Interval in seconds (3600 = 1 hour, 1800 = 30 min, 300 = 5 min)
    ReminderIntervalSeconds = 3600

    # ─────────────────────────────────────────────────────────────
    # COLOR SCHEME
    # ─────────────────────────────────────────────────────────────
    # Available colors: Black, DarkBlue, DarkGreen, DarkCyan, DarkRed,
    # DarkMagenta, DarkYellow, Gray, DarkGray, Blue, Green, Cyan,
    # Red, Magenta, Yellow, White

    # Background
    BackgroundColor = 'Black'

    # Stars colors (top to bottom gradient)
    StarsColor1 = 'DarkBlue'
    StarsColor2 = 'DarkCyan'
    StarsColor3 = 'Cyan'

    # Planet ring colors
    RingGlow   = 'DarkYellow'
    RingBright = 'Yellow'

    # Planet body colors
    PlanetHighlight = 'White'
    PlanetMid       = 'Gray'
    PlanetDark      = 'DarkGray'

    # "KEEP IT CHILL" text gradient (top to bottom)
    TextColor1 = 'Red'
    TextColor2 = 'DarkYellow'
    TextColor3 = 'Yellow'
    TextColor4 = 'Green'
    TextColor5 = 'Cyan'
    TextColor6 = 'Blue'
    TextColor7 = 'Magenta'

    # Footer text color
    FooterColor = 'DarkCyan'
}

# Export the config
$Config

