FROM debian:jessie

MAINTAINER Ostap Mykhaylyak

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
RUN apt-get install -y openvpn iptables easy-rsa
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

EXPOSE 1194/udp

WORKDIR /etc/openvpn

ADD ./bin /usr/local/bin
RUN chmod a+x /usr/local/bin/*

CMD ["run"]