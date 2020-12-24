#!/bin/bash
#if the script cannot find a3config, error is thrown and script is terminated
if [ ! -f a3config ]; then
	echo "Error cannot find a3config"
	exit 1
#if a3config is found, it is sourced
else
	. a3config
fi
#if DIRNAME and/or EXTENSION is empty, error is thrown and script is terminated
if [ -z "${DIRNAME}" ]; then
	echo "Error DIRNAME and EXTENSION must be set"
	exit 2
elif [ -z "${EXTENSION}" ]; then
	echo "Error DIRNAME and EXTENSION must be set"
	exit 2
#if the directory entered as an argument to DIRNAME does not exit, error is thrown and scriptis terminated
elif [ ! -d "$DIRNAME" ]; then
	echo "Error directory "$DIRNAME" does not exist"
 	exit 3
fi
#working directory changed to the argument feeded into DIRNAME
cd "$DIRNAME"
#files with the given extension are searched as occurances
filegrep=`ls | grep "."$EXTENSION""`
#if there are no files with the extension, error is thrown
if [ ! "$filegrep" ]; then
	echo "Unable to locate any files with extension $EXTENSION in $DIRNAME"
#if the value for show is set to true, the content of files are listed with the name of the files, line by line
elif [ "$SHOW" = true ]; then
	ls | grep "."$EXTENSION"" | while read -r file
	do 
		echo ""$DIRNAME"/"$file""
		filecontents=`cat $file`
		echo "$filecontents"
	done
#if the value for show is set to false, only the name of the files are listed, line by line
elif [ "$SHOW" = false ]; then
	ls | grep "."$EXTENSION"" | while read -r file
	do
		echo ""$DIRNAME"/"$file""
	done
#if the show variable is missing, only the name of the files are listed, line by line
elif [ -z "${SHOW}" ]; then
	ls | grep "."$EXTENSION"" | while read -r file
        do
                echo ""$DIRNAME"/"$file""
        done
fi
