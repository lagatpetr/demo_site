@echo off
rem Starts a tiny local web server so the camera and the offline AI work reliably.
cd /d "%~dp0"
set PY=
where python >nul 2>nul
if not errorlevel 1 set PY=python
if "%PY%"=="" (
  where py >nul 2>nul
  if not errorlevel 1 set PY=py
)
if "%PY%"=="" (
  echo Python was not found. Install it from python.org, or open AI_Item_Check_Demo.html directly - internet needed.
  pause
  exit /b 1
)
echo Starting the AI item demo server on http://localhost:8765
echo Keep the server window open during the show. Close it to stop.
start "AI item demo server" %PY% -m http.server 8765
timeout /t 2 >nul
start "" http://localhost:8765/AI_Item_Check_Demo.html
