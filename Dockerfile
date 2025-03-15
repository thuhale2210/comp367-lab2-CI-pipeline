FROM tomcat:9.0-jdk11

# Copy the built WAR file into Tomcat’s webapps directory
COPY target/*.war /usr/local/tomcat/webapps/app.war

# Expose port 8080
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]