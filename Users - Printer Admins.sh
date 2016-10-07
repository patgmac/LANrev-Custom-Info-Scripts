#!/bin/sh

dscl . read /groups/_lpadmin | grep GroupMembership | cut -c 18-