#!/bin/bash
set -eux
#cat /var/vcap/sys/run/trend-agent/pid | wc -l
input="/var/vcap/sys/run/trend-agent/pid"
while IFS= read -r line
do
  echo "$line"
  echo $line | xargs kill
done < "$input"
