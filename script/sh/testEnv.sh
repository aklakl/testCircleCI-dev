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

echo "checking for debian"
cat /etc/debian_version
cat /etc/os-release

echo ===============================check IP address==================================
echo "check current LAN IP"
ifconfig -a 

#check current public IP  CircleCI docker container 3.92.182.196,3.91.38.198,54.208.217.249,52.91.180.80,54.209.250.164,54.89.170.227
#all of the IP belong to Amazon compute
#check ip detail https://whatismyipaddress.com/ip/3.91.38.198
echo "checking public IP address"
curl 'https://api.ipify.org?format=json'
echo '/n'


echo "===============================display the space==============================="
df -h 

echo "===============================check System user==============================="
cat /etc/passwd | grep "/bin/bash" | grep -v "root" | cut -d ":" -f 1

# check the PID 
# ps -ef | grep "circleci-agent" | grep -v grep | awk '{print $2}'
# pgrep -f "circleci-agent"

# set circlecipid=$(ps -ef | grep "circleci-agent" | grep -v grep | awk '{print $2}')
# kill -9 $circlecipid
# #we can't kill the circleci-agent, will get error,follow this:
# CircleCI was unable to execute the job to completion, because the CircleCI agent received a kill signal midway through the job.
# This means that that either the agent got killed accidentally (through a killall command), or that the build container entrypoint (i.e. PID 1) allocated too much memory or terminated early.  Consider clearing entrypoint/command values and try again.


echo "===============================display current path and files==============================="
echo 'pwd'
pwd

echo 'ls -a all files'
ls -a
