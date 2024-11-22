:'
Docker Compose es una herramienta que permite definir y gestionar aplicaciones
Docker de múltiples contenedores a través de un archivo YAML.
Es decir, nos va a ayudar a desplegar varios contenedores en un mismo host de 
una forma sencilla, como si fueran una "unidad" en vez de varios contenedores.
También nos va a proporcionar herramientas para gestionar el ciclo de vida de 
esta "unidad", ahorrandonos por tanto la gestión de varios contenedores.

En la vida real, es muy común que necesitemos de varios contenedores para poder
proporcionar una solución completa.
Por ejemplo:
Nuestra aplicación de gestión (un contenedor) que necesita utilizar un gestor
 de base de datos (otro contenedor) 

Docker compose nos permite crear una unidad para ofrecer y gestionar los 
servicios(contenedores) de nuestra aplicación de una forma simple, segura y 
efectiva:

Con solo un comando y de forma automatizada podremos:
 - Crear las imagenes
 - Arrancar los contenedores
 - Consultar los logs de los contenedores
 - Escalar los servicios
 - Detener los contenedores
'

# Explicación de un fichero de definición de servicios de Docker compose
cat docker-compose-explicación.yml

:'
# Aprendamos a utilizar docker-compose con un ejemplo:
--------------------------------------------------------------------------------
Vamos a desplegar una solución compuesta por:
#  Nuestra aplicación de gestión (cuenta "impactos" de una web) 
# y un gestor de base de datos (para guardar el número de "impactos")

Utilizaremos los ficheros presentes en el directorio de la lección:
lección13/
├── app/               <--- Directorio con todos los recursos necesarios para construir nuestra aplicación
│   ├── Dockerfile     <--- El Dockerfile para construir la imagen de nuestra aplicación
│   └── app.py         <--- El script con  el código fuente de nuestra aplicación
└── docker-compose.yml <--- El fichero de instrucciones para desplegar nuestra solución (aplicación + base de datos)
'

# Construir y lanzar los contenenedores de nuestra solución o proyecto "impacts"
# (a partir de ahora hablaremos de servicios) de nuestra solución 
docker-compose -p impacts up -d --build 

# Nos conectaremos a la web de nuestra solución a través del puerto expuesto
# y comprobaremos que funciona

# Ayuda del comando compose:
docker compose --help

# vamos a ver que soluciones(proyectos) tenemos y en que estado
 docker-compose ls

# vamos a ver que servicios(contenedores) componen la solución(proyecto) "impacts"
docker-compose -p impacts ps -a

# vamos a ver estadísticas de utilización de los servicios de "impacts"
docker-compose -p impacts stats

# vamos a parar temporalmente el servicio web de "impacts"
docker compose -p impacts pause web

# veamos el estado de los servicios de "impacts"
docker compose -p impacts ls

# vamos a a parar completamente la solución "impacts"
docker compose -p impacts stop

# Comprobemos 
docker compose -p impacts ps -a

# vamos a ponerlos en marcha otra vez
docker compose -p impacts start

# Comprobemos 
docker compose -p impacts ls

# paremos y limpiemos la solución "impacts"
docker compose -p impacts down
