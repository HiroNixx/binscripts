#!/bin/bash

banner() {
	echo "[+] Beginning Install"


}

ubuntu_install() {
	echo "[+] Ubuntu Specific Apps"
	#Some useful apps
	sudo apt update && sudo apt upgrade
	sudo apt install mc virtualbox gufw libreoffice transmission-gtk deja-dup vlc vim  



	echo "[+] Enpass Install"
	#Enpass Install
	sudo echo "deb https://apt.enpass.io/ stable main" > \
	  /etc/apt/sources.list.d/enpass.list
	sudo wget -O - https://apt.enpass.io/keys/enpass-linux.key | apt-key add -
	sudo apt-get update
	sudo apt-get install enpass
	

	echo "[+] VSCodium Install"
	#VSCodium Install
	curl -s https://api.github.com/repos/VSCodium/vscodium/releases/latest | grep "browser_download_url.*amd64.deb" | cut -d : -f 2,3 | tr -d \" | wget -qi -
	sudo dpkg -i *.deb
	rm *.deb
	

	echo "[+] Slimbook Battery Install"
	sudo add-apt-repository ppa:slimbook/slimbook
	sudo apt install slimbookbattery

}


all_distros () {
	echo "[+] OS Indepedant Apps"
	#Joplin install
	wget -O - https://raw.githubusercontent.com/laurent22/joplin/dev/Joplin_install_and_update.sh | bash

}


main () {
	$(ubuntu_install)
	$(all_distros)
	
	
	echo "[+] Installation Completed Complete"
}

$(main)
