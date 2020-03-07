feh --bg-tile /home/papa/dotfiles/common/background.jpg

xrandr --output HDMI-0 --primary --output DP-3 --right-of HDMI-0

picom &

while true; do
	dwm > /dev/null 2>&1
done

