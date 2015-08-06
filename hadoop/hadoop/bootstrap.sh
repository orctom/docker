#!/bin/sh

set -e

/etc/.ssh/init.d/sshd start

# generate ssh key if not exist
/etc/.ssh/gen_ssh_key.sh

if [ $1 == "-namenode" ]; then
  hdfs namenode
fi

if [ $1 == "-secondarynode" ]; then
  hdfs secondarynamenode
fi

if [ $1 == "-datanode" ]; then
  hdfs datanode
fi

if [ $1 == "-resourcemanager" ]; then
  yarn resourcemanager
fi

if [ $1 == "-nodemanager" ]; then
  yarn nodemanager
fi

if [ $1 == "-namemanager" ]; then
  hdfs namenode
  yarn resourcemanager
fi

if [ $1 == "-datamanager" ]; then
  hdfs datanode
  yarn nodemanager
fi

if [ $1 == "-format" ]; then
  hdfs namenode -format -force
  hdfs dfs -mkdir -p /user/root
fi

if [ $1 == "-d" ]; then
  start-dfs.sh
  start-yarn.sh
  /etc/init.d/sshd stop
  /usr/sbin/sshd -D -d
fi

if [ $1 == "-sh" ] || [ $1 == "sh" ]; then
  start-dfs.sh
  start-yarn.sh
  /bin/sh
fi
