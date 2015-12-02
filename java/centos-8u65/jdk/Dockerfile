FROM centos:7
MAINTAINER Hao Chen <orctom@gmail.com>

ENV JAVA_VERSION_MAJOR 8
ENV JAVA_VERSION_MINOR 65
ENV JAVA_VERSION_BUILD 17
ENV PACKAGE_TYPE jdk

ENV JAVA_HOME /usr/java/jdk1.${JAVA_VERSION_MAJOR}.0_${JAVA_VERSION_MINOR}/

RUN \
  mkdir -p $JAVA_HOME \
  && curl -jkLH  "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/${JAVA_VERSION_MAJOR}u${JAVA_VERSION_MINOR}-b${JAVA_VERSION_BUILD}/${PACKAGE_TYPE}-${JAVA_VERSION_MAJOR}u${JAVA_VERSION_MINOR}-linux-x64.rpm -o /tmp/${PACKAGE_TYPE}-${JAVA_VERSION_MAJOR}u${JAVA_VERSION_MINOR}-linux-x64.rpm \
  && rpm -i /tmp/${PACKAGE_TYPE}-${JAVA_VERSION_MAJOR}u${JAVA_VERSION_MINOR}-linux-x64.rpm \
  && rm /tmp/${PACKAGE_TYPE}-${JAVA_VERSION_MAJOR}u${JAVA_VERSION_MINOR}-linux-x64.rpm \
  && rm -rf $JAVA_HOME/*src.zip \
            $JAVA_HOME/lib/missioncontrol \
            $JAVA_HOME/lib/visualvm \
            $JAVA_HOME/lib/*javafx* \
            $JAVA_HOME/jre/lib/ext/jfxrt.jar \
            $JAVA_HOME/jre/bin/javaws \
            $JAVA_HOME/jre/lib/javaws.jar \
            $JAVA_HOME/jre/lib/desktop \
            $JAVA_HOME/jre/lib/*javafx* \
            $JAVA_HOME/jre/lib/*jfx*

ENV PATH $PATH:$JAVA_HOME/bin