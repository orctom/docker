# elasticsearch for EC2

## Config
### elasticsearch.yml
 * Add `cloud.aws.access_key` and `cloud.aws.access_key`.
 * Add `discovery.ec2.tag.elk_cluster: elk_log`.

### AWS Console
 * Make sure port `9300` is allowed in the security group.
 * Add tag such as `alk_cluster=elk_log` to EC2 instance.
