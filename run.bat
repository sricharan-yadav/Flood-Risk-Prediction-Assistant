@echo off
title Flood Risk Prediction Assistant
echo ======================================================================
echo           FLOOD RISK PREDICTION ASSISTANT - ONE-CLICK LAUNCHER
echo ======================================================================
echo.

cd /d "%~dp0"

echo [1/3] Checking Python installation...
python --version >nul 2>&1
if %errorlevel% neq 0 (
    echo [ERROR] Python is not installed or not in system PATH!
    echo Please install Python 3.10+ from python.org and try again.
    pause
    exit /b 1
)

echo [2/3] Checking Machine Learning Model...
if not exist "backend\ml\flood_model.joblib" (
    echo [INFO] Model not found. Training machine learning models...
    python backend\ml\train_model.py
)

echo [3/3] Starting Unified Server on http://127.0.0.1:8000 ...
echo Opening your web browser...
start http://127.0.0.1:8000
python run_server.py

pause
