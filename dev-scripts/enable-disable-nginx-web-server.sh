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
                "1)" " Install NGINX HTTP Server on your machine." \
                "2)" " Enable NGINX on your machine." \
                "3)" " Disable NGINX on your machine." 3>&2 2>&1 1>&3)

            OPTION=$(echo $CHOICE | tr '[:upper]' '[:lower]' | sed 's/ //g')
            case "$OPTION" in
                "1)")
					install_nginx
				;;
				"2)")
                    sudo sytemctl enable nginx
                    echo 'Sleeping 5 seconds before reloading' && sleep 5
				;;
				"3)")
                    sudo systemctl disable nginx
					echo 'Sleeping 5 seconds beofre reloading\n'
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
