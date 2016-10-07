#!/bin/sh

last | grep console | cut -c 1-10,37- | head -1 | grep -v _mbsetupuser