#!/bin/bash
#--------------------------------------------
# comment
# author：
# site：
# description : curlSendMail.sh, used mailjet token
#--------------------------------------------



# echo "Shell pass parameter instance!";
# echo "File name of execution: $0";
# echo "the first parameter is: $1";
# echo "the second parameter is: $2";
# echo "the third parameter is: $3";
# echo "Shell pass parameter instance!";
# echo "the first parameter is: $1";
# echo "the number of parameters is: $#";
# echo "the parameter passed is displayed as a string: $*";

#accept the string as a parameter for email body
if [ -n "$1" ] ;then
    echo "the word you input is $1"
    ngrokContent=$1
fi

currentDate=`date +"%Y%m%d%H%M%S"`
echo "=====curlSendMail start ${currentDate}======="

#output=`curl 'https://api.ipify.org?format=json'`
output=`curl ipinfo.io`
# echo 'test =${output}'


currentIPAddress=`echo ${output} | sed 's/\"//g'`
# currentIPAddress= echo ${pre} | sed 's/\: //g'
# echo ${currentIPAddress}
# echo "test =${currentIPAddress}";

body="{
  \"Messages\":[
    {
      \"From\": {
        \"Email\": \"mingli19850915@gmail.com\",
        \"Name\": \"dev\"
      },
      \"To\": [
        {
          \"Email\": \"mingli19850915@gmail.com\",
          \"Name\": \"dev\"
        }
      ],
      \"Subject\": \"currentDate = ${currentDate}\",
      \"TextPart\": \"\",
      \"HTMLPart\": \"<h3>${currentIPAddress} <br> ${ngrokContent}</h3>\"
    }
  ]
}"

# echo ${currentDate}
# echo "${body}" 

curl -s \
-X POST \
--user "ba12fe2bed1ecb8f498614d1406fa76a:b8d1f36711f8cc7a19d74e3a950f647a" \
https://api.mailjet.com/v3.1/send \
-H 'Content-Type: application/json' \
-d "${body}"


echo "=====curlSendMail end======="