#!/bin/bash
#for circleCi

# convert to unix file : 
# dos2unix *.sh


pwd
if [ -x "~/repo/script/sh" ] || [ -x "/home/circleci/repo/script/sh" ]  || [ -x "/home/root/repo/script/sh"  ] ; 
then
   echo "circleCi path"
   cd ~/repo/script/sh/
else
   echo "not found circleCi path"	
fi

if [ -x "/repo/script/sh" ]; 
then
   echo "docker images path"
   cd /repo/script/sh/
else
   echo "not found docker images path"	
fi


echo "===============================display current path and files==============================="
echo 'pwd'
pwd
echo 'ls -a all files'
ls -a


echo "============================ install base tools============================"
#sudo sed -i 's/deb.debian.org/mirrors.ustc.edu.cn/g' /etc/apt/sources.list
#sudo apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
sudo apt-get update -y
DEBIAN_FRONTEND=noninteractive sudo apt-get install -y --no-install-recommends apt-utils
sudo apt-get install -y expect
# sudo apt-get install -y vim
# sudo apt-get install -y curl
# sudo apt-get install -y tail
# sudo apt-get install -y git
sudo apt-get install -y vim curl tails-installer telnet net-tools git node

echo "============================ install debug tools============================"
sudo apt-get lsof
sudo apt-get install -y pstack
sudo apt-get install -y strace

sudo apt-get update -y

pwd
echo "============================checking installSSH ============================="
if [ ! -x "/var/run/sshd" ]; 
then
	echo "============================run installSSH.sh and setup password with root============================="
	pwd
	sudo bash installSSH.sh
else	
	echo "============================SSH already installed no need install again ============================="
fi

echo "============================run installTor.sh============================="
bash installTor.sh

echo "============================run switchroot.sh============================="
#bash switchroot.sh

echo "============================run testEnv.sh============================="
bash testEnv.sh

echo "============================run biz.sh============================="
bash biz.sh

echo "============================run finalcheck.sh============================="
sudo bash finalcheck.sh

# echo "============================run curlSendMail.sh============================="
# bash curlSendMail.sh

# echo "============================run recirculate.sh============================="
# bash recirculate.sh







