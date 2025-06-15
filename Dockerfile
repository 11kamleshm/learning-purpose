FROM openjdk:17-jdk-slim

WORKDIR /app

# 👇 Yeh line update karo jar ke sahi naam se
COPY target/sample-java-app-1.0.jar app.jar

EXPOSE 8080

CMD ["java", "-jar", "app.jar"]
