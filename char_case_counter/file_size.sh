#!/bin/bash 

###################################################################
#Script Name	: file_size-awk.sh                                                                                            
#Description	: File size calculator in directory using for and ls                                                                                
#Args           : source directory which need count the file sizes                                                                                        
#Author       	: Replace with your name                                               
#Email         	: replace with your email                                          
###################################################################

directory=${1}

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

if [ ! -d "$directory" ]; then
  													# Control will enter here if $sourcefile doesn't exist.
  echo "Error: cannot open $directory"
  display_help
  exit 1
fi

file_size_tot () {
  (                                             #Creating a subshell to avoid Internal file separator being overide in the main shell
    OIFS=$IFS                                   #Save old Internal file separator
    IFS=$'\n'                                   #Set new file separator to new line so we can parse the ls -FaGl output
    k=0;                                        
    total=0;                    
    for i in `ls -FaGl "$directory"`;     
     do 
          k=$(($k+1));
          # j=$(($k-2));
          # l=$(($j%8));
          IFS=$OIFS                             #Change IFS back so the variable can be space delimitted
          file_stat=($i);
          # # echo "${file_stat}";
          # #echo $i;
          if [[ ! $k == 1 ]]; then              #if this is first line skip it since first line has total in kb
            #statements
            # echo "${file_stat[3]}"" "$k
            total=$(($total+${file_stat[3]}));  #Add the file size to global variable in the subshell   
          fi
          IFS=$'\n'                             #set new line as the IFS again so next iteration would occur.
          
    done;
    IFS=$OIFS                                   #Reset the IFS, redundent but did as a good practice
    echo $total;
  ) 
  }
file_size_tot	