# Dockerfile para el servicio de listado de ficheros
FROM golang:1.22-alpine

WORKDIR /app

COPY list_service.go list_service.go

RUN go env -w GO111MODULE=auto
RUN go build -o list_service /app/list_service.go

EXPOSE 6000

CMD ["list_service"]
