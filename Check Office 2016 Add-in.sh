#!/bin/sh

# Script to check for Office 2016 add-ins

if [ -d "/Library/Application Support/Microsoft/Office365/User Content.localized/Startup.localized/Word" ]; then
    echo "The following Word add-in's are installed: 
     `ls "/Library/Application Support/Microsoft/Office365/User Content.localized/Startup.localized/Word"`"
fi

if [ -d "/Library/Application Support/Microsoft/Office365/User Content.localized/Startup.localized/Excel" ]; then
    echo "The following Excel add-in's are installed: 
     `ls "/Library/Application Support/Microsoft/Office365/User Content.localized/Startup.localized/Excel"`"
fi

if [ -d "/Library/Application Support/Microsoft/Office365/User Content.localized/Startup.localized/PowerPoint" ]; then
    echo "The following PowerPoint add-in's are installed: 
     `ls "/Library/Application Support/Microsoft/Office365/User Content.localized/Startup.localized/PowerPoint"`"
fi