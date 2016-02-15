FROM orctom/java:8u65-jre

ENV LOGSTASH_VERSION 2.2.1
ENV LOGSTASH_HOME /usr/share/logstash

RUN \
  mkdir -p $LOGSTASH_HOME \
  && curl -fL https://download.elastic.co/logstash/logstash/logstash-${LOGSTASH_VERSION}.tar.gz -o /tmp/logstash-${LOGSTASH_VERSION}.tar.gz \
  && tar -xf /tmp/logstash-${LOGSTASH_VERSION}.tar.gz -C $LOGSTASH_HOME --strip-components=1 \
  && rm /tmp/logstash-${LOGSTASH_VERSION}.tar.gz

COPY logstash.sh /etc/
COPY logstash.conf /etc/

ENTRYPOINT ["/etc/logstash.sh"]
