import os
import time
import random

def stress_cpu():
    # Realiza cálculos matemáticos pesados para usar CPU
    start_time = time.time()
    while time.time() - start_time < random.uniform(0.1, 2.0):  # Dura entre 0.1 y 2 segundos
        [x**2 for x in range(10000)]

def stress_memory():
    # Consume memoria aleatoriamente entre 10MB y 100MB
    size_in_mb = random.randint(10, 100)
    _ = [0] * (size_in_mb * 1024 * 1024)

def stress_disk():
    # Escribe y borra datos aleatoriamente en un archivo
    size_in_mb = random.randint(10, 100)
    with open('stress_test.tmp', 'wb') as f:
        f.write(os.urandom(size_in_mb * 1024 * 1024))
    os.remove('stress_test.tmp')

def stress_loop(tipo):
    print(f"Estresando {tipo}")
    if tipo == 'cpu':
        stress_cpu()
    elif tipo == 'ram':
        stress_memory()
    elif tipo == 'disco':
        stress_disk()
    elif tipo == 'todo':
        stress_cpu()
        stress_memory()
        stress_disk()
    else:
        print("Opción no válida. Elige entre 'cpu', 'ram', 'disco' o 'todo'.")

if __name__ == "__main__":
    tipo = os.getenv('TIPO', 'todo').lower()  # Lee la variable de entorno TIPO, por defecto 'todo'
    while True:
        stress_loop(tipo)
        time.sleep(random.uniform(0.5, 3.0))  # Pausa entre 0.5 y 3 segundos antes de repetir
