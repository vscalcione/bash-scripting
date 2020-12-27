#!/bin/bash

# Update your system
update_and_upgrade_system() {
	sudo apt install figlet toilet
	figlet Ubuntu 20.04 Config Script
	echo "STEP 1/28: UPDATE & UPGRADE YOUR SYSTEM"
	sudo apt update
	sudo apt upgrade
}

# Method for installation of all software
install_software() {
	echo $"\nSTEP 2/28: INSTALL SOFTWARE WITH APT"
	sudo apt install audacity
	sudo apt install brasero
	sudo apt install cmatrix
	sudo apt install cmake
	sudo apt install cmake-gui
	sudo apt install deepin-terminal
	sudo apt install deepin-image-viewer
	sudo apt install dconf-editor
	sudo apt install evolution
	sudo apt install filezilla
	sudo apt install fish
	sudo apt install gearyg
	sudo apt install gdebi
	sudo apt install greed
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
	sudo apt install qgit
	sudo apt install rpi-imager
	sudo apt install remmina
	sudo apt install synaptic
	sudo apt install samba
	sudo apt install shotwell
	sudo apt install snapd
	sudo apt install transmission
	sudo apt install tree
	sudo apt install trash-cli
	sudo apt install vlc
	sudo apt install virtualbox
	sudo apt install vim
	sudo apt install vifm
	sudo apt install wireshark
	sudo apt install xterm
	sudo apt install chromium-browser
	sudo apt install gnome-todo
	sudo apt install neovim
	sudo apt install xfce4-terminal
	sudo apt install xfce4-taskmanager
	sudo apt install nsnake
	sudo apt install imagemagick
	sudo apt install monodoc-http
	sudo apt install vim-gtk3
	sudo apt install qtcreator
	sudo apt install qt5-default
	sudo apt install build-essentials
	sudo apt install sqlitebrowser
	
	echo $"\nSTEP 3/20: INSTALL SOFTWARE WITH SNAP"
	sudo snap install anbox --devmode --beta
	sudo snap install atom --classic
	sudo snap install bitwarden
	sudo snap install snap-store
	sudo snap install whatsdesk
	sudo snap install telegram-desktop
	sudo snap install sublime-text
	sudo snap install snapcraft
	sudo snap install robo3t-snap
	sudo snap install ksnip
	sudo snap install mailspring
	sudo snap install telegram-desktop
	sudo snap install vscode
	sudo snap install vscode-insiders
	sudo snap install slack --classic
	sudo snap install emacs --classic	

	echo $'\nAll software installed.' 
}

configuration_files(){
	echo 'STEP 3.1/28: .bashrc config'
        touch $HOME/.bashrc
        echo "set linenumbers" > .bashrc
	source $HOME/.bashrc

	echo 'STEP 3.2/28: .nanorc config'
	touch $HOME/.nanorc
	echo "set linenumbers" > .nanorc
	source $HOME/.nanorc

	echo 'STEP 3.3/28: .bashrc config (exported paths)'
	echo -e '' >> $HOME/.bashrc

	echo 'Obtain list of all installed packages'
	dkpg -l > software_backup_1.txt && cut -d ' ' -f 3 softwares_backup_1.txt > test1.txt
}

install_rabbitvcs() {
	echo 'STEP 4/28: Install RabbitVCS'
	sudo chown -R $USER:$USER ~/.config/rabbitvcs
	sudo add-apt-repository -r ppa:rabbitvcs/ppa
	sudo apt update
	sudo apt install rabbitvcs-nautilus rabbitvcs-core
	nautilus -q
	sudo apt install git
}

install_google_chrome(){
	echo 'STEP 5/28: Install Google Chrome'
	wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
	sudo dpkg -i google-chrome-stable_current_amd64.deb
}

install_mongodb(){
	echo 'STEP 6/28: Install MongoDB'
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

install_servless_framework(){
	echo 'STEP 7/28: Install Servless Framework'
	curl -o-  -L https://ssls.io/install | bash
}

install_brave_web_browser(){
	echo "STEP 8/28: Install Brave Web Browser"
	sudo apt install apt-transport-https curl
	curl -s https://brave-browser-apt-release.s3.brave.com/brave-core.asc | sudo apt-key --keyring /etc/apt/trusted.gpg.d/brave-browser-release.gpg add -
	echo "deb [arch=amd64] https://brave-browser-apt-relase.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list
	sudo apt update
	sudo apt install brave-browser
}

install_docker(){
	echo "STEP 9/28: Install Docker"
	sudo apt-get update
	sudo apt-get install apt-transport-https ca-certificates curl gnupg-agent software-properties-common
	curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
	sudo apt-key fingerprint 0EBFCD88
	sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
	sudo apt update
	sudo apt install docker-ce docker-ce-cli containerd.io
	
	echo 'Run Docker with no root user authorization'
	sudo groupadd docker
	sudo usermod -aG docker $USER
	newgrp docker
	docker run hello-world
}

install_netcore_sdk_aspnetcore_runtime_netcore_runtime(){
	echo "STEP 10/28: Install .NET Core SDK, ASP.NET Core Runtime, .NET Core Runtime"
	sudo apt update
	sudo apt install apt-transport-https dotnet-sdk-3.1 aspnetcore-runtime-3.1 dotnet-runtime-3.1
	sudo apt update
}

install_dart_sdk(){
	echo "STEP 11/28: Install Dart SDK"
	sudo apt update
	sudo apt install apt-transport-https
	sudo sh -c "wget -qO- https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -"
	sudo sh -c "wget -qO- https://storage.googleapis.com/download.dartlang.org/linux/debian/dart_stable.list > /etc/apt/sources.list.d/dart_stable.list"
	sudo apt update
	sudo apt install dart
}

install_nginx_webserver(){
	echo "STEP 12/28: Install Nginx Web Server"
	sudo apt install curl gnupg2 ca-certificates lsb-release
	echo "deb http://nginx.org/packages/ubuntu `lsb_release -cs` nginx" \ | sudo tee /etc/apt/sources.list.d/nginx.list
	curl -fsSL https://nginx.org/keys/nginx_signing.key | sudo apt-key add -
	sudo apt-key fingerprint ABF5BD827BD9BF62
	sudo apt update
	sudo apt install nginx
}

install_monodevelop(){
	echo "STEP 13/28: Install MonoDevelop"
	sudo apt install apt-transport-https dirmngr
	sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
	echo "deb https://download.mono-project.com/repo/ubuntu vs-bionic main" | sudo tee /etc/apt/sources.list.d/mono-official-vs.list
	sudo apt update
	sudo apt install monodevelop
}

install_vnc_viewer(){
	echo 'STEP 14/28: Install VNC Viewer'
	wget https://www.realvnc.com/download/file/viewer.files/VNC-Viewer-6.20.529-Linux-x64.deb
	sudo dpkg -i VNC-Viewer-6.20.259-Linux-x64.deb
}

install_skdman_gradle_groovyconsole(){
	echo 'STEP 15/28: Install SDKMAN, GROOVY'
	curl -s "https://get.sdkman.io" | bash
	source "$HOME/.sdkman/bin/sdkman-init.sh"
	sdk version
	sdk install gradle groovy
}

install_pgadmin4(){
	echo 'STEP 16/28: Install PGADMIN4'
	curl https://www.pgadmin.org/static/packges_pgadmin_org.pub | sudo apt-key add
	sudo sh -c 'echo "deb https://ftp.postgresql.org/pub/pgadmin/pgadmin4/apt/$(lsb_release -cs) pgadmin4 > /etc/apt/sources.list.d/pgadmin4.list && apt update'
	sudo apt install pgadmin
}

install_flutter(){
	echo 'STEP 17/28: Install Flutter SDK'
	file="flutter_linux_1.20.2-stable.tar.xz"
	if [ ! -f "$HOME/Scaricati/$file" ]
	then
		wget https://storage.googleapis.com/flutter_infra/stable/linux/flutter_linux/1.20.2-stable.tar.xz
		tar xf $FILE
	else
		tar xf $FILE
		git clone https://github.com/flutter/flutter.git
	fi
}

install_deno(){
	echo 'STEP 18/28: Install Deno'
	curl -fsSL https://deno.land/x/install/install.sh | sh
}

install_npm_packages(){
	echo 'STEP 19/28: Install NPM Packages'
	sudo npm install -g @angular/cli
	sudo npm install -g @vue/cli
	sudo npm install -g expo-cli
	sudo npm install -g rxjs
	sudo npm install -g typescript
	sudo npm install -g webpack
}

install_snx_reply_vpn(){
	echo 'STEP 20/28: Install SNX for VNP Connection'
	wget -O $HOME/Scaricati/snx_install.sh https://globalssl.enel.com/CSHELL/snx_install.sh
	sudo chmod +x snx_install.sh
	./snx_install
}

install_rust(){
	echo 'STEP 21/28: Install Rust'
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
	## add rust path on .bashrc file and source this file
}

install_anydesk(){
	echo 'STEP 22/28: Install Anydesk'
	wget -qO - https://keys.anydesk.com/repos/DEB-GPG-KEY | apt-key add -
	echo "deb http://deb.anydesk.com/ all main " > /etc/apt/sources.list.d/anydesk-stable.list
	sudo apt update
	sudo apt install anydesk
}

install_jetbrains_toolbox_and_ides(){
	echo 'STEP 23/28: Install Jetbrains-Toolbox, Datagrip 2020.1.2, GoLand 2020.1.2, Intellij Idea Ultimate 2020.1.1, PhpStorm 2020.1.1, PyCharm Professional 2020.1.1, WebStorm 2020.1.1'
	DIRECTORY="$HOME/Scaricati/Softwares"
	FILE="jetbrians_tollbox_1.18.7455.tar.gz"
	mkdir $DIRECTORY
	
	OPT_DIR="/opt/Jetbrains"
	OPT_JETBRAINS_ARCHIVES="/opt/Jetbrains/archives"

	mkdir $OPT_DIR && mkdir $OPT_JETBRAINS_ARCHIVES
	echo 'Jetbrains Toolbox Download'
	wget -O $FILE -P $DIRECTORY https://download.jetbrains.com/toolbox/jetbrains-toolbox-1.18.7455.tar.gz?_ga=2.164586619.572221752.1599036376-684567619.1596303473
	tar -xvzf $FILE
	cd jetrbrains_toolbox_1.18.7455/
	sudo chmod +x jetbrains_toolbox && ./jetbrains_toolbox

	echo 'CLion 2020.1.1 Installation'
	wget -O CLion-2020.1.1.tar.gz -P $OPT_JETBRAINS_ARCHIVES https://download.jetbrains.com/cpp/CLion-2020.1.1.tar.gz?_ga=2.95624540.1133034198.1599037736-163749920.1599037736
	tar -xvzf CLion-2020.1.1.tar.gz && mv clion-2020.1.1/ ../
	cd clion-2020.1.1/bin
	sudo chmod +x clion.sh
	./clion.sh

	echo 'Datagrip 2020.1.2 Installation'
	wget -O datagrip-2020.1.2.tar.gz -P $OPT_JETBRAINS_ARCHIVES https://download.jetbrains.com/datagrip/datagrip-2020.1.2.tar.gz?_ga=2.99891678.1133034198.1599037736-163749920.1599037736
	tar -xvzf datagrip-2020.1.2.tar.gz && mv Datagrip-2020.1.2/ ../
	cd Datagrip-2020.1.2/bin
	sudo chmod +x datagrip.sh
	./datagrip.sh
 
	echo 'GoLand 2020.1.2 Installation'
	echo 'Intellij Idea Ultimate Edition 2020.1.1 Installation'
	echo 'Php Storm 2020.1.1 Installation'
	echo 'PyCharm Professional 2020.1.1 Installation'
	echo 'Web Storm 2020.1.1 Installation'		
}

install_vscodium(){
	echo 'STEP 24/28: Install VSCodium'
	wget -qO - https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg | sudo apt-key add -
	echo "deb https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/repos/debs/ vscodium main" | sudo tee --append /etc/apt/sources.list.d/vscodium.list
	sudo apt update && sudo apt install codium
}

install_firefox_dev_edition(){
	echo 'STEP 25/28: Install Firefox Developer Edition'
	wget -O firefox-81.0b5.tar.bz2 -P /opt https://download.mozilla.org/?product=firefox-devedition-latest-ssl&os=linux64&lang=en-US
	sudo tar xjf firefox-81.0b5.tar.bz2 && sudo rm -rf firefox-81.0b5.tar.bz2
	sudo chown -R $USER /opt/firefox
	echo -e "export PATH=/opt/firefox/firefox:$PATH" >> $HOME/.bashrc
	source $HOME/.bashrc
	sudo nano /usr/share/applications/FirefoxDeveloperEdition.desktop
	
	## paste this
	## [Desktop Entry]
	## Version=1.0
	## Name=Firefox Developer Edition
	## GenericName=Web Browser
	## Exec=/opt/firefox/firefox
	## Terminal=false
	## Icon=/opt/firefox/browser/chrome/icons/default/default128.png
	## Type=Application
	## Categories=Network;WebBrowser;Favorites;
	## MimeType=text/html;text/xml;application/xhtml_xml;x-scheme-handler/http;x-scheme-handler/https;x-scheme-handler/ftp;
	## X-Ayatana-Desktop-Shortcuts=NewWindow;NewIncognito
	sudo cp -rp /usr/share/applications/FirefoxDeveloperEdition.desktop $HOME/Scrivania
	sudo chmod +x FirefoxDeveloperEdition.desktop
}

install_hyper_terminal(){
	echo 'STEP 26/28: Install Hyper Terminal'
	wget -O hyper_3.0.2_amd64.deb -P $HOME/Scaricati/Softwares https://releases.hyper.is/download/deb
	sudo dpkg -i hyper_3.0.2_amd64.deb
}

install_sublime_text(){
	echo 'STEP 26/28: Install Sublime Text'
	wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
	sudo apt-get install apt-transport-https
	echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
	sudo apt update
	sudo apt install sublime-text
}

install_opera(){
	echo 'STEP 27/28: Install Opera Browser'
	wget -O opera-stable_70.0.3728.154_amd64.deb -P $HOME/Scaricati/Software https://download.opera.com/download/get/?partner=www&opsys=Linux
	sudo dpkg -i $HOME/Scaricati/Software/opera-stable_70.0.3728.154_amd64.deb
}

install_github_desktop(){
	echo 'STEP 28/28: Install Github Desktop client'
	wget -qO https://packagecloud.io/shiftkey/desktop/gpgkey | sudo apt-leu add -
	sudo sh -c 'echo "deb [arch=amd64] https://packagecloud.io/shiftkey/desktop/any/ any main" > /etc/apt/sources.list.d/packagecloud-shiftky-desktop.list'
	sudo apt update
	sudo apt install github-desktop
}

install_yarn(){
	curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
	echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
	sudo apt update
	sudo apt install yarn
}

if [1 == 2]
then
	update_and_upgrade_system
	install_software
	install_rabbitvcs
	install_google_chrome
	install_mongodb
	install_servless_framework
	install_brave_web_browser
	install_docker
	install_netcore_sdk_aspnetcore_runtime_netcore_runtime
	install_dart_sdk
	install_nginx_webserver
	install_monodevelop
	install_vnc_viewer
	install_skdman_gradle_groovyconsole
	install_pgadmin4
	install_flutter
	install_deno
	install_npm_packages
	install_snx_reply_vpn
	install_rust
	install_anydesk
	install_jetbrains_toolbox_and_ides
	install_vscodium
	install_firefox_dev_edition
	install_hyper_terminal
	install_sublime_text
	install_opera
	install_github_desktop
	echo 'Installation complete'

	configuration_files
:fi
