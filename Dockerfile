# Use an official OpenJDK runtime as a parent image
FROM openjdk:11-jdk

# Set the working directory in the container
WORKDIR /app

# Copy the built JAR file into the container
COPY target/*.jar app.jar

# Expose port 8080
EXPOSE 8080

# Run the JAR file
CMD ["java", "-jar", "app.jar"]
