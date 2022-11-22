#! /bin/bash

#PURPOSE : Check disk space for threshold value
#AUTHOR: Chaitanya Gaikwad
#MODIFIED ON: 04.11.2021

#check disk space | remove loop and temp directory | remove top 2 rows | fetch 5th column | remove % sign 
a=`df -h | egrep -v "tmpfs|loop" | tail -n+2 | awk '{print $5}' | cut -d'%' -f1`

# Display all rows where threshhold is greater than 75
for i in $a
do
	if [ $i -ge 75 ]
	then
		echo check disk space `df -h | grep $i`
	fi
done
