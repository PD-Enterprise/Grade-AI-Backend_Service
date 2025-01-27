from flask import Flask, request, Response, jsonify
import subprocess
import os

app = Flask(__name__)

@app.route("/")
def index():
    return jsonify({
        "status": "healthy",
        "message": "API is running"
    })

@app.route("/chat", methods=["POST"])
def chat():
    # Get the prompt from the client
    data = request.json
    prompt = data.get('prompt')

    if not prompt:
        return jsonify({"error": "No prompt provided"}), 400

    try:
        result = subprocess.run(
            ["ollama", "run", "deepseek-r1:1.5b", prompt],
            capture_output=True,
            text=True
        )
        reponse = result.stdout
        return jsonify({"response": reponse}), 200
    except Exception as e:
        return jsonify({"error": str(e)}), 500

if __name__== "__main__":
    port = int(os.environ.get("PORT", 10000))
    app.run(host="0.0.0.0", port=port)