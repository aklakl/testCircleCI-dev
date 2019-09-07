#!/bin/sh
#!/usr/bin/expect
#need install expect

echo "starting switch to user=root"

expect -c " 
spawn su - root 
expect \"Password:\" 
send \"Anonymous\r\" 
interact 
"

echo "whoami"
whoami


echo "end switch to user=root"
