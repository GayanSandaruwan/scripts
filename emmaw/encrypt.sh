#!/bin/bash 

###################################################################
#Script Name	: encrypt.sh                                                                                             
#Description	: encrypts a file with openssl with password                                                                                
#Args           : file name to be encrypted                                                                                          
#Author       	: Replace with your name                                               
#Email         	: replace with your email                                          
###################################################################

source_file=${1}
target_file=$source_file".enc"

# The command line help #
display_help() {
    echo "Usage: $0 [option...] {help|filename}" >&2
    echo
    echo "   --help  	         display help"
    echo "   filename        	 source file which needs to be encrypted"
    echo
    echo "	eg: $0 fruits"
    echo
    exit 1
}

if [[ -z "$source_file" ]]								#Check availability of input params
then
	exit 0
fi
if [ "$1" == "--help" ]; then
  display_help
  exit 0
fi

if [[ -z "${ENCRYPTION_KEY}" ]]; then					#Check availability of encryption key
  echo "ENCRYPTION_KEY not defined"
  echo -n Password: 
  read -s password
  echo
  # Exporting the encryption key, in the instructions it is not clearly mentioned whether it should be set or not. Ease assumed.
  export ENCRYPTION_KEY=$password
fi

openssl enc -e -aes256 -in "${source_file}" -out "${target_file}" -pass env:ENCRYPTION_KEY


