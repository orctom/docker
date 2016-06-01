FROM orctom/logstash:2.2.1

RUN mkdir -p $LOGSTASH_HOME/patterns/
COPY websphere $LOGSTASH_HOME/patterns/
COPY logstash.conf /etc/
COPY logstash.sh /etc/
