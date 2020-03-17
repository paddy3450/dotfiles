feh --bg-tile /home/papa/dotfiles/common/background.jpg

picom &

dwm_status &

while true; do
	dwm > /dev/null 2>&1
done

