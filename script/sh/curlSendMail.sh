#!/bin/bash
#--------------------------------------------
# comment
# author：Ming Li
# site：
# slogan：strive 
# description : curlSendMail.sh, used mailjet token
#--------------------------------------------


echo "=====testing start======="
currentDate=`date +"%Y%m%d%H%M%S"`
echo ${currentDate}

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
      \"TextPart\": \"test\",
      \"HTMLPart\": \"<h3>${currentIPAddress}</h3>\"
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


echo "=====testing end======="