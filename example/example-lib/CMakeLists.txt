cmake_minimum_required (VERSION 3.2)
project (example-ios C CXX)

# Includes
include_directories (${example-ios_SOURCE_DIR})

# Source files
set (SOURCES
  HelloWorld.cpp
  HelloWorldIOS.mm
)

# Headers
set (HEADERS
  HelloWorld.hpp
  HelloWorldIOS.h
)


IF (${SIMULATOR})
  set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -mios-simulator-version-min=8.0")
ENDIF()

# Library
add_library (example STATIC ${SOURCES} ${HEADERS})

# Debug symbols set in XCode project
set_xcode_property (example GCC_GENERATE_DEBUGGING_SYMBOLS YES "All")

# Installation
set (CMAKE_INSTALL_PREFIX "${example-ios_SOURCE_DIR}/../example-app/example-lib")
install (TARGETS example DESTINATION lib)
install (FILES ${HEADERS} DESTINATION include)
