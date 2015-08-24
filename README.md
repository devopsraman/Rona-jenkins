# Docker Container for Nexus


This is conainter for [jenkins][1]. 

## To Build

```
> docker build --tag jenkins . # normal build
> docker build --no-cache=true --force-rm=true --tag jenkins . # force a full build
```

## To Run

```
>  docker run --name="jenkins-server" -t -i \
              --privileged \
              -p 18001:8080 \
              -v /data/files/jenkins/workdir:/u01/jenkins_home  \
              -v /data/files/jenkins/docker:/var/lib/docker \
              jenkins
```

[1]:  http://jenkins-ci.org/

