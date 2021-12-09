#!/bin/sh
# CVersion - https://github.com/djboni/cversion
# MIT License - Copyright (c) 2016 Djones A. Boni

. ./common.sh

case "$1" in
"-f")
    Force=1
    shift
    ;;
esac

VersionParam="$@"
case $VersionParam in
*[a-zA-Z]* | *-* | --help | -h)
    echo "Error invalid argument '$VersionParam'"
    echo "Usage: setversion.sh [-f] MAJOR MINOR REVISION"
    exit 1
    ;;
esac

# Argument version
VersionA="$1"
VersionB="$2"
VersionC="$3"
VersionD="0"
VersionABCD=$(($VersionA * 16777216))
VersionABCD=$(($VersionB * 65536 + $VersionABCD))
VersionABCD=$(($VersionC * 256 + $VersionABCD))
VersionABCD=$(($VersionD + $VersionABCD))

# File version
VersionABCD_file=$(cat "$APPVERSION")

# Check if new version is bigger than the old version
if [ $VersionABCD_file -ge $VersionABCD ] && [ -z $Force ]; then
    echo "New version is not bigger than the old version"
    echo "Use -f as first argument to do it anyway"
    echo_version "New:" $VersionABCD
    echo_version "Old:" $VersionABCD_file
    exit 2
fi

# Print version to terminal
echo_version "Version:" $VersionABCD

# Write to version file
echo "$VersionABCD" >"$APPVERSION"

exit 0
