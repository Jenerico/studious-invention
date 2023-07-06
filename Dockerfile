# Используйте образ Python в качестве базового
FROM python:3.8-slim

# Устанавливаем системные зависимости
RUN apt-get update && apt-get install -y \
    gcc \
    && rm -rf /var/lib/apt/lists/*

# Устанавливаем зависимости Python
COPY requirements.txt /app/requirements.txt
WORKDIR /app
RUN pip install --no-cache-dir -r requirements.txt

# Копируем исходный код приложения
COPY app /app

# Устанавливаем переменные окружения
ENV FLASK_APP=main.py
ENV FLASK_ENV=development

# Запускаем приложение
CMD ["flask", "run", "--host=0.0.0.0"]
