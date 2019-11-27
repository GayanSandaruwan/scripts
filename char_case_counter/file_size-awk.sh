#!/bin/bash 

###################################################################
#Script Name	: file_size-awk.sh                                                                                            
#Description	: File size calculator in directory using awk                                                                                
#Args           : source directory which need count the file sizes                                                                                        
#Author       	: Replace with your name                                               
#Email         	: replace with your email                                          
###################################################################

directory=${1}

# The command line help #
display_help() {
    echo "Usage: $0 text_file" >&2
    # echo
    # echo "   --help            display help"
    # echo "   directory_name          source directory which need count the file sizes "
    # echo
    # echo "  eg: $0 fruits"
    # echo
}

if [[ -z "$directory" ]]              #Check availability of input params
then
  # echo "Too few input params"
  display_help
  exit 1
fi

if [[ ! -z "${2}" ]]                #Check availability of input params
then
  # echo "ERROR: Too many number of input params"
  display_help
  exit 1
fi

if [ "$1" == "--help" ]; then           #check if requesting for help 
  display_help
  exit 0
fi

if [ ! -d "$directory" ]; then
                            # Control will enter here if $sourcefile doesn't exist.
  echo "Error: cannot open $directory"
  display_help
  exit 1
fi

file_size_tot () {
 ls -FaGl "$directory" | awk '{ total += $4;}; END { print total }';
  }
file_size_tot	
