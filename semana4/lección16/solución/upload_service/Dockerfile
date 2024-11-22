# Dockerfile para el servicio de subida de ficheros
FROM python:3.9-slim

WORKDIR /app

COPY upload_service.py /app/upload_service.py

RUN pip install flask

EXPOSE 5000

CMD ["python", "upload_service.py"]
