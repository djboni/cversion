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

# Head
do_EnterHeadPath
  APPHEAD_val=`"$EXEGIT" rev-parse HEAD`
do_EnterProjPath
echo "\"$APPHEAD_val\"" > "$APPHEAD"

# Build
Build_val=`cat "$APPBUILD"`
Build_val=$(($Build_val + 1))
echo $Build_val > "$APPBUILD"

# Build time
Buildtime_val=`date "+%Y/%m/%d %H:%M:%S"`
echo "\"$Buildtime_val\"" > "$APPBUILDTIME"

# Version
Version_val=`cat "$APPVERSION"`
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
