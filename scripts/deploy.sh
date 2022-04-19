#!/bin/bash
fqdn=$1
public_ip=$2
script="deploy.sh"
logfile="/var/log/jps-wazuh-install.log"
echo "[$script] Downloading latest build."  >> $logfile
git clone https://github.com/wazuh/wazuh-docker.git -b v4.2.6 --depth=1
cd wazuh-docker
echo "[$script] Deploying build"  >> $logfile
docker-compose up -d
echo "[$script] Docker deployment complete" >> $logfile
