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

echo 'pwd'
pwd
ls -a



echo ======enable the proxy with port=9999=========
cd ../../
sudo nohup node pp.js >pp.log &

echo 'pwd'
pwd
ls -a

#go to bin folder
cd ~/repo/bin

#curl https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip
if [ ! -f "ngrok2" ];then
  echo "ngrok not exist" 
else
  #rm -rf ngrok
  echo "ngrok exist"
  
  sudo chmod 777 ngrok2
  echo "changed permission"
fi
# echo 'unzip ngrok'
# unzip ngrok-stable-linux-amd64.zip

echo 'pwd'
pwd
ls -a


echo 'set ngrok authtoken'
sudo ./ngrok2 authtoken 1QO6q3pZ9NXTB7iNqtoQ6opzih9_3QZHCsqjxDguoNjPb7dKJ
# echo "../config/ngrok.yml"
# cat ../config/ngrok.yml
sudo cp -rf ../config/ngrok.yml /root/.ngrok2/ngrok.yml


# echo "cat /root/.ngrok2/ngrok.yml"
# sudo cat /root/.ngrok2/ngrok.yml

echo 'pwd'
pwd
ls -a

#https://dashboard.ngrok.com/get-started
#nohup sudo  ./ngrok http 8080 >ngrok.log &
#sudo ./ngrok tcp 22
#sudo ./ngrok http 8080
sudo nohup ./ngrok2 start httpbin proxy ssh >ngrok.log &
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
