#FROM frolvlad/alpine-oraclejdk8:slim
FROM frolvlad/alpine-oraclejre8:latest
COPY ./build/libs/Gradle_build-0.0.1-SNAPSHOT.jar app.jar
ENTRYPOINT ["java", "-jar", "app.jar"]
