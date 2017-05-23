#!/bin/sh

set -e

# generate ssh key if not exist
/etc/.ssh/gen_ssh_key.sh

if [ "$1" = "-d" ]; then
  java -jar /usr/share/jenkins/jenkins.war
fi

if [ "$1" = "-sh" ] || [ "$1" = "sh" ]; then
  java -jar /usr/share/jenkins/jenkins.war &
  /bin/sh
fi

if [ "$1" = "-bash" ] || [ "$1" = "bash" ]; then
  java -jar /usr/share/jenkins/jenkins.war &
  /bin/bash
fi