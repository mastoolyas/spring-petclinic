FROM eclipse-temurin:20.0.1_9-jdk-alpine as builder
WORKDIR app
COPY . .
RUN ./mvnw package

FROM openjdk:11.0.11-jre-slim
WORKDIR /app
COPY --from=builder /app/target/*.jar .
RUN chmod a+rx /app -R
CMD ["java", "-jar", "/app/spring-petclinic-3.1.0-SNAPSHOT.jar"]