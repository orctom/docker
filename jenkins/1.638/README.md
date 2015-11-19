# docker jenkins

## run jenkins

### built-in default configuration
```sudo docker run -d -p 8080:8080 orctom/jenkins```
```sudo docker run -it -p 8080:8080 orctom/jenkins -sh```

### customized settings.xml for Maven
```docker run -d -p 8080:8080 -v ~/.m2/settings.xml:/var/lib/jenkins/.m2/settings.xml orctom/jenkins```

## pre-installed plugins
Add the IDs of plugins into plugins.txt one per line.

## Maven
 * Replace .m2/settings.xml with your own settings.xml
 * Don't change repository location