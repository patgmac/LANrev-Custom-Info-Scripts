#!/bin/sh

if [[ -e /Library/Mathematica/Licensing/mathpass ]]; then
	echo `cat /Library/Mathematica/Licensing/mathpass`
else
	echo "mathpass not found"
fi
exit 0