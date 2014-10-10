FROM 192.168.1.178:5000/ubuntu-java7

MAINTAINER Ronan Gill <ronan@gillsoft.org>

ADD jenkins.war /u01/jenkins.war
RUN mkdir -p /u01/jenkins_home
RUN apt-get update && apt-get install -y git-core

VOLUME ["/u01/jenkins_home/", "/var/lib/docker"]

EXPOSE  8080

RUN usermod -u 1034 -d /u01/jenkins_home www-data && \
    chown -R www-data:users /u01/* && \
    chown -R www-data:users /u01/jenkins_home

USER www-data
#ENV HOME /u01/jenkins_home
ENV JENKINS_HOME /u01/jenkins_home

CMD java -jar /u01/jenkins.war --prefix=/jenkins
