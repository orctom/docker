#!/bin/sh

set -e

if [ "$1" = "-d" ]; then
  exec ${ARTIFACTORY_HOME}/bin/artifactory.sh;
fi

exec "$@"
