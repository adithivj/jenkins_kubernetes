FROM java:8

RUN apt-get update  
RUN apt-get install -y maven

WORKDIR /code

ADD  /pom.xml /code/pom.xml
RUN ["mvn", "dependency:resolve"]


ADD src /code/src
RUN ["mvn", "package"]

EXPOSE 8090

CMD ["/usr/lib/jvm/java-8-openjdk-amd64/bin/java", "-jar", "target/demo-0.0.1-SNAPSHOT.jar"]  
