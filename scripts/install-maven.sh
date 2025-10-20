#!/bin/bash
MAVEN_VERSION=3.9.11
cd /home/ubuntu
curl -sSLo maven.tar.gz https://dlcdn.apache.org/maven/maven-3/3.9.11/binaries/apache-maven-3.9.11-bin.tar.gz
tar -xzf maven.tar.gz 
mv apache-maven-3.9.11 maven
rm maven.tar.gz
