cmake_minimum_required(VERSION 3.24)

project(mple-support VERSION 0.1.0 LANGUAGES C CXX)

include(GNUInstallDirs)
include(ExternalProject)

option(MPLE_SUPPORT_BUILD_SHARED_LIBS "Build shared dependency libraries" OFF)

set(MPLE_SUPPORT_INSTALL_PREFIX ${CMAKE_INSTALL_PREFIX})
set(MPLE_SUPPORT_CMAKE_ARGS
    -DCMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE}
    -DCMAKE_INSTALL_PREFIX=<INSTALL_DIR>
    -DCMAKE_INSTALL_LIBDIR=${CMAKE_INSTALL_LIBDIR}
    -DCMAKE_PREFIX_PATH=<INSTALL_DIR>
    -DCMAKE_CXX_STANDARD=17
    -DCMAKE_CXX_STANDARD_REQUIRED=ON
    -DCMAKE_POSITION_INDEPENDENT_CODE=ON
    -DBUILD_SHARED_LIBS=${MPLE_SUPPORT_BUILD_SHARED_LIBS}
    -DBUILD_TESTING=OFF
)

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
