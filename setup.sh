#!/bin/bash

user_name="$USER"

cd ~
if [ ! -e ~/dotfiles ]; then
	git clone http://github.com/paddy3450/dotfiles
	echo "cloning dotfiles repo"
fi

# environment detection
if [ -f /etc/arch-release ]; then
	export MY_INSTALLER="pacman"
	export MY_INSTALL="-S --needed"
	# export MY_INSTALL="-S --noconfirm --needed"
	echo "System update..."
	sudo $MY_INSTALLER -Syu --noconfirm
elif [ command -v apt-get ]; then
	export MY_INSTALLER="apt-get"
	export MY_INSTALL="-qq install"
	echo "System update..."
	sudo $MY_INSTALLER update
elif [ command -v dnf ]; then
	export MY_INSTALLER="dnf"
	export MY_INSTALL="-y install"
	echo "System update..."
	sudo $MY_INSTALLER -y update
fi

function stow_dotfiles(){
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
}

 
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
		echo "cloning Minecraft from AUR"
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
sudo $MY_INSTALLER $MY_INSTALL 7zip
sudo $MY_INSTALLER $MY_INSTALL grep ripgrep
sudo $MY_INSTALLER $MY_INSTALL htop
sudo $MY_INSTALLER $MY_INSTALL btop
# sudo $MY_INSTALLER $MY_INSTALL mpc
# sudo $MY_INSTALLER $MY_INSTALL mpd
sudo $MY_INSTALLER $MY_INSTALL mpv
# sudo $MY_INSTALLER $MY_INSTALL ncmpcpp
sudo $MY_INSTALLER $MY_INSTALL vim
sudo $MY_INSTALLER $MY_INSTALL neovim
sudo $MY_INSTALLER $MY_INSTALL fastfetch
sudo $MY_INSTALLER $MY_INSTALL network-manager-applet
sudo $MY_INSTALLER $MY_INSTALL networkmanager
sudo $MY_INSTALLER $MY_INSTALL networkmanager-openvpn
sudo $MY_INSTALLER $MY_INSTALL openvpn
sudo $MY_INSTALLER $MY_INSTALL nnn
sudo $MY_INSTALLER $MY_INSTALL tmux
sudo $MY_INSTALLER $MY_INSTALL rclone
# sudo $MY_INSTALLER $MY_INSTALL vlc
# sudo $MY_INSTALLER $MY_INSTALL wmname
sudo $MY_INSTALLER $MY_INSTALL openssh
sudo $MY_INSTALLER $MY_INSTALL cava
sudo $MY_INSTALLER $MY_INSTALL playerctl
sudo $MY_INSTALLER $MY_INSTALL pandoc
sudo $MY_INSTALLER $MY_INSTALL pipewire helvum pipewire-audio pipewire-pulse pipewire-alsa pamixer alsa-utils pavucontrol
sudo $MY_INSTALLER $MY_INSTALL bluez bluez-utils blueberry
sudo $MY_INSTALLER $MY_INSTALL pyright python-pynvim
# sudo $MY_INSTALLER $MY_INSTALL python-pandas
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
sudo $MY_INSTALLER $MY_INSTALL noto-fonts ttf-noto-nerd ttc-iosevka
sudo $MY_INSTALLER $MY_INSTALL python-pywal
sudo $MY_INSTALLER $MY_INSTALL nemo
sudo $MY_INSTALLER $MY_INSTALL nemo-fileroller
sudo $MY_INSTALLER $MY_INSTALL lxappearance
sudo $MY_INSTALLER $MY_INSTALL arc-solid-gtk-theme materia-gtk-theme adapta-gtk-theme
sudo $MY_INSTALLER $MY_INSTALL papirus-icon-theme
sudo $MY_INSTALLER $MY_INSTALL transmission-gtk transmission-cli
sudo $MY_INSTALLER $MY_INSTALL alacritty
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
# graphical drivers
sudo $MY_INSTALLER $MY_INSTALL mesa
sudo $MY_INSTALLER $MY_INSTALL lib32-glu
sudo $MY_INSTALLER $MY_INSTALL lib32-nvidia-utils
sudo $MY_INSTALLER $MY_INSTALL lib32-vulkan-radeon
sudo $MY_INSTALLER $MY_INSTALL vulkan-intel
sudo $MY_INSTALLER $MY_INSTALL rocm-smi-lib #allow GPU details to be shown in btop (AMD)
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
sudo $MY_INSTALLER $MY_INSTALL arandr
}

function install_xfce4() {
#xfce
sudo $MY_INSTALLER $MY_INSTALL xfce4 xfce4-goodies
}

function install_cosmic() {
#cosmic
sudo $MY_INSTALLER $MY_INSTALL cosmic-session cosmic-terminal
}

function install_hyprland() {
#Hyprland
sudo $MY_INSTALLER $MY_INSTALL hyprland hyprpaper waybar wofi
sudo $MY_INSTALLER $MY_INSTALL cmake meson cpio pkg-config git gcc
hyprpm update
hyprpm add https://github.com/Duckonaut/split-monitor-workspaces # Add the plugin repository
hyprpm enable split-monitor-workspaces # Enable the plugin
hyprpm reload # Reload the plugins
hyprpm update
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
sudo $MY_INSTALLER $MY_INSTALL steam
sudo $MY_INSTALLER $MY_INSTALL discord
sudo $MY_INSTALLER $MY_INSTALL texlive-most biber
sudo $MY_INSTALLER $MY_INSTALL xournalpp
sudo $MY_INSTALLER $MY_INSTALL youtube-dl
sudo $MY_INSTALLER $MY_INSTALL cardinal
}

function install_audio_production() {
# DAW and audio production
# a subsection of the pro-audio arch package group
sudo $MY_INSTALLER $MY_INSTALL reaper
sudo $MY_INSTALLER $MY_INSTALL amsynth amsynth-common amsynth-standalone
# sudo $MY_INSTALLER $MY_INSTALL bespokesynth
# sudo $MY_INSTALLER $MY_INSTALL musescore
sudo $MY_INSTALLER $MY_INSTALL calf
sudo $MY_INSTALLER $MY_INSTALL cardinal-clap cardinal-lv2 cardinal-standalone cardinal-vst cardinal-vst3
sudo $MY_INSTALLER $MY_INSTALL carla
sudo $MY_INSTALLER $MY_INSTALL dexed dexed-standalone dexed-vst3 dexed-vst
sudo $MY_INSTALLER $MY_INSTALL dpf-plugins-lv2 dpf-plugins-vst dpf-plugins-vst3
sudo $MY_INSTALLER $MY_INSTALL dragonfly-reverb-lv2 dragonfly-reverb-standalone dragonfly-reverb-vst dragonfly-reverb-vst3
sudo $MY_INSTALLER $MY_INSTALL drumkv1-lv2 drumkv1-standalone
sudo $MY_INSTALLER $MY_INSTALL guitarx
sudo $MY_INSTALLER $MY_INSTALL iempluginsuite-vst3
sudo $MY_INSTALLER $MY_INSTALL infamousplugins
sudo $MY_INSTALLER $MY_INSTALL jc303-common jc303-lv2 jc303-vst3
sudo $MY_INSTALLER $MY_INSTALL mcp-plugins
sudo $MY_INSTALLER $MY_INSTALL ob-xd ob-xd-common ob-xd-lv2 ob-xd-standalone ob-xd-vst3
sudo $MY_INSTALLER $MY_INSTALL odin2-synthesizer odin2-synthesizer-clap odin2-synthesizer-common odin2-synthesizer-lv2 odin2-synthesizer-standalone odin2-synthesizer-vst3
sudo $MY_INSTALLER $MY_INSTALL opl-synth
sudo $MY_INSTALLER $MY_INSTALL opnplug-lv2 opnplug-standalone opnplug-vst
sudo $MY_INSTALLER $MY_INSTALL ot-cryptid-clap ot-cryptid-docs ot-cryptid-standalone ot-cryptid-vst3 ot-simian-docs ot-simian-lv2 ot-simian-vst3 ot-urchin-clap ot-urchin-docs ot-urchin-standalone ot-urchin-vst3
sudo $MY_INSTALLER $MY_INSTALL padthv1-lv2 padthv1-standalone 
sudo $MY_INSTALLER $MY_INSTALL surge-xt surge-xt-clap surge-xt-common surge-xt-standalone surge-xt-vst3
sudo $MY_INSTALLER $MY_INSTALL synthv1-lv2 synthv1-standalone
sudo $MY_INSTALLER $MY_INSTALL tembro
sudo $MY_INSTALLER $MY_INSTALL yass
sudo $MY_INSTALLER $MY_INSTALL yoshimi-lv2 yoshimi-standalone
sudo $MY_INSTALLER $MY_INSTALL zam-plugins-clap zam-plugins-ladspa zam-plugins-lv2 zam-plugins-vst zam-plugins-vst3
}

function install_virtual_machines() {
# Virtual machines
sudo $MY_INSTALLER $MY_INSTALL virt-manager
sudo $MY_INSTALLER $MY_INSTALL qemu
sudo $MY_INSTALLER $MY_INSTALL dnsmasq
sudo usermod -aG libvirt $user_name
echo "Enable libvirtd socket and service Y/N"
read -r enable_libvirtd
case $enable_libvirtd in
	y)
	systemctl enable libvirtd.service
	systemctl enable libvirtd.service
	systemctl enable libvirtd.socket
	systemctl start libvirtd.socket ;;
	*) ;;
esac
}

function menu() {
	read -n 1 -r -s -p $"Press any key to continue...."
	clear
	echo -ne "
		s)put dotfiles in place with STOW
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
		12)install audio production programs and plugins
		13)install Cosmic Desktop and cosmic apps
		14)install Hyprland and waybar
		0) Exit
	"
	read -r ans
	case $ans in
		s)stow_dotfiles ; menu ;;
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
		12)install_audio_production ; menu ;;
		13)install_cosmic; menu ;;
		14)install_hyprland; menu ;;
		*) exit 0 ;;
	esac
}

menu

##expressvpn
##reaper-bin carla
##spotify
##vscodium-bin
##yay
