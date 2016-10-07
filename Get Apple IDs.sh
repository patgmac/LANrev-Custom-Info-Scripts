#!/bin/sh

# Get a list of existing .plist files
USERFOLDERS=$( find /Users/*/Library/Preferences \
-name com.apple.storeagent.plist )

# Make a list of Apple IDs found in the .plists
for APLIST in $USERFOLDERS
do
     IDLIST=$( echo "$IDLIST\n$( defaults read $APLIST AppleID )" )
done

# Remove blank and duplicate lines
IDLIST=$( echo "$IDLIST" | sed '/^$/d' | uniq )

# Return the result
echo "$IDLIST"