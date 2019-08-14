#!/bin/bash

is-variable-set() {
    declare -p $1 &>dev/null
}

PLATFORM=${PLATFORM:-OS}             # Default to "OS" platform
BUILD_SHARED=${BUILD_SHARED:-0}
USE_XCODE=${USE_XCODE:-0}
BUILD_CURL=${BUILD_CURL:-0}
USE_STRICT_COMPILER_CHECKS=${USE_STRICT_COMPILER_CHECKS:-0}

SHARED_EXT=""
if [[ ${BUILD_SHARED} -eq 1 ]]; then
    SHARED_EXT="-DBUILD_SHARED=1 -DENABLE_VISIBILITY=1"
fi

GENERATOR_EXT=""
if [[ ${USE_XCODE} -eq 1 ]]; then
    GENERATOR_EXT="-G Xcode"
fi

USE_STRICT_COMPILER_CHECKS_EXT=""
if [[ ${USE_STRICT_COMPILER_CHECKS} -eq 1 ]]; then
    USE_STRICT_COMPILER_CHECKS_EXT="-DENABLE_STRICT_TRY_COMPILE=1"
fi

if [[ ${BUILD_CURL} -eq 1 ]]; then
  mkdir -p example/example-curl/build
  pushd example/example-curl/build
  cmake .. \
    ${GENERATOR_EXT} -DCMAKE_TOOLCHAIN_FILE=../../ios.toolchain.cmake \
    -DPLATFORM=${PLATFORM} ${USE_STRICT_COMPILER_CHECKS_EXT} || exit 1
  cmake --build . --config Release --parallel 4 || exit 1
  popd
else
  mkdir -p example/example-lib/build
  pushd example/example-lib/build
  cmake .. \
    ${GENERATOR_EXT} -DCMAKE_TOOLCHAIN_FILE=../../ios.toolchain.cmake \
    -DPLATFORM=${PLATFORM} ${USE_STRICT_COMPILER_CHECKS_EXT} ${SHARED_EXT}\
   || exit 1
  cmake --build . --config Release --target install || exit 1
  popd
fi
