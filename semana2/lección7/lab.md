Servidor web con almacenamiento de datos
----------------------------------------

En la empresa te han pedido que despliegues en la web su aplicación para recoger informes de clientes.

El departamente de desarrollo de la empresa, te ha entregado amablemente los ficheros de la aplicación y el Dockerfile para generar la imagen del contenedor necesario para crear un contenedor de la aplicación. (se encuentran en el directorio de esta lección, dentro de `ficheros_laboratorio`)

Tu trabajo es:
  - Estudia el código de la aplicación para saber que recursos usa. 
    TRUCO: Te interesa sobre todo averiguar el directorio de almacenamiento de informes y el puerto de comunicaciones
  - Revisa el Dockerfile para asegurarte que todo esta bien. 
  - Construye la imagen para poder lanzar contenedores de la aplicación de recogida de informes.
  - Crea un volumen de Docker, llamado "informes" para almacenar los ficheros de informes en el host.
    Así evitaremos perder los informes si el contenedor de la aplicación falla, o algún jefe,
    como paso el otro dia, para el contenedor sin darse cuenta.
  - Lanza el contenedor para que utilice el volumen de Docker
  
Para asegurarte el aumento de sueldo largamente merecido es conveniente que:
  - Pruebes la subida de un par de archivos
  - Compruebes que dentro del contenedor en ejecución, hay un directorio que contiene los archivos.
  - Compruebes que dentro del volumen "informes" se encuentran los achivos
  - Compruebes que si matas el contenedor de la aplicación, dentro del volumen "informes" siguen estando los archivos.

Sugerencias y pistas:
1. Para arrancar el contenedor y mapear el volumen, necesitarás saber cual es el directorio de destino en el contenedor. 
   
2. El comando para lanzar el contenedor necesita exponer un puerto utilizado en el servidor web .. como todavía no hemos explicado "comunicaciones",
   Damos una pista del parámetro (solo de este parámetro) que necesitarás para exponer el puerto de tu aplicación:

   Siendo xxxx el puerto de comunicaciones utilizado en recoge_informes.py tendrás que utilizar el parámetro:
   ```
   
   docker run .... -p xxxx:xxxx ...
   ```