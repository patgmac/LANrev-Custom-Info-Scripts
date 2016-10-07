#!/bin/sh

dscl . -read /Groups/com.apple.access_ssh GroupMembership | cut -c 18-