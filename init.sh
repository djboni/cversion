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

# Change directory
cd "$1"; shift; pwd

if [ ! -f "$APPHEAD" ]
then
  echo "\"\"" > "$APPHEAD"
fi

if [ ! -f "$APPBUILD" ]
then
  echo 0 > "$APPBUILD"
fi

if [ ! -f "$APPBUILDTIME" ]
then
  echo "\"\"" > "$APPBUILDTIME"
fi

if [ ! -f "$APPVERSION" ]
then
  echo 0 > "$APPVERSION"
  sh ./setversion.sh 0 1 0
fi
