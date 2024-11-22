# Construir la imagen de un contenedor:
cd semana1/lección5
docker build -t mi-app .

#construir otra vez la imagen ... (docker guarda el trabaja hecho anteriormente y lo reutiliza)
docker build -t mi-app .

# ver la historia de la imagen
docker history mi-app

# Buscar imagenes
docker search --help
docker search alpine
docker search --filter is-official=true --filter stars=3 alpine

# Descargar una imagen al host
docker pull alpine
docker pull python

# Listar imagenes
docker images

docker image ls

# inspeccionar una imagen
docker inspect mi-app

# borrar imagenes
docker images
docker rmi mi-app
docker images
docker rmi alpine python
