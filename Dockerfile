FROM openjdk:11-jdk

WORKDIR /app

# Copy the built WAR file into container
COPY target/*.war app.war

# Expose port 8080
EXPOSE 8080

# Run the application
CMD ["java", "-jar", "app.war"]