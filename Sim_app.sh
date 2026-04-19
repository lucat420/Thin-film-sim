# Universal Launcher for Unix-based systems (Mac/Linux)

echo "Checking environment..."
if [ ! -d "env" ]; then
    echo "Creating virtual environment..."
    python3 -m venv env
    source env/bin/activate
    pip install --upgrade pip
    pip install -r requirements.txt
else
    source env/bin/activate
fi

pip install voila ipywidgets

echo "Launching UI..."
voila simulator.ipynb