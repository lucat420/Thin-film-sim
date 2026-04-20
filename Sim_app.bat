@echo off
setlocal enabledelayedexpansion
cd /d "%~dp0"

echo --- OPTICAL SIMULATOR SETUP ---

if not exist "env\Scripts\activate.bat" (
    echo [INFO] Creating environment...
    python -m venv env
)

echo [INFO] Updating dependencies...
env\Scripts\python.exe -m pip install numpy matplotlib ipywidgets voila refractiveindex ipykernel

echo [INFO] Registering kernel...
env\Scripts\python.exe -m ipykernel install --user --name python3 --display-name "Python 3 (env)"

echo [INFO] Initializing Voila server in background...
start /b "" env\Scripts\voila.exe simulator.ipynb --no-browser --port=8866 --show_tracebacks=True

echo [INFO] Waiting 7 seconds for the engine to load heavy libraries...
timeout /t 7 /nobreak >nul

echo [OK] Launching UI...
start "" "http://localhost:8866"

echo [SYSTEM] Server is active. Do not close this window.
pause