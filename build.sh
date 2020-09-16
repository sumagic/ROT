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

PROJECT_DIR=$PWD
log_info "PROJECT_DIR: ${PROJECT_DIR}"

THIRD_DIR=${PROJECT_DIR}/3rd
if [ ! -d ${THIRD_DIR} ];then
    mkdir -p ${THIRD_DIR}
    log_info "create dir ${THIRD_DIR} success"
fi

# git clone https://github.com/gflags/gflags.git
GFLAGS_DIR=${THIRD_DIR}/gflags
if [ ! -d ${GFLAGS_DIR} ];then
    cd ${THIRD_DIR}
    git clone https://github.com/gflags/gflags.git
fi
cd ${GFLAGS_DIR}
git submodule update --init

# git clone https://github.com/google/glog.git
GLOG_DIR=${THIRD_DIR}/glog
if [ ! -d ${GLOG_DIR} ];then
    cd ${THIRD_DIR}
    git clone https://github.com/google/glog.git
fi
cd ${GLOG_DIR}
git submodule update --init






