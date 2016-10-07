#!/bin/sh

find ~/"Library/Logs/CrashReporter/" -newerct '14 days ago' -print | wc -l