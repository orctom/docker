#!/bin/sh

set -e

# find local non-loopback ip
client_ip=`ifconfig -a|awk '/(cast)/ {print $2}'|cut -d':' -f2|head -1`

if [ $1 == "sh" ]; then
  exec "$@"
elif [ $1 == "-join" || $1 == "-retry-join" ]; then
  consul agent \
    -server \
    -ui \
    -bootstrap-expect=3 \
    -data-dir=/usr/local/consul \
    -disable-host-node-id \
    -bind=${client_ip} \
    -client=${client_ip} \
    "$@"
else
  consul agent \
    -server \
    -ui \
    -bootstrap-expect=3 \
    -data-dir=/usr/local/consul \
    -disable-host-node-id \
    -bind=${client_ip} \
    -client=${client_ip}
fi
