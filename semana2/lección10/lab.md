Contenedores especializados en el uso de recursos
=================================================

Utiliza la imagen construida en la lección `imgstress`, para lanzar tres
 contenedores con los siguientes nombres y características:

 - sinmemoria : Limita la memoria RAM a 8000Mb y evita que se utilice memoria de 
                swap o intercambio.
 - sincpu     : Limita el uso de CPU a 1 CPU y a 100 shares
 - sindisco   : Limita el uso de disco al mínimo

 Monitoriza el funcionamiento de estos contenedores con `docker stats` y 
 verifica que has establecido los límites correctamente utilizando `docker inspect`
