# Use an official OpenJDK runtime as a parent image
FROM openjdk:17-jdk-slim

# Set the working directory in the container
WORKDIR /app

# Copy the source code into the container
COPY ./src /app/src

# Compile the Java source code (manual compilation)
RUN javac -d /app/bin /app/src/com/example/*.java

# Set the entry point to run the app
CMD ["java", "-cp", "/app/bin", "com.example.MyApp"]
