#!/bin/bash

set -x

# format the namenode if it's not already done
su -l -c 'mkdir -p /var/lib/hadoop-hdfs/hdfs-data/namenode /var/lib/hadoop-hdfs/hdfs-data/datanode && hdfs namenode -format -nonInteractive' hdfs

# clear all logs
rm -fr /var/log/hadoop-*/*

# start HDFS
service hadoop-hdfs-namenode start
service hadoop-hdfs-datanode start

# start YARN
service hadoop-yarn-nodemanager start
service hadoop-yarn-resourcemanager start

# start HIVE 2
service hive-metastore start
service hive-server2 start

# start Llama
service llama start

# start Impala
service impala-state-store start
service impala-catalog start
service impala-server start

# hadoop 0.20 Job Tracker
service hadoop-0.20-mapreduce-tasktracker start
su -l -c 'hadoop fs -mkdir -p hdfs:///tmp/hadoop-mapred/mapred/system' hdfs
su -l -c 'hadoop fs -chown -R mapred:hadoop hdfs:///tmp/hadoop-mapred' hdfs
service hadoop-0.20-mapreduce-jobtracker start

# Setup Impala HDFS directories
su -l -c 'hadoop fs -mkdir -p hdfs:///impala' hdfs
su -l -c 'hadoop fs -chown impala:hdfs hdfs:///impala' hdfs

/bin/bash