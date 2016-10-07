#!/bin/bash

# THIS IS NOT AN "INFO" ITEM. 
# IT WILL MODIFY THE FIREWALL SETTINGS

osSubVer=$(sw_vers -productVersion | cut -d '.' -f 2)
lanrevBlocked=$(/usr/libexec/ApplicationFirewall/socketfilterfw --listapps | grep -A 1 "LANrev Agent.app"| grep -i incoming | awk ' { print $2 } ' )

if [[ $osSubVer -gt "6" ]]; then
    if [[ $lanrevBlocked == Block* ]]; then
        /usr/libexec/ApplicationFirewall/socketfilterfw --unblock "/Library/Application Support/LANrev Agent/LANrev Agent.app" 1>/dev/null
        echo "Lanrev Unblocked"
    else
        echo "No ALF Changes Made"
    fi
fi
exit 0