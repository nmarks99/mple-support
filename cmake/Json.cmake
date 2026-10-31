ExternalProject_Add(
    nlohmann_json
    GIT_REPOSITORY https://github.com/nlohmann/json.git
    GIT_TAG ${MPLE_SUPPORT_JSON_REVISION}
    GIT_SHALLOW FALSE
    UPDATE_DISCONNECTED TRUE
    INSTALL_DIR ${MPLE_SUPPORT_INSTALL_PREFIX}
    CMAKE_ARGS
        ${MPLE_SUPPORT_CMAKE_ARGS}
        -DJSON_BuildTests=OFF
        -DJSON_Install=ON
)
