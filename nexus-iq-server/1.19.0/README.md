## nexus-iq-server

### Run
```
docker run \
  -d \
  -p 8080:8070 \
  -p 8071:8071 \
  orctom/nexus-iq-server:1.19.0
```

### Compose
```
iq:
  image: orctom/nexus-iq-server:1.19.0
  ports;
    - 8070:8070
    - 8071:8071
```