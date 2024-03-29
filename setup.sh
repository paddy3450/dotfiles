#!/bin/bash

cd ~
if [ ! -e ~/dotfiles ]; then
	git clone http://github.com/paddy3450/dotfiles
	echo "cloning dotfiles repo"
fi

# environment detection
if [ -f /etc/arch-release ]; then
	export MY_INSTALLER="pacman"
	export MY_INSTALL="-S --noconfirm --needed"
	$MY_INSTALLER -Syu --noconfirm
elif [ command -v apt-get ]; then
	export MY_INSTALLER="apt-get"
	export MY_INSTALL="-qq install"
	$MY_INSTALLER update
elif [ command -v dnf ]; then
	export MY_INSTALLER="dnf"
	export MY_INSTALL="-y install"
	$MY_INSTALLER -y update
fi

# Move config files in using stow
if [ -e ~/.bashrc ] && [ ! -L ~/.bashrc ]; then
	mv ~/.bashrc ~/.bashrc.backup
fi
if [ -e ~/.bash_profile ] && [ ! -L ~/.bash_profile ]; then
	mv ~/.bash_profile ~/.bash_profile.backup
fi
cd ~/dotfiles
stow -v -R -t ~ home  
cd ~

 
function install_dwm(){
	if [ ! -e ~/Programs ]; then
		mkdir Programs
		echo "MAKING PROGRAMS FOLDER"
	fi
	if [ ! -e ~/Programs/dwm ]; then
		cd ~/Programs
		echo "cloning DWM from github"
		git clone http://github.com/paddy3450/dwm
		cd ~/Programs/dwm
		sudo make clean install
		cd ~
	fi
}

function install_st(){
	if [ ! -e ~/Programs ]; then
		mkdir Programs
		echo "MAKING PROGRAMS FOLDER"
	fi
	if [ ! -e ~/Programs/st ]; then
		cd ~/Programs
		echo "cloning ST from github"
		git clone http://github.com/paddy3450/st
		cd ~/Programs/st
		sudo make clean install
		cd ~
	fi
}

function install_minecraft(){
	if [ ! -e ~/Programs ]; then
		mkdir Programs
		echo "MAKING PROGRAMS FOLDER"
	fi
	if [ ! -e ~/Programs/minecraft-launcher ]; then
		cd ~/Programs
		echo "cloning ST from github"
		git clone https://aur.archlinux.org/minecraft-launcher.git
		cd ~/Programs/minecraft-launcher
		makepkg -si
		cd ~
		sudo $MY_INSTALLER $MY_INSTALL gnome-keyring
	fi
}


# install programs 
function install_base_utility() {
# utility
sudo $MY_INSTALLER $MY_INSTALL git
sudo $MY_INSTALLER $MY_INSTALL sed
sudo $MY_INSTALLER $MY_INSTALL stow
sudo $MY_INSTALLER $MY_INSTALL feh 
sudo $MY_INSTALLER $MY_INSTALL atool 
sudo $MY_INSTALLER $MY_INSTALL zip 
sudo $MY_INSTALLER $MY_INSTALL gzip 
sudo $MY_INSTALLER $MY_INSTALL p7zip
sudo $MY_INSTALLER $MY_INSTALL htop
sudo $MY_INSTALLER $MY_INSTALL btop
sudo $MY_INSTALLER $MY_INSTALL mpc
sudo $MY_INSTALLER $MY_INSTALL mpd
sudo $MY_INSTALLER $MY_INSTALL mpv
sudo $MY_INSTALLER $MY_INSTALL ncmpcpp
sudo $MY_INSTALLER $MY_INSTALL vim
sudo $MY_INSTALLER $MY_INSTALL neofetch
sudo $MY_INSTALLER $MY_INSTALL neovim
if [ ! -e ~/.local/share/nvim/site/pack/packer/start/packer.nvim ]; then
	git clone --depth 1 https://github.com/wbthomason/packer.nvim\
		 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
fi
sudo $MY_INSTALLER $MY_INSTALL network-manager-applet 
sudo $MY_INSTALLER $MY_INSTALL networkmanager 
sudo $MY_INSTALLER $MY_INSTALL networkmanager-openvpn 
sudo $MY_INSTALLER $MY_INSTALL openvpn
sudo $MY_INSTALLER $MY_INSTALL nnn
sudo $MY_INSTALLER $MY_INSTALL tmux
sudo $MY_INSTALLER $MY_INSTALL rclone
sudo $MY_INSTALLER $MY_INSTALL vlc
sudo $MY_INSTALLER $MY_INSTALL wmname
sudo $MY_INSTALLER $MY_INSTALL openssh
sudo $MY_INSTALLER $MY_INSTALL cava
sudo $MY_INSTALLER $MY_INSTALL playerctl
sudo $MY_INSTALLER $MY_INSTALL pandoc
sudo $MY_INSTALLER $MY_INSTALL pulseaudio pulseaudio-alsa pamixer alsa-utils pavucontrol bluez blueberry
sudo $MY_INSTALLER $MY_INSTALL pyright python-pandas python-pynvim
echo "Enable bluetooth service Y/N"
read -r enable_bluetooth
case $enable_bluetooth in
	y)
	systemctl enable bluetooth.service
	systemctl start bluetooth.service ;;
	*) ;;
esac
}

function install_graphical_utility() {
##utility graphical
sudo $MY_INSTALLER $MY_INSTALL zathura zathura-pdf-mupdf zathura-djvu
sudo $MY_INSTALLER $MY_INSTALL noto-fonts 
sudo $MY_INSTALLER $MY_INSTALL python-pywal
sudo $MY_INSTALLER $MY_INSTALL nemo 
sudo $MY_INSTALLER $MY_INSTALL nemo-fileroller
sudo $MY_INSTALLER $MY_INSTALL lxappearance
sudo $MY_INSTALLER $MY_INSTALL arc-solid-gtk-theme materia-gtk-theme adapta-gtk-theme
sudo $MY_INSTALLER $MY_INSTALL papirus-icon-theme
sudo $MY_INSTALLER $MY_INSTALL transmission-gtk transmission-cli
sudo $MY_INSTALLER $MY_INSTALL arandr
}

function install_laptop_utilities() {
# laptop
sudo $MY_INSTALLER $MY_INSTALL acpi
sudo $MY_INSTALLER $MY_INSTALL sof-firmware
sudo $MY_INSTALLER $MY_INSTALL brightnessctl
sudo $MY_INSTALLER $MY_INSTALL xf86-input-synaptics
	if [ ! -f /etc/X11/xorg.conf.d/70-synaptics.conf ]; then
		sudo echo \
'Section "InputClass"
    Identifier "touchpad"
    Driver "synaptics"
    MatchIsTouchpad "on"
        Option "TapButton1" "1"
        Option "TapButton2" "3"
        Option "TapButton3" "2"
        Option "VertEdgeScroll" "on"
        Option "VertTwoFingerScroll" "on"
        Option "HorizEdgeScroll" "on"
        Option "HorizTwoFingerScroll" "on"
        Option "CircularScrolling" "on"
        Option "CircScrollTrigger" "2"
        Option "EmulateTwoFingerMinZ" "40"
        Option "EmulateTwoFingerMinW" "8"
        Option "CoastingSpeed" "0"
        Option "FingerLow" "30"
        Option "FingerHigh" "50"
        Option "MaxTapTime" "125"
        Option "PalmDetect" "1"
EndSection' | sudo tee /etc/X11/xorg.conf.d/70-synaptics.conf
	fi
}

function install_graphics_drivers() {
	echo "hello";
## graphical drivers
#sudo $MY_INSTALLER $MY_INSTALL mesa
#sudo $MY_INSTALLER $MY_INSTALL lib32-glu
#sudo $MY_INSTALLER $MY_INSTALL lib32-nvidia-utils
#sudo $MY_INSTALLER $MY_INSTALL lib32-vulkan-radeon
#sudo $MY_INSTALLER $MY_INSTALL vulkan-intel
}

function install_xorg() {
#X desktop
sudo $MY_INSTALLER $MY_INSTALL xorg-server 
sudo $MY_INSTALLER $MY_INSTALL xorg-xinit 
sudo $MY_INSTALLER $MY_INSTALL xorg-xsetroot 
sudo $MY_INSTALLER $MY_INSTALL xbindkeys 
sudo $MY_INSTALLER $MY_INSTALL xclip 
sudo $MY_INSTALLER $MY_INSTALL dmenu 
sudo $MY_INSTALLER $MY_INSTALL picom 
}

function install_xfce4() {
#xfce
sudo $MY_INSTALLER $MY_INSTALL xfce4 xfce4-goodies
}

function install_main_gui_programs() {
#applications
#sudo $MY_INSTALLER $MY_INSTALL blender
#sudo $MY_INSTALLER $MY_INSTALL calibre
#sudo $MY_INSTALLER $MY_INSTALL cantata
#sudo $MY_INSTALLER $MY_INSTALL chromium
sudo $MY_INSTALLER $MY_INSTALL discord
sudo $MY_INSTALLER $MY_INSTALL firefox
sudo $MY_INSTALLER $MY_INSTALL gimp
#sudo $MY_INSTALLER $MY_INSTALL inkscape
##sudo $MY_INSTALLER $MY_INSTALL kdenlive
sudo $MY_INSTALLER $MY_INSTALL libreoffice-fresh
sudo $MY_INSTALLER $MY_INSTALL rawtherapee
sudo $MY_INSTALLER $MY_INSTALL obs-studio 
##sudo $MY_INSTALLER $MY_INSTALL qmk
echo "ENABLE MULTI LIB IN /etc/pacman.conf"
sudo $MY_INSTALLER $MY_INSTALL steam-native-runtime
sudo $MY_INSTALLER $MY_INSTALL discord
sudo $MY_INSTALLER $MY_INSTALL texlive-most biber
sudo $MY_INSTALLER $MY_INSTALL xournalpp
sudo $MY_INSTALLER $MY_INSTALL reaper
sudo $MY_INSTALLER $MY_INSTALL youtube-dl
}

function install_virtual_machines() {
	echo "hello";
# Virtual machines
##sudo $MY_INSTALLER $MY_INSTALL vert-manager
##sudo $MY_INSTALLER $MY_INSTALL qemu
}

function menu() {
	read -n 1 -r -s -p $"Press any key to continue...."
	clear
	echo -ne "
		1)install base utility
		2)install graphics drivers
		3)install laptop utilities
		4)install xorg
		5)install st
		6)install dwm
		7)install graphical utility
		8)install xfce4
		9)install main gui_programs
		10)install virtual machines
		11)install minecraft
		0) Exit
	"
	read -r ans
	case $ans in
		1)install_base_utility ; menu ;;
		2)install_graphics_drivers; menu ;;
		3)install_laptop_utilities ; menu ;;
		4)install_xorg ; menu ;;
		5)install_st ; menu ;;
		6)install_dwm ; menu ;;
		7)install_graphical_utility ; menu ;;
		8)install_xfce4 ; menu ;;
		9)install_main_gui_programs ; menu ;;
		10)install_virtual_machines ; menu ;;
		11)install_minecraft ; menu ;;
		*) exit 0 ;;
	esac
}

menu

##expressvpn
##reaper-bin carla
##spotify
##vscodium-bin
##yay 

