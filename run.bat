@echo off
chcp 65001 >nul
title AI Data Intelligence Pro
cd /d "%~dp0"
echo ==========================================
echo   AI Data Intelligence Pro - Launcher
echo ==========================================
where py >nul 2>nul
if %errorlevel%==0 (
    set PY=py
) else (
    set PY=python
)
%PY% --version
if errorlevel 1 (
    echo Python is not installed or is not in PATH.
    echo Install Python 3.11 or 3.12, then run this file again.
    pause
    exit /b 1
)
if not exist ".venv\Scripts\python.exe" (
    echo Creating virtual environment...
    %PY% -m venv .venv
    if errorlevel 1 (
        echo Could not create virtual environment.
        pause
        exit /b 1
    )
)
echo Installing/updating required libraries...
".venv\Scripts\python.exe" -m pip install --upgrade pip
".venv\Scripts\python.exe" -m pip install -r requirements.txt
if errorlevel 1 (
    echo Library installation failed. Check your internet connection.
    pause
    exit /b 1
)
echo Starting application...
".venv\Scripts\python.exe" -m streamlit run app.py
pause
