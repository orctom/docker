FROM alpine:latest

MAINTAINER Hao Chen <orctom@gmail.com>

RUN apk --update add openssh

VOLUME ["~/.ssh/"]

COPY .ssh/ /etc/.ssh/

CMD ["/etc/.ssh/gen_ssh_key.sh"]
