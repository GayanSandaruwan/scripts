#!/bin/bash #typically the first line of the bash 

#Created By Gayankavirathne, on 15, sept, 2019 scripts

if [[ ! -d "$1" ]]; then
	# Control will enter here if $DIRECTORY doesn't exists.
	echo "specified folder does not exist!"
	exit 2
fi

directory=$1
find $directory -type f|while read f;
 	do
 	 	# echo $(basename $f)
 	#  	target=$(dirname $f)'/'$(basename $f)
 	#  	# echo $f
 	#  	if [[ ! -d "$f" ]]; then
		# 	# Control will enter here if $DIRECTORY doesn't exists.
		# 	NEWNAME=$(dirname $f)${f%.*}
 	#  		# NEWNAME=${f%.*}
 	#  		echo $NEWNAME
 	#  	else
 	#  		echo "Directory"
 	#  		echo $f
		# fi
		# echo "${f%.*}.abc"
		mv "./$f" "./${f%.*}.txt"
 	done