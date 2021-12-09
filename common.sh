#!/bin/sh
# CVersion - https://github.com/djboni/cversion
# MIT License - Copyright (c) 2016 Djones A. Boni

if [ -z $CVERSION_CommonExecuted ]; then

    set -e

    CVERSION_CommonExecuted=1

    APPNAME=info/appname.val
    APPHEADPATH=info/appheadpath.val
    APPHEAD=info/apphead.val
    APPBUILD=info/appbuild.val
    APPBUILDTIME=info/appbuildtime.val
    APPVERSION=info/appversion.val

    EXEGIT='/usr/bin/git'
    ls "$EXEGIT" >/dev/null 2>&1 || EXEGIT='C:/Program Files/Git/cmd/git.exe'

    echo_version() {
        Pre="$1"
        Ver="$2"
        VerA=$(($Ver / 16777216 % 256))
        VerB=$(($Ver / 65536 % 256))
        VerC=$(($Ver / 256 % 256))
        VerD=$(($Ver % 256))
        echo "$Pre $VerA.$VerB.$VerC.$VerD ($Ver)"
    }

    ExecPath=$(pwd)
    cd "$1"
    shift
    ProjPath=$(pwd)

    if [ -f "$APPHEADPATH" ]; then
        APPHEADPATH_EXISTS=1
    fi

    do_EnterExecPath() {
        cd "$ExecPath"
    }

    do_EnterProjPath() {
        cd "$ProjPath"
    }

    do_EnterHeadPath() {
        cd $(cat "$APPHEADPATH")
    }

fi
