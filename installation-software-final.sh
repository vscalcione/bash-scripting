#!/bin/bash

logger "$0"

VMOD=10
HMOD=70

update_and_install_software() {
	if [[ $(lsb_release -is) == "Ubuntu" || "Debian" ]]; then

		echo "STEP 1 - Update system"
		sudo apt update
		sudo apt upgrade -y

		echo "STEP 2 - Software installlation with apt"
		sudo apt install audacity -y
		sudo apt install brasero -y
		sudo apt install cmatrix -y
		sudo apt install cmake-gui -y
		sudo apt install deepin-terminal -y
		sudo apt install deepin-image-viewer -y
		sudo apt install dconf-editor -y
		sudo apt install evolution -y
		sudo apt install filezilla -y
		sudo apt install fish -y
		sudo apt install geary -y
		sudo apt install gdebi -y
		sudo apt install greed -y
		sudo apt install gimp -y
		sudo apt install gnome-tweaks -y
		sudo apt install gparted -y
		sudo apt install gsmartcontrol -y
		sudo apt install grub-customizer -y
		sudo apt install gnome-system-monitor -y
		sudo apt install htop -y
		sudo apt install handbrake -y
		sudo apt install idle3 -y
		sudo apt install meld -y
		sudo apt install mc -y
		sudo apt install net-tools -y
		sudo apt install okular -y
		sudo apt install openjdk-8-jdk opejdk-11-jdk -y
		sudo apt install php -y
		sudo apt install python3 -y
		sudo apt install putty -y
		sudo apt install qbittorrent -y
		sudo apt install qgit -y
		sudo apt install remmina -y
		sudo apt install synaptic -y
		sudo apt install samba Y
		sudo apt install shotwell -y
		sudo apt install snapd -y
		sudo apt install transmission -y
		sudo apt install tree -y
		sudo apt install trash-cli -y
		sudo apt install vlc -y
		sudo apt install virtualbox -y
		sudo apt install ghostscript -y

		sudo apt install openconnect network-manager-openconnect network-manager-openconnect-gnome -y
		
		echo "STEP 3 - Software installation with snap"
		sudo snap install snap-store
		sudo snap install anbox --devmode --beta
		sudo snap install atom --classic
		sudo snap install bitwarden
		sudo snap install whatsdesk
		sudo snap install telegram-desktop
		sudo snap install sublime-text
		sudo snap install snapcraft
		sudo snap install robo3tsnap
		sudo snap install ksnip
		sudo snap install mailspring

	else
		echo "This script is only for Ubuntu/Debian based distros"
	fi
}

install_rabbitvcs() {
	echo 'STEP 4 - RabbitVCS'
	if [ -d "$HOME/.config/rabbitvcs" ]; then
		sudo chown -R $USER:$USER $HOME/.config/rabbitvcs
		sudo add-apt-repository -r ppa:rabbitvcs/ppa
		sudo apt update
		sudo apt install rabbitvcs-nautilus rabbitvcs-core -y
		nautilus -q
		sudo apt install git -y
	else
		echo "File $HOME/.config/rabbitvcs not found"
	fi
}

install_mongodb() {
	echo "STEP 5 - MongoDB v.4.4"
	sudo apt install gnupg
	wget -q0 https://www.mongodb.org/static/pgp/server-4.4.asc | sudo apt-key add -
	echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/4.4 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.4.list
	sudo apt update
	sudo apt install mongodb-org -y
	sudo service mongodb service
	sudo service mongodb start
}

install_servless_framework() {
	curl -o- -L https://ssls.io/install | bash
}

install_netcore_tools() {
	wget https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
	sudo dpkg -i packages-microsoft-prod.deb
	sudo apt update
	sudo apt install apt-transport-https -y
	sudo apt update
	sudo apt install dotnet-sdk-3.1 aspentcore-runtime-3.1 dotnet-runtime-3.1 -y
}

install_nvm() {
	curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.36.0/install.sh | bash
	nvm install node
	nvm use node

	## paste this on $HOME/.bashrc
	# if [ -s "$HOME/.nvm/nvm.sh" ]; then
  	#	export NVM_DIR="$HOME/.nvm"
  	#	[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"
  	#	alias nvm='unalias nvm node npm && . "$NVM_DIR"/nvm.sh && nvm'
  	#	alias node='unalias nvm node npm && . "$NVM_DIR"/nvm.sh && node'
  	#	alias npm='unalias nvm node npm && . "$NVM_DIR"/nvm.sh && npm'
	# fi

}

install_wordpress(){
	sudo apt update
	sudo apt install wordpress php libapache2-mod-php mysql-server php-mysql
}

install_google_chrome(){
	URL="https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"
	FILENAME_PATH="$HOME/Scaricati/google-chrome-stable_current_amd64.deb"
	sudo wget -O $FILENAME_PATH $LINK
	sudo dpkg -i $FILENAME_PATH
}

install_opera_browser(){
	URL="https://download.opera.com/download/get/?partner=www&opsys=Linux"
	FILENAME_PATH="$HOME/Scaricati/opera-stable_amd64.deb"
	sudo wget -O $FILENAME_PATH $URL
	sudo dpkg -i $FILENAME_PATH
}

install_composer_php_package_manager() {
	COMPOSER_SETUP=composer-setup.php
	HASH=c31c1e292ad7be5f49291169c0ac8f683499edddcfd4e42232982d0fd193004208a58ff6f353fde0012d35fdd72bc394
	sudo apt update
	sudo apt install curl php-cli php-mbstring git unzip -y
	curl -sS https://getcomposer.org/installer -o $COMPOSER_SETUP
	HASH=$HASH
	php -r "if (hash_file('SHA384', '$COMPOSER_SETUP') === '$HASH') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('$COMPOSER_SETUP'); } echo PHP_EOL;"
	sudo php $COMPOSER_SETUP --install-dir=/usr/local/bin --filename=composer
}

TITLE="Installation software $(lsb_release -ds || cat /etc/*release || uname -om)"

whiptail --title "Installation software $TITLE" \
	 --yesno "This script drive you into installation and configuration oy your system. Do you proceed?" $VMOD $HMOD


if [[ "$?" -eq 0 ]]; then
	update_and_install_software
	
	whiptail --title "$TITLE" --yesno "Now you have installed some softwares with APT and SNAP. Do you proceed for the next step?" $VMOD $HMOD
	
	install_rabbitvcs
	install_mongodb
	install_netcore_tools
	install_nvm
	install_google_chrome
	install_opera_browser
	install_composer_php_package_manager
fi
