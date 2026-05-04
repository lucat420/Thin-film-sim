@echo off
setlocal enabledelayedexpansion
cd /d "%~dp0"

title Optical Simulator Setup

python --version >nul 2>&1
if %errorlevel% neq 0 (
    echo [!] Python was not found. Attempting auto-install...
    winget install -e --id Python.Python.3.12 --scope machine
    if !errorlevel! neq 0 (
        echo [ERROR] Auto-install failed.
        start https://www.python.org/downloads/
        pause
        exit /b
    )
    echo [OK] Python installed. RESTART this script.
    pause
    exit /b
)

echo --- OPTICAL SIMULATOR SETUP ---

if not exist "env\Scripts\activate.bat" (
    echo [INFO] Creating environment...
    python -m venv env
)

echo [INFO] Updating dependencies...
env\Scripts\python.exe -m pip install numpy matplotlib ipywidgets voila refractiveindex ipykernel

echo [INFO] Registering kernel...
env\Scripts\python.exe -m ipykernel install --user --name python3 --display-name "Python 3 (env)"

echo [INFO] Initializing Voila server...
start /b "" env\Scripts\voila.exe simulator.ipynb --no-browser --port=8866 --show_tracebacks=True

timeout /t 7 /nobreak >nul

echo [OK] Launching UI...
start "" "http://localhost:8866"

echo [SYSTEM] Server is active.
pause