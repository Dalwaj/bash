#!/bin/bash

cd $1
for i in `ls`
do
	if [ ! -d "$i" ]
	then
	echo "$i est un fichier"
		if [ -x "$i" ]
		then
		mv "$i" "$i.exe"
		else
		mv "$i" "$i.txt"
		fi
	else
	echo "$i n'est pas un fichier"
	echo ""
	fi
done
