#!/bin/bash
action=$(echo -e "CANCEL\nSHUTDOWN\nREBOOT\nHIBERNATE\nSUSPEND" | dmenu)
if [[ $action = "SHUTDOWN" ]];then
	systemctl poweroff
elif [[ $action = "REBOOT" ]];then
	systemctl reboot
elif [[ $action = "HIBERNATE" ]];then
	systemctl hybernate
elif [[ $action = "SUSPEND" ]];then
	systemctl suspend
fi
