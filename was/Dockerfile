FROM orctom/java:centos-8u65

ADD ibm/agent.installer.linux.gtk.x86_64_1.8.2000.20150303_1526.zip /tmp/agent.installer.linux.gtk.x86_64_1.8.2000.20150303_1526.zip
ADD ibm/was.repo.8550.developers.ilan_part1.zip /tmp/was.repo.8550.developers.ilan_part1.zip
ADD ibm/was.repo.8550.developers.ilan_part2.zip /tmp/was.repo.8550.developers.ilan_part2.zip
ADD ibm/was.repo.8550.developers.ilan_part3.zip /tmp/was.repo.8550.developers.ilan_part3.zip
ADD ibm/was.repo.8550.java7_part1.zip /tmp/was.repo.8550.java7_part1.zip
ADD ibm/was.repo.8550.java7_part2.zip /tmp/was.repo.8550.java7_part2.zip
ADD ibm/was.repo.8550.java7_part3.zip /tmp/was.repo.8550.java7_part3.zip

# pre-installation
RUN \
  yum -y upgrade && yum -qy install unzip gtk2.i686 libXtst.i686 && yum clean all \
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
  && echo "Cleaning" \
  && rm /tmp/agent.installer.linux.gtk.x86_64_1.8.2000.20150303_1526.zip \
  && rm /tmp/was.repo.8550.developers.ilan_part1.zip \
  && rm /tmp/was.repo.8550.developers.ilan_part2.zip \
  && rm /tmp/was.repo.8550.developers.ilan_part3.zip \
  && rm /tmp/was.repo.8550.java7_part1.zip \
  && rm /tmp/was.repo.8550.java7_part2.zip \
  && rm /tmp/was.repo.8550.java7_part3.zip \
  && rm -rf /opt/softwares

EXPOSE 80 9080 9443 9060 9043 8879

ENTRYPOINT ["/opt/IBM/WebSphere/AppServer/profiles/AppSrv01/bin/startServer.sh", "server1"]