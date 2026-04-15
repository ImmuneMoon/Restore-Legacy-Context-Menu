@echo off
title Classic Context Menu Restorer
echo Restoring the classic Windows right-click menu...
echo.

:: Add the registry key
reg.exe add "HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32" /f /ve

echo.
echo Restarting Windows Explorer to apply changes...
timeout /t 2 /nobreak >nul

:: Kill and restart Explorer
taskkill /f /im explorer.exe
start explorer.exe

echo.
echo Done! 
pause