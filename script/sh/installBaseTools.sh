#!/bin/bash
#for circleCi

cd ~/repo/script/sh/

echo "===============================display current path and files==============================="
echo 'pwd'
pwd
echo 'ls -a all files'
ls -a




echo "============================run switchroot.sh============================="
sudo ./switchroot.sh

sudo apt-get install expect
sudo apt-get install vim
sudo apt-get install curl
sudo apt-get install tail


echo "============================run installSSH.sh============================="
sudo ./installSSH.sh





# echo "============================run testEnv.sh============================="
# sudo ./testEnv.sh
