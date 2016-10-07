#!/bin/bash

FWPWD=`nvram security-password | cut -c 19-`
echo $FWPWD | perl -nle '$x=substr($_,1);print join("",map(chr(hex($_)^170),split(/\%/,$x)));'