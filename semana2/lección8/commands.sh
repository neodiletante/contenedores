# Exposición y publicación de puertos
# ===================================
# Necesario especificar que puertos de comunicación va a utilizar
# el contenedor. Esto se hace en el Dockerfile

# Construyamos la imagen de un servidor nginx que expone dos puertos 
docker build -t webserver .

# Podemos ver los puertos expuestos en una imagen utilizando "inspect"
# nota. "jq" nos ayuda a trabajar con un texto en format json 
# que es exactamente el producido por el comando "docker inspect"
docker inspect webserver | jq '.[0].Config.ExposedPorts'

# lancemos ahora el contenedor
docker run -d --rm --name misrv webserver

# veamos que puertos publica:
docker ps -a

# sin embargo, normalmente querremos acceder a esos puertos
# desde fuera del host en el que "corre" el contenedor.
# para ello tendremos que publicar los puertos
# primero mataremos el contenedor actual
docker kill misrv

# y ahora utilizaremos el parámetro "-p" del comando "docker run"
# para publicar el puerto 80.
# Esto hará que el servidor web sea accesible desde fuera de la máquina 
# la sintaxis es -p <puerto_en_el_host>:<puerto_en_el_contenedor>
# NOTA: en un host normal(no codespaces) esto haría que el servidor 
# web estuviera accesible en:
# http://localhost:8080 
# o si la direccion IP del host es 1.2.3.4 en http.//1.2.3.4:8080
docker run -d --rm -p 8080:80 --name misrv webserver

# y comprobamos la publicación de puerto 
docker ps -a
# También puede hacerse conectando a la url del servidor:
curl http://localhost:8080

# volvemos a matar el contenedor, y ahora publicaremos el otro puerto.
# para cada puerto publicado necesitaremos un nuevo parámetro "-p"
# y volvemos a comprobar los puertos publicados
docker kill misrv
docker run -d --rm -p 8080:80 -p 8443:443 --name misrv webserver
docker ps -a


# Redes de contenedores
# =====================
# Docker utiliza redes de comunicación para conectar los contenedores
# en un host y fuera de el
docker network ls

# hay varios tipos de redes 
# según con quien queramos que el contenedor se comunique. Las principales son
# bridge: Se utiliza POR DEFECTO en cualquier contenedor corriendo en el host
# host  : se utiliza cuando queramos eliminar el aislamiento entre la red del 
#         contenedor y la del host.

# inspeccionemos la red "bridge" para ver que tiene:
docker network inspect bridge

# Campos importantes:
# Config.Subnet : indica el patron de direcciones IP 
#                 que utilizará cualquier contenedor conectado a esta red 
# Config.Gateway: La IP que se utilizará como "salida" para alcanzar otras redes
# Containers    : la lista de contenedores (con sus atributos de red) que utilizan esta red

# vamos a crear un red nueva para conectar nuestros contenedores
docker network create mi_red

# vamos a  crear otro contenedor de Nginx pero conectado a  nuestra nueva red
docker run -d --name mi_nginx --network mi_red nginx

# Ahora vamos a crear otro contenedor que directamente hace una petición a nuestro
# servidor de Nginx en la red "mi_red" y termina.
# NOTA: utilizamos la imagen curlimages/curl que proporciona esta funcionalidad directamente:
docker run -it --rm --network mi_red curlimages/curl curl http://mi_nginx

# en cambio si ejecutamos el mismo contenedor pero sin especificar la red,
# veremos que el comando falla , ya que no puede encontrar ningun servidor "mi_nginx"
# en la red por defecto, que es bridge:
docker run -it --rm curlimages/curl curl http://mi_nginx

# comprobamos que "mi_nginx" es el unico contenedor usando la red "mi_red"
docker network inspect mi_red

# vamos a cambiar de red al contenedor mi_nginx
# primero lo desconectamos de la red "mi_nginx"
docker network disconnect mi_red mi_nginx

# y ahora lo conectamos a la red por defecto "bridge"
docker network connect bridge mi_nginx

# Utilizando el comando inspect podemos verlo
# ya dentro de la red por defecto "bridge"
docker network inspect bridge

# por último eliminemos la red de pruebas que hemos creado
docker network rm mi_red
docker network ls







