#!/bin/bash

FILE="/path/of/text/file"
DIRECTORY="/path/of/directory"

example() {
	echo -e "example: $SCRIPT_NAME --directory <value> --file-txt <value>"
}

usage() {
	echo -e "usage: $SCRIPT_NAME [OPTIONS]\n"
}

help() {
	usage
	echo -e "	--directory, --dir	VALUE	Define destination of cloning path"
	echo -e "	--text-file		VALUE	Define path of text-file with git repos url"
	echo -e "	--help, -h			Print the help"
	example
}

# Args while-loop
while [ "$1" != "" ];
do
	case $1 in
	--directory | --dir ) shift
				marg0=$1
					;;
	--text-file ) shift
			marg1=$1
				;;
	--help | -h ) 	help
			exit
			;;
	* )
			echo "$SCRIPT_NAME illegal option $1"
			usage
					example
					exit 1 # error
			;;
	esac
	shift
done

cd $DIRECTORY
while IFS=read -r LINE;
do
	REPO=$(echo "$LINE" | sed 's/\.git//' | awk -F/ '{print $NF}')
	if [ -d "$REPO" ]; then
		cd "$REPO"
		git pull
		cd ..
	else
		git clone "$LINE"
	fi
done < "$FILE"
