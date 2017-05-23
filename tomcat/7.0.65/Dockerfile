FROM orctom/java:7u79-jre

ENV CATALINA_HOME /usr/local/tomcat
ENV PATH $PATH:$CATALINA_HOME/bin
RUN mkdir -p "$CATALINA_HOME"

ENV TOMCAT_MAJOR 7
ENV TOMCAT_VERSION 7.0.65
ENV TOMCAT_DIST_URL https://www.apache.org/dist/tomcat/tomcat-$TOMCAT_MAJOR/v$TOMCAT_VERSION/bin/apache-tomcat-$TOMCAT_VERSION.tar.gz

WORKDIR $CATALINA_HOME

RUN set -x \
  && curl -fSL "$TOMCAT_DIST_URL" -o apache-tomcat-$TOMCAT_VERSION.tar.gz \
  && curl -fSL "$TOMCAT_DIST_URL.md5" -o apache-tomcat-$TOMCAT_VERSION.tar.gz.md5 \
  && md5sum -c apache-tomcat-$TOMCAT_VERSION.tar.gz.md5 \
  && tar -xvf apache-tomcat-$TOMCAT_VERSION.tar.gz --strip-components=1 \
  && rm bin/*.bat \
  && rm -r webapps/docs/ \
  && rm -r webapps/examples/ \
  && rm apache-tomcat-$TOMCAT_VERSION.tar.gz*

EXPOSE 8080
CMD ["catalina.sh", "run"]
