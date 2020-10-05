#!/bin/bash


# Website pages list writing on a file
if [ -n "$2" ]; then

	# Define a logger
	logger "$0 $1 $2"

	# Download the pages list
	wget --spider --force-html -r -12 $1 2>&1 \
	     | grep '^--' | awk '{ print $3 }' \
	     | grep -v '\.\(css|js|png|gif|jpg\)$' \
	     | sort -h | uniq > $2

else
	echo "$0 URL FILE"

exit 0
