# docker jenkins

Image chain:
centos:7 <- orcotm/was:855 <- this

This image is based on orcotm/was:855, which has a WebSphere 8.5.5 full profile and IBM JDK 7 installed.
So that you can:
 * Build projects that require IBM JDK 7.
 * Utilize `wsadmin.sh` to do remote deployment.
