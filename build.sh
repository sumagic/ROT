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

# # git clone https://github.com/gflags/gflags.git
# GFLAGS_DIR=${THIRD_DIR}/gflags
# if [ ! -d ${GFLAGS_DIR} ];then
#     cd ${THIRD_DIR}
#     git clone https://github.com/gflags/gflags.git
# fi
# cd ${GFLAGS_DIR}
# git submodule update --init

# # git clone https://github.com/google/glog.git
# GLOG_DIR=${THIRD_DIR}/glog
# if [ ! -d ${GLOG_DIR} ];then
#     cd ${THIRD_DIR}
#     git clone https://github.com/google/glog.git
# fi
# cd ${GLOG_DIR}
# git submodule update --init

# # create build
BUILD_X86_DIR=${PROJECT_DIR}/build/x86
# if [ ! -d ${BUILD_X86_DIR} ];then
#     mkdir -p ${BUILD_X86_DIR}
#     log_warn "create ${BUILD_X86_DIR} success"
# fi
# BUILD_AARCH64_DIR=${PROJECT_DIR}/build/aarch64
# if [ ! -d ${BUILD_AARCH64_DIR} ];then
#     mkdir -p ${BUILD_AARCH64_DIR}
#     log_warn "create ${BUILD_AARCH64_DIR} success"
# fi

# # X86编译安装glog
# cd ${GLOG_DIR}
# ./autogen.sh
# CONFIGURE_X86_GLOG=${BUILD_X86_DIR}/glog
# if [ ! -d ${CONFIGURE_X86_GLOG} ];then
#     mkdir -p ${CONFIGURE_X86_GLOG}
# fi
# cd ${CONFIGURE_X86_GLOG}
# ${GLOG_DIR}/configure --prefix=${BUILD_X86_DIR}
# make -j2
# make install

# # X86编译安装gflags
# CONFIGURE_X86_GFLAGS=${BUILD_X86_DIR}/gflags
# if [ ! -d ${CONFIGURE_X86_GFLAGS} ];then
#     mkdir -p ${CONFIGURE_X86_GFLAGS}
# fi
# cd ${CONFIGURE_X86_GFLAGS}
# cmake ${GFLAGS_DIR} -DCMAKE_INSTALL_PREFIX=${BUILD_X86_DIR}
# make -j2
# make install

# 编译主项目工程X86
PROJECT_BUILD_DIR=${BUILD_X86_DIR}/main
if [ ! -d ${PROJECT_BUILD_DIR} ];then
    mkdir -p ${PROJECT_BUILD_DIR}
fi
cd ${PROJECT_BUILD_DIR}
export BUILD_DIR=${BUILD_X86_DIR}
cmake ${PROJECT_DIR}
make







