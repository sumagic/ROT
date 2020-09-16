cmake_minimum_required(VERSION 3.16.3)

project(rot)

message(STATUS "BUILD_DIR: $ENV{BUILD_DIR}")
set(BUILD_DIR $ENV{BUILD_DIR})

include_directories(${BUILD_DIR}/include)

aux_source_directory(${CMAKE_SOURCE_DIR}/src/tool ROT_CC_FILES)

link_directories(${BUILD_dir}/lib)
add_executable(rot_server ${ROT_CC_FILES})
target_link_libraries(rot_server glog pthread)