#!/bin/bash

pwd

#check current LAN IP
ifconfig -a 

#check current public IP
curl 'https://api.ipify.org?format=json'

#ipv6
#curl 'https://api6.ipify.org?format=json'

#sleep 5


curl https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip

unzip ngrok-stable-linux-amd64.zip

pwd

sudo ./ngrok authtoken 1QO6q3pZ9NXTB7iNqtoQ6opzih9_3QZHCsqjxDguoNjPb7dKJ
