mkdir -p /var/log/ecs /etc/ecs /var/lib/ecs/data
touch /etc/ecs/ecs.config
docker run --name ecs-agent \
    --restart on-failure:10 -d \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v /var/log/ecs:/log \
    -v /var/lib/ecs/data:/data \
    -v /var/lib/docker:/var/lib/docker \
    -v /sys/fs/cgroup:/sys/fs/cgroup:ro \
    -v /var/run/docker/execdriver/native:/var/lib/docker/execdriver/native:ro \
    -p 127.0.0.1:51678:51678 \
    --env-file /etc/ecs/ecs.config \
    -e ECS_LOGFILE=/log/ecs-agent.log \
    -e ECS_DATADIR=/data/ \
    -e ECS_CLUSTER=Jenkins \
    amazon/amazon-ecs-agent