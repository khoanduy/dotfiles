#!/bin/bash

# * REMEMBER to set this environment variable
repo_path=$JAVA_MULTI_MODULE_PATH

cd $repo_path
mvn -N flyway:migrate
mvn clean org.apache.thrift.tools:maven-thrift-plugin:0.1.11:compile compile
mvn clean install -T 5
# mvn install -T 5
