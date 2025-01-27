from flask import Flask

app = Flask(__name__)

@app.route("/")
def index():
    return "Hello, World!"

# @app.route("/chat", methods=["POST"])
# def chat():
#     # Get the prompt from the client
#     data = request.json
#     prompt = data.get('prompt')

#     if not prompt:
#         return jsonify({"error": "No prompt provided"}), 400

if __name__== "__main__":
    # app.run(host="0.0.0.0", port=5000)
    app.run()