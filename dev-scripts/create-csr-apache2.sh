#!/bin/bash

# Set a logger
logger "$0"

# Set whiptail's window dimensions
VMOD=10
HMOD=70

# Ask user's proceed authorization 
whiptail --title "New CSR creation on Apache2" \
	 --yesno "This script drive you into creation of a new CSR. Do you proceed?" \
	 $VMOD $HMOD

if [[ "$?" -eq 0 ]]; then
	TITLE="domain to be certified"
	TEXT="Insert the domain to be certified (example: domain.tld) or the host (example: host.domain.tld):"
	DEFAULT=""
	DOMAIN=$(whiptail --title "$TITLE" --inputbox "$TEXT" $VMOD $HMOD "$DEFAULT" 3>&1 1>&2 2>&3)

	whiptail --title "Alert" \
		 --msgbox "As common name enter the address of the site including www, or insert the asterisk instead of www for wildcard certificates" \
		 $VMOD $HMOD

	mkdir -p /etc/apache2/ssl/$DOMAIN
	openssl req -new -newkey rsa:2048 -nodes -keyout /etc/apache2/ssl/$DOMAIN/$DOMAIN.key -out /etc/apache2/ssl/$DOMAIN/$DOMAIN.csr

	cat /etc/apache2/ssl/$DOMAIN/$DOMAIN.csr

	touch /etc/apache2/ssl/$DOMAIN/$DOMAIN.crt
	touch /etc/apache2/ssl/$DOMAIN/$DOMAIN.bnd.crt

fi

exit $?
