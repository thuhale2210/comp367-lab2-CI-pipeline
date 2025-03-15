FROM openjdk:11-jdk

WORKDIR /app

# Copy the built WAR file instead of a JAR
COPY target/*.war app.war

# Expose port 8080
EXPOSE 8080

# Run the application using a web server (if needed)
CMD ["java", "-jar", "app.war"]