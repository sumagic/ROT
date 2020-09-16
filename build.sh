#!/bin/bash

log ()
{
    times=$(date "+%Y-%m-%d %H:%M:%S")

    if [ $# -lt 2 ];then
        echo -e "[${times}] [\033[31mERROR\033[0m] [log() func should have more than 2 args, exit -1]"
        exit -1
    else
        echo -e "[${times}] $*"
    fi
}

log_info ()
{
    if [ $# -lt 1 ];then
        log "[\033[31mERROR\033[0m] log_info() func should have at least 1 arg"
    else
        log "[INFO]" "[$*]"
    fi
}

log_warn ()
{
    if [ $# -lt 1 ];then
        log "[\033[31mERROR\033[0m] log_warn() func should have at least 1 arg"
    else
        log "[\033[33mWARNING\033[0m]" "[$*]"
    fi
}

log_error ()
{
    if [ $# -lt 1 ];then
        log "[\033[31mERROR\033[0m] log_warn() func should have at least 1 arg"
    else
        log "[\033[31mERROR\033[0m]" "[$*]"
    fi
}

log_info "rot project build start"


