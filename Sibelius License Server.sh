#!/bin/sh

licFile="/Library/Application Support/Avid/Sibelius/_manuscript/LicenceServerInfo" 

if [ -e "$licFile" ]; then
	cat "$licFile" 
fi