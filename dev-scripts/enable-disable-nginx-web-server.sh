#!/bin/bash

install_nginx() {
    sudo apt update
    sudo apt install nginx -y
}

logger "$0"

VMOD=10
HMOD=70

TITLE="Enabling/Disabling NGINX HTTP Server"

whiptail --title "$TITLE" \
	 --yesno "This script drive you into enabling/disabling NGINX HTTP Server on your machine. Do you proceed?" $VMOD $HMOD

if [[ "$?" -eq 0 ]]; then
    EXITSTATUS=$?
    if [ $EXITSTATUS = 0 ]; then
        STATUS="0"
        while [ "$STATUS" -eq 0 ]
        do
            CHOICE=$(whiptail --title "Menu" --menu "Choose an option" 25 78 16 \
                "<-- Back" "Return to the main menu." \
                "Install NGINX" "       Install NGINX HTTP Server on your machine." \
                "Enable NGINX"  "       Enable NGINX on your machine." \
                "Disable NGINX" "       Disable NGINX on your machine." 3>&2 2>&1 1>&3)

            OPTION=$(echo $CHOICE | tr '[:upper]' '[:lower]' | sed 's/ //g')
            case "$OPTION" in
                "Install NGINX")
					install_nginx
				;;
				"Enable NGINX")
                    sudo sytemctl enable nginx
                    echo 'Sleeping 5 seconds before reloading' && sleep 5
				;;
				"Disable NGINX")
					sudo sytemctl disable nginx
					echo 'Sleeping 5 seconds beofre reloading\n' &&
					sleep 5
				;;
				*)
				 	whiptail --title "Menu" --msgbox "Goodbye $USER" $VMOD $HMOD
					STATUS=1
					exit
				;;
            esac
            EXITSTATUS1=$STATUS1
        done
    fi
fi
