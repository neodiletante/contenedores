Contenerización de aplicación
=============================

La empresa quiere distribuir la aplicación "./lab/app.js" en un contenedor.
Como siempre, eres el mejor candidato para hacer este trabajo con éxito.

Sigue las siguientes pasos, para definir tu Dockerfile:

1. Imagen base:

  - ¿ cual es la mejor imagen base para esta aplicación ?. Abre el fichero de la aplicación, 
    identifica el lenguaje, busca en google/docker hub la mejor imagen base para aplicaciones hechas
    con ese lenguaje.

 2. Dependencias:

  - ¿ que dependencias tiene la aplicación? Son suministradas esas dependencias en la imagen base?
    Si no lo son, como se pueden instalar en la imagen base?
    Debemos establecer algún directorio de trabajo en el Dockerfile?
    Como copiamos la aplicación app.js a la imagen?
 
 3. Configuración:

   - ¿Necesitamos hacer alguna operación especial para configurar la aplicación?
     ¿se expone algun puerto?

 4. Lanzar la aplicación:

   - ¿que comando podemos utilizar dentro del Dockerfile para lanzar la aplicación?

Una vez tengas tu Dockerfile:
 - Crea la imagen
 - Lanza el contenedor de la aplicación para ver que funciona sin problemas


**Recomendaciones:**
 Experimenta... Prueba diferentes imagenes base, utiliza la instrucciones que hemos
 visto para crear un Dockerfile lo mas flexible posible.

**Salvavidas:**
Se suministra un ejemplo "Salvavidas_NO_MIRAR" para que puedas
comprobar una posible solución, no es la mejor ni la única.
Mírala después de trabajar al menos 1 hora con el ejercicio.
