#!/bin/bash

AUTOLOGIN=`defaults read /Library/Preferences/com.apple.loginwindow autoLoginUser 2> /dev/null`

if [ -n "$AUTOLOGIN" ] ; then
	echo "Yes"
else
	echo "No"
fi