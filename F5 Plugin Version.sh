#!/bin/sh

# F5 plugin version

if [ -e /Library/Internet\ Plug-Ins/F5\ SSL\ VPN\ Plugin.plugin ]; then
	defaults read /Library/Internet\ Plug-Ins/F5\ SSL\ VPN\ Plugin.plugin/Contents/Info CFBundleVersion
else
	echo "F5 Plugin not installed"
fi
exit 0