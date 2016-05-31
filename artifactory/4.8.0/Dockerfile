FROM orctom/java:8u65-jre
MAINTAINER Hao Chen <orctom@gmail.com>

ENV ARTIFACTORY_HOME /opt/artifactory
ENV ARTIFACTORY_VERSION 4.8.0

RUN \
  curl -fL https://dl.bintray.com/jfrog/artifactory/jfrog-artifactory-oss-${ARTIFACTORY_VERSION}.zip -o /tmp/jfrog-artifactory-oss-${ARTIFACTORY_VERSION}.zip \
  && unzip /tmp/jfrog-artifactory-oss-${ARTIFACTORY_VERSION}.zip -C /tmp \
  && mv /tmp/artifactory-oss-4.8.0/ ${ARTIFACTORY_HOME} \
  && rm /tmp/jfrog-artifactory-oss-${ARTIFACTORY_VERSION}.zip

VOLUME ${ARTIFACTORY_HOME}/data
VOLUME ${ARTIFACTORY_HOME}/logs
VOLUME ${ARTIFACTORY_HOME}/backup

EXPOSE 8081

COPY artifactory.sh /

ENTRYPOINT ["/artifactory.sh"]
CMD ["-d"]
