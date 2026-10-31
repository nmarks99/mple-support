set(tinyxml2_BUILD_TESTING OFF CACHE BOOL "" FORCE)
FetchContent_Declare(
    tinyxml2
    GIT_REPOSITORY https://github.com/leethomason/tinyxml2.git
    GIT_TAG ${MPLE_SUPPORT_TINYXML2_REVISION}
    GIT_SHALLOW FALSE
    OVERRIDE_FIND_PACKAGE
)
FetchContent_MakeAvailable(tinyxml2)

FetchContent_Declare(
    console_bridge
    GIT_REPOSITORY https://github.com/ros/console_bridge.git
    GIT_TAG ${MPLE_SUPPORT_CONSOLE_BRIDGE_REVISION}
    GIT_SHALLOW FALSE
    PATCH_COMMAND ${CMAKE_COMMAND} -E env SOURCE_DIR=<SOURCE_DIR>
        ${CMAKE_COMMAND} -P ${CMAKE_CURRENT_LIST_DIR}/../patches/console_bridge.cmake
    OVERRIDE_FIND_PACKAGE
)
FetchContent_MakeAvailable(console_bridge)

set(APPEND_PROJECT_NAME_TO_INCLUDEDIR OFF CACHE BOOL "" FORCE)
FetchContent_Declare(
    urdfdom_headers
    GIT_REPOSITORY https://github.com/ros/urdfdom_headers.git
    GIT_TAG ${MPLE_SUPPORT_URDFDOM_HEADERS_REVISION}
    GIT_SHALLOW FALSE
    PATCH_COMMAND ${CMAKE_COMMAND} -E env SOURCE_DIR=<SOURCE_DIR>
        ${CMAKE_COMMAND} -P ${CMAKE_CURRENT_LIST_DIR}/../patches/urdfdom_headers.cmake
    OVERRIDE_FIND_PACKAGE
)
FetchContent_MakeAvailable(urdfdom_headers)
file(
    WRITE ${CMAKE_FIND_PACKAGE_REDIRECTS_DIR}/urdfdom_headers-extra.cmake
    "set(urdfdom_headers_VERSION 3.0.1)\n"
)

FetchContent_Declare(
    urdfdom
    GIT_REPOSITORY https://github.com/ros/urdfdom.git
    GIT_TAG ${MPLE_SUPPORT_URDFDOM_REVISION}
    GIT_SHALLOW FALSE
    PATCH_COMMAND ${CMAKE_COMMAND} -E env SOURCE_DIR=<SOURCE_DIR>
        ${CMAKE_COMMAND} -P ${CMAKE_CURRENT_LIST_DIR}/../patches/urdfdom.cmake
    OVERRIDE_FIND_PACKAGE
)
FetchContent_MakeAvailable(urdfdom)

set(BUILD_PYTHON_INTERFACE OFF CACHE BOOL "" FORCE)
set(BUILD_EXAMPLES OFF CACHE BOOL "" FORCE)
set(BUILD_BENCHMARK OFF CACHE BOOL "" FORCE)
set(BUILD_UTILS OFF CACHE BOOL "" FORCE)
set(BUILD_WITH_URDF_SUPPORT ON CACHE BOOL "" FORCE)
set(BUILD_WITH_COLLISION_SUPPORT OFF CACHE BOOL "" FORCE)
set(PINOCCHIO_BUILD_VISUALIZERS OFF CACHE BOOL "" FORCE)
set(INSTALL_DOCUMENTATION OFF CACHE BOOL "" FORCE)

FetchContent_Declare(
    pinocchio
    GIT_REPOSITORY https://github.com/stack-of-tasks/pinocchio.git
    GIT_TAG ${MPLE_SUPPORT_PINOCCHIO_REVISION}
    GIT_SHALLOW FALSE
    GIT_SUBMODULES cmake
)
FetchContent_MakeAvailable(pinocchio)
