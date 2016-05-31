#!/bin/sh

set -e

if [ "$1" = "-d" ]; then
	exec ${ARTIFACTORY_HOME}/bin/artifacotryctl start;
	exec tail -f ${ARTIFACTORY_HOME}/logs/catalina/catalina.out;
fi

exec "$@"
