#!/bin/bash

# this script is only really useful for centos installed on virtual machine, 
# and if the option to automatically connect to wifi wasn't selected.


# sets variable based on network interface
IP_ADDR=$(ip addr | grep -E "BROADCAST," | cut -c 4-9)

# edits network interface script, enables network on next boot
sed -i -e 's/ONBOOT=no/ONBOOT=yes/' /etc/sysconfig/network-scripts/ifcfg-$(echo $IP_ADDR)

# enables network interface for current login
ifup $IP_ADDR

# updates yum, installs a couple of applications
yum update && yum install nmap vim git -y
