@echo off
setlocal
for /f "tokens=5" %%P in ('netstat -ano ^| findstr /R /C:":8000 .*LISTENING"') do taskkill /PID %%P /T /F >nul 2>&1
for /f "tokens=5" %%P in ('netstat -ano ^| findstr /R /C:":8001 .*LISTENING"') do taskkill /PID %%P /T /F >nul 2>&1
for /f "tokens=5" %%P in ('netstat -ano ^| findstr /R /C:":8002 .*LISTENING"') do taskkill /PID %%P /T /F >nul 2>&1
echo KshetraSetu local server stopped (common ports 8000-8002).
pause
