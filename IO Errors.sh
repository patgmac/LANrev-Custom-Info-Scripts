#!/bin/sh

# Scan the system log for I/O errors

error=`grep -c 'disk0s2: I/O error' /var/log/system.log`
echo $error