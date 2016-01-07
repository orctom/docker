#! /usr/bin/env bash
set -e

ES_URL=${ES_URL:-"http://es:9200"}
$KIBANA_HOME/bin/kibana -e $ES_URL
