#!/bin/bash

echo 'pwd'
pwd

#check current LAN IP
ifconfig -a 

#check current public IP  CircleCI docker container 3.92.182.196,3.91.38.198 it belong to Amazon compute
#check ip detail https://whatismyipaddress.com/ip/3.91.38.198
curl 'https://api.ipify.org?format=json'
echo '/n'

#ipv6
#curl 'https://api6.ipify.org?format=json'

#start a http server
sudo node testHttpServer.js >http.log &
sleep 3

#make a http requst
curl http://127.0.0.1:8080?flag=testing
sleep 3

#verify the log
cat http.log




#curl https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip
echo 'unzip ngrok'
unzip ngrok-stable-linux-amd64.zip

echo 'pwd'
pwd

echo 'set ngrok authtoken'
sudo ./ngrok authtoken 1QO6q3pZ9NXTB7iNqtoQ6opzih9_3QZHCsqjxDguoNjPb7dKJ

#https://dashboard.ngrok.com/get-started
sudo nohup bash ngrok http 8080 >ngrok.log &

echo 'waiting for showing ngrok.log '
sleep 3

#monitor the log
cat ngrok.log


echo 'waiting for showing the public url'
sleep 3

#showing the public url
curl http://127.0.0.1:4040

echo 'Done testEnv.sh'
