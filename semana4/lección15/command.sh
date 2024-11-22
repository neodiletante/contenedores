:'
Construcción de imagenes en multiples etapas

Construir imágenes de contenedores en múltiples etapas es una práctica avanzada
y eficaz, que te permite crear imágenes más ligeras y seguras al  separar las 
dependencias y el entorno de construcción de la aplicación del  entorno de 
ejecución. 

El problema con la construcción en una sola etapa es que todas las herramientas
y dependencias necesarias para construir la aplicación también están 
presentes en la imagen final. 
Esto puede aumentar innecesariamente el tamaño de la imagen y potencialmente
incluir vulnerabilidades.

En la construcción de imágenes en múltiples etapas, puedes separar la fase de 
construcción de la fase de ejecución para optimizar tu imagen final. 
'

# Estudiemos como funciona un Dockerfile para construir usando múltiples étapas:
cat Dockerfile.ok

# Construyamos la imagen utilizando multiples etapas.
docker build -t img_ok -f Dockerfile.ok .

# Lancemos la aplicación
docker run --rm -it --name app img_ok

# Ahora construyamos la imagen sin utilizar multiples etapas
docker build -t img_mal -f Dockerfile.mal .

# Lancemos la aplicación
docker run --rm -it --name app_mal img_mal

# Comparemos las imagenes
docker images



