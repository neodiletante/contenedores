:'
Personalización y creación de imagenes para containers
--------------------------------------------------------------------------------

Durante todo el curso hemos estando utilizando Dockerfiles básicos para 
construir nuestras imágenes de ejemplo. En esta lección vamos a profundizar en
la construcción de imágenes utilizando Dockerfiles.

Un Dockerfile no es mas que un fichero de texto en el que se describen las 
acciones necearias para construir una imagen de contenedor.
Estas acciones se implementan a través de instrucciones, la referencia completa
 de instrucciones puede encontrarse en:
 https://docs.docker.com/reference/dockerfile/

En la lección vamos a centrarnos en la instrucciones mas importantes, y vamos a
seguir un enfoque conceptual de la construcción del contenedor.

En la lección de gestión de imágenes, se explico el concepto de imágen y que 
4 elementos principales se definian en la construcción de una imagen. 

Veamos ahora con detalle esos elementos, y que instrucciones nos ayudan a 
especificarlos dentro de un Dokerfile
'

# veamos el Dockerfile
cat Dockerfile

# Ejecutemos el Dockerfile para crear la imagen
docker build -t ming .

# lancemoslo y examinemos el contenenido de los directorios
docker run --rm -d -p 8080:80 --name servidor_ficheros ming
