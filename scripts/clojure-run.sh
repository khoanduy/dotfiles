#!/bin/bash

# Set current active JDK
jdk=$JAVA_HOME

# * REMEMBER to set this environment variable
repo_path=$CLOJURE_MULTI_MODULE_PATH

# Get args
module=$1
pivot_path="${2:=""}"  # must include / in the path if specified

echo "Preparing $module ..."
cd $repo_path
if ! [[ -f "$repo_path/$pivot_path$module/target/$module-1.0-SNAPSHOT.jar" ]]; then
  echo "Packaging $module ..."
  mvn package -pl :$module -am
  echo "Finished packaging $module"
fi

prop_file=""
if [[ -f "$repo_path/$pivot_path$module/configuration.properties" ]]; then
  prop_file="$pivot_path$module/configuration.properties"
elif [[ -f "$repo_path/$pivot_path$module/configuration.properties.edn" ]]; then
  prop_file="$pivot_path$module/configuration.properties.edn"
elif [[ -f "$repo_path/$pivot_path$module/configuration.properties" ]]; then
  prop_file="$pivot_path$module/configuration.properties"
elif [[ -f "$repo_path/$pivot_path$module/configuration.properties.edn" ]]; then
  prop_file="$pivot_path$module/configuration.properties.edn"
fi

echo "Starting $1 ..."
cmd="$jdk/bin/java -ea -Dlogback.configurationFile=file://$repo_path/logback-dev.xml -Dic.configurationFile=$prop_file -jar $pivot_path$module/target/$module-1.0-SNAPSHOT.jar"
tmux new-window -n "$module" "$cmd"
