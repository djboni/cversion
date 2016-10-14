/*
 Copyright 2016 Djones A. Boni

 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at

 http://www.apache.org/licenses/LICENSE-2.0

 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
 */

#include "version.h"

PROGMEM const uint32_t APP_VERSION =
#include "info/appversion.val"
#ifdef DEBUG
| (uint32_t)(DEBUG == 0 ? 255 : DEBUG)
#endif
;

PROGMEM const uint32_t APP_BUILD =
#include "info/appbuild.val"
;

PROGMEM const char APP_BUILD_TIME[20U] =
#include "info/appbuildtime.val"
;

PROGMEM const char APP_HEAD[41U] =
#include "info/apphead.val"
;
