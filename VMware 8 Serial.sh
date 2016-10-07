#!/bin/sh

cat /Library/Preferences/VMware\ Fusion/license-fusion-8* | grep Serial | awk '{print $3}'