FROM openjdk:8
ADD target/helloworld-1.1.jar tmp
EXPOSE 8085
ENTRYPOINT ["java","-jar","helloworld-1.1.jar"]
