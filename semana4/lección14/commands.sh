:'
Depuración de contenedores

A veces el contenedor no arranca, o la aplicación contenerizada no funciona como
se espera.
Necesitaremos tener presentes las diferentes técnicas que podemos aplicar para
depurar contenedores.
'
# construimos al imagen
docker build -t img-app .

# lanzamos el contenedor
docker run --rm -d  -p 7000:7000 --name app img-app
# Ni siquiera arranca .... veamos que pasa

# Fase 1. Recopilar información acerca de que esta pasando
# ------------------------------------------------------------------------------
# El primer paso es revisar los eventos de docker cuando lanzamos el contenedor
docker events 

# A continuaciñon tenemos que revisar el estado del "cadaver".
# Si un contenedor tiene problemas terminará siempre en estado "exited"
# y si no lo arrancamos con "--rm" , tendremos el contenedor "muerto"
# para estudiar que le  ha pasado.
# Así pues, lanzamos el contenedor con:
docker run -d --name app img-app

# E inspeccionamos el cadaver con:
docker inspect app

# Otro paso sería revisar los logs del contenedor... 
# para ver si obtenemos mas información de le pasó:
docker logs app

# Fase 2. Interactuar con el contenedor de la aplicación
# ------------------------------------------------------------------------------
# para entender mejor el arranque de la aplicación en el contenedor, podemos 
# arrancarla utilizando un shell interactivo. Veremos todo lo que esta pasando.
docker run -it -p 8000:8000 --name app img-app
docker rm app

# Podemos abrir una terminal en el contenedor para examinar el contenedor 
# "desde dentro":
docker exec -it app /bin/bash
docker kill app
docker rm app


# Fase 3: Interactuar con la aplicación directamente
# ------------------------------------------------------------------------------
# Podemos "enlazar nuestro código fuente" al contenedor. Depurar, añadir trazas
 # y arrancar la aplicación las veces que necesitemos. 
docker run -it -p 8000:8000 -v ${PWD}:/usr/src/fuente --name app img-app /bin/bash





