cmake_minimum_required(VERSION 3.16.3)

project(rot)

message(STATUS "BUILD_DIR: $ENV{BUILD_DIR}")
set(BUILD_DIR $ENV{BUILD_DIR})

include_directories(${BUILD_DIR}/include)

