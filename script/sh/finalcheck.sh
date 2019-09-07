#!/bin/bash
# for final checking the system


echo =================checking system process=================
ps -ef 

echo =========checking the network with port============
netstat -aptn 



echo "pwd"
pwd

cd ~/repo

echo 'pwd'
pwd

echo 'ls -a all files'
ls -a

echo =========checking ngrok.log============
cat bin/ngrok.log

echo =========checking proxy.log============
ls -a ~/repo/proxy/
cat proxy/pp.log
