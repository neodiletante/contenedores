# Utiliza una imagen base de Go
FROM golang:1.20-alpine

# Establece el directorio de trabajo dentro del contenedor
WORKDIR /app

# Copia los archivos de la aplicación al contenedor
COPY . .

# Compila la aplicación
RUN go mod init systeminfo && go mod tidy
RUN go build -o main .

# Ejecuta los tests
RUN go test -v ./...

# Expone el puerto en el que correrá la aplicación
EXPOSE 8080

# Comando para ejecutar la aplicación
CMD ["./main"]
