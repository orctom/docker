FROM orctom/java:centos-8u65

# pre-installation
RUN \
  yum -y upgrade && yum -y install unzip && yum clean all \
  && curl http://10.164.39.34:8000/agent.installer.linux.gtk.x86_64_1.8.2000.20150303_1526.zip -o /tmp/agent.installer.linux.gtk.x86_64_1.8.2000.20150303_1526.zip \
  && curl http://10.164.39.34:8000/was.repo.8550.developers.ilan_part1.zip -o /tmp/was.repo.8550.developers.ilan_part1.zip \
  && curl http://10.164.39.34:8000/was.repo.8550.developers.ilan_part2.zip -o /tmp/was.repo.8550.developers.ilan_part2.zip \
  && curl http://10.164.39.34:8000/was.repo.8550.developers.ilan_part3.zip -o /tmp/was.repo.8550.developers.ilan_part3.zip \
  && curl http://10.164.39.34:8000/was.repo.8550.java7_part1.zip -o /tmp/was.repo.8550.java7_part1.zip \
  && curl http://10.164.39.34:8000/was.repo.8550.java7_part2.zip -o /tmp/was.repo.8550.java7_part2.zip \
  && curl http://10.164.39.34:8000/was.repo.8550.java7_part3.zip -o /tmp/was.repo.8550.java7_part3.zip \
  && mkdir /opt/softwares \
  && mkdir /opt/softwares/ibm \
  && mkdir /opt/softwares/ibm/imgr \
  && mkdir /opt/softwares/ibm/was \
  && mkdir /opt/softwares/ibm/jdk \
  && unzip /tmp/agent.installer.linux.gtk.x86_64_1.8.2000.20150303_1526.zip -d /opt/softwares/ibm/imgr \
  && unzip /tmp/was.repo.8550.developers.ilan_part1.zip -d /opt/softwares/ibm/was \
  && unzip /tmp/was.repo.8550.developers.ilan_part2.zip -d /opt/softwares/ibm/was \
  && unzip /tmp/was.repo.8550.developers.ilan_part3.zip -d /opt/softwares/ibm/was \
  && unzip /tmp/was.repo.8550.java7_part1.zip -d /opt/softwares/ibm/jdk \
  && unzip /tmp/was.repo.8550.java7_part2.zip -d /opt/softwares/ibm/jdk \
  && unzip /tmp/was.repo.8550.java7_part3.zip -d /opt/softwares/ibm/jdk \
  && echo "installing IBM installation manager" \
  && /opt/softwares/ibm/imgr/installc -acceptLicense -accessRights admin -showProgress -silent \
  && echo "installing IBM WebSphere" \
  && /opt/IBM/InstallationManager/eclipse/tools/imcl -acceptLicense -showProgress install com.ibm.websphere.DEVELOPERSILAN.v85_8.5.5000.20130514_1044 -repositories /opt/softwares/ibm/was/repository.config \
  && echo "installing IBM JDK 7" \
  && /opt/IBM/InstallationManager/eclipse/tools/imcl -acceptLicense -showProgress install com.ibm.websphere.IBMJAVA.v70_7.0.4001.20130510_2103 -repositories /opt/softwares/ibm/jdk/repository.config -installationDirectory /opt/IBM/WebSphere/AppServer/ \
  && echo "Creating default profile" \
  && /opt/IBM/WebSphere/AppServer/bin/manageprofiles.sh -create -templatePath /opt/IBM/WebSphere/AppServer/profileTemplates/default/ \
  && echo "Change default JDK to 7" \
  && /opt/IBM/WebSphere/AppServer/bin/managesdk.sh -enableProfileAll -sdkname 1.7_64 -enableServers \
  && echo "Cleaning" \
  && rm -rf /tmp/* \
  && rm -rf /opt/softwares

ENV WAS_HOME /opt/IBM/WebSphere/AppServer

EXPOSE 2809 9080 9443 9060 9043 8880

ADD startWAS.sh /opt/startWAS.sh

ENTRYPOINT ["/opt/startWAS.sh"]
