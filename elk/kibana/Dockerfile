FROM orctom/java:8u65-jre

ENV KIBANA_VERSION 4.3.1
ENV KIBANA_HOME /etc/kibana

RUN \
  curl -fL https://download.elastic.co/kibana/kibana/kibana-${KIBANA_VERSION}-linux-x64.tar.gz -o /tmp/kibana-${KIBANA_VERSION}-linux-x64.tar.gz \
  && tar -xf /tmp/kibana-${KIBANA_VERSION}-linux-x64.tar.gz -C $KIBANA_HOME --strip-components=1 \
  && rm /tmp/kibana-${KIBANA_VERSION}-linux-x64.tar.gz \
  && cd ${KIBANA_HOME} \
  && bin/kibana plugin -i elastic/sense

EXPOSE 5601

CMD ["/etc/kibana/bin/kibana"]