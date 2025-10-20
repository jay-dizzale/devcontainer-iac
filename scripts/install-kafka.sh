#!/bin/bash
cd /home/ubuntu/
curl -sSLo kafka.tgz https://dlcdn.apache.org/kafka/4.1.0/kafka_2.13-4.1.0.tgz
tar -xzf kafka.tgz 
mv kafka_2.13-4.1.0 kafka
rm kafka.tgz