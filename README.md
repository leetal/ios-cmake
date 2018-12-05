A CMake toolchain file for iOS, watchOS and tvOS development with full simulator support and toggable options!

ios-cmake
=========

[![Build Status](https://travis-ci.org/leetal/ios-cmake.svg?branch=master)](https://travis-ci.org/leetal/ios-cmake)

Tested with the following combinations:
* XCode 5.x, iOS SDK 7
* XCode 6.1.x, iOS SDK 8.1
* XCode 8.2.x, iOS SDK 10.2
* XCode 9.4.x, iOS SDK 11.4
* XCode 10.0.x, iOS SDK 12.0

# Example usage 
**NOTE: The below commands will build for 64-bit simulator only. Change the `-DIOS_PLATFORM` to the applicable value if targeting another platform.**

```bash
cd example/example-lib
mkdir build
cd build
cmake .. -DCMAKE_TOOLCHAIN_FILE=../../ios.toolchain.cmake -DIOS_PLATFORM=SIMULATOR64
make
make install
```

This will build and install the library for the given IOS_PLATFORM.

## Options

* Set `-DIOS_PLATFORM` to "SIMULATOR" to build for iOS simulator 32 bit (i386) **DEPRECATED**
* Set `-DIOS_PLATFORM` to "SIMULATOR64" (example above) to build for iOS simulator 64 bit (x86_64)
* Set `-DIOS_PLATFORM` to "OS" to build for Device (armv7, armv7s, arm64, arm64e)
* Set `-DIOS_PLATFORM` to "OS64" to build for Device (arm64, arm64e)
* Set `-DIOS_PLATFORM` to "TVOS" to build for tvOS (arm64)
* Set `-DIOS_PLATFORM` to "SIMULATOR_TVOS" to build for tvOS Simulator (x86_64)
* Set `-DIOS_PLATFORM` to "WATCHOS" to build for watchOS (armv7k, arm64_32)
* Set `-DIOS_PLATFORM` to "SIMULATOR_WATCHOS" to build for watchOS Simulator (x86_64)

### Additional Options
`-DENABLE_BITCODE=(BOOL)` - Enabled by default, specify FALSE or 0 to disable bitcode

`-DENABLE_ARC=(BOOL)` - Enabled by default, specify FALSE or 0 to disable ARC

`-DENABLE_VISIBILITY=(BOOL)` - Disabled by default, specify TRUE or 1 to enable symbol visibility support

`-DIOS_ARCH=(STRING)` - Valid values are: armv7, armv7s, arm64, arm64e, i386, x86_64, armv7k, arm64_32. By default it will build for all valid architectures based on `-DIOS_PLATFORM` (see above)

__*The resulting binary will consist of only one platform. To combine all platforms into the same fat-library, use the LIPO tool. More information on this is available on the net.*__

## Thanks To

* [natbro](https://github.com/natbro) for adding tvOS support
* [MSNexploder](https://github.com/MSNexploder) for adding OS64 and arm64e support
* [garryyan](https://github.com/garryyan) for adding watchOS support

## Notes

Parts of the original toolchain comes from a similar project found on code.google.com
