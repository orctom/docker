## Usage

```
docker run -it orctom/logstash:2.2.1 bash
```

```
docker run -it orctom/logstash:2.2.1 -e 'input { stdin { } } output { stdout { } }'
```

```
docker run -d -v "$PWD/logstash.conf":/etc/logstash.conf orctom/logstash:2.2.1
```

```
docker run -d -v "$PWD/logstash.conf":/etc/logstash.conf -e WORKER_NO=4 orctom/logstash:2.2.1
```