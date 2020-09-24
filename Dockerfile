FROM openjdk:8
VOLUME /tmp

EXPOSE 8800

ADD target/cicdproject.jar cicdproject.jar
RUN echo Docker image creation is in progress

ENTRYPOINT ["java", "-jar", "cicdproject.jar"]