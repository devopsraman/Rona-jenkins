FROM 192.168.1.178:5000/ubuntu-java8

MAINTAINER Ronan Gill <ronan@gillsoft.org>

ADD jenkins.war /u01/jenkins.war
RUN apt-get update && apt-get install -y git-core

EXPOSE  8080


VOLUME ["/u01/jenkins", "/var/lib/docker"]
RUN chown -R www-data:users /u01/*

RUN usermod -u 1034 -d /u01/jenkins www-data && \
    chown -R www-data:users /u01/* && \
    chown -R www-data:users /u01/jenkins

USER www-data
ENV JENKINS_HOME /u01/jenkins
ENV HOME /u01/jenkins

CMD java -jar /u01/jenkins.war --prefix=/jenkins
