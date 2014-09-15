FROM ubuntu-java7

MAINTAINER Ronan Gill <ronan@gillsoft.org>

ADD jenkins.supervisor.conf /etc/supervisor/conf.d/
ADD docker.supervisor.conf /etc/supervisor/conf.d/
ADD jenkins.war /u01/jenkins.war
ADD wrapdocker /u01/wrapdocker
RUN mkdir -p /u01/jenkins_home

RUN wget -qO- https://get.docker.io/gpg | sudo apt-key add - && \
    sh -c "echo deb http://get.docker.io/ubuntu docker main > /etc/apt/sources.list.d/docker.list" && \
    apt-get update && apt-get install -y git-core lxc-docker


VOLUME ["/u01/jenkins_home/", "/var/lib/docker"]
WORKDIR /u01
EXPOSE     8080

RUN usermod -u 1034 -d /u01/jenkins_home www-data && \
    chown -R www-data:users /u01/* && \
    chown -R www-data:users /u01/jenkins_home && \
    usermod -g docker www-data
