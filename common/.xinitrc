feh --bg-tile /home/papa/Pictures/tile/1000x1000/0070.jpg

xrandr --output HDMI-0 --primary --output DP-3 --right-of HDMI-0

picom &

while true; do
	dwm > /dev/null 2>&1
done

