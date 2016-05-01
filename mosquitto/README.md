# emqtt

## Run
```
docker run \
  -d --name mosquitto \
  -p 1883:1883 \
  -p 9883:9883 \
  orctom/mosquitto:1.4.8
```

```
docker run \
  -it --name mosquitto \
  -p 1883:1883 \
  -p 9883:9883 \
  orctom/mosquitto:1.4.8 sh
```

```
docker run \
  -d --name mosquitto \
  -v /app/mosquitto/etc/mosquitto:/etc/mosquitto \
  -v /app/mosquitto/etc/mosquitto.d:/etc/mosquitto.d \
  -v /app/mosquitto/var/lib/mosquitto:/var/lib/mosquitto
  -v /app/mosquitto/auth-plug.conf:/etc/mosquitto.d/auth-plugin.conf
  -p 1883:1883 \
  -p 9883:9883 \
  orctom/mosquitto:1.4.8
```

Generate password
```
docker run \
  -it --rm \
  -p 1883:1883 \
  -p 9883:9883 \
  orctom/mosquitto:1.4.8 \
  np -p secretpass
```