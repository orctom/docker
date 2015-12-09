# install docker
```
wget -qO- https://get.docker.com/ | sh
```

# install compose
```
curl -L https://bootstrap.pypa.io/get-pip.py | sudo python
```
```
sudo pip install -U docker-compose
```

# shipyard
http://shipyard-project.com/
```
docker run -d --rm -v /var/run/docker.sock:/var/run/docker.sock shipyard/deploy start
```

# dockerui
https://github.com/crosbymichael/dockerui
```
docker run -d -p 9000:9000 --privileged -v /var/run/docker.sock:/var/run/docker.sock dockerui/dockerui
```

# registry
```
docker run -d -p 5000:5000 registry
```

```
docker run \
	--restart on-failure:10 -d \
    -e SETTINGS_FLAVOR=s3 \
    -e AWS_BUCKET=docker-registry \
    -e STORAGE_PATH=/registry \
    -e AWS_KEY=the_key \
    -e AWS_SECRET=the_secret \
    -e SEARCH_BACKEND=sqlalchemy \
    -p 80:5000 \
    --name docker-registry \
    registry:2
```