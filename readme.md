Curso de introducción a la gestión de contenedores
==================================================

[Video de presentación del curso](https://drive.google.com/file/d/1VL7xBtLQktAs2LrHzKPgxL-T9ErhOayo/view?usp=drive_link)

Objetivo del curso:
===================
Entender que es un contenedor y proporcionar las herramientas necesarias para gestionar contenedores en cualquier sistema informático.

Después del curso el alumno podrá desplegar cualquier aplicación informática utilizando contenedores, y proporcionar a la aplicación todas las ventajas que el uso de contenedores proporciona en el actual contexto de computación en la nube, despliegues hibridos (nube privada/publica) y servidores privados.

**Para quien es este curso:**

Este curso es una herramienta esencial para cualquier persona que quiera dedicarse profesionalmente a la informática o vaya a tener un contacto profesional con el desarrollo de soluciones informáticas.

Desarrolladores, administradores de sistemas, SREs, especialistas en calidad del software, científicos de datos, y por supuesto cualquier gestor de proyectos informáticos encontrarán en este curso los conocimientos necesarios para poder trabajar con soltura en entornos profesionales en los que en este momento y en el futuro la utilización de contenedores es ya la práctica común.

Semana 1: Lo que necesitas para entender que es y como funciona un contenedor
==============================================================================

Lección 1: Entendiendo la contenerización de aplicaciones
---------------------------------------------------------
**Conceptos clave:**

Ventajas de los contenedores: Aislamiento, uniformidad y escalabilidad. Comparativa con la virtualización de servidores. Prestaciones de los contenedores
 
**Videos de la lección(contenido solo disponible en el curso):**

  - Parte 1. El problema...
  - Parte 2. La solución

**Presentación utilizada en los videos de la lección (en la carpeta de la lección):**

  - [Entendiendo_contenerización(presentación).pdf](https://drive.google.com/file/d/1-wCPNjNB7jqdpCT-mXsLmITlON3UoUGT/view?usp=sharing)

**Lecturas y recursos interesantes:**

  - [Google Cloud: Definición de contenedores](https://cloud.google.com/learn/what-are-containers?hl=es#containers-defined)
  - [Microsoft: Windows y contenedores](https://learn.microsoft.com/es-es/virtualization/windowscontainers/about/)
  - [Red Hat: El concepto de los contenedores](https://www.redhat.com/es/topics/containers#motivos-para-elegir-red%C2%A0hat)

Lección 2: Gestores de contenedores
-----------------------------------
**Presentación conceptos clave:**

¿Que son los gestores de contenedores?. Docker vs Podman. Instalación en Windows o en Linux

**Videos de la lección(contenido solo disponible en el curso):**

  - Introducción
  - Gestores de contenedores

**Presentación utilizada en el video de la lección:**

  - [Gestores de contenedores (presentación).pdf](https://drive.google.com/file/d/1YisO9TeOgrvjp8gYZHG4h9TI52S25-5w/view?usp=sharing)

**Lecturas y recursos interesantes:**

  - [La página principal de Docker (en inglés)](https://www.docker.com/)
  - [La página con los enlaces para instalar Docker Desktop en tu ordenador (en inglés)](https://docs.docker.com/desktop/)
  - [La página principal de Podman (en inglés)](https://podman.io/)
  - [La página con la información para instalar Podman en tu ordenador (en inglés)](https://podman.io/docs/installation)
  - [Instalación de Docker engine en Windows](https://learn.microsoft.com/es-es/virtualization/windowscontainers/manage-docker/configure-docker-daemon)

Lección 3. Utilización de Github Codespaces
-------------------------------------------
Durante el curso utilizaremos el repositorio de github "[Curso Contenedores](https://github.com/jmolmo/CursoContenedores)". 
Este repositorio contiene los recursos necesarios para que el alumno se centre en el aprendizaje y no en tomar apuntes. En esta lección se explica como crear una copia para uso personal del repositorio contenedores, y como utilizar Codespaces para practicar los diferentes comandos y conceptos que se explicarán durante el curso. 
  
**Videos de la lección(contenido solo disponible en el curso):**

  - Introducción a codespaces
  - Como utilizar el proyecto "contenedores" en github
  
**Lecturas y recursos interesantes:**

  - [Excelente curso gratuito de Alfredo Deza sobre CodeSpaces (en inglés)](https://www.youtube.com/playlist?list=PLmsFUfdnGr3wTl-NCblzcrEv2lFSX975-)
  - [La propia documentación de Codespaces (en español)](https://docs.github.com/es/codespaces)

Lección 4. Paseo por la funcionalidad básica de contenedores
-------------------------------------------------------------
Principales comandos y flujo de trabajo habitual para contenerizar una aplicación

**Videos de la lección(contenido solo disponible en el curso):**

  - Introducción
  - Creación de una imagen de contenedor para distribuir una aplicación
  - Ejecución del contenedor que utiliza la imagen recien creada

**Lecturas y recursos interesantes:**

  - [Documentación de referencia de Docker (en inglés)](https://docs.docker.com/reference/)
  - [Documentación sobre la construcción de imágenes de contenedores](https://docs.docker.com/build/building/packaging/)
  - [Documentación del comando para ejecutar contenedores](https://docs.docker.com/engine/reference/run/)

**Ejercicio a realizar:**

  - [Contenerización de aplicación de entretenimiento familiar](semana1/lección4/lab.md)

Lección 5: Gestión de imágenes
------------------------------
En esta lección presentaremos los comandos y técnicas necesarias para trabajar con imágenes de contenedores

**Videos de la lección(contenido solo disponible en el curso):**

  - Introducción
  - Qué es y que contiene una imagen de contenedor
  - Capas de una imagen
  - Búsqueda de imágenes usando la linea de comandos
  - Búsqueda de imágenes usando la web de Docker - Docker Hub
  - Recogiendo imágenes de Docker Hub
  - Inspección de imágenes
  - Borrando imágenes
  - Resumen de la lección

**Lecturas y recursos interesantes:**

  - [¿Cuál es la diferencia entre imágenes y contenedores de Docker?](https://aws.amazon.com/es/compare/the-difference-between-docker-images-and-containers/)
  - [¿Qué es una imagen? (en inglés)](https://docs.docker.com/guides/docker-concepts/the-basics/what-is-an-image/)
  - [Entendiendo las capas de una imagen (en inglés)](https://docs.docker.com/guides/docker-concepts/building-images/understanding-image-layers/)

**Ejercicio a realizar:**

  - [Lanzar un servidor web que cumpla ciertos requisitos](semana1/lección5/lab.md)

Semana 2: Lo que vas a utilizar el 90% del tiempo: Trabajando con contenedores
==============================================================================

Lección 6: Creación y gestión de containers
-------------------------------------------
Entendiendo el estado y el ciclo de vida de un contenedor. Comandos para transitar entre los diferentes estados.

**Videos de la lección(contenido solo disponible en el curso):**

  - Introducción
  - Estado 'created'
  - Estado 'running'. Comandos start y restart
  - Estado 'running'. Comando run
  - Estado 'paused'
  - Estados 'stopping' y 'exited'
  - Borrado de contenedores
  - Parametro <--rm> del comando 'docker run'
  - Resumen de la lección

**Lecturas y recursos interesantes:**

  - [Comando 'docker ps'. Estados de un contenedor](https://docs.docker.com/reference/cli/docker/container/ls/#status)

**Ejercicio a realizar:**

  - [Jugando con los estados de un contenedor](semana2/lección6/lab.md)

Lección 7: Almacenamiento de datos en containers
------------------------------------------------
Introducción al almacenamiento persistente para contenedores

**Videos de la lección(contenido solo disponible en el curso):**

  - Introducción
  - Soluciones almacenamiento usando el host anfitrión
  - Preparación entorno de trabajo
  - Creación imagenes de ejemplo
  - Problemática del almacenamiento en contenedores
  - Compartición de directorios (bind mount)
  - Persistencia y compartición
  - Gestión de volumenes de Docker
  - Uso de volumenes de Docker
  - Liberación de espacio
  - Resumen de la lección

**Lecturas y recursos interesantes:**

- [Almacenamiento persistente en contenedores](https://learn.microsoft.com/es-es/virtualization/windowscontainers/manage-containers/persistent-storage)
- [Gestionar el almacenamiento en Docker (en inglés)](https://docs.docker.com/engine/storage/)

**Ejercicio a realizar:**

  - [Servidor web con almacenamiento de datos](semana2/lección7/lab.md)

Lección 8: Comunicaciones en los contenedores
---------------------------------------------
Exposición y mapeo de puertos. Gestión básica de redes de contenedores

**Videos de la lección(contenido solo disponible en el curso):**

  - Introducción
  - Exposición de puertos
  - Publicación de puertos
  - Redes de contenedores
  - Asignación de red a un contenedor
  - Cambio de red
  - Resumen de la lección

**Lecturas y recursos interesantes:**

  - [Docker - Networking (en inglés)](https://docs.docker.com/engine/network/)

**Ejercicio a realizar:**

  - [Enjambre de servidores web](semana2/lección8/lab.md)

Lección 9: Ejecutando contenedores
----------------------------------
Técnicas para el paso de variables y parámetros a contenedores
Entrando en contenedores en ejecución
Repaso de el comando <docker run> con todas las cosas que hemos aprendido

**Videos de la lección(contenido solo disponible en el curso):**

  - Introducción
  - Explicación de la problemática
  - Reemplazo del entrypoint
  - Parámetros --env y --env-file
  - Docker exec
  - Docker run bash
  - Docker attach
  - Resumen comando Docker run
  - Resumen de la lección

**Lecturas y recursos interesantes:**

  - [referencia de Docker run (en inglés)](https://docs.docker.com/reference/cli/docker/container/run/)

**Ejercicio a realizar:**

  - [Ejercicios](semana2/lección9/lab.md)


Lección 10: Gestión de recursos computacionales en containers
-------------------------------------------------------------
Gestión de recursos computacionales en containers y políticas de reinicio

**Videos de la lección(contenido solo disponible en el curso):**

  - Introducción
  - Preparación del entorno de trabajo
  - Limitando la CPU
  - Limitando la memoria RAM
  - Limitando el acceso a disco
  - Políticas de reaaranque de contenedores
  - Resumen de la lección

**Lecturas y recursos interesantes:**

  - [Referencia comando run (aparecen los parámetros de limitación de recursos) (en inglés)](https://docs.docker.com/reference/cli/docker/container/run/)

**Ejercicio a realizar:**

  - [Ejercicios](semana2/lección10/lab.md)

Semana 3: Cuando la cosa se complique, necesitarás saber esto:
==============================================================

Lección 11: Personalización y creación de imágenes para containers
-----------------------------------------------------------------
Explicación Dockerfile e instrucciones mas utilizadas

**Videos de la lección(contenido solo disponible en el curso):**

  - Introducción
  - Secciones lógicas en el Dockerfile. Sección de la imagen de la imagen de base
  - Sección de dependencias. WORKDIR y COPY
  - Sección de dependencias. ENV, ADD, y RUN
  - Sección de configuración
  - Sección de lanzamiento de la aplicación contenerizada
  - Contexto de un Dockerfile
  - Resumen de la lección

**Lecturas y recursos interesantes:**

  - [Referencia Dockerfile](https://docs.docker.com/reference/dockerfile/)

**Ejercicio a realizar:**

  - [Contenerización de una aplicación](semana3/lección11/lab.md)

Lección 12: Trabajando con registros
------------------------------------
Que es un registro de contenedores
Autenticación e interacción con registros de contenedores. Token de acceso personal
Recogiendo y enviando imagenes a registros de contenedores. 
Detección y solución de vulnerabilidades conocidas.

**Videos de la lección(contenido solo disponible en el curso):**

  - Introducción
  - Registros de imágenes de contenedores
  - Docker hub
  - Repositorios de imágenes
  - Subida de imagenes. Push fallido
  - Token de acceso personal al registro
  - Subida de imágenes. Detección de vulnerabilidades
  - Subida de imagen sin vulnerabilidades
  - Descarga de imagenes. Pull
  - Pull con "digest"
  - Borrado de imagenes
  - Resumen de la lección

**Lecturas y recursos interesantes:**

  - [¿Qué es el registro de contenedores?](https://www.redhat.com/es/topics/cloud-native-apps/what-is-a-container-registry)

**Ejercicio a realizar:**

  - [Despliegue y utilización de un registro de imagenes de contenedores privado](semana3/lección12/lab.md)

Lección 13: Docker compose
---------------------------
Utilizar docker-compose para gestionar soluciones de software que necesiten mas de un contenedor 

**Videos de la lección(contenido solo disponible en el curso):**

  - Introdución
  - Descripción general de un fichero de Docker compose
  - Descripción detallada de las secciones del fichero
  - Explicación de la solución de ejemplo
  - Lanzar un "solución" de Docker compose
  - Comandos de docker compose
  - Resumen

**Lecturas y recursos interesantes:**

  - [Referencia de subcomandos para "docker-compose" (inglés)](https://docs.docker.com/reference/cli/docker/compose/#subcommands)
  - [Referencia del fichero de definición de servicios (inglés)](https://docs.docker.com/reference/compose-file/)

**Ejercicio a realizar:**

  - [Solución Wordpress para la empresa](semana3/lección13/lab.md)


Semana 4: Técnicas avanzadas y ejercicio final
=====================================================================

Lección 14: Depuración de contenedores
--------------------------------------
Técnicas que podemos utilizar para depurar errores en contenedores y/o aplicaciones contenerizadas

**Videos de la lección(contenido solo disponible en el curso):**

  - Introducción
  - Fase 1. Estado del contenedor - eventos
  - Fase 1. Estado del contenedor - inspeccionar y ver logs
  - Fase 1. Estado del contenedor - Error de "salud"
  - Fase 1. Error en comando de arranque del contenedor
  - Fase 1. Error en la aplicación
  - Fase 2. "Meterse" en el contenedor
  - Fase 3. "Meterse" en la aplicación
  - Resumen de la lección
  
**Lecturas y recursos interesantes:**

  - [Docker inspect (en inglés)](https://docs.docker.com/reference/cli/docker/inspect/)
  - [Docker logs (en inglés)](https://docs.docker.com/reference/cli/docker/container/logs/)
  - [Docker exec (en inglés)](https://docs.docker.com/reference/cli/docker/container/exec/)

**Ejercicio a realizar:**

  - [Se necesita un salvador...](semana4/lección14/lab.md)

Lección 15: Construcción de imagenes en multiples etapas
--------------------------------------------------------
Técnica necesaria para hacer mas pequeñas nuestras imágenes y limitar vulnerabilidades.

**Videos de la lección(contenido solo disponible en el curso):**

  - Introducción
  - Explicación Dockerfile multi-stage o multi-etapas
  - Resumen de la lección
  
**Lecturas y recursos interesantes:**

  - [Docker multistage builds (en inglés)](https://docs.docker.com/build/building/multi-stage/)

**Ejercicio a realizar:**

  - [Optimización de la imagen de la aplicación "sysinfo"](semana4/lab.md)

Lesson 16: Proyecto final Microservicios
-----------------------------------------
Ejercicio para practicar el despliegue de una solución que utilice la arquitectura de microservicios

**Videos de la lección(contenido solo disponible en el curso):**

  - Explicación problemática y solución en el mundo real

**Lecturas y recursos interesantes:**

  - [Explicación arquitectura de microservicios según Microsoft](https://learn.microsoft.com/es-es/azure/architecture/guide/architecture-styles/microservices)
  - [Explicación arquitectura de microservicios según Red Hat](https://www.redhat.com/es/topics/microservices/what-are-microservices)

**Ejercicio a realizar:**

  - [Despliegue solución gestión informes](semana4/lección16/ejercicio_microservicios.md)
