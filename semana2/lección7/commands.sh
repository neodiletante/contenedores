# situarse en primer lugar en el directorio de la lección 7
cd semana2/lección7

# abrir en el entorno de Codepaces tres terminales distintas en horizontal
# (ver video)
# personalizar cada terminal con un prompt diferente
# para la terminal donde "correremos" el escritor:
export PS1='E---> '
# para la terminal donde "correremos" el lector:
export PS1='L===> '
# para la terminal del host:
export PS1='$ '

# Construir las imagenes que necesitaremos para practicar 
# los conceptos y comandos para proporcionar almacenamiento
# persistente a los contenedores

# escritor
$ docker build -t img_escritor -f Dockerfile.escribe .
# lector
$ docker build -t img_lector -f Dockerfile.lee .

# Arrancar de forma interactiva los dos contenedores en 
# dos terminales distintas
E---> docker run -it --rm  --name escritor img_escritor
L===> docker run -it --rm  --name lector img_lector

# crear un par de ficheros (granada, valencia) utilizando el escritor e
# intentar leer esos ficheros desde el lector. 
# veremos que NO existen los ficheros.

# veamos desde el host que es lo que "ve" cada contenedor
# utilizamos una tercera terminal, la del host, 
# para listar el directorio "/contenido" en ambos contenedores
$ docker exec escritor ls -la /contenido
$ docker exec lector ls -la /contenido

# Además veamos que pasa si "salimos" del escritor.
# - utilizar comando "salir" en escritor -
# volvemos a lanzarlo
E---> docker run -it --rm  --name escritor img_escritor

# veremos que el directorio "/contenido" esta vacio, 
# hemos perdido los ficheros escritos en la última ejecución
$ docker exec escritor ls -la /contenido

# para continuar con la solución 1 "salimos" del "lector" y del "escritor"
# - utilizar comando "salir" en "escritor" y en "lector" -
# hasta aqui el problema ... 
# 1 --> no tenemos almacenamiento persistente
# 2 --> cada contenedor tiene su propio almacenamiento
# Ahora la solución....

# Solución 1:
#------------------------------------------------------------------------------
# Utilizar "bind mounts"
# Es decir utilizamos un directorio dentro del sistema de ficheros
# del host para proporcionar almacenamiento persistente a los contenedores

# comprobamos que no tenemos ningún contenedor en ejecución
# si lo hay.... matarlo directamente con <docker kill >
$ docker ps -a

# creamos en el HOST el directorio que vamos 
# a utilizar para proporcionar almacenamiento a nuestros contenedores
# damos permiso a todo el mundo para utilizarlo
$ sudo mkdir /ciudades
$ sudo chmod 777 /ciudades

# y ahora vamos a arrancar el contenedor "escritor" en su terminal,
# diciendole que su directorio "/contenido" es un "enlace" o "mapea" 
# a el directorio "/ciudades" del host
E---> docker run -it --rm -v /ciudades:/contenido --name escritor img_escritor

# Creamos un par de ficheros de ciudades y comprobamos en el host
$ ls /ciudades

# comprobamos tambien que tenemos lo mismo en el contenedor escritor 
$ docker exec escritor ls -la /contenido

# que pasa si paramos el contenedor "escritor"?
# - utilizar comando salir en escritor -
# comprobamos que los ficheros siguen estando en "/ciudades"
$ ls /ciudades

# Arrancamos de nuevo el escritor y comprobamos
# que los ficheros antiguos tambien existen en el escritor
E---> docker run -it --rm -v /ciudades:/contenido --name escritor img_escritor
$ docker exec escritor ls -la /contenido

# La forma de hacer que el lector también vea estos ficheros 
# será utilizar el mismo "mapeo" de directorios que estamos
# utilizando en el escritor cuando arrancamos el lector
L===> docker run -it --rm -v /ciudades:/contenido --name lector img_lector


# Ahora si se teclea en el "lector" el nombre de una ciudad ya procesado
# por el "escritor", podremos acceder y leer ese fichero.
# utilizar como comando el nombre de una ciudad procesada en el "escritor"
# Ejemplo: --------------------------------------------------
# Introduce una palabra (o 'salir' para terminar): granada
# LECTOR: Contenido del archivo '/contenido/granada.txt':

# granada
# granada
# ....

# Antes de estudiar la 2ª solucion, finalizar la ejecución del escritor y el lector
# - utilizar "salir" en "lector" y "escritor"


# Solución 2:
#------------------------------------------------------------------------------
# Utilizar volumenes de Docker
# Es decir utilizamos un espacio de almacenamiento gestionado 
# por Docker para proporcionar almacenamiento a nuestros contenedores

# primero crearemos un volumen ciudades
# para utilizarlo con nuestros contenedores
$ docker volume create vol-ciudades

# podemos ver los volumenes de Docker disponibles usando:
docker volume ls

# podemos tener información adicional del volumen usando:
docker volume inspect vol-ciudades

# y la forma de utilizarlo en cualquier contenedor es bien fácil
# utilizamos también el parámetro -v cuando arrancamos el contenedor
# pero ates del ":" ponemos el nombre del volumen en vez del nombre de un directorio
E---> docker run -it --rm -v vol-ciudades:/contenido --name escritor img_escritor
L===> docker run -it --rm -v vol-ciudades:/contenido --name lector img_lector

# si se para y se vuelve a arrancar el escritor, veremos que la información persiste
# - utilizar "salir" en el escritor
# volver a arrancarlo y a visualizar el directorio "/contenido" del escritor
E---> docker run -it --rm -v vol-ciudades:/contenido --name escritor img_escritor
$ docker exec escritor ls -la /contenido

# Antes de estudiar como liberamos espacio, 
# finalizar la ejecución del escritor y el lector
# - utilizar "salir" en "lector" y "escritor"

# Liberar espacio de almacenamiento
# -----------------------------------------------------------------------------
# En el caso de utilizar "bind mounts", es decir directorios, 
# podemos eliminar ficheros o incluso el directorio entero desde el host
$ rm /ciudades/madrid.txt
$ rm -rf /ciudades

# En el caso de utilizar Volumenes de Docker, para borrar ficheros será necesario
# en primer lugar averiguar la uicación del volumen en el sistema de ficheros del host
$ docker volume inspect vol-ciudades | grep "Mountpoint"

# y luego utilizar el directorio de datos en cualquier orden para eliminar ficheros
# puede ser necesario tener permisos especiales
$ sudo rm /var/lib/docker/volumes/vol-ciudades/_data/granada.txt

# para liminar un volumen completo se utilizará la orden:
# (no se podrá borrar si esta en uso por algún contenedor)
$ docker volume rm vol-ciudades 

# comprobar borrado con
$ docker volume ls


