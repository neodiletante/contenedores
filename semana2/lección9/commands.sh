:'
Ejecutando contenedores
=======================
Durante todas la lecciones hemos utilizado el comando "docker run" para lanzar o
ejecutar contenedores.
En esta lección se introducirán las técnicas necesarias para lanzar contenedores
pasando al contenedor variables o parámetros.

También veremos las diferentes formas que tenemos para "meternos" dentro de un 
contenedor.

Por último una lista resumen de los parámetros mas utilizados del comando 
"docker run"
'

:'
Paso de variables/información al contenedor desde el host
--------------------------------------------------------------------------------
Es totalmente habitual que el comando que se utiliza para lanzar la aplicación
contenerizada necesite de ciertos parámetros para ajustar la ejecución a la 
situación concreta o necesidad del entorno de producción

Dentro del Dockerfile en la instrucción "ENTRYPOINT" no podemos especificar los
valores de los parámetros necesarios para lanzar la aplicación, ya
que normalmente esos valores solo serán conocidos cuando el contenedor se vaya 
a lanzar en el entorno de producción.

Hay tres maneras de "pasar" esto parámetros al contenedor, y se hace mediante la
 utilización de los siguiente parámetros del comando "docker run":

 --entrypoint: Este parámetro te permite sobrescribir el punto de entrada 
               (entry point en el Dockerfile) predeterminado de una imagen 
               de Docker. 
 --env (-e): Este parámetro se usa para definir variables de entorno dentro del
             contenedor. Puedes especificar una o varias variables de entorno
             que serán accesibles para los procesos que se ejecutan dentro del
              contenedor.

--env-file: Este parámetro permite cargar variables de entorno desde un 
            archivo de texto. Cada línea del archivo debe estar en el formato
             VARIABLE=valor, similar al uso de variables de entorno en sistemas 
             operativos Unix.
'

# 
# Imaginemos que tenemos una gestor de base de datos que para arrancar necesita
#  utilizar los datos de la cuenta de usuario y de un host. 
# Estos datos son:
#
# DB_HOST=localhost
# DB_USER=root
# DB_PASS=secret
# 

# Tenemos un script (ejemplo) que utiliza variables de entorno para conectar
# a la base de datos
cat db_script.sh

# también disponemos de un Dockerfile para generar la imagen que nos permitirá 
# conectar a la base de datos 
# Fijarse que en el Dockerfile no es necesario "nada" en especial para que se
# tengan en cuenta los datos del usuario ...
cat Dockerfile

# Construyamos la imagen que nos servirá para conectar a la base de datos y 
# para lanzar nuestors contenedores
docker build -t imgdbconnect .

# Probemos ahora las diferentes formas de pasar los datos del usuario al 
# contenedor:

# Utilizando el parámetro --entrypoint:
#-------------------------------------------------------------------------------

# lancemos el contenedor primero para ver como se comporta:

docker run --rm -it --name test imgdbconnect

# Reemplacemos el entrypoint para pasar los datos que necesitamos
docker run --rm -it --name test --entrypoint "sh" imgdbconnect -c "DB_HOST=localhost DB_USER=pepe /usr/local/bin/db_script.sh"

# Este método puede ser de utilidad en ciertos casos de uso, pero presenta el 
# problema de la falta de flexibilidad, ya que seguimos teniendo que especificar
# las variables que vamos a utilizar explicitamente en el comando que pasamos al
# parámetro entrypoint

# Utilizando variables de entorno
#-------------------------------------------------------------------------------

docker run --rm -it --name test --env DB_HOST=produccion_host --env DB_USER=admin --env DB_PASS=secret imgdbconnect

# Este método se utiliza mas habitualmente , porque es más fácil de hacer 
# genérico utilizando variable de entorno locales 
# Por ejemplo:
# Podíamos definir en cada host que vaya a ejecutar el contenedor las variables:
export HOST_DB_HOST=produccion2
export HOST_DB_USER="pepe"
export HOST_DB_PASS="1234"

# y luego podriamos utilizar el mismo comando en cualquier host que tuviera 
# definidas las variables:
docker run --rm -it --name test --env DB_HOST=$HOST_DB_HOST --env DB_USER=$HOST_DB_USER --env DB_PASS=$HOST_DB_PASS imgdbconnect


# Utilizando un fichero para las variables de entorno
#-------------------------------------------------------------------------------
# Utilizaremos el fichero "user_data-env" que se encuentra en este directorio.
cat user_data.env

# la orden sería:
docker run --rm -it --name test --env-file user_data.env imgdbconnect

# Este método es útil si el número de variables a utilizar es grande, y también,
# al "separar"  las variables en un fichero específico, sigue siendo totalmente
# genérico, ya que cada host puede tener su propio fichero de variables de 
# entorno y el comando para lanzar el contenedor será siempre el mismo para 
# cualquier host


:'
Formas de "meternos" dentro de un contenedor:

Muchas veces por motivos de depuración de errores o mejoras es necesario 
"entrar" en el contenedor que esta ejecutando una aplicación.

Estas técnicas nos permitirán tener el mismo "punto de vista" que la aplicación 
que "rueda" en el contenedor.
Recuerda que el contenedor ofrece a la aplicación un entorno "aislado" del host 
en el que se ejecuta el contenedor.
Tener acceso a este entorno puede facilitarnos muchas veces encontrar cual es la 
causa real de un error o problema en la aplicación contenerizada.
'

# Para los ejemplos vamos a lanzar un servidor web utilizando nginx.
docker run -dit --name mi-nginx -p 8080:80 nginx

# Verifiquemos que el contenedor esta corriendo
docker ps -a


# 1. Usar docker exec para abrir un shell interactivo
#-------------------------------------------------------------------------------
# Este es el método más común y directo para entrar en un contenedor. 
# Te permite ejecutar un comando dentro de un contenedor ya en ejecución.

docker exec -it mi-nginx /bin/bash

# Aquí, -it indica que deseas una sesión interactiva (-i) con un terminal de 
# acceso (-t).

# Una vez "dentro" podemos ver el raiz del contenedor:
ls -la
# O las variables de entorno utilizadas en el contenedor:
export
# O la configuración del servidor nginx
cat /etc/nginx/nginx.conf

# Para salir , cerraremos el terminal del contenedor con:
exit

# 2. Usar docker exec para ejecutar un comando puntual
#-------------------------------------------------------------------------------

# Si no necesitas un shell interactivo, pero deseas ejecutar un comando 
# específico dentro de un contenedor, puedes hacerlo sin entrar a un shell.

docker exec mi-nginx cat /etc/nginx/nginx.conf


# 3. Usar docker attach para conectar el terminal al proceso principal
#-------------------------------------------------------------------------------
# Este método conecta tu terminal al proceso principal del contenedor, 
# permitiéndote ver la salida estandar del proceso que ejecuta el contenedor.
# Lo cual puede ser muy útil para depurar errores

docker attach --detach-keys ctrl-x mi-nginx

# Una vez que nos hemos "pegado" al contenedor, estamos viendo la salida 
# estandar (stdout) del proceso que ejecuta el contenedor

# si nos conectamos a la web del servidor, y probamos por ejemplo una url
# podremos ver en el terminal como nginx esta procesando esas peticiones http

# para salir  pulsa la secuencia de teclas ctrl+x

# Nota importante: 
# La secuencia de cierre por defecto (ctrl-p + ctrl-q)
# solo funciona si el contenedor se ha  arrancado utilizando los parámetros -it
# (nosotros arrancamos con -dit).
# la secuencia por defecto es problemática porque puede ser procesada por la
# aplicación que utilizas como terminal.
# Por eso, se recomienda la utilización de uns secuencia de escape personalizada
# es lo que hacemos con:
# --detach-keys ctrl-x
# Cuidado!: Si pulsas ctrl-c pararás el contenedor, cosa que probablemente no 
# deseas

# 4. Arrancar un contenedor y entrar directamente en el shell
#-------------------------------------------------------------------------------
# Este método es útil si puedes iniciar un nuevo contenedor
# ten en cuenta que no se ejecutará la aplicación del contenedor sino el comando /bin/bash
docker run --rm -it nginx /bin/bash

# una vez dentro podemos ejecutar comandos o examinar el entorno de ejecución
# del contenedor
cat /etc/nginx/nginx.conf
export

:'
Resumen del comando "docker run" 
--------------------------------------------------
Este comando de Docker/Podman es probablemente el que tiene mas parámetros, 
repasemos los que hemos visto durante el curso hasta este momento.

Utiliza la documentación oficial para obtener mas información y ejemplos sobre 
estos parámetros:
https://docs.docker.com/reference/cli/docker/container/run/

Los parámetros que vamos a resumir son probablemente los que necesitarás
utilizar de forma mas habitual, y los que son necesarios tener siempre en mente.

Estan agrupados por grupos funcionales y puede que algunos de ellos todavia no
este explicados (lo serán en siguentes lecciones)
'

# Formato del comando
docker run <opciones> <imagen> 


# Ejecución de contenedores
#-------------------------------------------------------------------------------
# <imagen> es el nombre de la imagen que queremos utilizar para lanzar el 
# contenedor. Acostumbrate a utilizarla siempre en ultimo lugar.
# el nombre de la imagen puede llevar o no el "tag"

docker run alpine:latest

# borra el contenedor creado.
docker ps -a
docker rm <id_contenedor_asignado>

# Parámetros más importantes:
# --name <nombre> : Nos permite darle un nombre al contenedor
docker run --name miapp alpine:latest

# borra el contenedor creado.
docker rm miapp

# --rm: Fuerza a que el contenedor se elimine automaticamente cuando adquiere 
#       el estado "exited". Esto nos ayuda a tener "limpio" siempre nuestro 
#       entorno de contenedores

docker run --rm --name miapp alpine:latest

# -i, --interactive: Nos permite tener abierto un canal de comunicaciones 
#                    interactivo con el contenedor

docker run -i --rm --name miapp alpine:latest
# es raro .. pero ahora estas en una sesión interactiva con el contenedor 
# preuba 
ls -la
# y para salir
exit

# -t, --tty: Proporciona una terminal para comunicarse con el contenedor
# pero no conecta stdin.. por lo tanto .. mejor gastarlo siempre con i

docker run -it --rm --name miapp alpine:latest

# para salir
exit

# -d, --detach: ejecuta el contenedor en segundo plano

docker run -d --rm --name miapp nginx

#veremos el contenedor con
docker ps -a

# matamos el contenedor
docker kill miapp

# TRUCO: juntando "d" con "i" y con "t", tendrás un contenedor "muy accesible" 
# para poder entrar en el, depurar, ver logs , etc ...

docker run -dit --rm --name miapp alpine:latest

docker kill miapp

# --restart: Permite especificar la politica de rearranque del contenedor

docker run -dit --restart on-failure:3 --name miapp alpine:latest

docker kill miapp

# Publicación de puertos de comunicación
#-------------------------------------------------------------------------------
# -p, --publish: Publica puertos del contenedor a puertos del host
#                -p <puerto_host>:<puerto_contenedor>

docker run -dit --rm --name miwebsrv -p 8080:80 nginx

docker kill miwebsrv

# Almacenamiento persistente
#-------------------------------------------------------------------------------
# -v, --volume: Conecta un espacio de almacenamiento del host (directorio o 
#               volumen) en el contenedor:
#               -v <directorio_host|volumen_host>:<directorio_contenedor>

docker run -dit --rm --name miwebsrv -p 8080:80 -v ./:/data nginx

docker kill miwebsrv

# Paso de parámetros y variables a contenedores
#-------------------------------------------------------------------------------
# --entrypoint: reemplaza el entrypoint de la imagen con el comando que 
#               quieras
docker run --rm -it --name miapp --entrypoint "sh" imgdbconnect -c "echo 'hola'"

# -e, --env: Permite especificar variables de entorno que se pasarán al container:
docker run -dit --rm --name miapp -e MI_VAR=mi_valor alpine:latest

docker kill miapp

# --env-file: Permite pasar las variables de entorno del fichero especificado al
#             contenedor

docker run --rm -d --env-file user_data.env --name miapp imgdbconnect

# Limitación de recursos computacionales
#-------------------------------------------------------------------------------
# -m, --memory, --memory*: hay varios parámetros que permiten establecer limites
#                          de memoria

docker run -dit --rm -m 1GB --name miapp alpine:latest

docker kill miapp

# --cpu-* : hay varios parámetros que permiten limitar el uso de cpu
docker run -d --rm --cpu-period=100000 --cpu-quota=1000 --name miapp alpine:latest


# ----blkio-*, --device-*: hay varios parámetros que permiten limitar el uso de
#                          dispositivos de almacenamiento
docker run -d --rm --blkio-weight 10 --name miapp alpine:latest
