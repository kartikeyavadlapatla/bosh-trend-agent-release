#!/bin/bash
touch ds_kill ds_agent_kill
sudo systemctl stop ds_agent || true
sudo dpkg -r ds-agent || true

ps -ef | grep /var/vcap/jobs/trend-agent/bin/run.sh | awk '{print $2}' > run_kill || true
while IFS= read -r line
do
  echo "$line"
  echo $line | xargs kill
done < run_kill || true

input="/var/vcap/sys/run/trend-agent/pid" || true
while IFS= read -r line
do
  echo "$line"
  echo $line | xargs kill
done < "$input" || true
#sudo cp /dev/null /var/vcap/sys/run/trend-agent/pid

ps -ef | grep /var/opt/ds_agent | awk '{print $2}' > run_kill || true
while IFS= read -r line
do
  echo "$line"
  echo $line | xargs kill
done < ds_agent_kill || true

ps -ef | grep ds | awk '{print $2}' > run_kill || true
while IFS= read -r line
do
  echo "$line"
  echo $line | xargs kill
done < ds_kill || true
sleep 10
exit 0
