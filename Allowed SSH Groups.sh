#!/bin/sh

# Custom information item for LANrev
# Check NestedGroups within com.apple.access_ssh

group=`dscl . -read /Groups/com.apple.access_ssh NestedGroups | cut -c 15-`

if [ ${group} == "ABCDEFAB-CDEF-ABCD-EFAB-CDEF00000050" ]; then
	echo "Administrators"
else echo ${group}
fi

exit 0