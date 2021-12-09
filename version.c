/*
 * CVersion - https://github.com/djboni/cversion
 * MIT License - Copyright (c) 2016 Djones A. Boni
 */

#include "version.h"
#include <avr/pgmspace.h>

PROGMEM const struct cversion_t APPNAME = {
    #include "info/appname.val"
    ,
    #include "info/appversion.val"
    #ifdef DEBUG
    | (uint32_t)(DEBUG == 0 ? 255 : DEBUG)
    #endif
    ,
    #include "info/appbuild.val"
    ,
    #include "info/appbuildtime.val"
    ,
    #include "info/apphead.val"
};
