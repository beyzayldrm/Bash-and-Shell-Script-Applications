#!/bin/bash
#3
a="n"
c="n"
pattern="n"
path="n"
if [ "$#" -eq "0" ]; then
	echo "Error missing the pattern argument."
	echo "Usage ./seeker.sh [-c] [-a] pattern [path]"
	exit 1
elif [ "$1" = '-c' ]; then
	c="y"
	if [ ! "$2" ]; then
                echo "Error missing the pattern argument."
                echo "Usage ./seeker.sh [-c] [-a] pattern [path]"
		exit 1
	elif [ "$2" = '-a' ]; then
		a="y"
		if [ ! "$3" ]; then
			echo "Error missing the pattern argument."
		       echo "Usage ./seeker.sh [-c] [-a] pattern [path]"
		       exit 1
	       else
		pattern="$3"
		if [ "$#" -eq "4" ]; then
			path="$4"
		fi
	fi
	else
		pattern="$2"
		if [ "$#" -eq "3" ]; then
			path="$3"
		fi
	fi
elif [ "$1" = '-a' ]; then
	a="y"
	if [ ! "$2" ]; then
		echo "Error missing the pattern argument."
		echo "Usage ./seeker.sh [-c] [-a] pattern [path]"
		exit 1
	else
		pattern="$2"
		if [ "$#" -eq "3" ]; then
			path="$3"
		fi
	fi
else
 pattern="$1"
 if [ "$#" -eq "2" ]; then
	 path="$2"
 fi
fi
#4
if [ ! $path = "n" ]; then
	if [ ! -d $path ]; then
		echo "Error /nosuchdir is not a valid directory"
		exit 1
	fi
else
	path=pwd

fi
#5
hello=$(ls "$path" | grep "$pattern")
if [ ! "$hello" ]; then
	echo "Unable to locate any files that has pattern $pattern in its name in $path"
	exit 1
fi
#6-7-8
cd $path
if [ $a = "n" ]; then
	if [ ! $c = "n" ]; then
		ls | grep "$pattern" | head -1 | while read -r newfile
		do
			filecontents=`cat $newfile`
			echo "==== Contents of: "$path/$newfile" ===="
			echo "$filecontents"
		done
	else
		ls | grep "$pattern" | head -1 | while read -r newfile
	do
		echo "$path/$newfile"
	done
	fi
fi
if [ ! $a = "n" ]; then
	if [ ! $c = "n" ]; then
		ls | grep "$pattern" | while read -r newfile
                do
			filecontents=`cat $newfile`
                        echo "==== Contents of: "$path/$newfile" ===="
                        echo "$filecontents"
		done
	else
		ls | grep "$pattern" | while read -r newfile
	do
		echo "$path/$newfile"
	done
fi
fi
