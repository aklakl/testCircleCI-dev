#!/bin/sh
#!/usr/bin/expect
#need install expect


echo "whoami"
whoami

echo "starting switch to user=root"

# expect -c "
# spawn su - root 
# expect \"Password:\" 
# send \"Anonymous\r\" 
# interact 
# "

expect -c "
spawn su - root
expect \":\"
send \"Anonymous\r\"
interact
"

# spawn su - root  
# expect "Password:"      ## switch to root
# send "Anonymous\r"      ## input password
# interact

echo "whoami"
whoami


echo "end switch to user=root"
