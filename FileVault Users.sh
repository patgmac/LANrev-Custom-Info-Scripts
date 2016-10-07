#!/bin/sh

osversionlong=`sw_vers -productVersion`
osvers=$(echo $osversionlong | cut -d. -f2)
if [ $osvers -lt 7 ]; then
	echo "OS not capable of FV2"
	exit 0
fi

echo `fdesetup list | cut -d ',' -f1`

exit 0