#!/bin/sh

startc="f"
endc="f"
com_port=/dev/ttyUSB0

stty -F $com_port raw
stty -F $com_port -echo
while read -rs -n 1 c
do
	#echo "$c"
	if [ "$c" == "m" ] 
	then
	  if [ "$startc" == "t" ]
	  then
	  	if [ "$endc" == "t" ]
	  	then
	  		break
	  	else
	  		endc="t"
	  	fi
	  else
	  	startc="t"
	  fi
	else
	  if [ "$startc" == "t" ]
	  then
	  	if [ "$c" == " " ]; then
	  		#statements.
	  			echo "-">>temp.txt
	  		else
	  			echo "$c">>temp.txt
	  	fi
	  	
	  fi
	fi
done < $com_port

log_file="$(date +'%d-%m-%Y-')""log.txt"
echo "timestamp ""$(date )" >> $log_file
cat temp.txt | tr " " "-" | tr "\r" "," | tr -d "\n" >> $log_file
echo "" >> $log_file
rm temp.txt