# docker jenkins

## run jenkins

```
docker run -d \
	--name jenkins \
	-p 8080:8080 \
	-v /var/run/docker.sock:/var/run/docker.sock \
	-v $(which docker):$(which docker) \
	orctom/jenkins:2.9
```