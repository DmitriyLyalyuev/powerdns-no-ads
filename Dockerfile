FROM ubuntu:14.04.3

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get -qqy update && apt-get -qqy upgrade && apt-get -qqy install mc htop pdns-server pdns-backend-mysql wget parallel
RUN apt-get -qqy clean autoclean && apt-get -qqy autoremove && rm -rf /var/lib/{apt,cache,log}/

EXPOSE 53/udp

ENTRYPOINT ["pdns_server"]
