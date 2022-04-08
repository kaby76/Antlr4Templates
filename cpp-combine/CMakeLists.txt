# Template generated code from trgen 0.15.2

cmake_minimum_required (VERSION 3.14)
list(APPEND CMAKE_MODULE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/cmake)

set(CMAKE_CXX_STANDARD 17)
set(ANTLR_EXECUTABLE "C:/Users/Kenne/Downloads/antlr-4.9.3-complete.jar")
set(Java_JAVA_EXECUTABLE "java")
set(ANTLR4_TAG e4c1a74)
#SET(GCC_COVERAGE_COMPILE_FLAGS "-g -pg")
#SET(GCC_COVERAGE_LINK_FLAGS    "-g -pg")
#SET(CMAKE_CXX_FLAGS  "${CMAKE_CXX_FLAGS} ${GCC_COVERAGE_COMPILE_FLAGS}")
#SET(CMAKE_EXE_LINKER_FLAGS  "${CMAKE_EXE_LINKER_FLAGS} ${GCC_COVERAGE_LINK_FLAGS}")

add_definitions(-DANTLR4CPP_STATIC)

include(ExternalAntlr4Cpp)
include_directories(${ANTLR4_INCLUDE_DIRS} ${CMAKE_CURRENT_SOURCE_DIR}/)
find_package(ANTLR REQUIRED)

antlr_target(
    Arithmetic
    Arithmetic.g4
    )

include_directories(${ANTLR4_INCLUDE_DIRS})
include_directories(${ANTLR_Arithmetic_OUTPUT_DIR})

add_executable(Test
    Program.cpp
    ErrorListener.cpp
    ErrorListener.h
    CaseChangingCharStream.cpp
    CaseChangingCharStream.h
${ANTLR_Arithmetic_CXX_OUTPUTS}
    )

target_link_libraries(Test antlr4_static)
