#!/bin/bash


#go to nodejs folder
cd ~/repo/script/nodejs/

#start a http server
sudo node testHttpServer.js >http.log &
sleep 2

#make a http requst
curl http://127.0.0.1:8080?flag=testing
sleep 2

#verify the log
cat http.log

#curl https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip
if [ ! -f "ngrok" ];then
  echo "ngrok not exist" 
else
  rm -rf ngrok
fi
echo 'unzip ngrok'
unzip ngrok-stable-linux-amd64.zip

echo 'pwd'
pwd

echo 'ls all files'
ls -a

#go to bin folder
cd ~/repo/bin

echo 'set ngrok authtoken'
sudo ./ngrok authtoken 1QO6q3pZ9NXTB7iNqtoQ6opzih9_3QZHCsqjxDguoNjPb7dKJ
cp -rf ./config/ngrok.yml ~/.ngrok2/ngrok.yml

#cat ngrok.yml
#cat ~/.ngrok2/ngrok.yml

#https://dashboard.ngrok.com/get-started
#nohup sudo  ./ngrok http 8080 >ngrok.log &
#sudo ./ngrok tcp 22
#sudo ./ngrok http 8080
sudo nohup ./ngrok start httpbin proxy ssh >ngrok.log &
#sudo ./ngrok start httpbin proxy ssh   #terminal UI, but only present 10m0s #Too long with no output (exceeded 10m0s)


sleep 2

# echo 'waiting for showing ngrok.log '
# sleep 3

# #monitor the log
# cat ngrok.log


# echo 'waiting for showing the public url'
# sleep 3

#showing the public url
#curl http://127.0.0.1:4040

echo 'Done biz.sh'
