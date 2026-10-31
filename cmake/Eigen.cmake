FetchContent_Declare(
    Eigen3
    GIT_REPOSITORY https://gitlab.com/libeigen/eigen.git
    GIT_TAG ${MPLE_SUPPORT_EIGEN_REVISION}
    GIT_SHALLOW FALSE
    SOURCE_SUBDIR mple-support-no-cmakelists
)
FetchContent_MakeAvailable(Eigen3)

file(READ ${eigen3_SOURCE_DIR}/Eigen/Version eigen_version_header)
string(REGEX MATCH "#define EIGEN_WORLD_VERSION ([0-9]+)" _ "${eigen_version_header}")
set(eigen_version_world ${CMAKE_MATCH_1})
string(REGEX MATCH "#define EIGEN_MAJOR_VERSION ([0-9]+)" _ "${eigen_version_header}")
set(eigen_version_major ${CMAKE_MATCH_1})
string(REGEX MATCH "#define EIGEN_MINOR_VERSION ([0-9]+)" _ "${eigen_version_header}")
set(eigen_version_minor ${CMAKE_MATCH_1})
set(Eigen3_VERSION "${eigen_version_world}.${eigen_version_major}.${eigen_version_minor}")

add_library(Eigen3::Eigen INTERFACE IMPORTED GLOBAL)
set_target_properties(
    Eigen3::Eigen
    PROPERTIES
        INTERFACE_COMPILE_FEATURES cxx_std_14
        INTERFACE_INCLUDE_DIRECTORIES ${eigen3_SOURCE_DIR}
)

file(
    WRITE ${CMAKE_FIND_PACKAGE_REDIRECTS_DIR}/eigen3-config.cmake
    "set(Eigen3_VERSION ${Eigen3_VERSION})\nset(Eigen3_FOUND TRUE)\n"
)
file(
    WRITE ${CMAKE_FIND_PACKAGE_REDIRECTS_DIR}/eigen3-config-version.cmake
    "set(PACKAGE_VERSION ${Eigen3_VERSION})\nset(PACKAGE_VERSION_COMPATIBLE TRUE)\n"
)

install(DIRECTORY ${eigen3_SOURCE_DIR}/Eigen DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}/eigen3)
install(DIRECTORY ${eigen3_SOURCE_DIR}/unsupported/Eigen DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}/eigen3/unsupported)
install(
    FILES ${eigen3_SOURCE_DIR}/signature_of_eigen3_matrix_library
    DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}/eigen3
)

include(CMakePackageConfigHelpers)
configure_package_config_file(
    ${CMAKE_CURRENT_LIST_DIR}/Eigen3Config.cmake.in
    ${CMAKE_CURRENT_BINARY_DIR}/Eigen3Config.cmake
    INSTALL_DESTINATION ${CMAKE_INSTALL_DATADIR}/eigen3/cmake
    NO_SET_AND_CHECK_MACRO
    NO_CHECK_REQUIRED_COMPONENTS_MACRO
)
write_basic_package_version_file(
    ${CMAKE_CURRENT_BINARY_DIR}/Eigen3ConfigVersion.cmake
    VERSION ${Eigen3_VERSION}
    COMPATIBILITY AnyNewerVersion
)
install(
    FILES
        ${CMAKE_CURRENT_BINARY_DIR}/Eigen3Config.cmake
        ${CMAKE_CURRENT_BINARY_DIR}/Eigen3ConfigVersion.cmake
    DESTINATION ${CMAKE_INSTALL_DATADIR}/eigen3/cmake
)
