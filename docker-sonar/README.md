# Sonar (for OD only)

## Add dns mappings to hosts
```
echo "$docker_host_ip sonarci.io" | sudo tee -a /etc/hosts > /dev/null
echo "$docker_host_ip sonar.io" | sudo tee -a /etc/hosts > /dev/null
```

## Run the stack
```
sudo docker-compose up -d
```

## Enjoy
 * Open `sonarci.io` in your browser for the Jenkins that used for sonar jobs.
 * Open `sonar.io` in your borwser for SonarQube dashboard.
