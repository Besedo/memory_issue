from flask import Flask, request

app = Flask(__name__)

@app.route("/infer", methods=["POST"])
async def infer():
    item = request.get_json()
    return str(len(item))