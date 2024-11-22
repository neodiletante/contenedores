# 1. Imagen Base
FROM golang:1.20-alpine

# 2. Dependencias
# Establece el directorio de trabajo dentro del contenedor
WORKDIR /app

# Copia el archivo main.go en el contenedor
COPY main.go .

# Crea un directorio para almacenar las imágenes
RUN mkdir -p /app/images

# Copia las imagenes
COPY ./imagenes ./imagenes

# Compila la aplicación Go
RUN go env -w GO111MODULE=auto
RUN go build -o server .

# Expone el puerto en el que el servidor web estará escuchando
EXPOSE 8080

# Comando por defecto para ejecutar el servidor
CMD ["./server"]