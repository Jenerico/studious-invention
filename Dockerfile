# Базовый образ Python
FROM python:3.9

# Установка Flask
RUN pip install flask

# Копирование кода в контейнер
COPY . /app
WORKDIR /app

# Установка переменных окружения
ENV FLASK_APP=app.py

# Открытие порта
EXPOSE 5000

# Запуск приложения
CMD ["flask", "run", "--host=0.0.0.0"]
