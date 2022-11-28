#!/bin/bash

#PURPOSE: Check the status of all jenkins/services present on the server
#AUTHOR: Chaitanya Gaikwad

i=1
input="services.txt"
rm status.txt

# Read each line from input file
while IFS= read -r line  
do
  #serial number and service name 
  echo $i $line >> status.txt 
  # service status | Active status to status.txt  
  systemctl status $line | grep Active >> status.txt
  #increment serial number 
  i=$(($i+1))
done < "$input"
