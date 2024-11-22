# app.py
import logging
from http.server import SimpleHTTPRequestHandler
from socketserver import TCPServer

# Configurar logging
logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(message)s')
logger = logging.getLogger()

PORT = 8000

class CustomHandler(SimpleHTTPRequestHandler):
    def do_GET(self):
        logger.info("Procesando petición desde %s", self.client_address)
        super().do_GET()

Handler = CustomHandler

with TCPServer(("", PORT), Handler) as httpd:
    logger.info("Arrancando servidor http en puerto %d", PORT)
    try:
        httpd.serve_forever()
    except KeyboardInterrupt:
        logger.info("Cerrando servidor http")
        httpd.server_close()
