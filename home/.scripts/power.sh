#!/bin/bash
action=$(echo -e "CANCEL\nSHUTDOWN\nREBOOT\nHIBERNATE\nSUSPEND\nKILLX" | dmenu)
if [[ $action = "SHUTDOWN" ]];then
	systemctl poweroff
elif [[ $action = "REBOOT" ]];then
	systemctl reboot
elif [[ $action = "HIBERNATE" ]];then
	systemctl hybernate
elif [[ $action = "SUSPEND" ]];then
	systemctl suspend
elif [[ $action = "KILLX" ]];then
	killall xinit
fi
