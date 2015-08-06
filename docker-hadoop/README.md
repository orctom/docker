# Docker Hadoop Image

## What's in it
 * Base Image: `orctom/java:8u51-jre`
 * Installed Packages: `hadoop`
 * Image Size: 300+ MB

## How to use it

### Init
```
sudo docker-compose run namenode hdfs namenode -format
```

### Start the cluster
```
sudo docker-compose up -d
```

