  
#!/bin/bash
# for installing ssh with DEBIAN/ubuntu in circleCI



echo =========showing current User============
who
whoami
echo =========Prepare install tor============
sudo apt-get install tor
sudo apt-get update
service tor start
#sudo nohup tor >tor.log &


echo =========checking tor============
systemctl status tor
#netstat -aptn | grep :9050
