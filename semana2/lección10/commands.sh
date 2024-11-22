:'
Limitación de recursos computacionales en contenedores
================================================================================

En esta lección veremos como se pueden limitar los recursos que utiliza un 
contenedor. Estos límites nos sirven para garantizar que nuestros contenedores
 no se van a exceder en la utilización de los recursos computacionales (CPU, 
 RAM, y disco) del host en donde se ejecutan.

Utilizaremos la aplicación stress.py para ilustrar los conceptos de esta 
lección. 

La aplicación stress.py se ejecuta en un bucle continuo realizando de forma 
aleatoria operaciones que sirven para cambiar el uso de memoria , cpu y disco 
que hace la aplicación.
'

# En primer lugar construiremos la imagen del contenedor de stress 
# y lanzaremos tres contenedores para estresar el sistema utilizando la imagen 
# recien creada

docker build -t imgstress .
docker run -d --rm --env TIPO=cpu --name CPU_Jefe1 imgstress
docker run -d --rm --env TIPO=cpu --name CPU_Jefe2 imgstress
docker run -d --rm --env TIPO=cpu --name CPU_Jefe3 imgstress

# para ver como se comporta la aplicación en el usu de recursos, abriremos
# otra terminal y ejecutaremos en ella el comando:
docker stats

:'
Limites de CPU
--------------------------------------------------------------------------------
Docker permite limitar la cantidad de CPU que un contenedor puede usar. 
Esto se hace utilizando las siguientes opciones:

--cpus: Limita la cantidad de CPUs que un contenedor puede usar. 
        Por ejemplo, --cpus="1.5" permitirá que el contenedor utilice 1.5 CPUs.

  Ejemplo:
  docker run -d --rm  --cpus 2 --name jefex imgstress
  
--cpu-shares: Este es un valor relativo que indica la prioridad de un contenedor
              en comparación con otros. Un contenedor con más CPU shares tendrá
              más acceso a la CPU que otros. 
              Por defecto, un contenedor tiene 1024 shares.

  Ejemplo:
  docker run -d --rm --cpu-shares 2048 --name jefex imgstress

--cpu-period y --cpu-quota: 
              Estos dos parámetros se usan en conjunto para limitar el uso de la
              CPU en un periodo específico. Por ejemplo, puedes permitir que un
              contenedor utilice solo el 50% de la CPU en un periodo de 
              100000 microsegundos utilizando
               --cpu-period=100000 
               --cpu-quota=50000
  Ejemplo:
  docker run -d --rm --cpu-period 100000 --cpu-quota=50000 --name jefex imgstress
'
# Ejemplo 1. 
# Vamos a limitar fuertemente el tiempo de cpu en jefe3
# primero paramos jefe3 y lo volvemos a lanzar limitando el tiempo de cpu
# revisando la columna CPU de docker stats se puede ver que el
# % de CPU asignado a jefe3 es mucho menor (normalmente por debajo del 1%)
# mientars que los otros jefeshabitualmente pasan del 10%
docker stop CPU_Jefe3
docker run -d --rm --cpu-period=100000 --cpu-quota=1000 --env TIPO=cpu --name CPU_Jefe3 imgstress


# Para ver los limites de cpu asignados a un contenedor en ejecución, 
# podemos recurrir al comando "docker inspect", por ejemplo:
docker inspect CPU_Jefe3 --format='{{.HostConfig.CpuShares}} {{.HostConfig.CpuPeriod}} {{.HostConfig.CpuQuota}} {{.HostConfig.CpusetCpus}}'

:'
Limites de memoria
--------------------------------------------------------------------------------
Puedes limitar la memoria que un contenedor puede usar con las siguientes 
opciones:

-m o --memory: Limita la cantidad máxima de memoria que puede usar un 
               contenedor. Se puede especificar en bytes, KB, MB, GB, etc.
  Ejemplo:
  docker run -d --rm -m 100kb --name jefex imgstress

--memory-swap: Establece un límite combinado de memoria y swap. 
               Si no se especifica, Docker permite el uso de swap adicional 
               igual a la memoria establecida por -m. 
               Si --memory-swap se establece igual a -m, se deshabilita el swap.
  Ejemplo:
  docker run -d --rm -m 100kb --memory-swap 100kb --name jefex imgstress

--memory-reservation: Establece una cantidad de memoria reservada que el 
                      contenedor intentará usar antes de que el kernel 
                      comience a matar procesos.
  Ejemplo:
  docker run -d --rm --memory-reservation 100kb --name jefex imgstress                      
'
#Lancemos otros contenedore para jugar ahora con la memoria
docker run -d --rm --name RAM_Jefe3 imgstress


#ejemplo 2:
# Demos muy poca memoria al jefe3 de la RAM y veamos que pasa
# Pararemos RAM_Jefe3 y lo lanzamos de nuevo con la limitación
docker stop RAM_Jefe3
docker run -d --rm -m 6Mb --name RAM_Jefe3 imgstress

# Depuremos el problema .. porque no arranca el contenedor
# Pongamos en una tercera termina el comando 
docker events

# Y veamos que pasa.
docker run -d --rm -m 6Mb --name RAM_Jefe3 imgstress

# parece que el contenedor es "matado" por alguien....
# para poder ver mas infomación vamos a quitar el parámetro --rm ,
# de esta manera, podremos tener el "cadaver" del contenedor
# ( el contenedor en estado exited), y podremos hacer de forenses para
# averiguar mas cosas del asesinato
docker run -d -m 6Mb --name RAM_Jefe3 imgstress

# veamos los contenedores 
docker ps -a

# Inspeccionemos el cadaver 
docker logs RAM_Jefe3
docker inspect RAM_Jefe3

':
y podremos ver que en el estado tenemos:
            "Status": "exited",  <----- 
            "Running": false,
            "Paused": false,
            "Restarting": false,
            "OOMKilled": true,   <----- 
            "Dead": false,
            "Pid": 0,
            "ExitCode": 137,     <----
'

# O sea, el contenedor ha sido matado por el "OOM Killer" (OOMkilled =true)
# tambien se puede ver con una instracción como:
docker inspect RAM_Jefe3 --format='{{.State.OOMKilled}}'

# El código de error es 137, que indica que el contenedor ha intentado utilizar
# mas memoria de la que tenia asignada.
# Eso le pasará a cualquier contenedor que necesite usar mas memoria de
# la establecida en el limite.

# Demos un limite aceptable de memoria ahora:
docker run -d --rm -m 5200Mb --name RAM_Jefe3 imgstress

# los limites de memoria asignados los podemos ver en la columna de memoria
# del comando (docker stats) y tambien en la información del contenedor;
docker inspect RAM_Jefe3 --format='{{.HostConfig.Memory}}' | awk '{print $1/1048576 " MB"}'

# Nota: Una vez inspeccionado el cadaver, deshacerse de el.
docker rm RAM_Jefe3

:'
Límites de I/O de disco
--------------------------------------------------------------------------------
Docker también permite controlar la cantidad de I/O de disco que un contenedor 
puede realizar:

--blkio-weight: Controla la prioridad de I/O de disco de un contenedor. 
                El valor puede variar de 10 a 1000, 0 por defecto (dessactivado)
  Ejemplo:
  docker run -d --rm --blkio-weight 10 --name jefeX 10 imgstress

--device-read-bps y --device-write-bps: 
                Limita el ancho de banda de lectura y escritura en un 
                dispositivo específico.
  Ejemplo: 
  docker run -d --rm --device-read-bps /dev/sda:1mb --device-write-bps /dev/sdb:500kb --name jefeX imgstress

  ubuntu:latest

--device-read-iops y --device-write-iops: 
                Limita las operaciones de entrada/salida por segundo 
                en un dispositivo específico.
  Ejemplo:
  docker run -d --rm --device-read-ipos /dev/sda:500 --device-write-iops /dev/sdb:100 --name jefeX imgstress
'

# ejemplo3:
# lancemos dos jefes de disco, el segundo cmuy limitado en acceso a disco
# 
docker run -d --rm --env TIPO=disco --name Disco_Jefe1 imgstress
docker run -d --rm --env TIPO=disco --blkio-weight 10 --name Disco_Jefe2 imgstress


# Para ver la limitaciones introducidas,
# Utilizar el comando inspect y buscar dentro de "HostConfig" 
# todos los campos que empiecen con "Blkio"
docker inspect Disco_Jefe2 --format='{{.HostConfig.BlkioWeight}} {{.HostConfig.BlkioWeightDevice}} {{.HostConfig.BlkioDeviceReadBps}} {{.HostConfig.BlkioDeviceWriteBps}} {{.HostConfig.BlkioDeviceReadIOps}} {{.HostConfig.BlkioDeviceWriteIOps}}'



':
Políticas de reinicio
--------------------------------------------------------------------------------
Puedes configurar políticas de reinicio para que Docker intente reiniciar un 
contenedor en caso de fallo.

--restart: Configura la política de reinicio. Las opciones más comunes son:

  - no             : No reinicia el contenedor (por defecto).
  - on-failure     : Reinicia el contenedor solo si falla 
                     (puedes especificar un número máximo de reintentos).
  - always         : Siempre reinicia el contenedor si se detiene.
  - unless-stopped : Reinicia el contenedor a menos que haya sido detenido 
                     manualmente.

'

# Para probar este concepto utilizaremos un contenedor que arranca espera 2 
# segundos y falla con un error
# construiremos la imagen con:
docker build -t imgquefalla -f Dockerfile.falla .

# lancemos ahora el contenedor con un par de opciones de reinicio para ver como
# se comporta.
# Nota el parametro --rm con es compatible con el parámetro restart, por eso
# lo quitamos
# pondremos también en un segundo terminal el comando:
docker events
# eso nos permitirá presenciar los reintentos de arranque

# que intente arrancar solo 3 veces
docker run -d --restart on-failure:3 --name desastre imgquefalla

# Inspeccionar el cadaver, con inspect 
docker inspect desastre

:'
campos interesantes dentro del cadaver:
        "State": {
            "Status": "exited",
            ...
            "ExitCode": 1,
            ...
        ...
        "Name": "/desastre",
        "RestartCount": 3,
'
# una vez comprabado los restarts, borramos el contenedor muerto
docker rm desastre

# Ahora que intente arrancar siempre a menos que lo paremos nosotros
docker run -d --restart unless-stopped --name desastre imgquefalla
docker stop
docker rm desastre

