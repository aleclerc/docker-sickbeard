FROM ubuntu:14.04
#Thanks to https://github.com/user419/docker-sickbeard and https://github.com/GeoffreyPlitt/docker-sickbeard
MAINTAINER Tim Haak <tim@haak.co.uk>

ENV SICKBEARD_VERSION master
#ENV SICKBEARD_VERSION build-506

RUN apt-get -q update &&\
    apt-get -qy --force-yes dist-upgrade

RUN apt-get install -qy --force-yes python-cheetah python-setuptools wget tar ca-certificates curl git

RUN git clone https://github.com/midgetspy/Sick-Beard.git -b $SICKBEARD_VERSION /sickbeard

# apt clean
RUN apt-get clean &&\
  rm -rf /var/lib/apt/lists/* &&\
  rm -rf /tmp/*

VOLUME /config
VOLUME /media

ADD ./start.sh /start.sh
RUN chmod u+x  /start.sh

EXPOSE 8081

CMD ["/start.sh"]
