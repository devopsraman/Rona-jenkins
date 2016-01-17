FROM docker.gillsoft.org/ubuntu-java8

MAINTAINER Ronan Gill <ronan.gill@gillsoft.org>

ADD http://mirrors.jenkins-ci.org/war/latest/jenkins.war /u01/jenkins.war

EXPOSE  8080

RUN apt-get update && apt-get install -y git-core && \
	mkdir /u01/jenkins && \
	chown -R www-data:users /u01/* && \
	usermod -u 1034 -d /u01/jenkins www-data && \
    chown -R www-data:users /u01/* && \
    chown -R www-data:users /u01/jenkins&& \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN curl -sSL https://get.docker.com/ | sh

VOLUME ["/u01/jenkins", "/var/lib/docker"]
USER www-data
ENV JENKINS_HOME /u01/jenkins
ENV HOME /u01/jenkins

CMD java -jar /u01/jenkins.war --prefix=/jenkins
