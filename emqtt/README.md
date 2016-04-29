# emqtt

## Run
```
docker run \
  -d --name mqtt \
  -p 18083:18083 \
  -p 1883:1883 \
  -p 8883:8883 \
  -p 8083:8083 \
  orctom/emqtt
```

```
docker run \
  -d --name master \
  -e NODE_IP=<NODE_IP> \
  -p 18083:18083 \
  -p 1883:1883 \
  -p 8883:8883 \
  -p 8083:8083 \
  orctom/emqtt
```

```
docker run \
  -d --name node \
  -e NODE_IP=<NODE_IP> \
  -e MASTER=<MASTER_NODE_IP> \
  -p 18083:18083 \
  -p 1883:1883 \
  -p 8883:8883 \
  -p 8083:8083 \
  orctom/emqtt
```

## Some URLs:
 * Status: http://localhost:8083/status
 * Web dashboard: http://localhost:18083