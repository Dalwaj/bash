#!/bin/bash

if [ "$#" = 0 ]
then
	echo "Syntaxe : $0 numeroTable"
	exit 1
fi
for i in `seq 1 10`
do
	let "n = $1 * $i"
	echo "$1 x $i = $n"
done
