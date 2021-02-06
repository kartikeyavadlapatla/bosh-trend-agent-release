#!/bin/bash
set -eux
ACTIVATIONURL=''
MANAGERURL=''
CURLOPTIONS='--silent --tlsv1.2'
linuxPlatform='';
isRPM='';

#if [[ $(/usr/bin/id -u) -ne 0 ]]; then
#    echo You are not running as the root user.  Please try again with root privileges.;
#    logger -t You are not running as the root user.  Please try again with root privileges.;
#    exit 1;
#fi;

if ! type curl >/dev/null 2>&1; then
    echo "Please install CURL before running this script."
    logger -t Please install CURL before running this script
    exit 1
fi

sudo curl $MANAGERURL/software/deploymentscript/platform/linuxdetectscriptv1/ -o /tmp/PlatformDetection $CURLOPTIONS --insecure

if [ -s /tmp/PlatformDetection ]; then
    . /tmp/PlatformDetection
else
    echo "Failed to download the agent installation support script."
    logger -t Failed to download the Deep Security Agent installation support script
    exit 1
fi

platform_detect
if [[ -z "${linuxPlatform}" ]] || [[ -z "${isRPM}" ]]; then
    echo Unsupported platform is detected
    logger -t Unsupported platform is detected
    exit 1
fi

echo Downloading agent package...
if [[ $isRPM == 1 ]]; then package='agent.rpm'
    else package='agent.deb'
fi
sudo curl -H "Agent-Version-Control: on" $MANAGERURL/software/agent/${runningPlatform}${majorVersion}/${archType}/$package?tenantID=237 -o /tmp/$package $CURLOPTIONS --insecure

echo Installing agent package...
rc=1
if [[ $isRPM == 1 && -s /tmp/agent.rpm ]]; then
    rpm -ihv /tmp/agent.rpm
    rc=$?
elif [[ -s /tmp/agent.deb ]]; then
    sudo dpkg -i /tmp/agent.deb
    rc=$?
else
    echo Failed to download the agent package. Please make sure the package is imported in the Deep Security Manager
    logger -t Failed to download the agent package. Please make sure the package is imported in the Deep Security Manager
    exit 1
fi
if [[ ${rc} != 0 ]]; then
    echo Failed to install the agent package
    logger -t Failed to install the agent package
    exit 1
fi

echo Install the agent package successfully

sleep 15
sudo /opt/ds_agent/dsa_control -r
sudo /opt/ds_agent/dsa_control -a $ACTIVATIONURL "tenantID:<>" "token:<>" 2>&1 >> /var/vcap/sys/log/trend-agent/log
sleep 3
ps -ef | awk '/ds/{print $2}' > /var/vcap/sys/run/trend-agent/pid
