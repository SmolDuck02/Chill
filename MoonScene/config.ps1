<#
    config.ps1
    ═══════════════════════════════════════════════════════════════
    MOONSCENE CONFIGURATION FILE
    ═══════════════════════════════════════════════════════════════
#>

$Config = @{
    WindowWidth  = 180
    WindowHeight = 70
    ReminderIntervalSeconds = 3600
    
    # Background
    BackgroundColor = 'Black'
    
    # Star colors (for twinkling stars)
    StarsColor1 = 'White'
    StarsColor2 = 'Gray'
    StarsColor3 = 'DarkGray'
    
    # Ring/Galaxy glow colors
    RingGlow = 'Magenta'
    RingBright = 'Cyan'
    
    # Planet/Galaxy body colors
    PlanetHighlight = 'Yellow'
    PlanetMid = 'DarkYellow'
    PlanetDark = 'DarkMagenta'
    
    # Text colors (for KEEP IT CHILL fonts - rainbow colors)
    TextColor1 = 'Red'
    TextColor2 = 'DarkYellow'
    TextColor3 = 'Yellow'
    TextColor4 = 'Green'
    TextColor5 = 'Cyan'
    TextColor6 = 'Blue'
    TextColor7 = 'Magenta'
    TextColor8 = 'White'
    
    # Galaxy colors (for ASCII arts - vivid space vibes that pop against black)
    GalaxyColor1 = 'Magenta'        # Bright magenta
    GalaxyColor2 = 'Blue'           # Bright blue
    GalaxyColor3 = 'Cyan'           # Bright cyan
    GalaxyColor4 = 'DarkMagenta'    # Deep purple
    GalaxyColor5 = 'DarkBlue'       # Deep blue
    GalaxyColor6 = 'DarkCyan'       # Deep cyan
    GalaxyColor7 = 'White'          # Brilliant white stars
    GalaxyColor8 = 'DarkGray'       # Dark accents
    
    FooterColor = 'DarkCyan'
}

# Load ASCII Art from separate file
$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$artsPath = Join-Path $scriptDir 'arts.ps1'
$AsciiArtCollection = & $artsPath
# Estimated maximum widths (characters) for each art in AsciiArtCollection.
# Art 0 is the ringed planet (120), Arts 1-16 are galaxy scenes (140)
$AsciiArtWidths = @(
    120, 140, 140, 140, 140, 140, 140, 140, 140,
    140, 140, 140, 140, 140, 140, 140, 140
)

# ═══════════════════════════════════════════════════════════════════════════════
# TEXT STYLE COLLECTION - 11 fonts from fonts.txt
# ═══════════════════════════════════════════════════════════════════════════════

$TextStyleCollection = @(

    # FONT 1: Dollar Signs
    {
        param($c)
        Write-Host ' /$$   /$$ /$$$$$$$$ /$$$$$$$$ /$$$$$$$        /$$$$$$ /$$$$$$$$        /$$$$$$  /$$   /$$ /$$$$$$ /$$       /$$      ' -ForegroundColor $c.TextColor1
        Write-Host '| $$  /$$/| $$_____/| $$_____/| $$__  $$      |_  $$_/|__  $$__/       /$$__  $$| $$  | $$|_  $$_/| $$      | $$      ' -ForegroundColor $c.TextColor2
        Write-Host '| $$ /$$/ | $$      | $$      | $$  \ $$        | $$     | $$         | $$  \__/| $$  | $$  | $$  | $$      | $$      ' -ForegroundColor $c.TextColor3
        Write-Host '| $$$$$/  | $$$$$   | $$$$$   | $$$$$$$/        | $$     | $$         | $$      | $$$$$$$$  | $$  | $$      | $$      ' -ForegroundColor $c.TextColor4
        Write-Host '| $$  $$  | $$__/   | $$__/   | $$____/         | $$     | $$         | $$      | $$__  $$  | $$  | $$      | $$      ' -ForegroundColor $c.TextColor5
        Write-Host '| $$\  $$ | $$      | $$      | $$              | $$     | $$         | $$    $$| $$  | $$  | $$  | $$      | $$      ' -ForegroundColor $c.TextColor6
        Write-Host '| $$ \  $$| $$$$$$$$| $$$$$$$$| $$             /$$$$$$   | $$         |  $$$$$$/| $$  | $$ /$$$$$$| $$$$$$$$| $$$$$$$$' -ForegroundColor $c.TextColor7
        Write-Host '|__/  \__/|________/|________/|__/            |______/   |__/          \______/ |__/  |__/|______/|________/|________/' -ForegroundColor $c.TextColor8
    }

    # FONT 2: Fancy Script
    ,{
        param($c)
        Write-Host "                                                                  ,----,                                          ,--,      ,--,    " -ForegroundColor $c.TextColor1
        Write-Host "       ,--.                      .----.                         ,/   .*|                           ,--,        ,---.'|   ,---.'|    " -ForegroundColor $c.TextColor2
        Write-Host "   ,--/  /|    ,---,.    ,---,./    /  \             ,---,    ,*   .'  :          ,----..        ,--.'|   ,---,|   | :   |   | :    " -ForegroundColor $c.TextColor3
        Write-Host ",---,': / '  ,'  .' |  ,'  .' ||   :    \         ,*--.' |  ;    ;     /         /   /   \    ,--,  | :,*--.' |:   : |   :   : |    " -ForegroundColor $c.TextColor4
        Write-Host ":   : '/ / ,---.'   |,---.'   ||   |  .\ :        |   :  :.'___,/    ,'         |   :     :,---.'|  : '|   :  :|   ' :   |   ' :    " -ForegroundColor $c.TextColor5
        Write-Host "|   '   ,  |   |   .'|   |   .'.   :  |: |        :   |  '|    :     |          .   |  ;. /|   | : _' |:   |  ';   ; '   ;   ; '    " -ForegroundColor $c.TextColor6
        Write-Host "'   |  /   :   :  |-,:   :  |-,|   |   \ :        |   :  |;    |.';  ;          .   ; /--* :   : |.'  ||   :  |'   | |__ '   | |__  " -ForegroundColor $c.TextColor7
        Write-Host "|   ;  ;   :   |  ;/|:   |  ;/||   : .   /        '   '  ;*----'  |  |          ;   | ;    |   ' '  ; :'   '  ;|   | :.'||   | :.'| " -ForegroundColor $c.TextColor8
        Write-Host ":   '   \  |   :   .'|   :   .';   | |*-'         |   |  |    '   :  ;          |   : |    '   |  .'. ||   |  |'   :    ;'   :    ; " -ForegroundColor $c.TextColor1
        Write-Host "|   |    ' |   |  |-,|   |  |-,|   | ;            '   :  ;    |   |  '          .   | '___ |   | :  | ''   :  ;|   |  ./ |   |  ./  " -ForegroundColor $c.TextColor2
        Write-Host "'   : |.  \'   :  ;/|'   :  ;/|:   ' |            |   |  '    '   :  |          '   ; : .'|'   : |  : ;|   |  ';   : ;   ;   : ;    " -ForegroundColor $c.TextColor3
        Write-Host "|   | '_\.'|   |    \|   |    \:   : :            '   :  |    ;   |.'           '   | '/  :|   | '  ,/ '   :  ||   ,/    |   ,/     " -ForegroundColor $c.TextColor4
        Write-Host "'   : |    |   :   .'|   :   .'|   | :            ;   |.'     '---'             |   :    / ;   : ;--'  ;   |.' '---'     '---'      " -ForegroundColor $c.TextColor5
        Write-Host ";   |,'    |   | ,'  |   | ,'  *---'.|            '---'                          \   \ .'  |   ,/      '---'                        " -ForegroundColor $c.TextColor6
        Write-Host "'---'      *----'    *----'      *---*                                            *---*    '---'                                    " -ForegroundColor $c.TextColor7
    }

    # FONT 3: Parentheses Style
    ,{
        param($c)
        Write-Host '                                )         (      (                      ) (   (    (     ' -ForegroundColor $c.TextColor1
        Write-Host '                             ( /(         )\ )   )\ )  *   )     (   ( /( )\ ))\ ) )\ )  ' -ForegroundColor $c.TextColor2
        Write-Host '                             )\())(   (  (()/(  (()/(* )  /(     )\  )\()|()/(()/((()/(  ' -ForegroundColor $c.TextColor3
        Write-Host '                           |((_)\ )\  )\  /(_))  /(_))( )(_))  (((_)((_)\ /(_))(_))/(_)) ' -ForegroundColor $c.TextColor4
        Write-Host '                           |_ ((_|(_)((_)(_))   (_)) (_(_())   )\___ _((_|_))(_)) (_))   ' -ForegroundColor $c.TextColor5
        Write-Host '                           | |/ /| __| __| _ \  |_ _||_   _|  ((/ __| || |_ _| |  | |    ' -ForegroundColor $c.TextColor6
        Write-Host "                           |  ' < | _|| _||  _/   | |   | |     | (__| __ || || |__| |__  " -ForegroundColor $c.TextColor7
        Write-Host '                           |_|\_\|___|___|_|    |___|  |_|      \___|_||_|___|____|____| ' -ForegroundColor $c.TextColor8
    }

    # FONT 4: Big Block Letters
    ,{
        param($c)
        Write-Host '' -ForegroundColor $c.TextColor1
        Write-Host '____    ____       ______        ______        _____          ____  _________________             _____    ____   ____  ____  ____         ____        ' -ForegroundColor $c.TextColor2
        Write-Host '|    |  |    |  ___|\     \   ___|\     \   ___|\    \        |    |/                 \        ___|\    \  |    | |    ||    ||    |       |    |       ' -ForegroundColor $c.TextColor3
        Write-Host '|    |  |    | |     \     \ |     \     \ |    |\    \       |    |\______     ______/       /    /\    \ |    | |    ||    ||    |       |    |       ' -ForegroundColor $c.TextColor4
        Write-Host '|    | /    // |     ,_____/||     ,_____/||    | |    |      |    |   \( /    /  )/         |    |  |    ||    |_|    ||    ||    |       |    |       ' -ForegroundColor $c.TextColor5
        Write-Host "|    |/ _ _//  |     \--'\_|/|     \--'\_|/|    |/____/|      |    |    ' |   |   '          |    |  |____||    .-.    ||    ||    |  ____ |    |  ____ " -ForegroundColor $c.TextColor6
        Write-Host "|    |\    \'  |     /___/|  |     /___/|  |    ||    ||      |    |      |   |              |    |   ____ |    | |    ||    ||    | |    ||    | |    |" -ForegroundColor $c.TextColor7
        Write-Host '|    | \    \  |     \____|\ |     \____|\ |    ||____|/      |    |     /   //              |    |  |    ||    | |    ||    ||    | |    ||    | |    |' -ForegroundColor $c.TextColor8
        Write-Host "|____|  \____\ |____ '     /||____ '     /||____|             |____|    /___//               |\ ___\/    /||____| |____||____||____|/____/||____|/____/|" -ForegroundColor $c.TextColor1
        Write-Host "|    |   |    ||    /_____/ ||    /_____/ ||    |             |    |   |    |                | |   /____/ ||    | |    ||    ||    |     |||    |     ||" -ForegroundColor $c.TextColor2
        Write-Host '|____|   |____||____|     | /|____|     | /|____|             |____|   |____|                 \|___|    | /|____| |____||____||____|_____|/|____|_____|/' -ForegroundColor $c.TextColor3
        Write-Host "\(       )/    \( |_____|/   \( |_____|/   \(                 \(       \(                     \( |____|/   \(     )/    \(    \(    )/     \(    )/   " -ForegroundColor $c.TextColor4
        Write-Host "'       '      '    )/       '    )/       '                  '        '                      '   )/       '     '      '     '    '       '    '    " -ForegroundColor $c.TextColor5
        Write-Host "'             '                                                               '                                                  " -ForegroundColor $c.TextColor6
    }

    # FONT 5: Slashes Pattern (two-part)
    ,{
        param($c)
        Write-Host '__/\\\________/\\\__/\\\\\\\\\\\\\\\__/\\\\\\\\\\\\\\\__/\\\\\\\\\\\\\______________/\\\\\\\\\\\__/\\\\\\\\\\\\\\\___________         ' -ForegroundColor $c.TextColor1
        Write-Host '__\/\\\_____/\\\//__\/\\\///////////__\/\\\///////////__\/\\\/////////\\\___________\/////\\\///__\///////\\\/////____________        ' -ForegroundColor $c.TextColor2
        Write-Host '___\/\\\__/\\\//_____\/\\\_____________\/\\\_____________\/\\\_______\/\\\_______________\/\\\___________\/\\\_________________       ' -ForegroundColor $c.TextColor3
        Write-Host '____\/\\\\\\//\\\_____\/\\\\\\\\\\\_____\/\\\\\\\\\\\_____\/\\\\\\\\\\\\\/________________\/\\\___________\/\\\_________________      ' -ForegroundColor $c.TextColor4
        Write-Host '_____\/\\\//_\//\\\____\/\\\///////______\/\\\///////______\/\\\/////////__________________\/\\\___________\/\\\_________________     ' -ForegroundColor $c.TextColor5
        Write-Host '______\/\\\____\//\\\___\/\\\_____________\/\\\_____________\/\\\___________________________\/\\\___________\/\\\_________________    ' -ForegroundColor $c.TextColor6
        Write-Host '_______\/\\\_____\//\\\__\/\\\_____________\/\\\_____________\/\\\___________________________\/\\\___________\/\\\_________________   ' -ForegroundColor $c.TextColor7
        Write-Host '________\/\\\______\//\\\_\/\\\\\\\\\\\\\\\_\/\\\\\\\\\\\\\\\_\/\\\________________________/\\\\\\\\\\\_______\/\\\_________________  ' -ForegroundColor $c.TextColor8
        Write-Host '_________\///________\///__\///////////////__\///////////////__\///________________________\///////////________\///__________________ ' -ForegroundColor $c.TextColor1
        Write-Host '    ______________________/\\\\\\\\\__/\\\________/\\\__/\\\\\\\\\\\__/\\\______________/\\\___________________________________       ' -ForegroundColor $c.TextColor2
        Write-Host '    ____________________/\\\////////__\/\\\_______\/\\\_\/////\\\///__\/\\\_____________\/\\\___________________________________      ' -ForegroundColor $c.TextColor3
        Write-Host '    ___________________/\\\/___________\/\\\_______\/\\\_____\/\\\_____\/\\\_____________\/\\\___________________________________     ' -ForegroundColor $c.TextColor4
        Write-Host '    ___________________/\\\_____________\/\\\\\\\\\\\\\\\_____\/\\\_____\/\\\_____________\/\\\___________________________________     ' -ForegroundColor $c.TextColor5
        Write-Host '    ___________________\/\\\_____________\/\\\/////////\\\_____\/\\\_____\/\\\_____________\/\\\___________________________________    ' -ForegroundColor $c.TextColor6
        Write-Host '    ____________________\//\\\____________\/\\\_______\/\\\_____\/\\\_____\/\\\_____________\/\\\___________________________________   ' -ForegroundColor $c.TextColor7
        Write-Host '    ______________________\///\\\__________\/\\\_______\/\\\_____\/\\\_____\/\\\_____________\/\\\___________________________________ ' -ForegroundColor $c.TextColor8
        Write-Host '    _________________________\////\\\\\\\\\_\/\\\_______\/\\\__/\\\\\\\\\\\_\/\\\\\\\\\\\\\\\_\/\\\\\\\\\\\\\\\_______________________ ' -ForegroundColor $c.TextColor1
        Write-Host '    _____________________________\/////////__\////_______\////__\///////////__\///////////////__\///////////////________________________' -ForegroundColor $c.TextColor2
    }

    # FONT 6: Big Money (Pipes)
    ,{
        param($c)
        Write-Host ' ___  __    _______   _______   ________        ___  _________        ________  ___  ___  ___  ___       ___          ' -ForegroundColor $c.TextColor1
        Write-Host '|\  \ |\  \ |\  ___ \ |\  ___ \ |\   __  \      |\  \|\___   ___\     |\   ____\|\  \|\  \|\  \|\  \     |\  \         ' -ForegroundColor $c.TextColor2
        Write-Host ' \ \  \/  /|\ \   __/|\ \   __/|\ \  \|\  \     \ \  \|___ \  \_|     \ \  \___|\ \  \\\  \ \  \ \  \    \ \  \        ' -ForegroundColor $c.TextColor3
        Write-Host '  \ \   ___  \ \  \_|/_\ \  \_|/_\ \   ____\     \ \  \   \ \  \       \ \  \    \ \   __  \ \  \ \  \    \ \  \       ' -ForegroundColor $c.TextColor4
        Write-Host '   \ \  \\ \  \ \  \_|\ \ \  \_|\ \ \  \___|      \ \  \   \ \  \       \ \  \____\ \  \ \  \ \  \ \  \____\ \  \____  ' -ForegroundColor $c.TextColor5
        Write-Host '    \ \__\\ \__\ \_______\ \_______\ \__\          \ \__\   \ \__\       \ \_______\ \__\ \__\ \__\ \_______\ \_______\' -ForegroundColor $c.TextColor6
        Write-Host '     \|__| \|__|\|_______|\|_______|\|__|           \|__|    \|__|        \|_______|\|__|\|__|\|__|\|_______|\|_______|' -ForegroundColor $c.TextColor7
    }

    # FONT 7: Simple Backslash Style
    ,{
        param($c)
        Write-Host ' __  __     ______     ______     ______      __     ______      ______     __  __     __     __         __        ' -ForegroundColor $c.TextColor1
        Write-Host '/\ \/ /    /\  ___\   /\  ___\   /\  == \    /\ \   /\__  _\    /\  ___\   /\ \_\ \   /\ \   /\ \       /\ \       ' -ForegroundColor $c.TextColor2
        Write-Host '\ \  _"-.  \ \  __\   \ \  __\   \ \  _-/    \ \ \  \/_/\ \/    \ \ \____  \ \  __ \  \ \ \  \ \ \____  \ \ \____  ' -ForegroundColor $c.TextColor3
        Write-Host ' \ \_\ \_\  \ \_____\  \ \_____\  \ \_\       \ \_\    \ \_\     \ \_____\  \ \_\ \_\  \ \_\  \ \_____\  \ \_____\ ' -ForegroundColor $c.TextColor4
        Write-Host '  \/_/\/_/   \/_____/   \/_____/   \/_/        \/_/     \/_/      \/_____/   \/_/\/_/   \/_/   \/_____/   \/_____/ ' -ForegroundColor $c.TextColor5
    }

    # FONT 8: Colons Style (:::)
    ,{
        param($c)
        Write-Host '      :::    ::: :::::::::: :::::::::: :::::::::          ::::::::::: :::::::::::          ::::::::  :::    ::: ::::::::::: :::        :::  ' -ForegroundColor $c.TextColor1
        Write-Host '     :+:   :+:  :+:        :+:        :+:    :+:             :+:         :+:             :+:    :+: :+:    :+:     :+:     :+:        :+:   ' -ForegroundColor $c.TextColor2
        Write-Host '    +:+  +:+   +:+        +:+        +:+    +:+             +:+         +:+             +:+        +:+    +:+     +:+     +:+        +:+    ' -ForegroundColor $c.TextColor3
        Write-Host '   +#++:++    +#++:++#   +#++:++#   +#++:++#+              +#+         +#+             +#+        +#++:++#++     +#+     +#+        +#+     ' -ForegroundColor $c.TextColor4
        Write-Host '  +#+  +#+   +#+        +#+        +#+                    +#+         +#+             +#+        +#+    +#+     +#+     +#+        +#+      ' -ForegroundColor $c.TextColor5
        Write-Host ' #+#   #+#  #+#        #+#        #+#                    #+#         #+#             #+#    #+# #+#    #+#     #+#     #+#        #+#       ' -ForegroundColor $c.TextColor6
        Write-Host '###    ### ########## ########## ###                ###########     ###              ########  ###    ### ########### ########## ########## ' -ForegroundColor $c.TextColor7
    }

    # FONT 9: Hash Colons (##::)
    ,{
        param($c)
        Write-Host "'##:::'##:'########:'########:'########:::::'####:'########:::::'######::'##::::'##:'####:'##:::::::'##:::::::" -ForegroundColor $c.TextColor1
        Write-Host "##::'##:: ##.....:: ##.....:: ##.... ##::::. ##::... ##..:::::'##... ##: ##:::: ##:. ##:: ##::::::: ##:::::::" -ForegroundColor $c.TextColor2
        Write-Host "##:'##::: ##::::::: ##::::::: ##:::: ##::::: ##::::: ##::::::: ##:::..:: ##:::: ##:: ##:: ##::::::: ##:::::::" -ForegroundColor $c.TextColor3
        Write-Host "#####:::: ######::: ######::: ########:::::: ##::::: ##::::::: ##::::::: #########:: ##:: ##::::::: ##:::::::" -ForegroundColor $c.TextColor4
        Write-Host "##. ##::: ##...:::: ##...:::: ##.....::::::: ##::::: ##::::::: ##::::::: ##.... ##:: ##:: ##::::::: ##:::::::" -ForegroundColor $c.TextColor5
        Write-Host "##:. ##:: ##::::::: ##::::::: ##:::::::::::: ##::::: ##::::::: ##::: ##: ##:::: ##:: ##:: ##::::::: ##:::::::" -ForegroundColor $c.TextColor6
        Write-Host "##::. ##: ########: ########: ##:::::::::::'####:::: ##:::::::. ######:: ##:::: ##:'####: ########: ########:" -ForegroundColor $c.TextColor7
        Write-Host "..::::..::........::........::..::::::::::::....:::::..:::::::::......:::..:::::..::....::........::........::" -ForegroundColor $c.TextColor8
    }

    # FONT 10: Underscore Box
    ,{
        param($c)
        Write-Host '_______   ________   _______   ________    _     _         _     _______   _______   _     _   _______   _______  ' -ForegroundColor $c.TextColor1
        Write-Host '|_     _| | ._ _.  | | ._ _. | |__ ___  \  | |___| |  _____\ |   / _____ \ \__   __\ | |___| | / ______\ / ______\ ' -ForegroundColor $c.TextColor2
        Write-Host ".' _  '. | \ v / |  | \ v / |   | \\_/ |  |  ___  | \\_____ |   | \   / |  __| |__  |  ___  | | \       | \       " -ForegroundColor $c.TextColor3
        Write-Host "|_.' '._| |_/   \\_| |_/   \_|   '.___.'   |_|   |_|       /_|   \_/   \_/ \_______\ |_|   |_| |_/       |_/       " -ForegroundColor $c.TextColor4
    }

    # FONT 11: Diamond Pattern
    ,{
        param($c)
        Write-Host '_/\/\____/\/\__/\/\/\/\/\/\__/\/\/\/\/\/\__/\/\/\/\/\________/\/\/\/\__/\/\/\/\/\/\________/\/\/\/\/\__/\/\____/\/\__/\/\/\/\__/\/\________/\/\_______' -ForegroundColor $c.TextColor1
        Write-Host '_/\/\__/\/\____/\____________/\____________/\/\____/\/\________/\/\________/\/\__________/\/\__________/\/\____/\/\____/\/\____/\/\________/\/\_______ ' -ForegroundColor $c.TextColor2
        Write-Host '_/\/\/\/\______/\/\/\/\/\____/\/\/\/\/\____/\/\/\/\/\__________/\/\________/\/\__________/\/\__________/\/\/\/\/\/\____/\/\____/\/\________/\/\_______  ' -ForegroundColor $c.TextColor3
        Write-Host '_/\/\__/\/\____/\/\__________/\/\__________/\/\________________/\/\________/\/\__________/\/\__________/\/\____/\/\____/\/\____/\/\________/\/\_______   ' -ForegroundColor $c.TextColor4
        Write-Host '_/\/\____/\/\__/\/\/\/\/\/\__/\/\/\/\/\/\__/\/\______________/\/\/\/\______/\/\____________/\/\/\/\/\__/\/\____/\/\__/\/\/\/\__/\/\/\/\/\__/\/\/\/\/\_    ' -ForegroundColor $c.TextColor5
        Write-Host '______________________________________________________________________________________________________________________________________________________     ' -ForegroundColor $c.TextColor6
    }

)

@{
    Config = $Config
    AsciiArtCollection = $AsciiArtCollection
    TextStyleCollection = $TextStyleCollection
    AsciiArtWidths = $AsciiArtWidths
    # Estimated maximum widths for each font; used to avoid cut-off on narrow windows.
    TextStyleWidths = @(
        125, # Font 1 Dollar Signs
        145, # Font 2 Fancy Script
        80,  # Font 3 Parentheses
        150, # Font 4 Big Block Letters
        155, # Font 5 Slashes Pattern
        125, # Font 6 Big Money
        115, # Font 7 Simple Backslash
        150, # Font 8 Colons Style
        125, # Font 9 Hash Colons
        120, # Font10 Underscore Box
        145  # Font11 Diamond Pattern (trimmed)
    )
}
