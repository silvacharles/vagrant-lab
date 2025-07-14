FROM maven:3.8.7-openjdk-18-slim AS buildstage
RUN mkdir -p /opt/note
RUN apt-get update && apt-get install -y git 
WORKDIR /opt/note
RUN git clone https://github.com/callicoder/spring-boot-mysql-rest-api-tutorial.git /opt/note
RUN mvn package -Dmaven.test.skip=true



FROM openjdk:11-jdk-slim
RUN addgroup notes && adduser --system --ingroup notes --no-create-home notes
WORKDIR /opt/note
COPY --from=buildstage /opt/note/target/easy-notes-1.0.0.jar .
COPY application.properties application.properties
RUN chown -R notes:notes /opt/note
USER notes:notes
ENTRYPOINT ["java","-jar","/opt/note/easy-note.jar"]