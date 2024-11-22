Jugando con los estados de un contenedor
----------------------------------------

1. Diseñar un comando para mostrar de forma continua en una terminal el valor de los siguiente campos de un contenedor:

            "Status", "Running", "Paused" y "Restarting"

Sugerencia:
  Este comando es una variación del comando "watch docker inspect" utilizado durante los videos de esta lección.
  Documentación útil para este ejercicio:

  - [La documentación del comando "inspect"](https://docs.docker.com/reference/cli/docker/inspect/)

  - [La documentación para obtener el formato de salida deseado](https://pkg.go.dev/text/template#hdr-Examples)

Truco: Para conseguir el efecto de obtener en diferentes lineas los diferentes campos pedidos, se puede utilizar
para el parámetro --format el siguiente valor:

```
  --format='{{printf "Status: %s\nRunning: %t\n" .State.Status .State.Running}}' 
```

2. Ejecutar el comando diseñado en el punto anterior en una de las partes de una terminal dividida. En la otra parte ejecutar los comandos necesarios para cambiar el estado de un contenedor para que pase por los siguientes estados de forma secuencial:
  
  - created
  - running
  - paused
  - running
  - exited
  - running
  - exited

3. Asegurarse que el contenedor utilizado para el ejercicio "desaparece" totalmente al terminar este ejercicio.