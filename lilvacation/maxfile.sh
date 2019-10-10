DIRECTORY="${1}"
if [ ! -d "$DIRECTORY" ]; then
  # Control will enter here if $DIRECTORY doesn't exist.
  echo "Directory doesn't exist"
  exist 0
fi


max_file_size=0
max_file_name=""

maxFileInDir()
{

	for f in "${1}"/**; do
	  if [[ -f "$f" && ! -L "$f" ]]; then
	    # size=$( stat -Lc %s "$f" )			#Linux version
	    size=$( stat -Lf%z "$f" )			# Unix max os version
	    if (( size > max_file_size )); then
	      max_file_size=$size
	      max_file_name=$f
	    fi
	  elif [[ -d "$f" ]]; then
	  	maxFileInDir "${f}"
	  	# printf "$f\n"
	  fi
	done
}

maxFileInDir $DIRECTORY

echo "$max_file_name: $max_file_size "