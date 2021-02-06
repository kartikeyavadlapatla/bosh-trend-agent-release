#!/bin/bash
touch /var/vcap/sys/log/trend-agent/stop.log
chmod 777 /var/vcap/sys/log/trend-agent/stop.log
cp /dev/null /var/vcap/sys/log/trend-agent/stop.log
/var/vcap/jobs/trend-agent/bin/stop.sh 2>&1 > /var/vcap/sys/log/trend-agent/stop.log &
sleep 2
exit 0
