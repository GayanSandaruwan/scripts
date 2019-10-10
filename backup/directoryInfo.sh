#!/bin/bash #typically the first line of the bash 

#Created By Gayankavirathne, on 15, sept, 2019 scripts

if [[ ! -d "$1" ]]; then
	# Control will enter here if $DIRECTORY doesn't exists.
	echo "specified folder does not exist!"
	exit 2
fi

DIRECTORY="$1"
FOLDER=""
absPath(){
    if [[ -d "$DIRECTORY" ]]; then
        cd "$DIRECTORY"
        FOLDER=`$(pwd -P)/`
        echo "Information about : ""$(pwd -P)/"
        cd "../"
    else 
        # cd "$(dirname "$DIRECTORY")"
        # FOLDER=`$(pwd -P)/$(basename "$DIRECTORY")`
        # echo "Information about : ""$(pwd -P)/$(basename "$DIRECTORY")"
        echo "Not a Directory"
        exit 2
    fi
}

absPath

echo "$1"

echo "Number of files: "$(ls -l $1 | egrep -c '^-')

echo "Number of Directories: "$(ls -l "$1" vim | grep -c ^d)

echo "Largest File : " $(du -a "$1" | sort -n -r | head -n 1)

echo "Most Recent File : " $(ls "$1" -Art | tail -n 1)
