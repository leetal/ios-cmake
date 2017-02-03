#!/bin/bash

mkdir example/example-lib/build
cd example/example-lib/build
cmake .. \
    -DCMAKE_TOOLCHAIN_FILE=../../ios.toolchain.cmake \
    -DIOS_PLATFORM=$IOS_PLATFORM \
    || exit 1
make || exit 1
make install || exit 1
