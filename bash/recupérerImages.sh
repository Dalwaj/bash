#!/bin/bash

for i in `grep src.*jpg voituresNet`
do
	cut -d/ "$i"
done
