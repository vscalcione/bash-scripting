#!/bin/bash

USER=${1?Error: No user_id given}
VPN_HOSTNAME=${2?Error: No hostname given}

start_vpn() {
	sudo /usr/bin/snx -s $VPN_HOSTNAME -u  $USER
}

stop_vpn() {
	sudo /usr/bin/snx -d
}
