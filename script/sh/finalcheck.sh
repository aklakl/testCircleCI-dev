#!/bin/bash
# for final checking the system


echo =================checking system process=================
ps -ef 

echo =========checking the network with port============
netstat -aptn 



# echo "pwd"
# pwd
# if [ -x "~/repo" ] || [ -x "/home/circleci/repo" ]  || [ -x "/home/root/repo"  ] ; 
# then
#    echo "found circleCi path"
#    cd ~/repo
# else
#    echo "not found circleCi path"	
# fi

# if [ -x "/repo" ]; 
# then
#    echo "found docker images path"
#    cd /repo/
# else
#    echo "not found docker images path"	
# fi

echo 'pwd'
pwd

echo 'ls -a all files'
ls -a

echo =========checking ngrok.log============
# tmpstr=`cat ngrok.log  | grep .ngrok.io`
# ls -a bin/
# echo "tmpstr=${tmpstr}"
bash ngrokCheck.sh


echo =========checking proxy.log============
ls -a ../../proxy/
#cat proxy/pp.log


