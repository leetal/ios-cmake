#!/bin/bash

mkdir example/example-lib/build
cd example/example-lib/build

SHARED_EXT=""
if [[ $BUILD_SHARED -eq 1 ]]; then
    SHARED_EXT="-DBUILD_SHARED=1 -DENABLE_VISIBILITY=1"
fi

cmake .. \
    -DCMAKE_TOOLCHAIN_FILE=../../ios.toolchain.cmake \
    -DIOS_PLATFORM=$IOS_PLATFORM $SHARED_EXT\
    || exit 1
make -j2 || exit 1
make install || exit 1
