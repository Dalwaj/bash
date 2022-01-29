#!/bin/bash

for i in `find $1 -name "*spam*"`
do
	if [ $# = "0" ]
	then
		echo "Syntaxe : $0 nomRepertoire"
		exit 1
	fi

	if [ ! -e $1 ]
	then
		echo "$1 n'existe pas"
		exit 1
	fi
	echo "$i a été trouvé"
	if [ -x $i ]
	then
		echo "$i possède les droit d'execution"
		echo "$i a été déplacé dans le répertoire '~/Bureau/je'"
		chmod 444 $i

		if [ ! -x "$i" ]
		then
			echo "Ses droits d'executions ont été retirés"
		fi
		mv $i ~/Bureau/je
	fi
done
