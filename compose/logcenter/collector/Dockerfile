FROM orctom/logstash:2.2.1

RUN \
  mkdir -p $LOGSTASH_HOME/plugins \
  && curl -fL https://github.com/orctom/logstash-input-httpfile/files/100602/logstash-input-httpfile-0.2.0.gem.zip -o /tmp/logstash-input-httpfile-0.2.0.gem.zip \
  && unzip /tmp/logstash-input-httpfile-0.2.0.gem.zip -d $LOGSTASH_HOME/plugins \
  && $LOGSTASH_HOME/bin/plugin install $LOGSTASH_HOME/plugins/logstash-input-httpfile-0.2.0.gem \
  && rm /tmp/logstash-input-httpfile-0.2.0.gem.zip

COPY logstash.conf /etc/
