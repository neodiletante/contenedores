# Usa una imagen base de Python
FROM python:3.8-slim

# Crea un directorio de trabajo
WORKDIR /app

# Copia el script Python en el contenedor
COPY stress.py .

# Ejecuta el script al iniciar el contenedor
CMD ["python", "stress.py"]
