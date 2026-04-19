@echo off
setlocal enabledelayedexpansion
cd /d "%~dp0"

echo --- STARTING SIMULATOR ---
echo Current Directory: %cd%

set "ACTIVATE_PATH="

for %%d in (env venv .venv) do (
    if exist "%%d\Scripts\activate.bat" set "ACTIVATE_PATH=%%d\Scripts\activate.bat"
    if exist "%%d\bin\activate.bat" set "ACTIVATE_PATH=%%d\bin\activate.bat"
)

if "%ACTIVATE_PATH%"=="" (
    echo [ERROR] Could not find the activation file in 'env', 'venv', or '.venv'.
    echo Please ensure the virtual environment folder contains a 'Scripts' subfolder.
    dir env 2>nul
    pause
    exit /b
)

echo [OK] Virtual environment found: %ACTIVATE_PATH%
call "%ACTIVATE_PATH%"

echo [OK] Starting Voila server...
start "" "http://localhost:8866"
voila simulator.ipynb --no-browser --port=8866

pause