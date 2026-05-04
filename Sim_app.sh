#!/bin/bash

cd "$(dirname "$0")"

echo "--- OPTICAL SIMULATOR SETUP (LINUX) ---"

if ! command -v python3 &> /dev/null; then
    echo "[ERROR] Python 3 is not installed. Please install it using your package manager (e.g., sudo apt install python3)."
    exit 1
fi

if [ ! -d "env" ]; then
    echo "[INFO] Creating virtual environment..."
    python3 -m venv env
fi

echo "[INFO] Updating dependencies..."
./env/bin/pip install numpy matplotlib ipywidgets voila refractiveindex ipykernel[cite: 6]

echo "[INFO] Registering kernel..."
./env/bin/python -m ipykernel install --user --name python3 --display-name "Python 3 (env)"

echo "[INFO] Initializing Voila server..."
./env/bin/voila simulator_13.ipynb --no-browser --port=8866 --show_tracebacks=True &


echo "[INFO] Waiting 7 seconds for the engine to load..."
sleep 7

echo "[OK] Launching UI..."
if command -v xdg-open &> /dev/null; then
    xdg-open http://localhost:8866
elif command -v gnome-open &> /dev/null; then
    gnome-open http://localhost:8866
else
    echo "[SYSTEM] Please open your browser and go to http://localhost:8866"
fi

echo "[SYSTEM] Server is active. Keep this terminal open to use the simulator."
wait