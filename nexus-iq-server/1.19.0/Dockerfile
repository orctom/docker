FROM orctom/java:8u65-jre
MAINTAINER Hao Chen <orctom@gmail.com>

ENV SONATYPE_HOME /opt/sonatype-nexus
ENV SONATYPE_WORK /opt/sonatype-work
ENV IQ_SERVER_VERSION 1.19.0

RUN \
  curl -fL http://download.sonatype.com/clm/server/nexus-iq-server-${IQ_SERVER_VERSION}-bundle.tar.gz -o /tmp/nexus-iq-server-${IQ_SERVER_VERSION}-bundle.tar.gz \
  && mkdir -p $SONATYPE_HOME $SONATYPE_WORK \
  && tar -zxf /tmp/nexus-iq-server-${IQ_SERVER_VERSION}-bundle.tar.gz -C $SONATYPE_HOME \
  && rm /tmp/nexus-iq-server-${IQ_SERVER_VERSION}-bundle.tar.gz

COPY config.yml ${SONATYPE_WORK}/

VOLUME ${SONATYPE_WORK}

ENV JVM_OPTIONS -Xmx1024m

EXPOSE 8070
EXPOSE 8071
EXPOSE 443

CMD java -server ${JVM_OPTIONS} -jar ${SONATYPE_HOME}/nexus-iq-server-${IQ_SERVER_VERSION}.jar server ${SONATYPE_WORK}/config.yml
