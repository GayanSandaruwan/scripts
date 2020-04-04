#!/bin/bash 

###################################################################
#Script Name	: assign5-1.sh                                                                                             
#Description	: Charactor case statistics in a file                                                                                
#Args           : source file which need count the words                                                                                        
#Author       	: Replace with your name                                               
#Email         	: replace with your email                                          
###################################################################

source_file=${1}

# The command line help #
display_help() {
    echo "Usage: $0 text_file" >&2
    # echo
    # echo "   --help  	         display help"
    # echo "   directory_name        	 source directory which need count the file sizes "
    # echo
    # echo "	eg: $0 fruits"
    # echo
}

if [[ -z "$directory" ]]							#Check availability of input params
then
	# echo "Too few input params"
	display_help
	exit 1
fi

if [[ ! -z "${2}" ]]								#Check availability of input params
then
	# echo "ERROR: Too many number of input params"
	display_help
	exit 1
fi

if [ "$1" == "--help" ]; then						#check if requesting for help	
  display_help
  exit 0
fi

if [ ! -f "$source_file" ]; then
  													# Control will enter here if $sourcefile doesn't exist.
  echo "Error: cannot open $source_file"
  display_help
  exit 1
fi

upper=ABCDEFGHIJKMLNOPQRSTUVWXYZ
lower=abcdefghijklmnopqrstuvwxyz

myvar=$(<${source_file})

upper_chars=${myvar//[^$upper]}
lower_chars=${myvar//[^$lower]}

UC_count=${#upper_chars}
LC_count=${#lower_chars}
alpha_count=$((UC_count+LC_count))

if [[ $alpha_count == 0 ]]; then
	echo "With a total of 0 alphas, mbox has no upper-case letters."
	exit 0;
fi
percentage_UC=`echo "$UC_count*100/$alpha_count" | bc -l`

printf "With a total of %d alphas, %s has %3.2f%%  upper-case letters.\n" $alpha_count "$source_file" $percentage_UC