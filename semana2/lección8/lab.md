Enjambre de servidores web
--------------------------

Después del éxito conseguido con la aplicación de recogida de informes (lección 8). 
La dirección de la empresa ha decidido encargarte:

*El despliegue de un enjambre de servidores web!!!*

Los recursos necesarios se encuentran en el directorio `ficheros laboratorio`.

Los servidores web implementados por app.py exponen dos "end points":
```
  - /     : Que devuelve una página web con el texto "Hola desde <ip del contenedor>
  - /info : Que devuelve una página con información acerca de todos los servidores web del enjambre.
```
Se necesitan tres servidores web en el enjambre, los contenedores se llamaran App1, App2, y App3

Solo App3 será accesible desde el exterior, utilizando para ello el puerto 80.

Si decides aceptar esta misión, tu trabajo será:

1. Construir la imagen "imgapp" utilizando el Dockerfile suministrado
2. Crear una red de contenedores llamada "enjambre"
3. Lanzar los tres contenedores requeridos todos conectados en la red "enjambre"
   Importante: 
     - Estar seguro de que el contenedor "App3" publica el puerto 80
     - utilizar `--rm` para asegurarnos que los contenedores "desaparecen" cuando se paran
5. Probar que hay acceso al servidor web de App3, probar las URLs "/" y "/info"
6. Desconectar de la red enjambre a "App2" y volver a probar la url "/info" de App3. Notas alguna diferencia?
7. Intentar borrar la red "enjambre"
8. Parar todos los contenedores
   Sugerencia: Con la mayoria de comandos docker, cuando puedes dar un nombre de contenedor( o imagen),
               También puedes dar una lista de contenedores o imagenes.
               Ejem: 
               `$ docker stop App1 App2 App3`
9.  Borrar la red "enjambre"
10. Comprobar que no queda ningún contenedor en estado "exited" en el host.
