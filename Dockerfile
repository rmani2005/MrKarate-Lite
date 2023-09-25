#Docker file for building the image for Spring boot application
FROM ubuntu as ubuntu_os
USER root

FROM maven:3.8-jdk-11 as maven_build

ENV myVariable = "This is myVaraible value from Dockerfile"
ENV hostIP = ""

WORKDIR '/app'
VOLUME /tmp

COPY pom.xml .    
COPY src ./src
#COPY src /app
#COPY target /app
#RUN mvn clean package install -Dmaven.test.skip=true && rm -r target

ARG JAR_NAME="hello-karate-1.0.3-SNAPSHOT"
# To package the application
#COPY src ./src
#RUN mvn clean package -Dmaven.test.skip=true

########run stage########
#FROM openjdk:11
#WORKDIR '/app'
Run mkdir -p testfolder
ARG JAR_NAME="hello-karate-1.0.3-SNAPSHOT"
RUN ls -l /app
RUN ls -l /app/target
RUN chmod -R 777 target
#COPY target .
#COPY ./target/hello-karate-1.0.2-SNAPSHOT.jar hello-karate-1.0.2-SNAPSHOT.jar

WORKDIR './target'
#run the app
ENV JAVA_OPTS ""
EXPOSE 8082
#ADD hello-karate-1.0.2-SNAPSHOT.jar app.jar
CMD ["java","-jar","hello-karate-1.0.3-SNAPSHOT.jar"]
ENTRYPOINT ["java","-jar","hello-karate-1.0.3-SNAPSHOT.jar"]
ENV hostIP = ""

#Run mode
#FROM openjdk:11
#LABEL 
