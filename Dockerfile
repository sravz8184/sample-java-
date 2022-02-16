
FROM openjdk
RUN java -version
ARG JAR_FILE=C:\Users\774808\.jenkins\workspace\2nd pipeline\target

COPY  ${JAR_FILE} helloworld-1.1.jar /
EXPOSE 8123
ENTRYPOINT ["java", "-jar", "/helloworld-1.1.jar"]
