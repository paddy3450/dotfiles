# Patrick's dotfiles
# Stow usage
To quickly move into place and manage my dotfiels I use stow. Instead of copying the files over stow places a link that links back to the file in the cloned git directory. With any new file or structure change just run stow again to add/update the links.  

stow -v -R -t ~ foldertostow  
-t target   
-R (restow, unstow then stow again)  
-v verbose  

#Keyboard shortcuts  
*Programs Launching*  
Mod4 + Shift + c	      Web Browser (chromium)  
Mod4 + Shift + f	      File Browser (nemo)  
Mod4 + Shift + t	      Torrent client (transmission)  
Mod4 + Shift + m	      Music player (Spotify)  
Mod4 + Shift + s	      Steam  
Mod4 + Shift + d	      Discord  
Mod4 + Shift + g	      Gimp  
Mod4 + Shift + b	      OBS  
Mod4 + Shift + r	      DAW (reaper)  

*other*  
Shift+Mod4+slash 	Random wallpaper and theme

*Media*  
Mod4 + Up		Stop playback  
Mod4 + Down		Play/Pause  
Mod4 + Left		Previous track  
Mod4 + Right		Next track  

*Window Manager (DWM)*  
Mod4 + d		Launcher (dmenu)  
Mod4 + c		Terminal (st)  
Mod4 + b		Toggle bar  
Mod4 + j		Focus window downstack  
Mod4 + k		Focus window upstack  
Mod4 + i		Increase master window count  
Mod4 + o		Decrease master window count  
Mod4 + h		Move window split left  
Mod4 + l		Move window split right  
Mod4 + Return		Set window as master  
Mod4 + Tab		Swithch to last used tag  
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
Mod4 + Shift + 0	Add currnet window to all tags  
Mod4 + Shift + <num>	Add currnet window to tag <num>  
Mod4 + p		Set foucs down a monitor  
Mod4 + n		Set foucs up a monitor  
Mod4 + Shift + p	Move current window down a monitor  
Mod4 + Shift + n	Move current window up a monitor  
Mod4 + F5		Reload colours from .xresources  
Mod4 + minus		Decrease gaps  
Mod4 + equal		Increase gaps  
Mod4 + Shift + equal	Set gaps to zero  
Mod4 + Shift + q	Quit DWM  
