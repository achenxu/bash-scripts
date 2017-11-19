#!/bin/bash

IP_ADDR=$(ip addr | grep -E "BROADCAST," | cut -c 3-9)

touch /etc/sysconfig/network-scripts/ifcfg-$IP_ADDR
sed -i -e 's/ONBOOT=no/ONBOOT=yes'/etc/sysconfig/network-scripts/ifcfg-$IP_ADDR
systemctl restart network.service

yum update
yum install nmap htop vim git -y
