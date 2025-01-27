#!/bin/bash

# Start Ollama in the background
ollama serve &

# Run your Flask app
python3 app.py