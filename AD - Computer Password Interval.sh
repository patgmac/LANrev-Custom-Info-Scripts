#!/bin/sh

# AD Password Interval
# Computer account password interval

dsconfigad -show | grep Password | cut -c 36-