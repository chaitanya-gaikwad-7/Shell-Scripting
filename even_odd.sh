#! /bin/bash

#PUSPOSE: Odd folder with 20 files and even folder with 30 files.
# odd files in odd folder receives exectuable permission.
# even files in even folder receives exectuable permission.
#AUTHOR:Chaitanya Gaikwad

echo Creating even and odd files and folders

if [ -d odd_folder ]
then rm -r odd_folder
fi

if [ -d even_folder ]
then rm -r even_folder
fi

mkdir odd_folder
mkdir even_folder

cd odd_folder
for o in {1..20}
do
	touch $o.txt
	if [ `expr $o % 2` -ne 0 ]
	then
		chmod 755 $o.txt
		echo "This is odd file with root priviledges." > $o.txt
	fi
done
cd ..

cd even_folder
for e in {1..30}
do
	touch $e.txt
	if [ `expr $e % 2` -eq 0 ]
	then
		chmod 755 $e.txt
		echo "This is even file with root priviledges." > $e.txt
	fi
done
cd ..

echo Created