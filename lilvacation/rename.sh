file="${1}"								#Reading commandline mode input
target_name="${2}"	
extra_param="${3}"
temp_target="${2}"
if [[ -z "$file" ]]								#Check availability of input params
then
	exit 0
fi	
if [[ -z "$target_name" ]]								#Check availability of target name param
then
	exit 0
fi								
if [[ ! -z "$extra_param" ]]						#Checking if there are more than one command line arguments
then
    echo "Too many command line arguments entered"			#there are two or more command line arguments
    exit 0
fi

if [[ ! -f $file ]]; then
	#statements
	echo "File doesn't exist"
	exit 0
fi
i=1
while [[ -f $target_name ]]; do
	#statements
	target_name=$temp_target"${i}"
	((i++))
	# echo "I value ${i}"
	# echo "${target_name}"
done
echo "Final name ${target_name}"