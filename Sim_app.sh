cd "$(dirname "$0")"

echo "--- OPTICAL SIMULATOR SETUP ---"

if [ ! -d "env" ]; then
    echo "[INFO] Virtual environment not found. Creating 'env'..."
    python3 -m venv env
fi

echo "[INFO] Activating environment and installing libraries..."
source env/bin/activate
pip install --upgrade pip

pip install -r requirements.txt ipykernel

echo "[INFO] Registering Jupyter kernel for Voila..."
python3 -m ipykernel install --user --name python3 --display-name "Python 3 (env)"

echo "[OK] Starting Voila server..."

voila simulator.ipynb --no-browser --port=8866 --show_tracebacks=True & 

sleep 2

if [[ "$OSTYPE" == "darwin"* ]]; then
    open "http://localhost:8866"
else
    xdg-open "http://localhost:8866"
fi

echo "[OK] Simulator is running. Press Ctrl+C to stop."
wait
