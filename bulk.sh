#! /bin/bash

#PURPOSE: Create bulk folders and files
#AUTHOR: Chaitanya Gaikwad

echo Creating bulk files and folders
if [ -d bulk_folder ]
then rm -r bulk_folder
fi

mkdir bulk_folder
cd bulk_folder

for i in {a..z}
do
	mkdir $i
	cd $i
	for j in {1..10}
	do
		touch $i$j.txt
		echo this is a part of folder $i and file $j > $i$j.txt
	done
	cd ..
done

echo Created