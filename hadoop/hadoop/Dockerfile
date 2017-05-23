FROM orctom/java:8u65-jre
MAINTAINER Hao Chen <orctom@gmail.com>

RUN \
  apk add --update openssh rsync \
  && rc-update add sshd \
  && rc-status \
  && touch /run/openrc/softlevel \
  && /etc/init.d/sshd start \
  && /etc/init.d/sshd stop \
  && rm -rf /var/cache/apk/*

# hadoop
ENV HADOOP_VERSION 2.7.1
ENV HADOOP_PREFIX /usr/local/hadoop
ENV HADOOP_MAPRED_HOME $HADOOP_PREFIX
ENV HADOOP_COMMON_HOME $HADOOP_PREFIX
ENV HADOOP_HDFS_HOME $HADOOP_PREFIX
ENV YARN_HOME $HADOOP_PREFIX
ENV HADOOP_DATA /var/lib/hadoop
ENV HADOOP_LOG_DIR /var/log/hadoop
ENV HADOOP_CONF_DIR $HADOOP_PREFIX/etc/hadoop/
ENV YARN_LOG_DIR /var/log/yarn/
ENV PATH $PATH:$HADOOP_PREFIX/bin:$PATH:$HADOOP_PREFIX/sbin

RUN \
  curl -fL http://172.17.42.1/dist/hadoop/core/hadoop-${HADOOP_VERSION}/hadoop-${HADOOP_VERSION}.tar.gz -o /tmp/hadoop-${HADOOP_VERSION}.tar.gz \
  && mkdir ${HADOOP_PREFIX} \
  && mkdir -p ${HADOOP_DATA}/dfs/namenode \
  && mkdir -p ${HADOOP_DATA}/dfs/datanode \
  && tar -zxf /tmp/hadoop-${HADOOP_VERSION}.tar.gz -C ${HADOOP_PREFIX} --strip-components=1 \
  && rm /tmp/hadoop-${HADOOP_VERSION}.tar.gz

# prepare for ssh key generation
COPY .ssh/ /etc/.ssh/

VOLUME /var/lib/hadoop/
VOLUME /var/lib/yarn/
VOLUME ${HADOOP_LOG_DIR}/
VOLUME ${YARN_LOG_DIR}/

# NameNode (HDFS)
EXPOSE 9000 50070
# DataNode (HDFS)
EXPOSE 50010 50020 50075
# BackupNode (HDFS)
EXPOSE 50100

# Job Tracker
EXPOSE 50030
# Task Trackers
EXPOSE 50060

# ResourceManager (YARN)
EXPOSE 8030 8031 8032 8033 8088
# NodeManager (YARN)
EXPOSE 8040 8042

# MapReduce JobHistory
EXPOSE 19888

ADD bootstrap.sh /etc/bootstrap.sh
RUN chmod +x /etc/bootstrap.sh

ENTRYPOINT ["/etc/bootstrap.sh"]

CMD ["-d"]
