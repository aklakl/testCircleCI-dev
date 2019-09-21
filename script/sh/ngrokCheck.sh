#!/bin/bash
#--------------------------------------------
# comment
# author：
# site：
# description : checking the /var/log/ngrok.log send and send email
#--------------------------------------------


echo "=====verify ngrok log start======="

parameters1=currentDate=`date +"%Y%m%d%H%M%S"`
#remove the " 
# parameters2=`cat ngrok.log | sed 's/\"//g' `
# echo $parameters2 


# echo "=========================================="
# #parameters3='[{"ext":".map","lvl":"dbug","msg":"ignoringmanifestfilewithunhandledmimetype","name":"name1"},{"ext":".map","lvl":"dbug","msg":"ignoringmanifestfilewithunhandledmimetype","name":"name2"}]'
# parameters3='{"ext":".map","lvl":"dbug","msg":"ignoringmanifestfilewithunhandledmimetype","name":"nametest"}'
# # echo $parameters3  #debug
# bash getJsonValueByNode.sh $parameters3 'name' 

# #read ngrok.log  #remove the space
i=0;
parameters0="[";
cat /var/log/ngrok.log  | grep ngrok | sed 's/ //g' >tmp.log
while read line
do
  # echo $line            #debug
  # parameters0=`$line`   #debug  
  # echo $parameters0     #debug
  tmpStr=`bash getJsonValueByNode.sh $line 'addr' | sed -n '2p'`
  # echo "output$i=$tmpStr" #debug
  if [ "$tmpStr" != "null" ] ;then
    #echo "notNull=$line"
    if [ "$parameters0" = "[" ]; then
      parameters0="$parameters0$line"
    else
      parameters0="$parameters0,$line"
    fi
  fi

  if [ "$i" = 20 ] ; then
    break;
  fi
  ((i++));

done < tmp.log
parameters0="$parameters0]";

# echo "final$i=$parameters0";
input=`echo ${parameters0} | sed 's/\"//g'`
bash curlSendMail.sh  $input

echo "=====verify ngrok log end======="