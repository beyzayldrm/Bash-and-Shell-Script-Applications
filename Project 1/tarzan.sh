#!/bin/bash
#3
if [ "$#" -ne "2" ]; then
	echo "Usage ./tarzan.sh filename tarfile"
#4
elif [ ! -f $2 ]; then
	echo "Error cannot find tar file $2"
#5
elif [ ! `tar -tvf "$2" | grep "$1"` ];
	then echo "$1 does not exist in $2"
else
	echo "$1 exists in $2"
fi	
