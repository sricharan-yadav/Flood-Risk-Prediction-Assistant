@echo off
title Flood Risk Prediction Assistant - Backend Server
cd /d "%~dp0"
echo Starting FastAPI Uvicorn Backend on http://127.0.0.1:8000 ...
python -m uvicorn backend.app.main:app --host 127.0.0.1 --port 8000 --reload
pause
