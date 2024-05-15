#!/bin/bash

# Set current active JDK
jdk=$JAVA_HOME

# * REMEMBER to set this environment variable
repo_path=$JAVA_MULTI_MODULE_PATH

# Get args
module=$1

echo "Preparing $module ..."
cd $repo_path
if ! [[ -f "$repo_path/$module/target/$module-1.0-SNAPSHOT.jar" ]]; then
  echo "Packaging $module ..."
  mvn package -pl :$module -am
  echo "Finished packaging $module"
fi

echo "Starting $module ..."
cmd="$jdk/bin/java -ea -Dlogback.configurationFile=file://$repo_path/logback-dev.xml -Dic.configurationFile=$repo_path/configuration.properties:$repo_path/$module/configuration.properties -jar $repo_path/$module/target/$module-1.0-SNAPSHOT.jar"
tmux new-window -n "$module" "$cmd"
