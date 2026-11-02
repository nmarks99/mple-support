ExternalProject_Add(
    toppra
    GIT_REPOSITORY https://github.com/hungpham2511/toppra.git
    GIT_TAG ${MPLE_SUPPORT_TOPPRA_REVISION}
    GIT_SHALLOW FALSE
    UPDATE_DISCONNECTED TRUE
    # TOPP-RA hardcodes lib, so patch it to honor the superbuild's CMAKE_INSTALL_LIBDIR.
    PATCH_COMMAND git apply --whitespace=nowarn ${CMAKE_CURRENT_LIST_DIR}/../patches/toppra-gnu-install-dirs.patch
    SOURCE_SUBDIR cpp
    INSTALL_DIR ${MPLE_SUPPORT_INSTALL_PREFIX}
    DEPENDS eigen
    CMAKE_ARGS
        ${MPLE_SUPPORT_CMAKE_ARGS}
        -DPYTHON_BINDINGS=OFF
        -DINSTALL_DOCUMENTATION=OFF
        -DBUILD_WITH_PINOCCHIO=OFF
        -DBUILD_WITH_qpOASES=OFF
        -DBUILD_WITH_GLPK=OFF
)
