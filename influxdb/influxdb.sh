#!/bin/sh

set -e

if [ "$1" = "-d" ]; then
  exec influxd
fi

exec "$@"
