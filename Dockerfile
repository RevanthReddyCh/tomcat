FROM ubuntu as builder

RUN apt-get update -y && apt-get install git -y && apt-get install -y openjdk-11-jdk

RUN git clone https://github.com/awsdevop183/tomcat.git

WORKDIR /tomcat

RUN bash build.sh


FROM tomcat

WORKDIR /usr/local/tomcat/webapps


COPY --from=builder /tomcat/ROOT.war .

EXPOSE 8080

CMD ["catalina.sh", "run"]
