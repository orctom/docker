FROM debian:jessie

ENV MOSQUITTO_VERSION=1.4.8

RUN apt-get update \
  && apt-get install -y curl build-essential libssl-dev libc-ares-dev uuid-dev libmysqlclient-dev ca-certificates \
  && curl -fL http://mosquitto.org/files/source/mosquitto-$MOSQUITTO_VERSION.tar.gz -o /tmp/mosquitto-$MOSQUITTO_VERSION.tar.gz \
  && tar -xvf /tmp/mosquitto-$MOSQUITTO_VERSION.tar.gz -C /tmp \
  && cd /tmp/mosquitto-$MOSQUITTO_VERSION && make && make install && ldconfig \
  && curl -fL https://codeload.github.com/jpmens/mosquitto-auth-plug/tar.gz/0.0.7 -o /tmp/mosquitto-auth-plug.tar.gz \
  && tar -xvf /tmp/mosquitto-auth-plug.tar.gz -C /tmp \
  && cd /tmp/mosquitto-auth-plug-0.0.7 \
  && cp config.mk.in config.mk \
  && sed -i "s/MOSQUITTO_SRC =/MOSQUITTO_SRC = ..\//" config.mk \
  && make \
  && cp auth-plug.so /usr/local/lib/ \
  && cp np /usr/local/bin/np \
  && chmod +x /usr/local/bin/np \
  && apt-get remove --purge -y build-essential libssl-dev libc-ares-dev uuid-dev libmysqlclient-dev ca-certificates \
  && apt-get autoremove -y \
  && rm -rf /var/lib/apt/lists/* /tmp/*  

VOLUME ["/var/lib/mosquitto", "/etc/mosquitto", "/etc/mosquitto.d"]

EXPOSE 1883 9883

COPY mosquitto.sh /usr/local/bin/
COPY mosquitto.conf /etc/mosquitto/mosquitto.conf

ENTRYPOINT ["mosquitto.sh"]
CMD ["-d"]