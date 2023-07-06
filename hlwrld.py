from flask import Flask

app = Flask(__name__)

@app.route('/')
def hello_world():
    return 'Hello, world!'

@app.route('/health')
def health_check():
    return 'OK'

@app.route('/ready')
def ready_check():
    # Проверяем, готово ли приложение к обработке запросов
    # В данном примере всегда возвращаем 'OK'
    return 'OK'

if __name__ == '__main__':
    app.run()
