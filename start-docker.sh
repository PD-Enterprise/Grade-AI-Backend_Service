#!/bin/bash
pip3 install -r requirements.txt
ollama serve &
sleep 10
python3 app.py