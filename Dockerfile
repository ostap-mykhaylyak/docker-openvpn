FROM debian:jessie

MAINTAINER Ostap Mykhaylyak

RUN dpkg-divert --local --rename --add /sbin/initctl
RUN ln -sf /bin/true /sbin/initctl

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
RUN apt-get install -y openvpn iptables easy-rsa
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

EXPOSE 1194/udp

WORKDIR /etc/openvpn

ADD ./bin /usr/local/bin
RUN chmod a+x /usr/local/bin/*

CMD ["run"]

# docker build -t="ostap/openvpn" .
# docker run --name prova -v /etc/openvpn busybox
# docker run --volumes-from prova --rm ostap/openvpn generate server
# docker run --volumes-from prova --rm ostap/openvpn generate client ostap
# docker run --volumes-from prova --rm ostap/openvpn get ostap

# docker run --volumes-from prova -d -p 1194:1194/udp --cap-add=NET_ADMIN ostap/openvpn
# docker run -i -t --volumes-from prova --rm -p 1194:1194/udp --cap-add=NET_ADMIN ostap/openvpn /bin/bash