FROM orctom/java:8u65-jre

ENV ES_VERSION 2.2.0
ENV ES_HOME /usr/share/elasticsearch

RUN \
  curl -fL https://github.com/tianon/gosu/releases/download/1.7/gosu-amd64 -o /usr/local/bin/gosu \
  && chmod +x /usr/local/bin/gosu \
  && adduser -h "/home/elasticsearch" -D -u 1000 -s /bin/bash elasticsearch \
  && mkdir -p ${ES_HOME} \
  && curl -fL https://download.elasticsearch.org/elasticsearch/release/org/elasticsearch/distribution/tar/elasticsearch/${ES_VERSION}/elasticsearch-${ES_VERSION}.tar.gz -o /tmp/elasticsearch-${ES_VERSION}.tar.gz \
  && tar -xf /tmp/elasticsearch-${ES_VERSION}.tar.gz -C $ES_HOME --strip-components=1 \
  && rm /tmp/elasticsearch-${ES_VERSION}.tar.gz \
  && ln -s /usr/share/elasticsearch/bin/elasticsearch /usr/local/bin/elasticsearch \
  && cd ${ES_HOME} \
  && bin/plugin install cloud-aws \
  && bin/plugin install royrusso/elasticsearch-HQ \
  && bin/plugin install lmenezes/elasticsearch-kopf \
  && bin/plugin install mobz/elasticsearch-head

VOLUME /usr/share/elasticsearch/data

COPY elasticsearch.yml ${ES_HOME}/config/elasticsearch.yml
COPY elasticsearch.sh /etc/elasticsearch.sh

EXPOSE 9200 9300

CMD ["/etc/elasticsearch.sh"]