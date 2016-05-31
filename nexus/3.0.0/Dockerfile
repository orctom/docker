FROM orctom/java:8u65-jre
MAINTAINER Hao Chen <orctom@gmail.com>

ENV SONATYPE_HOME /opt/sonatype-nexus
ENV SONATYPE_WORK /opt/sonatype-work
ENV NEXUS_VERSION 3.0.0-03

RUN \
  curl -fL https://download.sonatype.com/nexus/oss/nexus-${NEXUS_VERSION}-bundle.tar.gz -o /tmp/nexus-${NEXUS_VERSION}-bundle.tar.gz \
  curl -fL https://sonatype-download.global.ssl.fastly.net/nexus/3/nexus-${NEXUS_VERSION}-unix.tar.gz -o /tmp/nexus-${NEXUS_VERSION}-unix.tar.gz \
  && mkdir -p $SONATYPE_HOME $SONATYPE_WORK \
  && tar -zxf /tmp/nexus-${NEXUS_VERSION}-unix.tar.gz -C $SONATYPE_HOME --strip-components=1 \
  && rm /tmp/nexus-${NEXUS_VERSION}-unix.tar.gz \

VOLUME ${SONATYPE_WORK}

EXPOSE 8081

CMD ["/opt/sonatype-nexus/bin/nexus", "console"]
