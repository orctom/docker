FROM orctom/java:8u65-jre

ENV KIBANA_VERSION 4.4.1
ENV KIBANA_HOME /usr/share/kibana

RUN \
  mkdir -p ${KIBANA_HOME} \
  && curl -fL https://download.elastic.co/kibana/kibana/kibana-${KIBANA_VERSION}-linux-x64.tar.gz -o /tmp/kibana-${KIBANA_VERSION}-linux-x64.tar.gz \
  && tar -xf /tmp/kibana-${KIBANA_VERSION}-linux-x64.tar.gz -C $KIBANA_HOME --strip-components=1 \
  && rm /tmp/kibana-${KIBANA_VERSION}-linux-x64.tar.gz \
  && curl -fL https://raw.githubusercontent.com/orctom/alpine-glibc-packages/master/usr/lib/libstdc++.so.6.0.21 -o /usr/lib/libstdc++.so.6.0.21 \
  && ln -s /usr/lib/libstdc++.so.6.0.21 /usr/lib/libstdc++.so.6.new \
  && mv /usr/lib/libstdc++.so.6.new /usr/lib/libstdc++.so.6 \
  && cd ${KIBANA_HOME} \
  && bin/kibana plugin --install elasticsearch/marvel/latest \
  && bin/kibana plugin --install elastic/sense

COPY kibana.sh /etc/kibana.sh

EXPOSE 5601

CMD ["/etc/kibana.sh"]