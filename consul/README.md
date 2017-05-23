## Consul

### Run
#### 1st node
```
docker run --name node1 -d -P orctom/consul
```

#### 2nd node
```
docker run --name node2 -d -P orctom/consul -join 172.17.0.2
```

#### 3rd node
```
docker run --name node3 -d -P orctom/consul -join 172.17.0.2
```

#### shell
```
docker run --rm -it orctom/consul sh
```

### Hard-coded Args
```
-server \
-ui \
-bootstrap-expect=3 \
-data-dir=/usr/local/consul \
-disable-host-node-id \
-bind=${client_ip} \
-client=${client_ip} \
```

where
```
client_ip=`ifconfig -a|awk '/(cast)/ {print $2}'|cut -d':' -f2|head -1`
```
