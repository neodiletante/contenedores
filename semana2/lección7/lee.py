import os

def leer_fichero_con_palabra(palabra):
    directorio = "/contenido"
    nombre_fichero = os.path.join(directorio, palabra + ".txt")
    
    try:
        with open(nombre_fichero, 'r') as archivo:
            contenido = archivo.read()
            print(f"LECTOR: Contenido del archivo '{nombre_fichero}':\n")
            print(contenido)
    except FileNotFoundError:
        print(f"El archivo '{nombre_fichero}' no existe.")

def main():
    while True:
        palabra = input("Introduce una palabra (o 'salir' para terminar): ")
        if palabra.lower() == 'salir':
            print("Saliendo del programa...")
            break
        leer_fichero_con_palabra(palabra)

if __name__ == "__main__":
    main()