
FROM openjdk:8
RUN java -version

COPY  C:\Users\774808\.jenkins\workspace\2nd pipeline\target
WORKDIR C:\Users\774808\.jenkins\workspace\2nd pipeline\target


# Stage 2 (to create a downsized "container executable", ~87MB)
FROM openjdk:8
WORKDIR /root/
COPY --from=builder C:\Users\774808\.jenkins\workspace\2nd pipeline\target\helloworld-1.1.jar .

EXPOSE 8123
ENTRYPOINT ["java", "-jar", "helloworld-1.1.jar"]
