FROM docker.gillsoft.org/ubuntu-java8

MAINTAINER Ronan Gill <ronan.gill@gillsoft.org>

ADD http://mirrors.jenkins-ci.org/war-stable/latest/jenkins.war /u01/jenkins.war

RUN apt-get update && \
    apt-get install -y git-core apt-transport-https ca-certificates && \
    apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D && \
    echo "deb https://apt.dockerproject.org/repo ubuntu-wily main" > /etc/apt/sources.list.d/docker.list && \
    apt-get update && \
    dpkg-query -l  | grep lxc-docker | xargs -r apt-get purge && \
    apt-get install -y docker-engine && \
    mkdir -p /u01/jenkins && \
    chown -R www-data:users /u01/* && \
    usermod -u 1034 -d /u01/jenkins www-data && \
    chown -R www-data:users /u01/* && \
    chown -R www-data:users /u01/jenkins&& \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

VOLUME ["/u01/jenkins", "/var/lib/docker"]
USER www-data
ENV JENKINS_HOME /u01/jenkins
ENV HOME /u01/jenkins

CMD java -jar /u01/jenkins.war --prefix=/jenkins
