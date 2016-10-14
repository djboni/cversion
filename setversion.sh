#!/bin/sh
# Copyright 2016 Djones A. Boni
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
. ./common.sh

case "$1" in 
  "-f") Force=1; shift ;;
esac

VersionParam="$@"
case $VersionParam in
  *[a-zA-Z]*|*-*|--help|-h)
    echo "Error invalid argument '$VersionParam'"
    echo "Usage: setversion.sh [-f] MAJOR MINOR REVISION"
    exit 1 ;;
esac

# Argument version
VersionA="$1"
VersionB="$2"
VersionC="$3"
VersionD="0"
VersionABCD=$(( $VersionA * 16777216 ))
VersionABCD=$(( $VersionB * 65536 + $VersionABCD ))
VersionABCD=$(( $VersionC * 256 + $VersionABCD ))
VersionABCD=$(( $VersionD + $VersionABCD ))

# File version
VersionABCD_file=`cat "$VERSION"`

# Check if new version is bigger than the old version
if [ $VersionABCD_file -ge $VersionABCD ] && [ -z $Force ]
then
  echo "New version is not bigger than the old version"
  echo "Use -f as first argument to do it anyway"
  echo_version "New:" $VersionABCD
  echo_version "Old:" $VersionABCD_file
  exit 2
fi

# Print version to terminal
echo_version "Version:" $VersionABCD

# Write to version file
echo "$VersionABCD" > "$VERSION"

exit 0
