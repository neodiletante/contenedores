# Imagen base
FROM python:3.8-slim

# Dependencias
WORKDIR /app

COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

COPY . .

# Lanzar aplicación
CMD ["python", "app.py"]
