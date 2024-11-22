Ejercicio sobre búsqueda de imágenes
-------------------------------------

En la empresa nos han encargado desplegar un servidor web. Los requerimientos son:

1. Se necesita una imagen oficial de Docker Hub
2. Que la licencia sea "Open source", en concreto "Apache License, Version 2.0"
3. La imagen del contenedor no puede ocupar mas de 150 Kb
4. El servidor web debe ofrecer acceso a los ficheros contenidos en este directorio (semana1/lección5)

Sugerencias:
------------
- Utiliza en Docker Hub los filtros "Docker oficial image" y "web server"
- Busca la imagen que cumpla los requerimientos 2 y 3 en Docker Hub.
  a parte de buscar la información en "Docker Hub", también puedes traerte las imagenes a tu ordenador(entorno codespaces) con el comando "docker pull" e inspeccionarlas con "docker inspect"
- Usala (construye un Dockerfile) para lanzar un contenedor que satisfaga el requisito 4
  probablemente la ficha de la imagen en Docker hub te dará información acerca de como construir el Dockerfile
