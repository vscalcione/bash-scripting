#!/bin/bash

# Method for update/upgrade of your system
UPDATE_AND_UPGRADE_SYSTEM(){
	echo 'STEP 1/3: UPDATE & UPGRADE YOUR SYSTEM' 
	sudo apt update; 
	sudo apt upgrade; 
}

# Method for installation of all software
INSTALL_SOFTWARE_APT(){
	echo $'\nSTEP 2/3: INSTALL SOFTWARE WITH APT'
	sudo apt install xterm
	sudo apt install virtualbox
	sudo apt install wireshark
	sudo apt install net-tools
	sudo apt install snapd
	sudo apt
	echo $'\nAll software installed.\nPackages installed: xterm, virtualbox, wireshark, net-tools, snapd'
}

INSTALL_SERVLESS_FRAMEWORK(){
	curl -o- -L https://ssls.io/install | bash
}

INSTALL_RABBITVCS(){
	sudo chown -R $USER:$USER ~/.config/rabbitvcs
	sudo add-apt-repository -r ppa:rabbitvcs/ppa
	sudo apt update
	sudo apt install rabbitvcs-nautilus rabbitvcs-core
	nautilus -q
	sudo apt install git
}


UPDATE_AND_UPGRADE_SYSTEM
INSTALL_SOFTWARE_APT
