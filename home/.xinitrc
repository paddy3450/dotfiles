[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

export EDITOR=vim st
export TERMCMD=urxvtc
export BROWSER=firefox

dbus-update-activation-environment --all
gnome-keyring-daemon --start --components=secrets

xbindkeys &

picom -c &

dwm_status &

[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

feh --bg-tile ~/.config/wallpapers/background.jpg
defaultTheme

if grep -q 'LittleBao' /etc/hostname; then
	setxkbmap -option caps:escape
fi

setxkbmap -option compose:ralt

if grep -q 'BigPapa' /etc/hostname; then
	while true; do
		monitors
		dwm > /dev/null 2>&1
		monitors
	done
fi

while true; do
	dwm > /dev/null 2>&1
done
