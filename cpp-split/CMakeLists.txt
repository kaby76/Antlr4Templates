
cmake_minimum_required (VERSION 3.14)
list(APPEND CMAKE_MODULE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/cmake)

set(CMAKE_CXX_STANDARD 17)
set(ANTLR_EXECUTABLE "/tmp/antlr4-4.10-complete.jar")
set(Java_JAVA_EXECUTABLE "java")
set(ANTLR4_TAG 3e3fecf)
#SET(GCC_COVERAGE_COMPILE_FLAGS "-g -pg")
#SET(GCC_COVERAGE_LINK_FLAGS    "-g -pg")
#SET(CMAKE_CXX_FLAGS  "${CMAKE_CXX_FLAGS} ${GCC_COVERAGE_COMPILE_FLAGS}")
#SET(CMAKE_EXE_LINKER_FLAGS  "${CMAKE_EXE_LINKER_FLAGS} ${GCC_COVERAGE_LINK_FLAGS}")

add_definitions(-DANTLR4CPP_STATIC)

include(ExternalAntlr4Cpp)
include_directories(${ANTLR4_INCLUDE_DIRS} ${CMAKE_CURRENT_SOURCE_DIR}/)
find_package(ANTLR REQUIRED)

antlr_target(
    ArithmeticLexer
    ArithmeticLexer.g4
    LEXER
    )
antlr_target(
    ArithmeticParser
    ArithmeticParser.g4
    PARSER
    DEPENDS_ANTLR ArithmeticLexer
    COMPILE_FLAGS -lib ${ANTLR_ArithmeticLexer_OUTPUT_DIR}
    )

include_directories(${ANTLR_ArithmeticLexer_OUTPUT_DIR})
include_directories(${ANTLR_ArithmeticParser_OUTPUT_DIR})

add_executable(Test
    Program.cpp
    ErrorListener.cpp
    ErrorListener.h
${ANTLR_ArithmeticLexer_CXX_OUTPUTS}
    ${ANTLR_ArithmeticParser_CXX_OUTPUTS}
    )


target_link_libraries(Test antlr4_static)
