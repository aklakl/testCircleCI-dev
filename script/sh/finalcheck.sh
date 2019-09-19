#!/bin/bash
# for final checking the system


echo =================checking system process=================
ps -ef 

echo =========checking the network with port============
netstat -aptn 



echo "pwd"
pwd


if [ -x "~/repo/" ]; then
	echo "circleCi path"
  	cd ~/repo/
fi
if [ -x "/repo" ]; then
	echo "docker images path"
  	cd /repo/
fi

echo 'pwd'
pwd

echo 'ls -a all files'
ls -a

echo =========checking ngrok.log============
cat bin/ngrok.log
ls -a bin/

echo =========checking proxy.log============
ls -a proxy/
#cat proxy/pp.log


