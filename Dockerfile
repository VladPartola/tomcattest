FROM ubuntu

MAINTAINER vladpartola

RUN apt-get -y update && apt-get -y upgrade
RUN apt-get -y install openjdk-11-jdk wget
RUN apt-get install unzip
RUN mkdir /usr/local/tomcat
RUN wget https://www-us.apache.org/dist/tomcat/tomcat-10/v10.0.4/bin/apache-tomcat-10.0.4.tar.gz -O /tmp/tomcat.tar.gz
RUN wget https://github.com/VladPartola/tomcattest/archive/refs/heads/main.zip -O /tmp/main.zip
RUN cd /tmp && tar xvfz tomcat.tar.gz && unzip main.zip -d /tmp
RUN cp -Rv /tmp/apache-tomcat-10.0.4/** /usr/local/tomcat/ && cp -Rv /tmp/tomcattest-main/index.jsp /usr/local/tomcat/webapps/ROOT

EXPOSE 8080
CMD ["/usr/local/tomcat/bin/catalina.sh", "run"]
