# CMakeLists.txt
# Top-level CMakeLists, project configuration
# Author: akowalew

cmake_minimum_required(VERSION 3.5.1 FATAL_ERROR)
project(tiva-cmake-seed)

set(PROJECT_VERSION_MAJOR 1)
set(PROJECT_VERSION_MINOR 0)
set(PROJECT_VERSION_PATCH 0)

# Add "cmake" folder to use e.g. FindTivaWare script
list(APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake")

# Specify compiler flags for all targets
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} \
	-std=c11 \
	-pedantic \
	-Wall \
	-Werror \
")

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} \
	-std=gnu++14 \
	-pedantic \
	-Wall \
	-Werror \
")

set(CMAKE_C_FLAGS_DEBUG "${CMAKE_C_FLAGS_DEBUG} -g")
set(CMAKE_C_FLAGS_RELEASE "${CMAKE_C_FLAGS_RELEASE} -O2 -DNDEBUG")

set(CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG} -g")
set(CMAKE_CXX_FLAGS_RELEASE "${CMAKE_CXX_FLAGS_RELEASE} -O2 -DNDEBUG")

include_directories(include)
add_subdirectory(src)
