En la empresa requieren tus servicios otra vez. 
Ahora necesitan una solución de gestión de contenidos para que todos los empleados
puedan tener su propio blog. 
Lo necesitan para mañana.

Esta petición que haría caer en la deseperación a mucha gente, es "pecata minuta" para ti.
Afortunadamente, acabas de aprender a usar Docker compose y casualmente te acuerdas
de que viste en Docker Hub una imagen de Wordpress, que tenia un ejemplo de código 
llamado "docker-compose.yml" que en su momento no supiste reconocer como de valor, pero
que ahora puedes apreciar totalmente su importancia.

Si decides aceptar este desafiante reto podrás responder a las siguiente preguntas:

1. ¿Como se llaman los servicios que se despliegan usando el docker-compose.yml de Wordpress?
2. ¿Cuantos volumenes de datos se crean?
3. ¿Como se puede para temporalmente el servicio de base de datos?
4. ¿Como se pueden ver las estadísticas de utilización de los servicios?
5. ¿Como se pueden ver los logs del los servicios desplegados?

NOTA IMPORTANTE:
Este ejercicio es muy interesante si se realiza en una máquina virtual (fedora + docker instalado, por ejemplo). 
También en un host donde tengas linux o windows instalado, (instalando previamente docker)

Si intentas ejecutar el "docker compose" de Wordpress en el entorno de Github Codespaces, 
va a funcionar, pero el acceso a la página web de "wordpress" no va bien debido a la redirección
que hace GitHub codepaces para poder ofrecer los servicios proporcionados por los puertos expuestos.

Si te conectas a la dirección (vamos a llamarla "codespaces_wordpress_url") que aparece en la pestaña "puertos",
 después de lanzar los contenedores, verá la página de inicio de un servidor ngix.
para poder ver "algo" de wordpress necesitarás conectarte a la página:
<codespaces_wordpress_url>/wp-admin/install.php
Y pasará lo mismo con otras páginas....
Por eso , te sugiero que intentes estudiar este ejemplo usando tu propio ordenador como host, en vez del entorno de codespaces.