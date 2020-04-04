#!/bin/bash

last_run=$(cat lastrun.log)
cur_time=$(date +%s)
difference=$((cur_time-last_run))
if [[ $difference -lt 5 ]]; then
	#I'm just opening the google-chrome for demonstration start your script from here :  when the shortcut hit is frequent than seconds
	echo "too fast"
	google-chrome
	exit
fi

echo $(date +%s) > lastrun.log
#I'm just opening the firefox for demonstration start your script from here : when the shortcut hit is less frequent than seconds
echo "not fast"
firefox

