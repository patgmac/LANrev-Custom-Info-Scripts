#!/bin/sh

ac -p | sort -nk 2 | awk '/total/{print x};{x=$1}'