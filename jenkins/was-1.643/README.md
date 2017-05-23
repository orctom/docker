# docker jenkins

Image chain:
centos:7 <- orcotm/was:8.5.5 <- this

This image is based on orcotm/was:8.5.5, which has a WebSphere 8.5.5 full profile and IBM JDK 7 installed.
So that you can:
 * Build projects that require IBM JDK 7.
 * Utilize `wsadmin.sh` to do remote deployment.
 * Added

Run (from Ubuntu host):
```
docker run -d \
  --name jenkins \
  -p 8080:8080 \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v $(which docker):$(which docker) \
  orctom/jenkins:was-1.643
```
