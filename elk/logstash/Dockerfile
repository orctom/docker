FROM orctom/java:8u65-jre

ENV LOGSTASH_VERSION 2.1.1
ENV LOGSTASH_HOME /etc/logstash

RUN \
  curl -fL https://download.elastic.co/logstash/logstash/logstash-${LOGSTASH_VERSION}.tar.gz -o /tmp/logstash-${LOGSTASH_VERSION}.tar.gz \
  && tar -xf /tmp/logstash-${LOGSTASH_VERSION}.tar.gz -C $LOGSTASH_HOME --strip-components=1 \
  && rm /tmp/logstash-${LOGSTASH_VERSION}.tar.gz

EXPOSE 9200 9300

CMD ["/etc/logstash/bin/logstash", "agent"]