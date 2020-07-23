[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

feh --bg-tile ~/.config/wallpapers/background.jpg

xbindkeys &

picom &

dwm_status &

if grep -q 'BigPapa' /etc/hostname; then
	while true; do

		monitors
		dwm > /dev/null 2>&1
	done
fi

while true; do
	dwm > /dev/null 2>&1
done
