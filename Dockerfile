# Usa una imagen base de Java
FROM openjdk:17-jdk-slim

# Directorio de trabajo
WORKDIR /app

# Copia el JAR compilado
COPY api/target/server-fhir.jar server-fhir.jar

# Expone el puerto
EXPOSE 8080

# Comando de inicio
ENTRYPOINT ["java", "-jar", "server-fhir.jar"]
