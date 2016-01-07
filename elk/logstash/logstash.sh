#! /usr/bin/env bash
set -e

$LOGSTASH_HOME/bin/logstash agent -f /etc/logstash.conf
