cmake_minimum_required(VERSION 4.00)

project(queens-problem)
find_package(SCIP REQUIRED)

set(CMAKE_CXX_STANDARD 23)
add_executable(queens-problem src/queens-problem.cpp)
target_link_libraries(queens-problem PRIVATE libscip)