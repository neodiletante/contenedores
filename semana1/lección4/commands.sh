# Listar las imagenes de contenedor que tenemos
docker image ls

# Construir una imagen utilizando El Dockerfile presente en la carpeta
cd semana1/lección4
docker build -t mi-app .

#Listar la imagen recien creada
docker image ls

# Lanzar el contenedor
docker run --rm -p 8000:8000 mi-app

# Abrir otro terminal
# (situa el cursor en el terminal y pulsa simultaneamente ctrl + mayúsculas + 5)
# ---------------------------------
# ver contenedores en ejecución
docker ps

# ver los logs de un contenedor en ejecución
docker logs -f <nombre_contenedor>

# eliminar la imagen que hemos creado
docker rmi mi-app

