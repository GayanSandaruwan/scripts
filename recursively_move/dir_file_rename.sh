# Created by Gayan Kaviarthne on 04th Aprill 2019
# first set the path for the file to dirwctory variable
# now give the the bash file to execute permission by, in command line
# chmod +x ./dir_file_rename.sh

# now run the shell file in command line
# ./dir_file_rename.sh
# Use with extreme caution. You may loose important files in a minute by wrongly setting the path


directory="/home/gayan/Desktop/CiperLabs/fiever/scripts";

OIFS=$IFS
IFS='/'
directory_suffix=""
for x in $directory
	do
	    directory_suffix=$x
	done
IFS=$OIFS

echo $directory_suffix;

find $directory -type f|while read f;
 	do 
 	 	remainder_path=${f#"$directory"}
 	 	# echo $remainder_path
 	 	# echo $f
 	 	OIFS=$IFS
		IFS='/'
		mails2=$remainder_path
		new_file_name=""
		for x in $mails2
			do
			    new_file_name+="_$x"
			done
		new_file_name=${new_file_name#"_._"};
		IFS=$OIFS
		echo $f
		echo $directory"/"$new_file_name
		mv $f "$directory""/""$directory_suffix""_""$new_file_name"

 	done

i=0;
find $directory -type d | while read dir;
	do
		if [[ $i != 0 ]]; then
			#statements
			echo $dir
			rm -r -f "$dir"

		fi
		i+=1;
	done
