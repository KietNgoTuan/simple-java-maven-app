#
# Build stage
#
FROM maven:3.8.1-adoptopenjdk-11 AS build
COPY src /usr/src/app/src  
COPY pom.xml /usr/src/app  
RUN mvn -f /usr/src/app/pom.xml clean package

#
# Package stage
#
FROM openjdk:11-jre-slim
COPY --from=build /usr/src/app/targetsimple-java-maven-app-1.0.0-SNAPSHOT.jar /usr/app/simple-java-maven-app-1.0.0-SNAPSHOT.jar  
EXPOSE 8080  
ENTRYPOINT ["java","-jar","/usr/app/simple-java-maven-app-1.0.0-SNAPSHOT.jar"]  
