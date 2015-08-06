# ambassador
## Sample Usage
1. Starts Redis (Host A)
 * ```sudo docker run -d --name redis1 redis```
2. Starts Ambassador (Host A)
 * ```sudo docker run -d --link redis1:redis --name ambassador -p 6379:6379 orctom/ambassador```
3. Starts Ambassador (Host B)
 * ```sudo docker run -d --name redis_ambassador --expose 6379 -e REDIS_PORT_6379_TCP=tcp://host-a:6379 orctom/ambassador```
4. Start Comsumer (Host B)
 * ```sudo docker run --rm -it --link redis_ambassador:redis relateiq/redis-cli```
