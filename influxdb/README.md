# influxdb

## Run
```
docker run \
  -d --name influxdb \
  -p 8083:8083 \
  -p 8086:8086 \
  -p 2003:2003 \
  -p 25826:25826 \
  -p 4242:4242 \
  orctom/influxdb
```

## Some URLs:
 * Admin console: http://localhost:8083/ (root/root)