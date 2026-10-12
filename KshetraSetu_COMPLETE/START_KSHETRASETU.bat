@echo off
setlocal
cd /d "%~dp0"

powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%~dp0start.ps1"
if errorlevel 1 (
  echo.
  echo KshetraSetu could not be started.
  echo Please read the error above.
  echo.
  pause
)
exit /b %ERRORLEVEL%
