import os

def crear_fichero_con_palabra(palabra):
    directorio = "/contenido"
    nombre_fichero = os.path.join(directorio, palabra + ".txt")
    
    with open(nombre_fichero, 'w') as archivo:
        archivo.write((palabra + '\n') * 10)
    print(f"Archivo '{nombre_fichero}' creado con éxito.")

def main():
    while True:
        palabra = input("ESCRITOR: Introduce una palabra (o 'salir' para terminar): ")
        if palabra.lower() == 'salir':
            print("Saliendo del programa...")
            break
        crear_fichero_con_palabra(palabra)

if __name__ == "__main__":
    main()
