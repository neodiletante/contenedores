from flask import Flask
import redis

app = Flask(__name__)
cache = redis.Redis(host='redis', port=6379)

@app.route('/')
def hola_mundo():
    count = cache.incr('hits')
    return f'Hola mundo! Ya hemos visto esto {count} veces.'

if __name__ == "__main__":
    app.run(host="0.0.0.0", debug=True)
