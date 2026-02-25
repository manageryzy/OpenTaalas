# model/systemc/CMakeLists.txt — Header-only reference model library

add_library(opentaalas_model INTERFACE)
target_include_directories(opentaalas_model INTERFACE
  "${CMAKE_CURRENT_SOURCE_DIR}/include"
  "${CMAKE_CURRENT_SOURCE_DIR}/src"
  ${AC_TYPES_INCLUDE_DIR}
  ${SYSTEMC_INCLUDE_DIRS}
)
target_link_libraries(opentaalas_model INTERFACE ${SYSTEMC_LIBRARIES})
