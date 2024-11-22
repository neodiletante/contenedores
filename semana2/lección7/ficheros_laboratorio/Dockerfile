# Usa la imagen oficial de Python como base
FROM python:3.8-slim

# Establece el directorio de trabajo en /app
WORKDIR /app

# Copia los archicvos de la aplicación web para recoger informes
COPY recoge_informes.py /app/
COPY index.html /app/templates/

# Instala Flask
RUN pip install Flask

# Expone el puerto 5000 para que Flask esté accesible
EXPOSE 5000

# Comando para ejecutar la aplicación Flask
CMD ["python", "recoge_informes.py"]