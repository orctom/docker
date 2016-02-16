# Elasticsearch
## Run
```
docker run \
	-d \
	--name es \
	-p 9200:9200 \
	-p 9300:9300 \
	orctom/elasticsearch:2.2.0
```
```
docker run \
	-d \
	--name es \
	-p 9200:9200 \
	-p 9300:9300 \
	-e ES_MAX_MEM=2g \
	-e ES_CLUSTER_NAME=my_cluster \
	-e ES_NODE_NAME=my_cluster_node_01 \
	orctom/elasticsearch:2.2.0
```
```
docker run \
	-d \
	--name es \
	-p 9200:9200 \
	-p 9300:9300 \
	-v /usr/share/elasticsearch/data:/var/lib/elasticsearch/data \
	orctom/elasticsearch:2.2.0
```

## Use

### elasticsearch
```curl http://localhost:9200/```

### head dashboard
http://localhost:9200/_plugin/head/

### kopf
http://localhost:9200/_plugin/kopf/

### HQ
http://localhost:9200/_plugin/hq/