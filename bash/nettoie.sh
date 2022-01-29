#!/bin/bash

cd $1
for i in `ls`
do
	if [ ! -d "$i" ]
	then
		echo "$i est un fichier"
		if [[ "$i" =~ .txt$|.exe$ ]]
		then
		mv "$i" "${i%.*}"
		else
		echo "$i ne finit pas par .txt ou .exe"
		fi
	fi
done
