FROM orctom/java:ubuntu-8u65

ENV MAVEN_VERSION 3.3.9
ENV JENKINS_VERSION 1.638

ENV JENKINS_HOME /var/lib/jenkins
ENV MAVEN_HOME /usr/share/maven

RUN \
	apt-get update && apt-get install -y git ssh && rm -rf /var/lib/apt/lists/* \
	&& useradd -d "$JENKINS_HOME" -u 1000 -m -s /bin/bash jenkins \
	&& mkdir -p $JENKINS_HOME \
	&& mkdir -p /usr/share/maven/ \
	&& curl -fL http://www.us.apache.org/dist/maven/maven-3/${MAVEN_VERSION}/binaries/apache-maven-${MAVEN_VERSION}-bin.tar.gz -o /tmp/apache-maven-bin.tar.gz \
	&& tar -xf /tmp/apache-maven-bin.tar.gz -C $MAVEN_HOME --strip-components=1 \
	&& ln -s $MAVEN_HOME/bin/mvn /usr/bin/mvn \
	&& rm /tmp/apache-maven-bin.tar.gz \
	&& mkdir -p /usr/share/jenkins/ \
	&& curl -fL http://mirrors.jenkins-ci.org/war/${JENKINS_VERSION}/jenkins.war -o /usr/share/jenkins/jenkins.war

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

# volume
VOLUME ["$JENKINS_HOME"]

# for main web interface:
EXPOSE 8080

# will be used by attached slave agents:
EXPOSE 52000

USER jenkins

# jenkins configuration
COPY config $JENKINS_HOME/
COPY email-templates $JENKINS_HOME/email-templates/

# prepare for ssh key generation
COPY .ssh/ /etc/.ssh/

COPY bootstrap.sh /etc/bootstrap.sh

ENTRYPOINT ["/etc/bootstrap.sh"]
CMD ["-d"]
