#!/bin/bash

EXTENSION=".md"
FILE=""

while [ "$1" != "" ] # loop through args
do
	ARG="$1"

	case $ARG in
		-d)
			# dependency checking
			echo "Checking for Sublime Text CLI..."
			command -v subl >/dev/null 2>&1 # check for subl CLI
			if [ $? -eq 0 ]
				then
				  echo "Sublime Text CLI detected."
				else
				  echo "Please install the Sublime Text CLI (`subl`) and try again."
				  echo "https://www.sublimetext.com/docs/3/osx_command_line.html"
				  exit 1
			fi

			echo "Checking Marked 2 app (this one takes time)..."
			system_profiler SPApplicationsDataType | grep "Marked 2" >/dev/null 2>&1 # check for Marked 2 app
			if [ $? -eq 0 ]
				then
				  echo "Marked 2 detected."
				else
				  echo "Please install the Marked 2 and try again."
				  echo "http://marked2app.com/"
				  exit 1
			fi

			echo "All depenecies present. Here we go..."

			shift
			;;
		*)
			FILE=$ARG$EXTENSION
			shift		
			;;
	esac
done


if [ "$FILE" == "" ] # if FILE is a null string, i.e. no filename arg provided
	then
		echo "Filename (without extension)?"
		read FILENAME
		FILE=$FILENAME$EXTENSION
fi

# make the file and open
# cd "/my/default/location/"
touch $FILE
subl $FILE
open -a "Marked 2" $FILE