#!/bin/bash
#vim:ft=bash

root=$JAVA_MODS_ROOT
log_file=test-output-$(date +%s).log
cd $root

if [ -z ${1} ]; then
  mvn test -T 2C -DskipTests=false \
    -Dic.configurationFile=$(pwd)/configuration.properties \
    -Dlogback.configurationFile=$(pwd)/logback-dev.xml \
    -Dgroups=small,medium | tee $log_file

  exit 0
fi

module_name=":$1"
if [ -z ${2} ]; then
  mvn test -T 2C -pl $module_name -DskipTests=false \
    -Dic.configurationFile=$(pwd)/configuration.properties \
    -Dlogback.configurationFile=$(pwd)/logback-dev.xml \
    -Dgroups=small,medium | tee $log_file

  exit 0
fi

test_name="com.instaclustr.$2"
mvn test -Dtest=$test_name -pl $module_name -DskipTests=false -Dgroups=small,medium

