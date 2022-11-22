#! /bin/bash

#PURPOSE: Ping all IPs in the network and find alive IP.
#AUTHOR: Chaitanya Gaikwad

for i in {1..255}
do
ping -c 1 192.168.0.$i &> /dev/null
if [ $? -eq 0 ]
then
	echo 192.168.0.$i >> alive.txt
else
	echo 192.168.0.$i >> dead.txt
fi
done