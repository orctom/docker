FROM orctom/java:8u65
MAINTAINER Hao Chen <orctom@gmail.com>

ENV SLAVE_VERSION 2.53.2
ENV MAVEN_VERSION 3.3.9
ENV GRADLE_VERSION 2.9

ENV MAVEN_HOME /usr/share/maven
ENV GRADLE_HOME /usr/share/gradle

COPY jenkins-slave /usr/local/bin/jenkins-slave

RUN \
  apk add --update git openssh && rm -rf /var/cache/apk/* \
  && mkdir -p /usr/share/maven/ \
  && curl -fL http://www.us.apache.org/dist/maven/maven-3/${MAVEN_VERSION}/binaries/apache-maven-${MAVEN_VERSION}-bin.tar.gz -o /tmp/apache-maven-bin.tar.gz \
  && tar -xf /tmp/apache-maven-bin.tar.gz -C $MAVEN_HOME --strip-components=1 \
  && ln -s $MAVEN_HOME/bin/mvn /usr/bin/mvn \
  && rm /tmp/apache-maven-bin.tar.gz \
  && curl -fL https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip -o /tmp/gradle-${GRADLE_VERSION}-bin.zip \
  && unzip /tmp/gradle-${GRADLE_VERSION}-bin.zip -d /tmp/ \
  && mv /tmp/gradle-${GRADLE_VERSION} ${GRADLE_HOME} \
  && ln -s $GRADLE_HOME/bin/gradle /usr/bin/gradle \
  && mkdir -p /usr/share/jenkins/ \
  && curl -fL http://repo.jenkins-ci.org/public/org/jenkins-ci/main/remoting/${SLAVE_VERSION}/remoting-${SLAVE_VERSION}.jar -o /usr/share/jenkins/slave.jar

COPY .ssh/ /root/.ssh/

ENTRYPOINT ["jenkins-slave"]