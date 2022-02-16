FROM openjdk
RUN java -version

COPY  target/*.jar /
EXPOSE 8123
ENTRYPOINT ["java", "-jar", "/helloworld-1.1.jar"]
