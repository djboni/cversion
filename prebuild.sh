#!/bin/sh
# CVersion - https://github.com/djboni/cversion
# MIT License - Copyright (c) 2016 Djones A. Boni

. ./common.sh

# Head
do_EnterHeadPath
APPHEAD_val=$("$EXEGIT" rev-parse HEAD)
do_EnterProjPath
echo "\"$APPHEAD_val\"" >"$APPHEAD"

# Build
Build_val=$(cat "$APPBUILD")
Build_val=$(($Build_val + 1))
echo $Build_val >"$APPBUILD"

# Build time
Buildtime_val=$(date "+%Y/%m/%d %H:%M:%S")
echo "\"$Buildtime_val\"" >"$APPBUILDTIME"

# Version
Version_val=$(cat "$APPVERSION")
VersionA_val=$(($Version_val / 16777216 % 256))
VersionB_val=$(($Version_val / 65536 % 256))
VersionC_val=$(($Version_val / 256 % 256))
VersionD_val=$(($Version_val % 256))

# Print
echo_version \
    "Version:   " $Version_val
echo "Build:      $Build_val"
echo "Build time: $Buildtime_val"
echo "HEAD:       $APPHEAD_val"

exit 0
