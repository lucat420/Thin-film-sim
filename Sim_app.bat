@echo off
setlocal enabledelayedexpansion
cd /d "%~dp0"

title Optical Simulator Setup

python --version >nul 2>&1
if %errorlevel% neq 0 (
    echo [!] Python was not found on this system.
    echo [INFO] Attempting automated installation via Winget...

    winget install -e --id Python.Python.3.12 --scope machine
    
    if !errorlevel! neq 0 (
        echo [ERROR] Automated installation failed or Winget is not available.
        echo [INFO] Redirecting to official Python website...
        start https://www.python.org/downloads/
        echo Please install Python manually and ensure "Add Python to PATH" is checked.
        pause
        exit /b
    )
    
    echo [OK] Python installed successfully. 
    echo [SYSTEM] Please RESTART this script to apply environment changes.
    pause
    exit /b
)

echo --- OPTICAL SIMULATOR SETUP ---

if not exist "env\Scripts\activate.bat" (
    echo [INFO] Creating environment...[cite: 2]
    python -m venv env[cite: 2]
)

echo [INFO] Updating dependencies...[cite: 2]
env\Scripts\python.exe -m pip install numpy matplotlib ipywidgets voila refractiveindex ipykernel[cite: 2]

echo [INFO] Registering kernel...[cite: 2]
env\Scripts\python.exe -m ipykernel install --user --name python3 --display-name "Python 3 (env)"[cite: 2]


echo [INFO] Initializing Voila server in background...[cite: 2]
start /b "" env\Scripts\voila.exe simulator.ipynb --no-browser --port=8866 --show_tracebacks=True[cite: 2]


echo [INFO] Waiting 7 seconds for the engine to load heavy libraries...[cite: 2]
timeout /t 7 /nobreak >nul[cite: 2]


echo [OK] Launching UI...[cite: 2]
start "" "http://localhost:8866"[cite: 2]

echo [SYSTEM] Server is active. Do not close this window.[cite: 2]
pause[cite: 2]