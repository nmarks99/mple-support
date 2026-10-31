include(${CMAKE_CURRENT_LIST_DIR}/Eigen.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/Json.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/Ompl.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/Toppra.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/Pinocchio.cmake)

add_custom_target(
    mple-support-dependencies ALL
    DEPENDS nlohmann_json ompl toppra pinocchio
)
