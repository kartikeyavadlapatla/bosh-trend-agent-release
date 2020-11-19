#!/bin/bash
touch /var/vcap/sys/log/trend-agent/log
/var/vcap/jobs/trend-agent/bin/run.sh 2>&1 >> /var/vcap/sys/log/trend-agent/log &
#echo $! > /var/vcap/sys/run/trend-agent/pid

