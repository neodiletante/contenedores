# Usa una imagen base oficial de Python 3.9 (o la versión de Python que prefieras)
FROM python:3.9-slim

# Establece el directorio de trabajo en el contenedor
WORKDIR /app

# Copia el archivo de requerimientos (si existe) en el contenedor
# ADD requirements.txt /app/
COPY requirements.txt .

# Instala las dependencias necesarias
RUN pip install --no-cache-dir -r requirements.txt

# Instala curl
RUN apt-get update && apt-get install -y curl

# Copia todo el contenido del proyecto en el directorio de trabajo del contenedor
COPY app.py .
COPY templates/* ./templates/

# Expone el puerto que usa Flask
EXPOSE 8000

# Configurar el healthcheck
HEALTHCHECK --interval=30s --timeout=10s --retries=3 \
  CMD curl -f http://localhost:8000/ || exit 1

# Define el comando para ejecutar la aplicación Flask
CMD ["python", "app.py"]
