#!/bin/bash

# Set current active JDK
jdk=$JAVA_HOME

# * REMEMBER to set this environment variable
repo_path=$JAVA_MULTI_MODULE_PATH

echo "Preparing $1 ..."
cd $repo_path
if ! [[ -f "$repo_path/$1/target/$1-1.0-SNAPSHOT.jar" ]]; then
  echo "Packaging $1 ..."
  mvn package -pl :$1 -am
  echo "Finished packaging $1"
fi

echo "Starting $1 ..."
cmd="$jdk/bin/java -ea -Dlogback.configurationFile=file://$repo_path/logback-dev.xml -Dic.configurationFile=$repo_path/configuration.properties:$repo_path/$1/configuration.properties -jar $repo_path/$1/target/$1-1.0-SNAPSHOT.jar"
tmux new-window -n "$1" "$cmd"
