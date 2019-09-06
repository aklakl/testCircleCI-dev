#!/bin/bash

echo =================================check environment===============================
env


echo =================================check System====================================
echo "cat /proc/version"
cat /proc/version

echo "uname -a"
uname -a

echo "uname -r"
uname -r

echo "cat /etc/issue"
cat /etc/issue

echo "cat /etc/lsb-release"
cat /etc/lsb-release


echo "lsb_release -a"
lsb_release -a

echo ===============================check IP address==================================
#check current LAN IP
ifconfig -a 

#check current public IP  CircleCI docker container 3.92.182.196,3.91.38.198,54.208.217.249,52.91.180.80,54.209.250.164,54.89.170.227
#all of the IP belong to Amazon compute
#check ip detail https://whatismyipaddress.com/ip/3.91.38.198
curl 'https://api.ipify.org?format=json'
echo '/n'


echo 'pwd'
pwd
