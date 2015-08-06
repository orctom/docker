#!/bin/bash

set -e

service ssh restart
start-dfs.sh
start-yarn.sh

if [[ $1 == "-d" ]]; then
  tail -f $HADOOP_PREFIX/logs/*
fi

if [[ $1 == "-bash" ]]; then
  /bin/bash
fi
