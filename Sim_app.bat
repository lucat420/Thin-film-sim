@echo off
setlocal enabledelayedexpansion
cd /d "%~dp0"

echo --- OPTICAL SIMULATOR SETUP ---

if not exist "env\Scripts\activate.bat" (
    echo [INFO] Virtual environment not found. Creating 'env'...
    python -m venv env
)

echo [INFO] Installing required libraries...
env\Scripts\python.exe -m pip install numpy matplotlib ipywidgets voila refractiveindex ipykernel

echo [INFO] Registering Jupyter kernel for Voila...
env\Scripts\python.exe -m ipykernel install --user --name python3 --display-name "Python 3 (env)"

echo [OK] Starting Voila server...
start "" "http://localhost:8866"
env\Scripts\voila.exe simulator.ipynb --no-browser --port=8866 --show_tracebacks=True

pause