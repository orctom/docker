FROM debian:jessie

ENV INFLUXDB_VERSION 0.13.0

RUN \
  apt-get update && apt-get install -y curl tar && rm -rf /var/lib/apt/lists/* \
  && curl -fL https://dl.influxdata.com/influxdb/releases/influxdb_${INFLUXDB_VERSION}_amd64.deb -o /tmp/influxdb_${INFLUXDB_VERSION}_amd64.deb \
  && dpkg -i /tmp/influxdb_${INFLUXDB_VERSION}_amd64.deb \
  && rm -rf /tmp/emqttd-debian64-1.0.1-beta-20160416.zip

COPY influxdb.conf /etc/influxdb/influxdb.conf
COPY influxdb.sh /influxdb.sh

VOLUME /var/lib/influxdb

EXPOSE 8083
EXPOSE 8086
EXPOSE 2003
EXPOSE 25826
EXPOSE 4242

ENTRYPOINT ["influxdb.sh"]
CMD ["-d"]