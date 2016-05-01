#!/bin/sh

set -e

if [ "$1" = "-d" ]; then
	exec /usr/local/sbin/mosquitto -c /etc/mosquitto/mosquitto.conf
fi

exec "$@"
