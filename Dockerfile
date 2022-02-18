FROM openjdk:8
RUN java -version
WORKDIR /app
COPY  target/*.jar /app
EXPOSE 9090
ENTRYPOINT ["java", "-jar", "/app/helloworld-1.1.jar"]
