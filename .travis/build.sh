#!/bin/bash

mkdir example/example-lib/build
cd example/example-lib/build

SHARED_EXT=""
if [[ $BUILD_SHARED -eq 1 ]]; then
    SHARED_EXT="-DBUILD_SHARED=1 -DENABLE_VISIBILITY=1"
fi

GENERATOR_EXT=""
if [[ $USE_XCODE -eq 1 ]]; then
    GENERATOR_EXT="-G Xcode"
fi

cmake .. \
    $GENERATOR_EXT -DCMAKE_TOOLCHAIN_FILE=../../ios.toolchain.cmake \
    -DIOS_PLATFORM=$IOS_PLATFORM $SHARED_EXT\
    || exit 1
cmake --build . --config Release --target install || exit 1
