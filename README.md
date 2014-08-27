# Docker Container for Nexus


This is conainter for [nexus][1]. The container uses [supervisord][2] to run both nexus and an ssh server.

The file nexus.conf is an upstart job for ubuntu.

## To Build

```
> docker build --tag nexus . # normal build
> docker build --no-cache=true --force-rm=true --tag nexus . # force a full build
```

## To Run

```
>  docker run --name="nexus-server" -t -i \
                -v /data/files/nexus/:/data \
                -v /data/tvshows:/volume1/tvshows \
                -v /data/files/nzbget:/nzbget \
                -p 8083:8083 nexus
```

[1]:  https://github.com/echel0n/SickRage
[2]:  http://supervisord.org/

