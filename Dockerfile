FROM openjdk
RUN java -version

COPY  target/*.jar /
EXPOSE 9090
ENTRYPOINT ["java", "-jar", "/helloworld-1.1.jar"]
