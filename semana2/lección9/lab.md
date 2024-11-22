Ejecutando y entrando en contenedores. Repaso de `docker run`
=============================================================

**Primer ejercicio:**
Lanza un contenedor que proporcione un servicio de gestión de base de datos.
Utiliza la imagen de MySQL. La contraseña del servidor tiene que ser "passw0rd"

**Segundo ejercicio:**
Lanza el contenedor de nginx:
`docker run -dit --name mi-nginx -p 8080:80 nginx`

y encuentra cuantas "worker_connections" utiliza el servidor, y en que 
directorio almacena los logs de acceso.

**Tercer ejercicio:**
Repasa los principales parámetros del comando "docker run". 
Para ello utiliza la lista de ordenes que se encuentra al final del [fichero de
 comandos de la lección](commands.sh)
