:'Registros de contenedores
Los registros de contenedores son servicios donde puedes almacenar y distribuir 
imágenes de contenedores. Docker Hub es el registro más conocido, pero también 
puedes configurar registros privados o usar otros servicios como Amazon ECR, 
Google Container Registry, o Azure Container Registry.

'
# Construyamos la aplicación de presentación de prototipos de vehiculos e 
# instalaciones de nuestra empresa
docker build -t imgproto .

# Puedes echar un vistazo a los prototipos corriendo:
docker run --rm -d -p 8080:8080 --name appproto imgproto

:'
Subamos nuestra primera imagen al registor de docker hub
para ellos necesitamos en primer lugar cambiar la etiqueta
a nuestra imagen, para que referencie el lugar de almacenamiento
de la misma
'
# Subiendo imagenes
# ------------------------------------------------------------------
# Listamos las imagenes
docker images

# Cambiamos la etiqueta para referenciar nuestro registro:
#   [<url_registro>]/[<usr_docker_hub>]/<repositorio>:<etiqueta>
# en nuestro caso... 
# el repositorio por defecto es docker hub... No hace falta poner la url del registro
# y el resto de la información se puede ver en la página web del repositorio.
#    alumnicursosjmo/ge:tagname
# NOTA IMPORTANTE:
# A partir de ahora, tendrás que sustituir en los comandos que vienen 
# a continuación:
# alumnicursosjmo <--- por tu nombre de usuario de Docker
# ge              <--- por el nombre del repositorio que hayas creado
docker tag imgproto:latest alumnicursosjmo/ge:latest

# Comprobamos
docker images

# Intentamos subir la imagen:
docker push alumnicursosjmo/ge:latest

:' y falla ....
esto es porque no nos hemos autentificado en el registro.

Aunque el repositorio este configurado como público, solo el
dueño del repositorio o alguien que tenga permiso podrá subir imagenes
en el.

Mi recomendación es utilizar siempre "tokens de acceso personal" para
hacer cualquier tipo de operaciones en los repositorios de nuestro registro
de imagenes:
Ver video "Gestión de tokens de acceso personal"
'

# Accedamos ahora utilizando un token de acceso personal
# al repositorio "ge"
docker login -u alumnicursosjmo
password: <---------------  pegar aquí el token de acceso personal a "ge"

# si ahora probamos a subir la imagen al repositorio ge...
docker push alumnicursosjmo/ge

# Conectate a la web del tu registro de Docker hub y revisa la imagen.

# hay unos cuantos problemas de seguridad (hemos usado una imagen de base antigua)
# Modifiquemos nuestro Dockerfile para incluir una imagen de base segura,
# haciendo caso a lo que sugiere Docker hub
# tenemos que sustituir
FROM golang:1.20-alpine
# por
FROM golang:1.22-alpine
# volvamos a construir (ahora con una etiqueta adecuada para subir la imagen al repositorio)
docker build -t alumnicursosjmo/ge:V1.0 .
# Comprobamos
docker images
# y subamos la V.1.0 de nuestra imagen: (no hace falta hacer login... ya lo hemos hecho antes)
docker push alumnicursosjmo/ge:V1.0
# y volvamos a echar un vistazo a la web de nuestro repo... lo mismo ha mejorado....

# Bajando imagenes
# ------------------------------------------------------------------------
# Para traerse una imagen de cualquier repositorio utilizaremos:
# docker pull [<url_registro>]/[<usr_docker_hub>]/<repositorio>:<etiqueta>
#
# En las imágenes públicas de Docker Hub, no es necesario especificar 
# <usr_docker_hub> y el repositorio es el nombre de la imagen
# ejem
docker pull nginx:latest
docker pull busybox:stable

# Trabajando en desarrollo del software, y en otras ocasiones muy particulares,
# hay veces que necesitamos referenciar de forma exacta una imagen en concreto.
# Ejemplo: tenemos configurado en un módulo para utilizar img1:v1.0 .. y hemos actualizado 
# img1:v1.0 con unas cosas para probar .... el módulo no cargará nunca la nueva actualización
# porque piensa que ya la tiene. En esos caso es mejor que el módulo trabaje
# con "digest"(un identificador único para cada imagen) de imagenes... 
# lo podemos hacer con:

# el digest de busybox:stable para la arquitectura linux/riscv64 es:
# sha256:0a9ce6c1a04fbe0711e61c7179b0bc0a9cc1dd1bf4ba998ef1a09f7437463ddf
docker pull busybox:stable@sha256:0a9ce6c1a04fbe0711e61c7179b0bc0a9cc1dd1bf4ba998ef1a09f7437463ddf

# si listamos las imagenes veremos dos busybox con diferentes "image ids"
docker images

# Borrado de imágenes del registro
# -----------------------------------------------------------------------
# No hay comando.. hay que ineteractuar con el servidor del registro a través de API REST.
# sería algo así como:
curl -H "Authorization: JWT tu_token_aqui" -X DELETE "https://hub.docker.com/v2/repositories/myuser/myrepo/manifests/sha256:abcd1234"
# Lo fácil, utilizar la web del registro manualmente





