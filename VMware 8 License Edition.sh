#!/bin/sh

cat /Library/Preferences/VMware\ Fusion/license-fusion-8* | grep "LicenseEdition =" | awk '{print $3}'