cmake_minimum_required(VERSION 3.24)

project(mple-support VERSION 0.1.0 LANGUAGES C CXX)

include(GNUInstallDirs)
include(FetchContent)

option(MPLE_SUPPORT_BUILD_SHARED_LIBS "Build shared dependency libraries" OFF)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_POSITION_INDEPENDENT_CODE ON)
set(BUILD_SHARED_LIBS ${MPLE_SUPPORT_BUILD_SHARED_LIBS} CACHE BOOL "Build shared libraries" FORCE)
set(BUILD_TESTING OFF CACHE BOOL "Build dependency tests" FORCE)

include(${CMAKE_CURRENT_SOURCE_DIR}/versions.cmake)
include(${CMAKE_CURRENT_SOURCE_DIR}/cmake/Dependencies.cmake)

configure_file(
    ${CMAKE_CURRENT_SOURCE_DIR}/cmake/mple-support.mk.in
    ${CMAKE_CURRENT_BINARY_DIR}/mple-support.mk
    @ONLY
)
configure_file(
    ${CMAKE_CURRENT_SOURCE_DIR}/cmake/manifest.txt.in
    ${CMAKE_CURRENT_BINARY_DIR}/manifest.txt
    @ONLY
)

install(
    FILES
        ${CMAKE_CURRENT_BINARY_DIR}/mple-support.mk
        ${CMAKE_CURRENT_BINARY_DIR}/manifest.txt
    DESTINATION ${CMAKE_INSTALL_DATADIR}/mple-support
)
