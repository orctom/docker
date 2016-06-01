docker run --name nexus \
    --restart on-failure:10 -d \
    -v /app/sonatype-work:/opt/sonatype-work \
    -p 80:8081 \
    orctom/nexus:2.12.1