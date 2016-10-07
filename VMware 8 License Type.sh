#!/bin/sh

cat /Library/Preferences/VMware\ Fusion/license-fusion-8* | grep "LicenseType =" | awk '{print $3}'