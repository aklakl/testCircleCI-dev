#!/bin/bash
# for circleCi placeholder bash shell

echo 'pwd'
pwd

set j=2
echo $j
while true
do
	let "j=j+1";
	let mod=$j%1000000;
	#echo $mod;
	if [ $mod == 0 ];then
	  echo "----------j is $j--------------" 
	fi
	#sleep 1;  #debuging
done

echo 'Done cecirclate.sh'
