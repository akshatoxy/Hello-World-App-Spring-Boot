#!/usr/bin/env bash

kill -9 $(cat /home/ec2-user/pid.file) || true

echo "Starting Spring Application..."
java -jar /home/ec2-user/spring-boot-hello-world-example-0.0.1-SNAPSHOT.jar --server.port=8080 > /home/ec2-user/helloworld.log &
ps aux | grep "8080$" | awk '{print $2}' > /home/ec2-user/pid.file