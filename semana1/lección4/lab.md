Nuestro cliente nos ha pedido una imagen de contenedor para distribuir una aplicación de entretenimiento familiar cuyo código fuente se suministra a continuación.
La imagen de contenedor se tiene que llamar "me-parto", de tal manera que el contenedor se pueda ejecutar con el comando:
```
  # docker run --rm  me-parto
```
Fuente de la aplicación "me-parto.py":

```
import random

# Lista de chistes
chistes = [
    "¿Por qué los pájaros no usan Facebook? Porque ya tienen Twitter.",
    "¿Qué hace una abeja en el gimnasio? ¡Zum-ba!",
    "¿Qué le dice un gusano a otro gusano? Voy a dar una vuelta a la manzana.",
    "¿Qué hace una computadora en la playa? ¡Busca un byte!",
    "¿Por qué los esqueletos no pelean entre ellos? Porque no tienen agallas.",
    "¿Cómo se despiden los químicos? Ácido un placer.",
    "¿Por qué los peces no van a la escuela? Porque ya están en el agua.",
    "¿Qué le dice una iguana a su hermana gemela? Somos iguanitas.",
    "¿Qué hace una vaca con los ojos cerrados? Leche concentrada.",
    "¿Qué le dice un jardinero a otro? Disfrutemos mientras podamos."
]

def contar_chistes():
    while True:
        input("Presiona Enter para escuchar un chiste...")
        chiste = random.choice(chistes)
        print(f"\n{chiste}\n")

# Ejecutar la función
if __name__ == "__main__":
    contar_chistes()
```

Sugerencias para la implementación:
  - Crear el directorio "risas" dentro de "lección4"
  - Crear un fichero "me-parto.py" con el código fuente de la aplicación en el directorio "risas"
  - Copiar el Dockerfile de la "lección4" en el directorio risas
  - Personalizar el Dockerfile del directorio "risas",.... la aplicación "me-parto" no necesita exponer ningún puerto
  - Construir el contenedor con la orden "build" (no será necesario utilizar el parámetro -p)
  