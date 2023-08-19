#!/bin/bash
cd ~
if [[ ! -d "~/dotfiles" ]]; then
	git clone http://github.com/paddy3450/dotfiles
fi
if [[ ! -d "~/Programs" ]]; then
	mkdir "~/Programs"
fi
if [[ ! -d "~/Programs/dwm" ]]; then
	cd ~/Programs
	git clone http://github.com/paddy3450/dwm
	cd ~
fi
if [[ ! -d "~/Programs/st" ]]; then
	cd ~/Programs
	git clone http://github.com/paddy3450/st
	cd ~
fi

# Move config files in using stow
if [[ -f "~/.bashrc" && [! -L "~/.bashrc"]]]; then
	mv ~/.bashrc ~/.bashrc.backup
fi
if [[ -f ~/.bash_profile  && [! -L ~/.bash_profile]]]; then
	mv ~/.bash_profile ~/.bash_profile.backup
fi
cd ~/dotfiles
stow -v -R -t ~ home  
cd ~

# environment detection
if [ -f /etc/arch-release ]; then
	export MY_INSTALLER="pacman"
	expoft MY_INSTALL="-S --noconfirm"
	MY_INSTALLER -Syu --noconfirm
elif [ command -v apt-get ]; then
	export MY_INSTALLER="apt-get"
	expoft MY_INSTALL="-qq install"
	MY_INSTALLER update
elif [ command -v dnf ]; then
	export MY_INSTALLER="dnf"
	expoft MY_INSTALL="-y install"
	MY_INSTALLER -y update
fi
 

# install programs 
# utility
MY_INSTALLER MY_INSTALL git
MY_INSTALLER MY_INSTALL sed
MY_INSTALLER MY_INSTALL stow
MY_INSTALLER MY_INSTALL feh 
MY_INSTALLER MY_INSTALL atool 
MY_INSTALLER MY_INSTALL zip 
MY_INSTALLER MY_INSTALL gzip 
MY_INSTALLER MY_INSTALL p7zip
MY_INSTALLER MY_INSTALL htop
MY_INSTALLER MY_INSTALL btop
MY_INSTALLER MY_INSTALL mpc
MY_INSTALLER MY_INSTALL mpd
MY_INSTALLER MY_INSTALL mpv
MY_INSTALLER MY_INSTALL ncmpcpp
MY_INSTALLER MY_INSTALL vim
MY_INSTALLER MY_INSTALL neofetch
MY_INSTALLER MY_INSTALL neovim
MY_INSTALLER MY_INSTALL network-manager-applet 
MY_INSTALLER MY_INSTALL networkmanager 
MY_INSTALLER MY_INSTALL networkmanager-openvpn 
MY_INSTALLER MY_INSTALL openvpn
MY_INSTALLER MY_INSTALL nnn
MY_INSTALLER MY_INSTALL tmux
MY_INSTALLER MY_INSTALL rclone
MY_INSTALLER MY_INSTALL vlc
MY_INSTALLER MY_INSTALL wmname
MY_INSTALLER MY_INSTALL openssh
MY_INSTALLER MY_INSTALL cava
MY_INSTALLER MY_INSTALL playerctl
MY_INSTALLER MY_INSTALL pulseaudio pulseaudio-alsa pamixer alsa-utils pavumixer blueberry
MY_INSTALLER MY_INSTALL pyright python-pandas python-pynvim
MY_INSTALLER MY_INSTALL pandoc
#utility graphical
MY_INSTALLER MY_INSTALL zathura zathura-pdf-mupdf zathura-djvu
MY_INSTALLER MY_INSTALL noto-fonts 
MY_INSTALLER MY_INSTALL python-pywal
MY_INSTALLER MY_INSTALL nemo 
MY_INSTALLER MY_INSTALL nemo-fileroller
MY_INSTALLER MY_INSTALL lxappearance
MY_INSTALLER MY_INSTALL arc-solid-gtk-theme materia-gtk-theme adapta-gtk-theme
MY_INSTALLER MY_INSTALL papirus-icon-theme
MY_INSTALLER MY_INSTALL transmission-gtk transmission-cli
MY_INSTALLER MY_INSTALL arandr

# laptop
MY_INSTALLER MY_INSTALL acpi

# graphical drivers
MY_INSTALLER MY_INSTALL mesa
MY_INSTALLER MY_INSTALL lib32-glu
MY_INSTALLER MY_INSTALL lib32-nvidia-utils
MY_INSTALLER MY_INSTALL lib32-vulkan-radeon

#X desktop
MY_INSTALLER MY_INSTALL xorg-server 
MY_INSTALLER MY_INSTALL xorg-xinit 
MY_INSTALLER MY_INSTALL xorg-xsetroot 
MY_INSTALLER MY_INSTALL xbindkeys 
MY_INSTALLER MY_INSTALL dmenu 
MY_INSTALLER MY_INSTALL picom 

#xfce
MY_INSTALLER MY_INSTALL xfce4 xfce4-goodies

#applications
MY_INSTALLER MY_INSTALL blender
MY_INSTALLER MY_INSTALL calibre
MY_INSTALLER MY_INSTALL cantata
MY_INSTALLER MY_INSTALL chromium
MY_INSTALLER MY_INSTALL discord
MY_INSTALLER MY_INSTALL firefox
MY_INSTALLER MY_INSTALL gimp
MY_INSTALLER MY_INSTALL inkscape
MY_INSTALLER MY_INSTALL kdenlive
MY_INSTALLER MY_INSTALL libreoffice-fresh
MY_INSTALLER MY_INSTALL obs-studio 
MY_INSTALLER MY_INSTALL qmk
MY_INSTALLER MY_INSTALL steam-ntive-runtime
MY_INSTALLER MY_INSTALL texlive-most biber
MY_INSTALLER MY_INSTALL xournalpp
MY_INSTALLER MY_INSTALL youtube-dl
# Virtual machines
MY_INSTALLER MY_INSTALL vert-manager
MY_INSTALLER MY_INSTALL qemu

#expressvpn
#reaper-bin carla
#spotify
#vscodium-bin
#yay 
