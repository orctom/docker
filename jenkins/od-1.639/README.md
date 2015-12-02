# docker jenkins

## run jenkins

### built-in default configuration
```sudo docker run -d -p 8080:8080 orctom/jenkins:ubuntu-1.638```

### customized settings.xml for Maven
```docker run -d -p 8080:8080 -v ~/.m2/settings.xml:/var/lib/jenkins/.m2/settings.xml orctom/jenkins```

## pre-installed plugins
Add the IDs of plugins into plugins.txt one per line.

