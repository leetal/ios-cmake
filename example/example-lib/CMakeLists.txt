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

# Library
if (BUILD_SHARED)
  add_library (example SHARED ${SOURCES} ${HEADERS})
  message(STATUS "Building shared version...")
else()
  add_library (example STATIC ${SOURCES} ${HEADERS})
  message(STATUS "Building static version...")
endif()

# Executable
add_executable (helloworld main.cpp)

# Link the library with the executable
target_link_libraries(helloworld example)

# Debug symbols set in XCode project
set_xcode_property (example GCC_GENERATE_DEBUGGING_SYMBOLS YES "All")

# Installation
set (CMAKE_INSTALL_PREFIX "${example-ios_SOURCE_DIR}/../example-app/example-lib")
install (TARGETS example helloworld DESTINATION lib)
install (FILES ${HEADERS} DESTINATION include)
