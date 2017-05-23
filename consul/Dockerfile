FROM orctom/alpine:3.2
MAINTAINER Hao Chen <orctom@gmail.com>

RUN \
  curl https://releases.hashicorp.com/consul/0.8.3/consul_0.8.3_linux_amd64.zip -o /tmp/consul.zip \
  && unzip /tmp/consul.zip -d /usr/local/bin

CMD ["/bin/sh"]