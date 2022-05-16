FROM openjdk:8
ADD target/maven-wrapper.jar maven-wrapper.jar
EXPOSE 80
ENTRYPOINT ["java", "-jar", "maven-wrapper.jar"]
