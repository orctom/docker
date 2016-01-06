FROM orctom/java:8u65-jre

ENV ES_VERSION 2.1.1
ENV ES_HOME /etc/elasticsearch

RUN \
  curl -fL https://download.elasticsearch.org/elasticsearch/release/org/elasticsearch/distribution/tar/elasticsearch/${ES_VERSION}/elasticsearch-${ES_VERSION}.tar.gz -o /tmp/elasticsearch-${ES_VERSION}.tar.gz \
  && tar -xf /tmp/elasticsearch-${ES_VERSION}.tar.gz -C $ES_HOME --strip-components=1 \
  && rm /tmp/elasticsearch-${ES_VERSION}.tar.gz \
  && cd ${ES_HOME} \
  && bin/plugin -i elasticsearch/marvel/latest \
  && bin/plugin -i elasticsearch/elasticsearch-cloud-aws/latest \
  && bin/plugin -i elasticsearch/elasticsearch-lang-mvel/latest \
  && bin/plugin -i elasticsearch/license/latest \
  && bin/plugin -i elasticsearch/watcher/latest \
  && bin/plugin -i mobz/elasticsearch-head/latest \
  && bin/plugin -i royrusso/elasticsearch-HQ/latest \
  && bin/plugin -i lmenezes/elasticsearch-kopf/latest

EXPOSE 9200 9300

CMD ["/etc/elasticsearch/bin/elasticsearch"]