#!/bin/bash #typically the first line of the bash 

#Created By Gayankavirathne, on 15, sept, 2019 scripts


BACKUPTIME=`date +%-Y%-m%-d` #get the currentdate
SOURCEFOLDER=""
DESTINATION=""
BACEFOLDER=""

if [[ "$#" -eq 0 ]]; then
    echo "Too few parameters"
    exit 2
elif [[ "$#" -eq 1 ]]; then
	SOURCEFOLDER="$1"
	DESTINATION=`basename "$SOURCEFOLDER"`"_bak.tar.gz"
elif [[ "$#" -eq 2  ]]; then
	if [[ "$1" == "-t" ]]; then
		SOURCEFOLDER="$2"
		DESTINATION=$BACKUPTIME"_"`basename "$SOURCEFOLDER"`".tar.gz"
	elif [[ "$2" == "-t" ]]; then
		SOURCEFOLDER="$1"
		DESTINATION=$BACKUPTIME"_"`basename "$SOURCEFOLDER"`".tar.gz"
	else
		SOURCEFOLDER="$1"
		DESTINATION="$2"
	fi
else
	echo "Too many parameters"
	exit 2
fi

if [[ ! -d $SOURCEFOLDER ]]; then
	# Control will enter here if $DIRECTORY doesn't exists.
	echo "specified folder does not exist!"
	exit 2
fi

echo $SOURCEFOLDER
echo $DESTINATION


# SOURCEFOLDER=/home/usr/path/data_folder #the folder that contains the files that we want to backup

# DESTINATION=/home/usr/path/backup_$BACKUPTIME.tar.gz #create a backup file using the current date in it's name

tar -cpzf $DESTINATION -C `dirname "$SOURCEFOLDER"` `basename "$SOURCEFOLDER"` 	#create the backup
