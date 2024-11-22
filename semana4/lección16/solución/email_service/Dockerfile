# Dockerfile para el servicio de email en Java
FROM openjdk:17-jdk-slim

WORKDIR /app

COPY EmailService.java /app/EmailService.java

RUN javac EmailService.java

CMD ["java", "EmailService"]