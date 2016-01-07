#! /usr/bin/env bash
set -e

ES_OPTS="$@"

if [ -n "$ES_CLUSTER_NAME" ]; then
  ES_OPTS="-Des.cluster.name=$ES_CLUSTER_NAME $ES_OPTS"
fi

if [ -n "$ES_NODE_NAME" ]; then
  ES_OPTS="-Des.node.name=$ES_NODE_NAME $ES_OPTS"
fi

chown -R elasticsearch:elasticsearch $ES_HOME
gosu elasticsearch $ES_HOME/bin/elasticsearch $ES_OPTS
