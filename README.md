# Patrick's dotfiles
# Stow usage
To quickly move into place and manage my dotfiels I use stow. Instead of copying the files over stow places a link that links back to the file in the cloned git directory. With any new file or structure change just run stow again to add/update the links.  

stow -v -R -t ~ foldertostow  
-t target   
-R (restow, unstow then stow again)  
-v verbose  

#Keyboard shortcuts  
*Programs Launching*  
Mod4 + Shift + c      Web Browser (chromium)  
Mod4 + Shift + b      Web Browser (firefox)  
Mod4 + Shift + f      File Browser (nemo)  
Mod4 + Shift + t      Torrent client (transmission)  
Mod4 + Shift + m      Music player (spotify)  
Mod4 + Shift + ctrl+m Music player (cantata)  
Mod4 + Shift + s      Steam
Mod4 + Shift + d      Discord
Mod4 + Shift + g      Gimp
Mod4 + Shift + o      OBS
Mod4 + Shift + r      DAW (reaper)  
Mod4 + Shift + v      Virtual Machines (virt-manager)  

*other*  
Mod4 + Shift + slash 	Random wallpaper and theme
Mod4 + Shift + period 	Default wallpaper and theme
Mod4 + Shift + x	Power menu

*Media*  
Mod4 + Up		Stop playback  
Mod4 + Down		Play/Pause  
Mod4 + Left		Previous track  
Mod4 + Right		Next track  
Mod4 + Shift + Up	Spotify Stop playback  
Mod4 + Shift + Down	Spotify Play/Pause  
Mod4 + Shift + Left	Spotify Previous track  
Mod4 + Shift + Right	Spotify Next track  
Mod4 + alt + Up		mpd Stop playback  
Mod4 + alt + Down	mpd Play/Pause  
Mod4 + alt + Left	mpd Previous track  
Mod4 + alt + Right	mpd Next track  
Mod4 + ctrl+alt+Up	mpd Volume up
Mod4 + ctrl+alt+Down	mpd Volume down 
Mod4 + Shift+ctrl+Down	Mute toggle

*Window Manager (DWM)*  
Mod4 + d		Launcher (dmenu)  
Mod4 + c		Terminal (st)  
Mod4 + b		Toggle bar  
Mod4 + j		Focus window downstack  
Mod4 + k		Focus window upstack  
Mod4 + Shift + j	Move window downstack  
Mod4 + Shift + k	Move window upstack  
Mod4 + i		Increase master window count  
Mod4 + o		Decrease master window count  
Mod4 + h		Move window split left  
Mod4 + l		Move window split right  
Mod4 + Return		Set window as master  
Mod4 + Tab		Switch to last used tag  
Mod4 + x		Kill the current window  
Mod4 + t		Set layout tiled master  
Mod4 + f		Set layout floating    
Mod4 + m		Set layout monocle  
Mod4 + u		Set layout tiled centered master  
Mod4 + Shift + u	Set layout tiled centered floating master  
Mod4 + space		Switch to last used layout  
Mod4 + Shift + space	Toggle floating on current window  
Mod4 + 0		View windows on all tags  
Mod4 + <num>		View windows on tag <num>  
Mod4 + Shift + 0	Add current window to all tags  
Mod4 + Shift + <num>	Add current window to tag <num>  
Mod4 + p		Set focus down a monitor  
Mod4 + n		Set focus up a monitor  
Mod4 + Shift + p	Move current window down a monitor  
Mod4 + Shift + n	Move current window up a monitor  
Mod4 + F5		Reload colours from .xresources  
Mod4 + minus		Decrease gaps  
Mod4 + equal		Increase gaps  
Mod4 + Shift + equal	Set gaps to zero  
Mod4 + Shift + q	Quit DWM  

#Arch install
- Boot an arch live usb
- Connect to the internet (wifi-menu)
- Partition the disk with fdisk (Swap and UEFI partition if needed)
- Format partitions 'mkfs.ext4 /dev/root_partition'
- Swap setup (if used) 'mkswap /dev/swap_partition' 'swapon /dev/swap_partition'
- Mount root to /mnt and UEFI to /mnt/efi
- Install 'pacstrap /mnt base base-devel linux linux-firmware vim dhcpcd networkmanager wpa_supplicant man-db man-pages git'
- Gernerate fstab 'genfstab -U /mnt >> /mnt/etc/fstab'
- Chroot and finish setup 'arch-chroot /mnt'
- Set timezone 'ln -sf /usr/share/zoneinfo/Region/City /etc/localtime'
- Sync time 'timedatectl set-ntp true' update hardware clock 'hwclock --systohc'
- Set local, uncomment needed lines in /etc/locale.gen then run 'locale-gen'
- Set LANG, edit /etc/locale.conf and add 'LANG=en_US.UTF-8' (or desired language)
- Set keyboard layout, etit /etc/vconsole.conf and add 'KEYMAP=us'
- Set hostname, edit /etc/hostname
- Set hosts, edit /etc/hosts and add lines '127.0.0.1 localhost' '::1 localhost'
- Set root password run 'passwd'
- Install grub 'pacman -S grub' then follow setup on the wiki
- Reboot
- Setup network 'systemctl enable NetworkManager.service' 'systemctl start NetworkManager.service' 'nmtui'
- User setup 'useradd -m -g wheel <username>' 'passwd <username>' edit /etc/sudoers so wheel can use sudo
- At this point install a DE or do whatever
- I grab my dotfiles and install a few packages

#Packages I use  
 *Desktop environment*
- git stow xorg-server xorg-xinit xorg-xsetroot xbindkeys dmenu picom feh noto-fonts python-pywal
- .conf https://github.com/paddy3450/dotfiles
- dwm https://github.com/paddy3450/dwm
- st https://github.com/paddy3450/st  
*Then the following as needed*
- acpi
- atool zip gzip p7zip
- blender
- calibre
- cantata
- cava
- chromium
- discord
- firefox
- gimp
- htop
- inkscape
- kdenlive
- libreoffice-fresh
- mpc
- mpd
- mpv
- ncmpcpp
- nemo nemo-fileroller
- neofetch
- neovim
- network-manager-applet networkmanager networkmanager-openvpn openvpn
- nnn
- npm
- obs-studio obs-ndi obs-v4l2sink v4l2loopback-dkms
- openssh
- pandoc
- playerctl
- pulseaudio pulseaudio-alsa pamixer alsa-utils
- pyright python-pandas python-pynvim
- qemu
- qmk
- rclone
- steam
- teams teamspeak3
- texlive-most biber
- tmux
- transmission-gtk transmission-cli
- vert-manager
- vlc
- wmname
- xournalpp
- youtube-dl
- zathura zathura-pdf-mupdf zathura-djvu
- lxappearance
- arc-solid-gtk-theme materia-gtk-theme adapta-gtk-theme
- papirus-icon-theme
*AUR*
- expressvpn
- plex-media-server
- reaper-bin carla
- spotify
- vscodium-bin
- yay 
- zoom
