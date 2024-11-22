Ejercicio de microservicios
===========================

Que vas a conseguir haciendo este ejercicio:
---------------------------------------------
En este ejercicio practicarás con todos los conocimientos adquiridos en el curso. 
La tarea a realizar esta pensada para que te enfrentes a un encargo de contenerización de los que te vas a encontrar trabajando en un entorno profesional en el mundo real.

Lógicamente los microservicios estan simplificados al máximo, pero nos servirán para ilustrar perfectamente los pasos y desafios que tendrás que superar para completar el ejercicio.

Por lo tanto, si haces el ejercicio, tendrás la confianza de poder abordar y participar en proyectos de contenerización de aplicaciones que utilicen la arquitectura de microservicios.

Esta arquitectura es ampliamente utilizada en muchos ámbitos... por ejemplo, los muchos de los servicios ofrecidos por Netflix utilizan este enfoque de diseño y despliegue da la funcionalidad.


Introducción
------------
La arquitectura de microservicios es un enfoque de diseño de software en el que una aplicación se estructura como un conjunto de servicios pequeños e independientes, cada uno de los cuales es responsable de una función específica. En lugar de construir una aplicación monolítica, donde todos los componentes están interconectados y dependen entre sí, los microservicios permiten que cada componente se desarrolle, despliegue y escale de manera independiente.

Ventajas:
---------
  - Flexibilidad en el desarrollo: Diferentes equipos pueden trabajar en distintas partes de la aplicación simultáneamente.
  - Mejora de la resiliencia: La falla en un microservicio no afecta a toda la aplicación.
  - Escalabilidad específica: Permite escalar solo las partes de la aplicación que lo necesiten, optimizando el uso de recursos.

Desventajas:
------------
  - Complejidad en la gestión: Manejar múltiples microservicios puede ser complicado, especialmente en cuanto a la orquestación y el monitorización.
  - Comunicación y latencia: El aumento en la cantidad de servicios puede aumentar la latencia debido a la comunicación entre ellos.
  - Despliegue y pruebas: Requiere herramientas y procesos avanzados para manejar el despliegue continuo y las pruebas de integración.

La mayoria de las desventajas pueden ser anuladas utilizando contenedores para desplegar los diferentes microservicios. Por eso , esta arquitectura se ha hecho tan popular en los últimos años.


Descripción del proyecto:
-------------------------

Se trata de desplegar la solución de recogida de informes de empresa. Esta solución esta formada por tres microservicios:

  - Servicio de carga de ficheros:
    Es una web que permite al usuario especificar un fichero y sube ese fichero al almacén de ficheros.

  - Servicio de resumen de informes:
    Es una web que nos proporciona un listado de los ficheros que se han subido a la web de carga.

  - Servicio de alertas:
    Es un programa que revisa el almacen de ficheros y nos envia un email si hay algún fichero que excede los 100Kb

Recursos técnicos disponibles:
-------------------------------

El departamento de programación nos ha pasado una ficha de cada uno de estos microservicios para facilitarnos el proceso de contenerización:

Servicio de carga de ficheros:
  - Implementado utilizando el script: ./microservicios/upload_service.py
  - Librerias utilizadas: flask
  - Almacenamiento de datos: en el directorio "/uploads"
  - Puertos de comunicación utilizados: 5000/tcp
  - Comando para lanzar el servicio: python upload_service.py
  - Notas adicionales: 

Servicio de resumen de informes:
  - Implementado utilizando el script: ./microservicios/list_service.go
  - Librerias utilizadas: Ninguna
  - Directorio de revisión de ficheros: "/uploads"
  - Puertos de comunicación utilizados: 6000/tcp
  - Comando para lanzar el servicio: "list_service"
  - Notas adicionales: 
    Será necesario antes de compilar la aplicación, inicializar el entorno de go, utilizar:
    go env -w GO111MODULE=auto

Servicio de alertas:
  - Implementado utilizando el script: ./microservicios/EmailService.java
  - Librerias utilizadas: Ninguna
  - Directorio de revisión de ficheros: "/uploads"
  - Puertos de comunicación utilizados: ninguno
  - Comando para lanzar el servicio: "java EmailService <smtp_server> <email_destinatario>"
  - Notas adicionales:
      - La aplicación necesita ser compilada utlizando el entorno OpenJDK.

        
Tareas a realizar:
------------------

1. Construir una imagen de contenedor para el servicio de carga de ficheros
2. Lanzar el contenedor del servicio de carga de ficheros para probarlo
3. Construir el Dockerfile para el servicio de resumen de informes
4. Lanzar el contenedor del servicio de resumen de informes para probarlo    
5. Construir el Dockerfile para el servicio de alertas
6. Lanzar el contenedor del serviciode alertas para probarlo    
7. Crear un fichero de "docker compose" para gestionar todos los microservicios

Nota: Todos los servicios utilizan un  directorio "/uploads" para acceder a los ficheros.
       Este directorio será el mismo en el host para todos los servicios. 
       Será necesario incluir un parámetro en la orden "docker run" para poder especificarlo.





