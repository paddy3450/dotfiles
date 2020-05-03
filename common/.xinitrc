[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

feh --bg-tile /home/papa/dotfiles/common/background.jpg

xbindkeys &

picom &

dwm_status &

while true; do
	dwm > /dev/null 2>&1
done

