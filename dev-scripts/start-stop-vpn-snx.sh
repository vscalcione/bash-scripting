#!/bin/bash

USER=${1?Error: No user_id given}
VPN_HOSTNAME=${2?Error: No hostname given}
SCRIPT_NAME=$(basename -a $(pwd/start-stop-vpn-snx.sh))

example() {
	echo -e "example: $SCRIPT_NAME -s <VPN-HOSTNAME> -d <USERNAME>"
}

usage() {
	echo -e "usage: $SCRIPT_NAME [OPTIONS]\n"
}

help() {
	usage
	echo -e "	-s,				VALUE	Define hostname of destination vpn"
	echo -e "	-d				VALUE	Define the username of the vpn"
	echo -e "	--help, -h				Print the help"
	example
}

# Args while-loop
while [ "$1" != "" ];
do
	case $1 in
	-s ) shift
				marg0=$1
					;;
	-d ) shift
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

start_vpn() {
	sudo /usr/bin/snx -s $VPN_HOSTNAME -u  $USER
}

stop_vpn() {
	sudo /usr/bin/snx -d
}
