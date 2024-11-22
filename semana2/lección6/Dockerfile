# Utilizar una imagen oficial de Python como base
FROM python:3.8-slim

# Establecer el directorio de trabajo en el contenedor
WORKDIR /usr/src/app

# Copiar todo lo que hay en el directorio actual al directorio de trabajo en el contenedor
COPY . .

# Exponer el puerto 8000 para utilizarlo en nuestra aplicación de prueba
EXPOSE 8000

# Ejecutar nuestra aplicación al lanzar el contenedor
CMD ["python", "./app.py"]