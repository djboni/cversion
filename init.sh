#!/bin/sh
# CVersion - https://github.com/djboni/cversion
# MIT License - Copyright (c) 2016 Djones A. Boni

. ./common.sh

if [ ! -f "$APPNAME" ]; then
    echo "\"\"" >"$APPNAME"
fi

if [ -z "$APPHEADPATH_EXISTS" ]; then
    echo "." >"$APPHEADPATH"
fi

if [ ! -f "$APPHEAD" ]; then
    echo "\"\"" >"$APPHEAD"
fi

if [ ! -f "$APPBUILD" ]; then
    echo 0 >"$APPBUILD"
fi

if [ ! -f "$APPBUILDTIME" ]; then
    echo "\"\"" >"$APPBUILDTIME"
fi

if [ ! -f "$APPVERSION" ]; then
    echo 0 >"$APPVERSION"

    do_EnterExecPath
    sh ./setversion.sh "$ProjPath" 0 1 0
    do_EnterProjPath
fi
