FROM orctom/jenkins:1.625.2

# maven settings
USER jenkins
COPY .m2/ $JENKINS_HOME/.m2/
RUN chown -R jenkins:jenkins $JENKINS_HOME
