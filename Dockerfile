FROM ubuntu

MAINTAINER vladpartola

RUN apt-get -y update && apt-get -y upgrade
RUN apt-get -y install openjdk-11-jdk wget
RUN apt-get install zip
RUN mkdir /usr/local/tomcat
RUN wget https://www-us.apache.org/dist/tomcat/tomcat-10/v10.0.4/bin/apache-tomcat-10.0.4.tar.gz -O /tmp/tomcat.tar.gz
RUN cd /tmp && tar xvfz tomcat.tar.gz
RUN cp -Rv /tmp/apache-tomcat-10.0.4/** /usr/local/tomcat/

WORKDIR /usr/local/tomcat

RUN wget https://github.com/VladPartola/tomcattest/archive/refs/heads/main.zip -O /tmp/main.zip
RUN cd /tmp && zip -r main.zip /tmp
COPY /tmp/tomcattest-main/index.jsp webapps/ROOT

EXPOSE 8080
CMD ["/usr/local/tomcat/bin/catalina.sh", "run"]
