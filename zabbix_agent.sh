#!/bin/bash
sudo apt update && sudo apt -y upgrade
sudo apt install -y wget && sudo apt install -y nano
mkdir downloads
cd downloads
wget https://repo.zabbix.com/zabbix/5.4/ubuntu/pool/main/z/zabbix-release/zabbix-release_5.4-1+ubuntu20.04_all.deb
sudo dpkg -i zabbix-release_5.4-1+ubuntu20.04_all.deb
sudo apt update && sudo apt install -y zabbix-agent

#maybe with sudo
sed -i 's/Server=127.0.0.1/Server=YOUR_IP/' /etc/zabbix/zabbix_agentd.conf
sed -i 's/ServerActive=127.0.0.1/ServerActive=YOUR_IP/' /etc/zabbix/zabbix_agentd.conf

#or you can use sudo nano /etc/zabbix/zabbix_agentd.conf (edit Server line and ServerActive 
#and manually put there your ip instead of localhost into Server and ServerActive lines, 
#BUT add zabbix LOCAL server ip if both zabbix server and zabbix client are in the same VPC, for example in aws) 
sudo service zabbix-agent stop
sudo service zabbix-agent start
sudo service zabbix-agent status
