#!/bin/sh

# show_loginWindow_field_status.sh
# Checks if loginwindow is set to fields, or icons

lwstatus=`defaults read /Library/Preferences/com.apple.loginwindow SHOWFULLNAME`

if [ $lwstatus == 0 ]; then
	echo "Icons"
elif [ $lwstatus == 1 ]; then
	echo "Name and password fields"
fi
exit 0