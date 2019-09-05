#!/bin/bash
# for final checking the system


echo =================checking system process=================
ps -ef 

echo =========checking the network with port============
netstat -aptn 

echo =========checking ngrok.log============
cat ngrok.log
