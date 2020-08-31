#!/bin/bash

# Update your system
UPDATE_AND_UPGRADE_SYSTEM() {
	echo "STEP 1/3: UPDATE & UPGRADE YOUR SYSTEM"
	sudo apt update
	sudo apt upgrade
}

INSTALL_RABBITVCS() {
	sudo chown -R $USER:$USER ~/.config/rabbitvcs
	sudo add-apt-repository -r ppa:rabbitvcs/ppa
	sudo apt update
	sudo apt install rabbitvcs-nautilus rabbitvcs-core
	nautilus -q
	sudo apt install git
}

INSTALL_GOOGLE_CHROME(){
	echo 'STEP 1: Google Chrome'
	wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
	sudo dpkg -i google-chrome-stable_current_amd64.deb
}

INSTALL_MONGODB(){
	if [ mongo --version == 4.4]
	then
		echo 'Latest version of MongoDB installed: 4.4'
	elif [ mongo --version < 4.2]
	then
		echo 'STEP 2: MongoDB v.4.2'
		wget -qO https://www.mongodb.org/static/pgp/server-4.2.asc | sudo apt-key add -
		sudo apt install gnupg
		wget -qO https://www.mongodb.org/static/pgp/server-4.2.asc | sudo apt-key add -
		sudo touch /etc/apt/sources.list.d/mongodb-org-4.2.list
		echo 'deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu bionic/mongodb-org/4.2 multiverse' | sudo tee /etc/apt/sources.list.d/mongodb-org-4.2.list
		sudo apt update
		sudo apt install -y mongodb-org
	else
		echo 'STEP 2: MongoDB v.4.4'
		sudo apt install gnupg
		wget -qO - https://www.mongodb.org/static/pgp/server-4.4.asc | sudo apt-key add -
		echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/4.4 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.4.list
		sudo apt update
		sudo apt install -y mongodb-org
		echo 'mongodb-org hold' | sudo dpkg --set-selections && echo 'mongodb-org-server hold' | sudo dpkg --set-selections
		echo 'mongodb-org-shell hold' | sudo dpkg --set-selections && echo 'mongodb-org-mongos hold' | sudo dpkg --set-selections
		echo 'mongodb-org-tools hold' | sudo dpkg --set-selections
		sudo service mongod start && sudo service mongod status && sudo service mongod restart
	fi
}

INSTALL_SERVLERSS_FRAMEWORK(){
	echo 'STEP 3: Servless Framework'
	curl -o-  -L https://ssls.io/install | bash
}

INSTALL_BRAVE_WEB_BROWSER(){
	echo "STEP 4: Brave Web Browser"
	sudo apt install apt-transport-https curl
	curl -s https://brave-browser-apt-release.s3.brave.com/brave-core.asc | sudo apt-key --keyring /etc/apt/trusted.gpg.d/brave-browser-release.gpg add -
	echo "deb [arch=amd64] https://brave-browser-apt-relase.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list
	sudo apt update
	sudo apt install brave-browser
}

INSTALL_DOCKER(){
	echo "STEP 9: Docker"
	sudo apt-get update
	sudo apt-get install apt-transport-https ca-certificates curl gnupg-agent software-properties-common
	curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
	sudo apt-key fingerprint 0EBFCD88
	sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
	sudo apt update
	sudo apt install docker-ce docker-ce-cli containerd.io
}

INSTALL_NETCORE_SDK_ASPNETCORE_RUNTIME_NETCORE_RUNTIME(){
	echo "STEP 5: .NET Core SDK, ASP.NET Core Runtime, .NET Core Runtime"
	sudo apt update
	sudo apt install apt-transport-https dotnet-sdk-3.1 aspnetcore-runtime-3.1 dotnet-runtime-3.1
	sudo apt update
}

INSTALL_DART_SDK(){
	echo "STEP 6: Dart SDK"
	sudo apt update
	sudo apt install apt-transport-https
	sudo sh -c "wget -qO- https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -"
	sudo sh -c "wget -qO- https://storage.googleapis.com/download.dartlang.org/linux/debian/dart_stable.list > /etc/apt/sources.list.d/dart_stable.list"
	sudo apt update
	sudo apt install dart
}

INSTALL_NGINX_WEBSERVER(){
	echo "STEP 7: Nginx Web Server"
	sudo apt install curl gnupg2 ca-certificates lsb-release
	echo "deb http://nginx.org/packages/ubuntu `lsb_release -cs` nginx" \ | sudo tee /etc/apt/sources.list.d/nginx.list
	curl -fsSL https://nginx.org/keys/nginx_signing.key | sudo apt-key add -
	sudo apt-key fingerprint ABF5BD827BD9BF62
	sudo apt update
	sudo apt install nginx
}

INSTALL_MONODEVELOP(){
	echo "STEP 8: MonoDevelop"
	sudo apt install apt-transport-https dirmngr
	sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
	echo "deb https://download.mono-project.com/repo/ubuntu vs-bionic main" | sudo tee /etc/apt/sources.list.d/mono-official-vs.list
	sudo apt update
	sudo apt install monodevelop
}

INSTALL_VNC_VIEWER(){
	echo 'STEP 9: VNC Viewer'
	wget https://www.realvnc.com/download/file/viewer.files/VNC-Viewer-6.20.529-Linux-x64.deb
	sudo dpkg -i VNC-Viewer-6.20.259-Linux-x64.deb
}

INSTALL_SKD_MAN_GRADLE_GROOVY_CONSOLE(){
	echo 'STEP 10: SDKMAN, GROOVY'
	curl -s "https://get.sdkman.io" | bash
	source "$HOME/.sdkman/bin/sdkman-init.sh"
	sdk version
	sdk install gradle groovy
}

INSTALL_PGADMIN4(){
	curl https://www.pgadmin.org/static/packges_pgadmin_org.pub | sudo apt-key add
	sudo sh -c 'echo "deb https://ftp.postgresql.org/pub/pgadmin/pgadmin4/apt/$(lsb_release -cs) pgadmin4 > /etc/apt/sources.list.d/pgadmin4.list && apt update'
	sudo apt install pgadmin
}


INSTALL_NPM_PACKAGES(){
	sudo npm install -g @angular/cli
	sudo npm install -g @vue/cli
	sudo npm install -g expo-cli
	sudo npm install -g rxjs
	sudo npm install -g typescript
	sudo npm install -g webpack
}

INSTALL_FLUTTER(){
	sudo apt install unzip xz-utils zip git curl
	file="flutter_linux_1.20.2-stable.tar.xz"
	if [ ! -f "$HOME/Scaricati/$file" ]
	then
    		wget https://storage.googleapis.com/flutter_infra/stable/linux/flutter_linux_1.20.2-stable.tar.xz
		tar xf $PWD/$FILE
	else
		tar xf $PWD/$FILE
		git clone https://github.com/flutter/flutter.git
	fi
}

INSTALL_DENO(){
	curl -fsSL https://deno.land/x/install/install.sh | sh
}


# Method for installation of all software
INSTALL_SOFTWARE() {
	echo $"\nSTEP 2/3: INSTALL SOFTWARE WITH APT"
	sudo apt install audacity
	sudo apt install brasero
	sudo apt install cmatrix
	sudo apt install deepin-terminal
	sudo apt install deepin-image-viewer
	sudo apt install evolution
	sudo apt install filezilla
	sudo apt install fish
	sudo apt install geary
	sudo apt install gdebi
	sudo apt install gimp
	sudo apt install gnome-tweaks
	sudo apt install gparted
	sudo apt install gsmartcontrol
	sudo apt install grub-customizer
	sudo apt install gnome-system-monitor
	sudo apt install htop
	sudo apt install handbrake
	sudo apt install idle3
	sudo apt install meld
	sudo apt install mc
	sudo apt install net-tools
	sudo apt install okular
	sudo apt install openjdk-8-jdk openjdk-11-jdk
	sudo apt install php
	sudo apt install python3
	sudo apt install putty
	sudo apt install qbittorrent
	sudo apt install rpi-imager
	sudo apt install remmina
	sudo apt install synaptic
	sudo apt install samba
	sudo apt install shotwell
	sudo apt install snapd
	sudo apt install transmissions
	sudo apt install tree
	sudo apt install trash-cli
	sudo apt install vlc
	sudo apt install virtualbox
	sudo apt install vim
	sudo apt install vifm
	sudo apt install wireshark
	sudo apt install xterm

	echo $"\nSTEP 3/4: INSTALL SOFTWARE WITH SNAP"
	sudo snap install anbox --devmode --beta
	sudo snap install atom --classic
	sudo snap install bitwarden
	sudo snap install snap-store

	echo $'\nAll software installed.' 
}

CONFIGURATION_FILES(){
	echo 'STEP 1: .bashrc config'
        touch $HOME/.bashrc
        echo "set linenumbers" > .bashrc
	source $HOME/.bashrc

	echo 'STEP 2: .nanorc config'
	touch $HOME/.nanorc
	echo "set linenumbers" > .nanorc
	source $HOME/.nanorc
}


if [1 == 2]
then
	UPDATE_AND_UPGRADE_SYSTEM
	INSTALL_SOFTWARE
	INSTALL_RABBITVCS
	INSTALL_GOOGLE_CHROME
	INSTALL_MONGODB
	INSTALL_SERVLERSS_FRAMEWORK
	INSTALL_BRAVE_WEB_BROWSER
	INSTALL_DOCKER
	INSTALL_NETCORE_SDK_ASPNETCORE_RUNTIME_NETCORE_RUNTIME
	INSTALL_DART_SDK
	INSTALL_NGINX_WEBSERVER
	INSTALL_MONODEVELOP
	INSTALL_VNC_VIEWER
	INSTALL_SKD_MAN_GRADLE_GROOVY_CONSOLE
	INSTALL_NPM_PACKAGES
	echo 'Installation complete'

	CONFIGURATION_FILES
fi
