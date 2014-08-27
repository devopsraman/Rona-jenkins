FROM ubuntu-java7

MAINTAINER Ronan Gill <ronan@gillsoft.org>

RUN apt-get update && apt-get install -y git-core
RUN mkdir -p /u01/jenkins_home
WORKDIR /u01

ADD jenkins.war /u01/jenkins.war

VOLUME ["/u01/jenkins_home/"]

EXPOSE     8080

RUN usermod -u 1034 -d /u01/jenkins_home www-data
RUN chown -R www-data:users /u01/*
RUN chown -R www-data:users /u01/jenkins_home

ADD jenkins.supervisor.conf /etc/supervisor/conf.d/
