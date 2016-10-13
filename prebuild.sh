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
set -e

git='/usr/bin/git'
ls "$git" >/dev/null 2>&1 || git='C:/Program Files/Git/cmd/git.exe'

HEAD=../info/apphead.val
BUILD=../info/appbuild.val
VERSION=../info/appversion.val

# Head
Head_val=`"$git" rev-parse HEAD`
echo "\"$Head_val\"" > "$HEAD"

# Build
Build_val=`cat "$BUILD"`
Build_val=$(($Build_val + 1))
echo $Build_val > "$BUILD"

# Version
Version_val=`cat "$VERSION"`
VersionA_val=$(($Version_val / 16777216 % 256))
VersionB_val=$(($Version_val / 65536 % 256))
VersionC_val=$(($Version_val / 256 % 256))
VersionD_val=$(($Version_val % 256))

# Print
echo "Version: $VersionA_val.$VersionB_val.$VersionC_val.$VersionD_val"
echo "Build:   $Build_val"
echo "Head:    $Head_val"

exit 0
