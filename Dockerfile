# Use Maven image for build stage
FROM maven:3.8.5-eclipse-temurin-17 AS build
WORKDIR /app
COPY . .
ARG ENV=production
RUN mvn clean package -P${ENV} -DskipTests

# Use OpenJDK image for running stage
FROM openjdk:17
WORKDIR /app
COPY --from=build /app/target/myapp-1.0-SNAPSHOT.jar app.jar
ENTRYPOINT ["java", "-jar", "app.jar"]
