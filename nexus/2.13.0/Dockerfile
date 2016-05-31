FROM orctom/java:8u65-jre
MAINTAINER Hao Chen <orctom@gmail.com>

ENV SONATYPE_HOME /opt/sonatype-nexus
ENV SONATYPE_WORK /opt/sonatype-work
ENV NEXUS_VERSION 2.13.001

RUN \
  curl -fL https://download.sonatype.com/nexus/oss/nexus-${NEXUS_VERSION}-bundle.tar.gz -o /tmp/nexus-${NEXUS_VERSION}-bundle.tar.gz \
  && mkdir -p $SONATYPE_HOME $SONATYPE_WORK \
  && tar -zxf /tmp/nexus-${NEXUS_VERSION}-bundle.tar.gz -C $SONATYPE_HOME --strip-components=1 \
  && rm /tmp/nexus-${NEXUS_VERSION}-bundle.tar.gz \
  && adduser -h "$SONATYPE_HOME" -D -u 1000 -s /bin/sh nexus \
  && chown -R nexus:nexus $SONATYPE_HOME $SONATYPE_WORK

VOLUME ${SONATYPE_WORK}

EXPOSE 8081

USER nexus

CMD ["/opt/sonatype-nexus/bin/nexus", "console"]
