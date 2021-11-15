[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

export EDITOR=vim st
export TERMCMD=urxvtc
export BROWSER=chromium

xbindkeys &

picom -c &

dwm_status &

[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

feh --bg-tile ~/.config/wallpapers/background.jpg
defaultTheme

if grep -q 'LittleBao' /etc/hostname; then
	setxkbmap -option caps:escape
fi

if grep -q 'BigPapa' /etc/hostname; then
	while true; do
		xrnadr --dpi 96
		monitors
		dwm > /dev/null 2>&1
		monitors
	done
fi

while true; do
	dwm > /dev/null 2>&1
done
