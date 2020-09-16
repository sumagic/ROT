cmake_minimum_required(VERSION 3.16.3)

project(rot)

message(STATUS "BUILD_DIR: $ENV{BUILD_DIR}")
set(BUILD_DIR $ENV{BUILD_DIR})

include_directories(${BUILD_DIR}/include)
include_directories(${CMAKE_SOURCE_DIR}/inc)


aux_source_directory(${CMAKE_SOURCE_DIR}/src ROT_CC_FILES)

link_directories(${BUILD_dir}/lib)
add_executable(rot_server ${CMAKE_SOURCE_DIR}/src/tool/rot_server.cc)
target_link_libraries(rot_server glog gflags pthread)

add_executable(rot ${CMAKE_SOURCE_DIR}/src/tool/rot_client.cc)
target_link_libraries(rot glog gflags pthread)