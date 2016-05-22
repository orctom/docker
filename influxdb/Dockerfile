FROM debian:jessie

ENV INFLUXDB_VERSION 0.13.0

RUN \
  apt-get update && apt-get install -y curl && rm -rf /var/lib/apt/lists/* \
  && curl -fL https://dl.influxdata.com/influxdb/releases/influxdb_${INFLUXDB_VERSION}_amd64.deb -o /tmp/influxdb_${INFLUXDB_VERSION}_amd64.deb \
  && dpkg -i /tmp/influxdb_${INFLUXDB_VERSION}_amd64.deb \
  && rm -rf /tmp/influxdb_${INFLUXDB_VERSION}_amd64.deb

COPY influxdb.conf /etc/influxdb/influxdb.conf
COPY influxdb.sh /influxdb.sh

VOLUME /var/lib/influxdb

# admin
EXPOSE 8083
# API
EXPOSE 8086
# Graphite
EXPOSE 2003
# Collectd
EXPOSE 25826
# openTSDB
EXPOSE 4242

ENTRYPOINT ["/influxdb.sh"]
CMD ["-d"]