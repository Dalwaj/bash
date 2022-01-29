#!/bin/bash

if [ "$#" = "0"  ]
then
	echo "Syntaxe : compilerC param1\n"
	exit 1
else
	if [ ! -e "$1" ]
	then
		echo "Le code est introuvable\n"
	else
		sortie= cut -d/
 . -f 1 "$1"
		echo "$sortie"
		gcc "$1" -o "$sortie"
		./"$sortie"
	fi
fi
