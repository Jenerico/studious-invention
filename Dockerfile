# Базовый образ Python
FROM python:3.9

# Установка Flask и gunicorn
RUN pip install flask gunicorn

# Копирование кода в контейнер
COPY . /app
WORKDIR /app

# Установка переменных окружения
ENV FLASK_APP=hlwrld.py

# Открытие порта
EXPOSE 5000

# Запуск приложения с использованием gunicorn
CMD ["gunicorn", "-b", "0.0.0.0:5000", "--access-logfile", "-", "app:app"]
