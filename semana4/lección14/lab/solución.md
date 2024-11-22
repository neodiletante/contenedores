El objetivo de este ejercicio, es que que intentes averiguar que es lo que esta pasando utilizando todoas las técnicas de depuración que hemos visto en la lección.

El problema planteado es realmente muy dificil de resolver porque se necesitan conocimientos de:
  - Como funciona flask
  - Como funciona "Docker in Docker", el entorno que utilizamos para el curso
  - Como funcionan internamente las comunicaciones entre contendores y hosts.

El problema es que si no se indica explicitamente en la instrucción, la dirección del servidor web, 
las direcciones utilizadas por flask hacen imposible la comunicación desde fuera del contenedor "docker in docker" desde el que lanzamos el contenedor:
Esto se puede comprobar viendo como se comunica el contenedor de Codespaces con el contenedor de la app. 
Utilizando  un comando `netstat -tlpna` en el host (contenedor docker in docker de Codespaces), se puede ver que las direcciones IP que se exponen para el contenedor
no son las correctas, haciendo que sea imposible la comunicación del contenedor con el "exterior".

Para que funcione, hay que forzar la dirección IP del interface del servidor web a "todas", es decir "0.0.0.0".
Para ello, en la linea 23 de app.py, hay que utilizar la siguiente instrucción:
```
app.run(debug=True, host='0.0.0.0', port=8000)
```