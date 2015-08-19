#! /bin/sh

plugins=$( cat $1 )
for plugin in $plugins; do
	curl -fL http://mirrors.jenkins-ci.org/plugins/${plugin}/latest/${plugin}.hpi -o $JENKINS_HOME/plugins/${plugin}.hpi
done

# cat $1 | sed '/^\s*$/d' | uniq | xargs -I {} -- curl -fL http://mirrors.jenkins-ci.org/plugins/{}/latest/{}.hpi -o $JENKINS_HOME/plugins/{}.hpi