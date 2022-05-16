FROM openjdk:8
ADD ./.mvn/wrapper/maven-wrapper.jar maven-wrapper.jar
EXPOSE 80

