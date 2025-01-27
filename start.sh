#!bin/bash

# Install Ollama
curl -fsSL https://ollama.ai/install.sh | sh

# Start Ollama in the background
ollama serve &

# Wait for Ollama to start (adjust sleep time if needed)
sleep 10

# Run your Flask app
python app.py