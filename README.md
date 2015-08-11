# OpenVPN for Docker

Don't use in production

docker build -t="ostap/openvpn" .

docker run --name $DATA -v /etc/openvpn busybox

docker run --volumes-from $DATA --rm ostap/openvpn generate server

docker run --volumes-from $DATA --rm ostap/openvpn generate client $NAME

docker run --volumes-from $DATA --rm ostap/openvpn get $NAME > $NAME.ovpn

docker run --volumes-from $DATA -d -p 1194:1194/udp --cap-add=NET_ADMIN ostap/openvpn

