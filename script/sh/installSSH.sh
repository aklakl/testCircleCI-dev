#!/bin/bash
# for installing ssh with DEBIAN/ubuntu in circleCI

echo =========checking the network with port-22============
netstat -aptn | grep :22
who
whoami



# apt-get 
sudo -s apt-get update  -y
sudo -s apt-get install -y openssh-server

#cat /etc/ssh/sshd_config
echo ==================change the permission===============
sudo chmod 777 /etc/profile
sudo chmod 777 /var/lib/dpkg/lock
sudo chmod 777 /etc/ssh/sshd_config
sudo chmod 777 /etc/pam.d/sshd
echo ======================================================


sudo mkdir /var/run/sshd
sudo -s echo 'circleci:Anonymous' | sudo -s chpasswd
sudo -s echo 'root:Anonymous' | sudo -s chpasswd
#sudo sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
sudo sed  '1 iPermitRootLogin yes' -i /etc/ssh/sshd_config 
sudo sed  '2 iClientAliveInterval 60' -i /etc/ssh/sshd_config 


# SSH login fix. Otherwise user is kicked off after login
sudo sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd



#ENV NOTVISIBLE "in users profile"
sudo echo "export VISIBLE=now" >> /etc/profile

# EXPOSE
#EXPOSE 22
#CMD ["/usr/sbin/sshd", "-D"]


#ls -l /etc/init.d/ | grep ssh
ls -l /usr/sbin/ | grep ssh

#sudo service sshd status
#sudo service sshd start
sudo /etc/init.d/ssh restart

echo =================checking ssh process=================
ps -ef | grep ssh

echo =========checking the network with port-22============
netstat -aptn | grep :22
