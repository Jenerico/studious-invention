from flask import Flask
from prometheus_flask_exporter import PrometheusMetrics

app = Flask(__name__)
metrics = PrometheusMetrics(app)

@app.route('/')
def hello_world():
    metrics.counter('hello_world_requests', 'Number of requests to hello_world endpoint').inc()
    return 'Hello, world!'

@app.route('/health')
def health_check():
    return 'OK'

@app.route('/ready')
def ready_check():
    return 'OK'

if __name__ == '__main__':
    app.run()
