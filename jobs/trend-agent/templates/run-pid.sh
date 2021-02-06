#!/bin/bash
touch /var/vcap/sys/log/trend-agent/start.log
chmod 777 /var/vcap/sys/log/trend-agent/start.log
cp /dev/null /var/vcap/sys/log/trend-agent/start.log
/var/vcap/jobs/trend-agent/bin/run.sh 2>&1 > /var/vcap/sys/log/trend-agent/start.log &
sleep 2
exit 0
#echo $! > /var/vcap/sys/run/trend-agent/pid
