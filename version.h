/*
 * CVersion - https://github.com/djboni/cversion
 * MIT License - Copyright (c) 2016 Djones A. Boni
 */

#ifndef VERSION_H_
#define VERSION_H_

#include <stdint.h>

#ifdef __cplusplus
extern "C" {
#endif

struct cversion_t {
    char name[20U];
    uint32_t version;
    uint32_t build;
    char datetime[20U];
    char head[41U];
};

#define CVERSION_DECLARE(name) extern const struct cversion_t name

#ifndef APPNAME
#define APPNAME App
#endif

CVERSION_DECLARE(APPNAME);

#ifdef __cplusplus
} /* extern "C" */
#endif

#endif /* VERSION_H_ */
