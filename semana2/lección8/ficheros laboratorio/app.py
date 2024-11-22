from flask import Flask, jsonify
import socket
import os

app = Flask(__name__)

@app.route('/')
def index():
    hostname = socket.gethostname()
    return f"Hola desde {hostname}!"

@app.route('/info')
def info():
    # Lista de otros contenedores en la misma red
    containers = ['app1', 'app2', 'app3']
    container_info = []

    for container in containers:
        try:
            # Resolvemos el nombre del contenedor a su dirección IP
            ip = socket.gethostbyname(container)
            container_info.append({"Nombre": container, "ip": ip})
        except socket.error as e:
            container_info.append({"Nombre": container, "error": str(e)})

    return jsonify(container_info)

if __name__ == "__main__":
    # El contenedor main expondrá en el puerto 8000
    app.run(host='0.0.0.0', port=8000)

