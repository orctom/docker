FROM orctom/java:8u51

ENV JENKINS_HOME /var/lib/jenkins
ENV MAVEN_HOME /usr/share/maven

RUN \
	apk add --update git openssh && rm -rf /var/cache/apk/* \
	&& adduser -h "$JENKINS_HOME" -D -u 1000 -s /bin/sh jenkins \
	&& mkdir -p $JENKINS_HOME \
	&& mkdir -p /usr/share/maven/ \
	&& curl -fL http://www.us.apache.org/dist/maven/maven-3/3.3.3/binaries/apache-maven-3.3.3-bin.tar.gz -o /tmp/apache-maven-bin.tar.gz \
	&& tar -xf /tmp/apache-maven-bin.tar.gz -C $MAVEN_HOME --strip-components=1 \
	&& ln -s $MAVEN_HOME/bin/mvn /usr/bin/mvn \
	&& rm /tmp/apache-maven-bin.tar.gz \
	&& mkdir -p /usr/share/jenkins/ \
	&& curl -fL http://mirrors.jenkins-ci.org/war-stable/1.609.2/jenkins.war -o /usr/share/jenkins/jenkins.war

# install plugins
COPY plugins.sh /usr/share/jenkins/plugins.sh
COPY plugins.txt /usr/share/jenkins/plugins.txt
RUN \
	chmod +x /usr/share/jenkins/plugins.sh; sync \
	&& mkdir -p $JENKINS_HOME/plugins \
	&& /usr/share/jenkins/plugins.sh /usr/share/jenkins/plugins.txt \
	&& chown -R jenkins:jenkins $JENKINS_HOME

# slave
COPY init.groovy $JENKINS_HOME/init.groovy.d/tcp-slave-agent-port.groovy

# jenkins configuration
COPY config $JENKINS_HOME/

# prepare for ssh key generation
COPY .ssh/ /etc/.ssh/

# volume
VOLUME ["$JENKINS_HOME"]

# for main web interface:
EXPOSE 8080

# will be used by attached slave agents:
EXPOSE 52000

USER jenkins

COPY bootstrap.sh /etc/bootstrap.sh

ENTRYPOINT ["/etc/bootstrap.sh"]
CMD ["-d"]
