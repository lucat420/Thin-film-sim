cd "$(dirname "$0")"

echo "--- OPTICAL SIMULATOR SETUP (Unix) ---"

if [ ! -d "env" ]; then
    echo "[INFO] Creating environment..."
    python3 -m venv env
fi

source env/bin/activate
pip install numpy matplotlib ipywidgets voila refractiveindex ipykernel

echo "[INFO] Registering kernel..."
python3 -m ipykernel install --user --name python3 --display-name "Python 3 (env)"

echo "[INFO] Initializing server..."
voila simulator.ipynb --no-browser --port=8866 --show_tracebacks=True & 

echo "[INFO] Waiting 7 seconds for engine warm-up..."
sleep 7

if [[ "$OSTYPE" == "darwin"* ]]; then
    open "http://localhost:8866"
else
    xdg-open "http://localhost:8866"
fi

echo "[OK] Simulator active. Press Ctrl+C to terminate."
wait