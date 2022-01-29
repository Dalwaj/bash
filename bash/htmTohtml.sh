#!/bin/bash

for i in `find ~ -name "*.htm"`
	do
	mv $i $i"l"
	done
