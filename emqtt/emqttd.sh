#!/bin/sh

if [ -n "$NODE_IP" ]; then
  sed -i 's/127.0.0.1/'"$NODE_IP"'/g' /opt/emqttd/etc/vm.args
fi

/opt/emqttd/bin/emqttd start;

sleep 5

if [ -n "$MASTER" ]; then
  /opt/emqttd/bin/emqttd_ctl cluster emqttd@$MASTER;
  sleep 10;
fi

tail -f --retry /opt/emqttd/log/*