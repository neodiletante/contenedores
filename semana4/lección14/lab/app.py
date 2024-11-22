from flask import Flask, render_template, jsonify
import requests

app = Flask(__name__)

# Función para recuperar los datos
def fetch_data():
    response = requests.get('https://jsonplaceholder.typicode.com/posts')
    data = response.json()
    return data

@app.route('/get_data', methods=['GET'])
def get_data():
    data = fetch_data()
    return jsonify(data)  # Devuelve los datos en formato JSON

@app.route('/')
def index():
    return render_template('index.html')  # Renderiza la página principal

if __name__ == "__main__":
    app.ran(debug=True, port=8000)

