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

HEAD=../info/apphead.val
BUILD=../info/appbuild.val
VERSION=../info/appversion.val

echo_version() {
  Pre="$1"
  Ver="$2"
  VerA=$(($Ver / 16777216 % 256))
  VerB=$(($Ver / 65536 % 256))
  VerC=$(($Ver / 256 % 256))
  VerD=$(($Ver % 256))
  echo "$Pre $VerA.$VerB.$VerC.$VerD ($Ver)"
}
