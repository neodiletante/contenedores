# Usamos una imagen base de Python
FROM python:3.9-slim

# Establecemos el directorio de trabajo
WORKDIR /app

# Copiamos el archivo app.py al contenedor
COPY app.py /app

# Instalamos la libreria Flask (usado en app.py)
RUN pip install Flask

# Exponemos el puerto utilizado en la aplicación
EXPOSE 8000

# Lanzamos la aplicación
CMD ["python", "app.py"]