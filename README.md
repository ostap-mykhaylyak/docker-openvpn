# OpenVPN for Docker

            Don't use in production

## Quick Start

* Download and build from GitHub

            docker build -t ostap/openvpn git://github.com/ostap-mykhaylyak/docker-openvpn.git

* Create $DATA container

            docker run --name $DATA -v /etc/openvpn busybox

* Generate OpenVPN Server certificates and configuration

            docker run --volumes-from $DATA --rm ostap/openvpn generate server

* Generate OpenVPN Client certificates

            docker run --volumes-from $DATA --rm ostap/openvpn generate client $NAME

* Retrieve the client configuration with embedded certificates

            docker run --volumes-from $DATA --rm ostap/openvpn get $NAME > $NAME.ovpn

* Start OpenVPN Server

            docker run --volumes-from $DATA -d -p 1194:1194/udp --cap-add=NET_ADMIN ostap/openvpn