[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

export EDITOR=vim st
export TERMCMD=urxvtc
export BROWSER=chromium

xbindkeys &

picom -c &

dwm_status &

feh --bg-tile ~/.config/wallpapers/background.jpg

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
