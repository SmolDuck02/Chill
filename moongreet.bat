@echo off
title Moon Greeting Launcher
color 0E

:menu
cls
echo.
echo ==========================================
echo       MOON GREETING CONTROL PANEL
echo ==========================================
echo.
echo   [1] View Moon Scene (Launch Once)
echo   [2] Start Reminder Loop (Runs in background)
echo   [3] Edit Configuration (config.ps1)
echo   [4] Exit
echo.
echo ==========================================
set /p choice="Enter your choice (1-4): "

:: Handle the logic
if "%choice%"=="1" goto view
if "%choice%"=="2" goto reminder
if "%choice%"=="3" goto config
if "%choice%"=="4" exit
goto menu

:view
:: Runs LaunchMoonScene.ps1 from the MoonScene folder
echo.
echo Launching Moon Scene...
powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0MoonScene\LaunchMoonScene.ps1"
goto menu

:reminder
:: Runs StartMoonReminder.ps1
echo.
echo Starting Reminder Loop...
powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0MoonScene\StartMoonReminder.ps1"
goto menu

:config
:: Opens the config file in Notepad
echo.
echo Opening configuration...
notepad "%~dp0MoonScene\config.ps1"
goto menu