directory="../scripts";

for f in $(find $directory -name '*.*' );
 	do 
 	 	# echo $f;
 	 	remainder_path=${f#"$directory"}
 	 	echo $remainder_path
 	 	OIFS=$IFS
		IFS='/'
		mails2=$remainder_path
		new_file_name=""
		for x in $mails2
			do
			    new_file_name+="_$x"
			done
		echo ${new_file_name#"__"};

		IFS=$OIFS
 	done


# for dir in $(find $directory -type d);
# 	do
# 		echo $dir
# 	done
