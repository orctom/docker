FROM orctom/java:8u51-jre
MAINTAINER Hao Chen <orctom@gmail.com>

RUN \
  apt-get update && apt-get install -y ssh rsync \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# hadoop
ENV HADOOP_VERSION 2.7.1
ENV HADOOP_PREFIX /usr/local/hadoop
ENV HADOOP_MAPRED_HOME $HADOOP_PREFIX
ENV HADOOP_COMMON_HOME $HADOOP_PREFIX
ENV HADOOP_HDFS_HOME $HADOOP_PREFIX
ENV YARN_HOME $HADOOP_PREFIX
ENV HADOOP_DATA /var/lib/hadoop
ENV HADOOP_CONF_DIR $HADOOP_PREFIX/etc/hadoop/
ENV PATH $PATH:$HADOOP_PREFIX/bin:$PATH:$HADOOP_PREFIX/sbin

RUN \
  curl -fL http://archive.apache.org/dist/hadoop/core/hadoop-${HADOOP_VERSION}/hadoop-${HADOOP_VERSION}.tar.gz -o /tmp/hadoop-${HADOOP_VERSION}.tar.gz \
  && mkdir ${HADOOP_PREFIX} \
  && mkdir ${HADOOP_PREFIX}/logs \
  && mkdir -p ${HADOOP_DATA}/dfs/namenode \
  && mkdir -p ${HADOOP_DATA}/dfs/datanode \
  && tar -zxf /tmp/hadoop-${HADOOP_VERSION}.tar.gz -C ${HADOOP_PREFIX} --strip-components=1 \
  && rm /tmp/hadoop-${HADOOP_VERSION}.tar.gz

ADD hadoop-env.sh $HADOOP_CONF_DIR/hadoop-env.sh
ADD core-site.xml $HADOOP_CONF_DIR/core-site.xml
ADD hdfs-site.xml $HADOOP_CONF_DIR/hdfs-site.xml
ADD yarn-site.xml $HADOOP_CONF_DIR/yarn-site.xml
ADD mapred-site.xml $HADOOP_CONF_DIR/mapred-site.xml

VOLUME /var/lib/hadoop/
VOLUME /var/log/hadoop-hdfs
VOLUME /var/log/hadoop-mapreduce
VOLUME /var/log/hadoop-yarn

# pig
ENV PIG_VERSION 0.15.0
ENV PIG_PREFIX /usr/local/pig
ENV PATH $PATH:$PIG_PREFIX/bin
RUN \
  curl -fL http://archive.apache.org/dist/pig/pig-${PIG_VERSION}/pig-${PIG_VERSION}.tar.gz -o /tmp/pig-${PIG_VERSION}.tar.gz  \
  && mkdir ${PIG_PREFIX} \
  && tar -zxf /tmp/pig-${PIG_VERSION}.tar.gz -C ${PIG_PREFIX} --strip-components=1 \
  && rm /tmp/pig-${PIG_VERSION}.tar.gz 

# hive
ENV HIVE_VERSION 1.2.1
ENV HIVE_PREFIX /usr/local/hive
ENV PATH $PATH:$HIVE_PREFIX/bin
RUN \
  curl -fL http://archive.apache.org/dist/hive/hive-${HIVE_VERSION}/apache-hive-${HIVE_VERSION}-bin.tar.gz -o /tmp/apache-hive-${HIVE_VERSION}-bin.tar.gz  \
  && mkdir ${HIVE_PREFIX} \
  && tar -zxf /tmp/apache-hive-${HIVE_VERSION}-bin.tar.gz -C ${HIVE_PREFIX} --strip-components=1 \
  && rm /tmp/apache-hive-${HIVE_VERSION}-bin.tar.gz

# zookeeper
ENV ZK_VERSION 3.4.6
ENV ZK_PREFIX /usr/local/zookeeper
ENV ZK_CONF_DIR $ZK_PREFIX/conf
ENV PATH $PATH:$ZK_PREFIX/bin
RUN \
  curl -fL http://archive.apache.org/dist/zookeeper/zookeeper-${ZK_VERSION}/zookeeper-${ZK_VERSION}.tar.gz -o /tmp/zookeeper-${ZK_VERSION}.tar.gz \
  && mkdir ${ZK_PREFIX} \
  && tar -zxf /tmp/zookeeper-${ZK_VERSION}.tar.gz -C ${ZK_PREFIX} --strip-components=1 \
  && rm /tmp/zookeeper-${ZK_VERSION}.tar.gz

ADD zoo.cfg $ZK_CONF_DIR/zoo.cfg

# hbase
ENV HBASE_VERSION 1.1.1
ENV HBASE_PREFIX /usr/local/hbase
ENV HBASE_CONF_DIR $HBASE_PREFIX/conf
ENV PATH $PATH:$HBASE_PREFIX/bin
RUN \
  curl -fL http://archive.apache.org/dist/hbase/${HBASE_VERSION}/hbase-${HBASE_VERSION}-bin.tar.gz -o /tmp/hbase-${HBASE_VERSION}-bin.tar.gz \
  && mkdir ${HBASE_PREFIX} \
  && tar -zxf /tmp/hbase-${HBASE_VERSION}-bin.tar.gz -C ${HBASE_PREFIX} --strip-components=1 \
  && rm /tmp/hbase-${HBASE_VERSION}-bin.tar.gz

ADD hbase-site.xml $HBASE_CONF_DIR/hbase-site.xml

VOLUME /var/lib/hbase
VOLUME /var/log/hbase

# format dfs
RUN hdfs namenode -format

# passwordless ssh
RUN \
  service ssh start \
  && ssh-keygen -q -N "" -t rsa -f ~/.ssh/id_rsa \
  && cat $HOME/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys \
  && ssh-keyscan localhost >> ~/.ssh/known_hosts

# NameNode (HDFS)
EXPOSE 8020 50070
# DataNode (HDFS)
EXPOSE 50010 50020 50075

# ResourceManager (YARN)
EXPOSE 8030 8031 8032 8033 8088
# NodeManager (YARN)
EXPOSE 8040 8042

# Mapred ports
EXPOSE 19888

# zookeeper
EXPOSE 2181

# Thrift API
EXPOSE 9090
# Thrift Web UI
EXPOSE 9095

# HBase Master API port
EXPOSE 60000
# HBase Master Web UI
EXPOSE 60010

# Regionserver API port
EXPOSE 60020
# HBase Regionserver web UI
EXPOSE 60030

# Spark history server
EXPOSE 18080

ADD bootstrap.sh /etc/bootstrap.sh
RUN chmod +x /etc/bootstrap.sh

ENTRYPOINT ["/etc/bootstrap.sh", "-d"]
CMD ["/etc/bootstrap.sh", "-d"]
