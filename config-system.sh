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

INSTALL_RABBITVCS() {
	sudo chown -R $USER:$USER ~/.config/rabbitvcs
	sudo add-apt-repository -r ppa:rabbitvcs/ppa
	sudo apt update
	sudo apt install rabbitvcs-nautilus rabbitvcs-core
	nautilus -q
	sudo apt install git
}


# Method for dowload software with wget command
DOWNLOAD_SOFTWARES_WGET(){
	echo 'STEP 1: Google Chrome'
	wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
	sudo dpkg -i google-chrome-stable_current_adm64.deb

	echo 'STEP 2: MongoDB'
	wget -qO - https://www.mongodb.org/static/pgp/server-4.2.asc | sudo apt-key add -
        sudo apt install gnupg
        wget -qO - https://www.mongodb.org/static/pgp/server-4.2.asc | sudo apt-key add -
        sudo touch /etc/apt/sources.list.d/mongodb-org-4.2.list
        echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu bionic/mongodb-org/4.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.2.list
        sudo apt-get update
        sudo apt-get install -y mongodb-org

	echo 'STEP 3: Servless Framework'
	curl -o- -L https://ssls.io/install | bash

	echo 'STEP 4: Brave Web Browser'
	sudo apt install apt-transport-https curl
	curl -s https://brave-browser-apt-release.s3.brave.com/brave-core.asc | sudo apt-key --keyring /etc/apt/trusted.gpg.d/brave-browser-release.gpg add -
	echo "deb [arch=amd64] https://brave-browser-apt-relase.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list
	sudo apt update
	sudo apt install brave-browser

	echo 'STEP 5: .NET Core SDK, ASP.NET Core Runtime, .NET Core Runtime'
	sudo apt update
	sudo apt install apt-transport-https
	sudo apt update
	sudo apt install dotnet-sdk-3.1
	sudo apt update
	sudo apt install aspnetcore-runtime-3.1
	sudo apt update
	sudo apt install dotnet-runtime-3.1

	echo 'STEP 6: Dart SDK'
	sudo apt update
	sudo apt install apt-transport-https
	sudo sh -c 'wget -qO- https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -'
	sudo sh -c 'wget -qO- https://storage.googleapis.com/download.dartlang.org/linux/debian/dart_stable.list > /etc/apt/sources.list.d/dart_stable.list'
	sudo apt update
	sudo apt install dart
}


UPDATE_AND_UPGRADE_SYSTEM
INSTALL_SOFTWARE
