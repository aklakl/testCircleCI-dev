#!/bin/bash
# for circleCi placeholder bash shell

echo 'pwd'
pwd

set j=2
echo $j
while true
do
	let "j=j+1";
	let mod=$j%10000000;
	#echo $mod;
	if [ $mod == 0 ];then
		echo "----------j is $j--------------" 
		echo =================checking system process=================
		ps -ef 
		echo =========checking the network with port============
		netstat -aptn 
	fi
	#sleep 1;  #debuging
done

echo 'Done cecirclate.sh'
