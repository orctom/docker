FROM alpine:3.4

RUN \
  apk add --update erlang curl wget bash tar \
  && rm -rf /tmp/* /var/cache/apk/*

CMD ["/bin/sh"]