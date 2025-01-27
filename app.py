from flask import Flask, request, jsonify
import subprocess

app = Flask(__name__)

@app.route("/")
def index():
    print("Hello, World!")

@app.route("/chat", methods=["POST"])
def chat():
    # Get the prompt from the client
    data = request.json
    prompt = data.get('prompt')

    if not prompt:
        return jsonify({"error": "No prompt provided"}), 400

if __name__== "__main__":
    app.run(host="0.0.0.0", port=5000)