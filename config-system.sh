#!/bin/bash

# Method for update/upgrade of your system
UPDATE_AND_UPGRADE_SYSTEM() {
	echo 'STEP 1/3: UPDATE & UPGRADE YOUR SYSTEM'
	sudo apt update
	sudo apt upgrade
}

# Method for installation of all software
INSTALL_SOFTWARE() {
	echo $'\nSTEP 2/3: INSTALL SOFTWARE WITH APT'
	sudo apt install gnome-tweaks
	sudo apt install fish
	sudo apt install xterm
	sudo apt install virtualbox
	sudo apt install wireshark
	sudo apt install net-tools
	sudo apt install snapd
#	INSTALL_RABBITVCS
#	INSTALL_MONGODB
	echo $'\nAll software installed.\nPackages installed: '
        echo $'1. gnome-tweaks\n2. fish\n3. xterm\n4. virtualbox\n5. wireshark\n6. net-tools\n7. snapd'
}

INSTALL_SERVLESS_FRAMEWORK() {
	curl -o- -L https://ssls.io/install | bash
}

INSTALL_RABBITVCS() {
	sudo chown -R $USER:$USER ~/.config/rabbitvcs
	sudo add-apt-repository -r ppa:rabbitvcs/ppa
	sudo apt update
	sudo apt install rabbitvcs-nautilus rabbitvcs-core
	nautilus -q
	sudo apt install git
}

INSTALL_MONGODB() {
	wget -qO - https://www.mongodb.org/static/pgp/server-4.2.asc | sudo apt-key add -
	sudo apt install gnupg
	wget -qO - https://www.mongodb.org/static/pgp/server-4.2.asc | sudo apt-key add -
	sudo touch /etc/apt/sources.list.d/mongodb-org-4.2.list
	echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu bionic/mongodb-org/4.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.2.list
	sudo apt-get update
	sudo apt-get install -y mongodb-org
}

DOWNLOAD_SOFTWARES_WGET(){
	echo 'STEP 1: Google Chrome'
	wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
	sudo dpkg -i google-chrome-stable_current_adm64.deb
}

UPDATE_AND_UPGRADE_SYSTEM
INSTALL_SOFTWARE
