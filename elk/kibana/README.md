# Kibana
## Run
```
docker run \
	-d \
	--name kibana \
	-p 5601:5601 \
	--link es:es \
	orctom/kibana:4.4.1
```
```
docker run \
	-d \
	--name kibana \
	-p 5601:5601 \
	-e ES_URL=http://172.17.0.1:9200 \
	orctom/kibana:4.4.1
```

## Use

### elasticsearch
http://localhost:5601

### head dashboard
http://localhost:9200/_plugin/head/

### kopf
http://localhost:9200/_plugin/kopf/

### HQ
http://localhost:9200/_plugin/hq/