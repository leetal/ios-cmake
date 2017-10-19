A CMake toolchain file for iOS development

ios-cmake
=========

[![Build Status](https://travis-ci.org/leetal/ios-cmake.svg?branch=master)](https://travis-ci.org/leetal/ios-cmake)

Tested with the following combinations:
* XCode 5.x, iOS SDK 7
* XCode 6.1.x, iOS SDK 8.1
* XCode 8.2.x, iOS SDK 10.2
* XCode 9.0.x, iOS SDK 11.0

# Example usage 
**NOTE: 64-bit simulator ONLY! Change the `-DIOS_PLATFORM` to applicable value if targeting other platform.**

```bash
cd example
mkdir build
cd build
cmake .. -DCMAKE_TOOLCHAIN_FILE=../../ios.toolchain.cmake -DIOS_PLATFORM=SIMULATOR64
make
make install
```

This will create an XCode project in build directory where the example can be modified.

## Options

* Set `-DIOS_PLATFORM` to "SIMULATOR" (example above) to build for iOS simulator 32 bit (i386)
* Set `-DIOS_PLATFORM` to "SIMULATOR64" to build for iOS simulator 64 bit (x86_64)
* Set `-DIOS_PLATFORM` to "OS" to build for Device (armv7, armv7s, arm64)

__*The resulting binary will be a fat library. To combine all platforms into the same, use the LIPO tool. More information on this is available on the net.*__
