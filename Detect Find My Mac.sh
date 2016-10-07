#!/bin/sh

if [[ `nvram fmm-mobileme-token-FMM > /dev/null 2>&1 && echo $?` ]]; then echo "Enabled"; else echo "Disabled"; fi