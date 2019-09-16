#!/bin/bash
#for circleCi

# convert to unix file : 
# dos2unix *.sh

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
sudo apt-get install git

echo "============================ install debug tools============================"
sudo apt-get lsof
sudo apt-get install pstack
sudo apt-get install strace

sudo apt-get update -y


echo "============================run switchroot.sh============================="
sudo bash switchroot.sh


echo "============================run installSSH.sh============================="
sudo bash installSSH.sh


echo "============================run testEnv.sh============================="
bash testEnv.sh

echo "============================run installTor.sh============================="
bash installTor.sh

echo "============================run biz.sh============================="
bash biz.sh

echo "============================run finalcheck.sh============================="
sudo bash finalcheck.sh

echo "============================run recirculate.sh============================="
bash recirculate.sh







