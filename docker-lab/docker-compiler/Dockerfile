FROM openjdk:11-jdk-slim
RUN addgroup notes && adduser --system --ingroup notes --no-create-home notes
ENV MAVEN_VERSION=3.9.9
ENV MAVEN_HOME=/usr/lib/mvn
ENV PATH="$MAVEN_HOME/bin:$PATH"
RUN apt-get update && apt-get install -y wget tar git
RUN wget http://archive.apache.org/dist/maven/maven-3/$MAVEN_VERSION/binaries/apache-maven-$MAVEN_VERSION-bin.tar.gz && \
 tar -zxvf apache-maven-$MAVEN_VERSION-bin.tar.gz && \
 rm apache-maven-$MAVEN_VERSION-bin.tar.gz && \
 mv apache-maven-$MAVEN_VERSION /usr/lib/mvn
WORKDIR /opt/note
RUN git clone https://github.com/callicoder/spring-boot-mysql-rest-api-tutorial.git /opt/note
RUN mvn package -Dmaven.test.skip=true
ARG JAR_FILE=*.jar
RUN cp ./target/easy-notes-1.0.0.jar /opt/note/easy-note.jar
COPY application.properties application.properties
RUN chown -R notes:notes /opt/note
USER notes:notes
ENTRYPOINT ["java","-jar","/opt/note/easy-note.jar"]
