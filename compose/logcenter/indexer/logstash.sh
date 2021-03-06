#! /usr/bin/env bash
set -a

WORKER_NO=${WORKER_NO:-"2"}

echo "Waiting 'Exchange' in MQ to be initialized by 'log collector' for 15 secends..."
sleep 15
echo "Starting..."

if [ $# -eq 0 ]; then
  $LOGSTASH_HOME/bin/logstash agent -f /etc/logstash.conf -w $WORKER_NO
elif [ $1 == "-e" ]; then
  $LOGSTASH_HOME/bin/logstash agent "$@"
else
  exec "$@"
fi
