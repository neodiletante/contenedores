# 1. Imagen base e identificación 
#===============================================================================
# NOTA: las variables ARG solo se utilizan en la construcción
ARG CODE_VERSION=alpine
ARG BASE_IMAGE=nginx
FROM ${BASE_IMAGE}:${CODE_VERSION}

# 1.1 Identificación y etiquetado de la imagen 
LABEL autor="Juan Miguel Olmo"
LABEL descripcion="Imagen para probar instrucciones de Dockerfile"

# 2. Dependencias
#===============================================================================

# Establecer un directorio de trabajo
WORKDIR /usr/share/nginx/html

# 2.1 Copia de información
# Copia de ficheros
COPY ./ficheros_ejemplo/libros.json ./dir_libros_1/
COPY ./ficheros_ejemplo/* ./dir_libros_2/
COPY ./ficheros_ejemplo/libros.json ./ficheros_ejemplo/libros2.json ./dir_libros3/

# Añadir ficheros
# Añadir un fichero comprimido y descomprimirlo en destino
ADD ./ficheros_ejemplo/muchos_ficheros.tar ./dir_muchos_ficheros

# Añadir un fichero remoto... un rpm para instalar
ADD https://rpmfind.net/linux/fedora/linux/development/rawhide/Everything/x86_64/os/Packages/r/redhat-display-fonts-4.0.3-12.fc41.noarch.rpm  ./rpms/

# Especificar variables de entorno
# NOTA: las variablesde entorno estarán presentes también en el contenedor
ENV MI_NOMBRE="Juan Miguel Olmo"

# 2.2 Ejecución de ordenes

# RUN para ejecutar comandos en el contenedor
# NOTA: cada RUN crea una nueva capa en el contenedor
RUN date > fecha_instalación.txt
RUN rm index.html


# si lo que vamos a hacer pensamos que mejor genere una sola capa, 
# podemos simplificar con
RUN <<EOF
apk update
apk upgrade
apk add curl
EOF

# 3. Configuración
#===============================================================================
# Exponer puertos de comunicación
EXPOSE 80

# Añadir variables de entorno
ENV USER="juanmi"
ENV PASS="secret"

# Elimina la configuración por defecto de Nginx
RUN rm /etc/nginx/conf.d/default.conf

# Copia tu configuración personalizada de Nginx
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Añadir un comprobador de salud del contenedor
HEALTHCHECK --interval=5m --timeout=3s \
  CMD curl -f http://localhost/ || exit 1

# 4. Lanzar la aplicación contenerizada
#===============================================================================
# ENTRYPOINT
# Define la linea de comando para lanzar la aplicación contenerizada
ENTRYPOINT ["nginx", "-g", "daemon off;"]

# NOTA: También se puede utilizar el comando CMD para lanzar la aplicación 
# contenerizada. Se utiliza normalmente para definir un comportamiento por 
# defecto para el contenedor o para proporcioanr la lista de parámetros para
# ENTRYPOINT
# si no utilizaramos ENTRYPOINT en esta imagen sería:
# CMD ["nginx", "-g", "daemon off;"]
# o con ENTRYPOINT:
# CMD ["-g", "daemon off;"]
# ENTRYPOINT ["nginx"]








