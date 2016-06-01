# logcenter

## Overview

```
 +-----------------------+
 |      app server       |
 |       +---------------+
 |       | log forwarder |----------+
 +-------+---------------+          |     logstash
                                    v      +----+ 
                                 +----+    |{io}|    +---------------+
                                 | MQ |--> |    | -->| Elasticsearch |
                      logstash   +----+    |    |    +---------------+
                       +----+       ^      +----+            |
 +--------------+      |{io}|       |     (indexer)          v
 |  app server  |----> |    | ------+                +---------------+
 +--------------+      |    |                        |    Kibana     |
                       +----+                        +---------------+
                      (puller)
```

## Setup

### Compose
```
docker-compose up -d
```

### One-by-One

#### MQ
```
docker run -d \
	--name mq \
	-p 15672:15672 \
	-e RABBITMQ_DEFAULT_USER=mq \
	-e RABBITMQ_DEFAULT_PASS=mq \
	rabbitmq:3.6.0-management
```

#### Puller
```
docker run -d \
	--name logpuller \
	--link mq:mq \
	logcenter_logpuller
```

#### Elasticsearch
```
docker run -d \
	--name es \
	-p 9200:9200 \
	-p 9300:9300 \
	-e ES_MAX_MEM=2g \
	-e ES_CLUSTER_NAME=logcenter \
	-v /usr/share/elasticsearch/data:/var/lib/elasticsearch/data \
	orctom/elasticsearch:2.1.1
```

#### mq
```
docker run -d \
  --name mq \
  -p 5672:5672 \
  -p 15672:15672 \
  -e RABBITMQ_DEFAULT_USER=mq \
  -e RABBITMQ_DEFAULT_PASS=mq \
  rabbitmq:3.6.0-management
```

#### Indexer
```
docker run -d \
	--name indexer \
	--link es:es \
	--link mq:mq \
  -e WORKER_NO=4 \
	logcenter_indexer
```

### debug

#### logpuller
```
docker run -it --rm --link logcenter_mq_1:mq logcenter_log logstash -e '
  input {
    rabbitmq {
      host => "mq"
      exchange => "was"
      queue => "tailer"
      durable => true
      user => "mq"
      password => "mq"
    }
  } 
  output { 
    stdout {
      codec => rubydebug
    } 
  }
  '
```

#### indexer
```
docker run -it --rm --link logcenter_mq_1:mq logstash logstash -e '
  input {
    rabbitmq {
      host => "mq"
      exchange => "was"
      queue => "tailer"
      durable => true
      user => "mq"
      password => "mq"
    }
  } 
  output { 
    stdout {
    	codec => rubydebug
    } 
  }
  '
```

```
docker run -d \
  --link logcenter_mq_1:mq \
  --link logcenter_es_1:es \
  logcenter_indexer
```