from flask import Flask
from prometheus_client import Counter, generate_latest, CONTENT_TYPE_LATEST

app = Flask(__name__)

hello_counter = Counter("hello_world_counter", "Hello world endpoint hit count")

@app.route('/')
def hello_world():
    hello_counter.inc()
    return 'Hello, world!'

@app.route('/health')
def health_check():
    return 'OK', 200

@app.route('/ready')
def ready_check():
    return 'OK', 200

@app.route('/metrics')
def metrics():
    return generate_latest(), 200, {CONTENT_TYPE_LATEST: "text/plain"}

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=5000)
