@echo off
title Flood Risk Prediction Assistant - Frontend Dev Server
cd /d "%~dp0frontend"
set "PATH=%LOCALAPPDATA%\Programs\nodejs;%PATH%"
echo Starting Vite React Dev Server on http://localhost:5173 ...
call npm run dev
pause
