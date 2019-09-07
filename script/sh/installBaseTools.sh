#!/bin/bash
#for circleCi

cd ~/repo/script/sh/

echo "===============================display current path and files==============================="
echo 'pwd'
pwd
echo 'ls -a all files'
ls -a


echo "============================ install base tools============================"
sudo apt-get install expect
sudo apt-get install vim
sudo apt-get install curl
sudo apt-get install tail

echo "============================run switchroot.sh============================="
sudo bash switchroot.sh


echo "============================run installSSH.sh============================="
sudo bash installSSH.sh



echo "============================run biz.sh============================="
bash biz.sh


# echo "============================run testEnv.sh============================="
# sudo ./testEnv.sh



