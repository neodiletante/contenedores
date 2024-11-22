# Volvemos a crear nuestra imagen de pruebas:
docker build -t mi-app .

# revisamos el listado de imagenes:
docker images

# Creamos el contenedor "mi-contenedor" usando la image "mi-app":
docker create --name mi-contenedor mi-app

# revisamos contenedores presentes en el sistema y su estado:
docker ps -a

# obtenemos solo el campo estado del contenedor, utilizando el
# el comando watch en una segunda terminal:
watch docker inspect --format='{{.State.Status}}' mi-contenedor

# estados "created"y "running"
#-------------------------------------------------------------------------------
# Arrancamos nuestro contenedor:
docker start mi-contenedor

# revisamos contenedores presentes en el sistema:
docker ps -a

# Antes de probar "restart", para ver los cambios de estado vamos a 
# utilizar el comando events en una segunda terminal:
docker events --filter container=mi-contenedor

# rearrancamos nuestro contenedor:
docker restart mi-contenedor

# revisamos contenedores presentes en el sistema:
docker ps -a

# borramos contenedor y probamos otra forma de arrancar un nuevo contenedor
# (la habitual):
docker run -d --name mi-contenedor2 mi-app

# revisamos contenedores presentes en el sistema:
docker ps -a

# comprobamos el estado general del contenedor:
docker inspect mi-contenedor


# estado "paused"
#-------------------------------------------------------------------------------
# pausamos el contenedor
docker pause mi-contenedor

# revisamos contenedores presentes en el sistema:
docker ps -a

# reanudamos el contenedor:
docker unpause mi-contenedor

# revisamos contenedores presentes en el sistema:
docker ps -a

# estado "exited"
#-------------------------------------------------------------------------------
# Paramos el contenedor (amablemente):
docker stop mi-contenedor

# revisamos contenedores presentes en el sistema:
docker ps -a

# arrancamos el contenedor (el que habiamos parado) otra vez:
docker start mi-contenedor

# revisamos contenedores presentes en el sistema:
docker ps -a

# matamos el contenedor (sin amabilidad):
docker kill mi-contenedor

# Borrando contenedores
#-------------------------------------------------------------------------------
# borramos para siempre el contenedor:
docker rm mi-contenedor

# revisamos contenedores presentes en el sistema:
docker ps -a

# arrancamos un nuevo contenedor para probar un "rm" mas potente:
docker run -d --name mi-contenedor mi-app

# revisamos contenedores presentes en el sistema:
docker ps -a

# borramos el contenedor sin ni siquiera pararlo ....
docker rm -f mi-contenedor

# revisamos contenedores presentes en el sistema:
docker ps -a

# limpiamos todos los contenedores parados(exited) en el sistema:
docker container prune

# Si queremos evitar tener que eliminar manualmente un contenedor cuando este termine
# Hay que utilizar el parámetro --rm en el comando docker run
docker run -d --rm --name mi-contenedor mi-app


# entrando dentro del contenedor
#-------------------------------------------------------------------------------
# Arrancamos otra vez nuestra aplicación de pruebas
docker run -dit --rm --name mi-contenedor -p 8000:8000 mi-app

# nos convertimos en el terminal de salida del contenedor:
docker attach mi-contenedor

# comprobamos salida haciendo un par de peticiones en http://localhost:8000

# salimos de "attach" pulsando "ctrl-p" y después "ctrl-q" .. No funcionará si
# no arrancamos el contenedor utilizando "-dit"

# ejecutamos un comando en el contenedor
docker exec mi-contenedor ls

# nos "metemos" dentro del contenedor:
docker exec -it mi-contenedor /bin/bash