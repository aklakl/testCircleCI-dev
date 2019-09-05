#!/bin/bash

echo 'pwd'
pwd

#check current LAN IP
ifconfig -a 

#check current public IP  CircleCI docker container 3.92.182.196 
curl 'https://api.ipify.org?format=json'
echo '/n'

#ipv6
#curl 'https://api6.ipify.org?format=json'

#sleep 5



#curl https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip
echo 'unzip ngrok'
unzip ngrok-stable-linux-amd64.zip

echo 'pwd'
pwd

echo 'set ngrok authtoken'

sudo ./ngrok authtoken 1QO6q3pZ9NXTB7iNqtoQ6opzih9_3QZHCsqjxDguoNjPb7dKJ



echo 'Done testEnv.sh'
