cmake_minimum_required(VERSION 4.00)

project(modelling-mip)
find_package(SCIP REQUIRED)

set(CMAKE_CXX_STANDARD 23)
add_executable(modelling-mip src/modelling-mip.cpp)
target_link_libraries(modelling-mip PRIVATE libscip)