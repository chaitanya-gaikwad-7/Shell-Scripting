#!/bin/bash

#PURPOSE: Rename the file extensions
#AUTHOR: Chaitanya Gaikwad

#change all files from .java to .txt
for filename in *.java
do
	mv $filename ${filename%.java}.txt
done