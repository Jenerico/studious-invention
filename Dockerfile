# Базовый образ Python
FROM python:3.9

# Установка Flask, gunicorn и prometheus-flask-exporter
RUN pip install flask gunicorn prometheus-flask-exporter

# Копирование кода в контейнер
COPY . /app
WORKDIR /app

# Установка переменных окружения
ENV FLASK_APP=hlwrld.py

# Открытие порта
EXPOSE 5000

# Запуск приложения с использованием gunicorn и метрик
CMD ["gunicorn", "-b", "0.0.0.0:5000", "--access-logfile", "-", "--enable-stdio-inheritance", "app:app"]
