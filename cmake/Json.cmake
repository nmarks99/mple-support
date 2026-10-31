set(JSON_BuildTests OFF CACHE BOOL "" FORCE)
set(JSON_Install ON CACHE BOOL "" FORCE)

FetchContent_Declare(
    nlohmann_json
    GIT_REPOSITORY https://github.com/nlohmann/json.git
    GIT_TAG ${MPLE_SUPPORT_JSON_REVISION}
    GIT_SHALLOW FALSE
    OVERRIDE_FIND_PACKAGE
)
FetchContent_MakeAvailable(nlohmann_json)
