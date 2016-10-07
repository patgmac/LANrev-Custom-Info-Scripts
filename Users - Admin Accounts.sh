#!/bin/sh

dscl . read /groups/admin | grep GroupMembership | cut -c 18-