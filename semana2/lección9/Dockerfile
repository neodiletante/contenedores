# imagen Base
FROM alpine:latest

# preparamos el script que nos conecta con la base de datos
COPY db_script.sh /usr/local/bin/db_script.sh
RUN chmod +x /usr/local/bin/db_script.sh

# ejecutamos el script para conectar con la base de datos
ENTRYPOINT ["/usr/local/bin/db_script.sh"]
