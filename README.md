A CMake toolchain file for iOS, watchOS and tvOS development with full simulator support and toggable options!

### NEW!
* Now exposes Autoconf compatible triples, accessible via the `APPLE_TARGET_TRIPLE` variable.

ios-cmake
=========

[![Build Status](https://travis-ci.org/leetal/ios-cmake.svg?branch=master)](https://travis-ci.org/leetal/ios-cmake)

Tested with the following combinations:
* XCode 8.3, iOS SDK 10.3
* XCode 9.4, iOS SDK 11.4
* XCode 10.2, iOS SDK 12.2
* XCode 11.1, iOS SDK 13.1
* XCode 11.3, iOS SDK 13.3

# Example usage 
**NOTE: The below commands will build for 64-bit simulator only. Change the `-DPLATFORM` to the applicable value if targeting another platform.**

```bash
cd example/example-lib
mkdir build
cd build
cmake .. -G Xcode -DCMAKE_TOOLCHAIN_FILE=../../ios.toolchain.cmake -DPLATFORM=OS64COMBINED
cmake --build . --config Release --target install
```

This will build and install the library for the given IOS_PLATFORM.

## Options

* Set `-DPLATFORM` to "SIMULATOR" to build for iOS simulator 32 bit (i386) **DEPRECATED**
* Set `-DPLATFORM` to "SIMULATOR64" (example above) to build for iOS simulator 64 bit (x86_64)
* Set `-DPLATFORM` to "OS" to build for Device (armv7, armv7s, arm64)
* Set `-DPLATFORM` to "OS64" to build for Device (arm64)
* Set `-DPLATFORM` to "OS64COMBINED" to build for Device & Simulator (FAT lib) (arm64, x86_64)
* Set `-DPLATFORM` to "TVOS" to build for tvOS (arm64)
* Set `-DPLATFORM` to "TVOSCOMBINED" to build for tvOS & Simulator (arm64, x86_64)
* Set `-DPLATFORM` to "SIMULATOR_TVOS" to build for tvOS Simulator (x86_64)
* Set `-DPLATFORM` to "WATCHOS" to build for watchOS (armv7k, arm64_32)
* Set `-DPLATFORM` to "WATCHOSCOMBINED" to build for watchOS & Simulator (armv7k, arm64_32, i386)
* Set `-DPLATFORM` to "SIMULATOR_WATCHOS" to build for watchOS Simulator (i386)

### COMBINED Options
The options called *COMBINED (OS64COMBINED, TVOSCOMBINED and WATCHOSCOMBINED) will build complete FAT-libraries for 
the given platform. These FAT-libraries include slices for both device and simulator, making the distribution and 
usage of the library much more simple!

**NOTE: The COMBINED options _ONLY_ work with the Xcode generator (-G Xcode), together with a install-target (see example above).**

### Exposed Variables
`XCODE_VERSION` - Version number (not including Build version) of Xcode detected.

`SDK_VERSION` - Version of SDK being used.

`CMAKE_OSX_ARCHITECTURES` - Architectures being compiled for (generated from PLATFORM).

`APPLE_TARGET_TRIPLE` - Used by autoconf build systems. NOTE: If "`ARCHS` are overridden, this will **NOT** be set! 

### Additional Options
`-DENABLE_BITCODE=(BOOL)` - Enabled by default, specify FALSE or 0 to disable bitcode

`-DENABLE_ARC=(BOOL)` - Enabled by default, specify FALSE or 0 to disable ARC

`-DENABLE_VISIBILITY=(BOOL)` - Disabled by default, specify TRUE or 1 to enable symbol visibility support

`-DENABLE_STRICT_TRY_COMPILE=(BOOL)` - Disabled by default, specify TRUE or 1 to enable strict compiler checks (will run linker on all compiler checks whenever needed)

`-DARCHS=(STRING)` - Valid values are: armv7, armv7s, arm64, i386, x86_64, armv7k, arm64_32. By default it will build for all valid architectures based on `-DPLATFORM` (see above)

__*To combine all platforms into the same FAT-library, either build any of the "*COMBINED*" platform types OR use the 
LIPO tool. More information on how to combine libraries with LIPO is readily available on the net.*__

## Thanks To

* [natbro](https://github.com/natbro) for adding tvOS support
* [MSNexploder](https://github.com/MSNexploder) for adding OS64 and arm64e support
* [garryyan](https://github.com/garryyan) for adding watchOS support

## Notes

Parts of the original toolchain comes from a similar project found on code.google.com
