# Docker Oracle JDK Image

## What's in it
 * Base Image: `alpine:3.2` or `ubuntu:14.04.3` or `centos:7`
 * Installed Packages: `curl`, `oracle jdk/jre`

## How to use it
 * ```FROM orctom/java:centos-8u65```    (jdk, centos:centos7)
 * ```FROM orctom/java:ubuntu-8u65-jre```  (server jre, ubuntu:14.04.3)
 * ```FROM orctom/java:ubuntu-8u55```    (jdk, ubuntu:14.04.3)
 * ```FROM orctom/java:8u65-jre```      (server jre, alpine:3.2)
 * ```FROM orctom/java:8u55```        (jdk, alpine:3.2)
 * ```FROM orctom/java:8u51-jre```      (server jre, alpine:3.2)
 * ```FROM orctom/java:8u51```        (jdk, alpine:3.2)
 * ```FROM orctom/java:7u79-jre```      (server jre, alpine:3.2)
 * ```FROM orctom/java:7u79```        (jdk, alpine:3.2)
