A CMake toolchain file for iOS (+ Catalyst), watchOS, tvOS and macOS development with full simulator support and toggleable options!

### NEW!
* Experimental Catalyst support (iOS on macOS)
* macOS support and experimental Apple Silicon support
* Deprecated options now removed.

ios-cmake
=========

[![Build Status](https://travis-ci.org/leetal/ios-cmake.svg?branch=master)](https://travis-ci.org/leetal/ios-cmake)

Tested with the following combinations:
* XCode 8.3, iOS SDK 10.3
* XCode 9.4, iOS SDK 11.4
* XCode 10.2, iOS SDK 12.2
* XCode 11.1, iOS SDK 13.1
* XCode 11.3, iOS SDK 13.3
* XCode 12.4, iOS/iPadOS SDK 14.4, tvOS 14.3, watchOS 7.2, macOS SDK 11.1

## Platform flag options (-DPLATFORM=_flag_)

* _OS_ - to build for iOS (armv7, armv7s, arm64) **DEPRECATED in favour of OS64**
* _OS64_ - to build for iOS (arm64 only)
* _OS64COMBINED_ - to build for iOS & iOS Simulator (FAT lib) (arm64, x86_64)
* _SIMULATOR_ - to build for iOS simulator 32 bit (i386) **DEPRECATED**
* _SIMULATOR64_ - to build for iOS simulator 64 bit (x86_64)
* _SIMULATORARM64_ - to build for iOS simulator 64 bit (arm64)
* _TVOS_ - to build for tvOS (arm64)
* _TVOSCOMBINED_ - to build for tvOS & tvOS Simulator (arm64, x86_64)
* _SIMULATOR_TVOS_ - to build for tvOS Simulator (x86_64)
* _WATCHOS_ - to build for watchOS (armv7k, arm64_32)
* _WATCHOSCOMBINED_ - to build for watchOS & Simulator (armv7k, arm64_32, i386)
* _SIMULATOR_WATCHOS_ - to build for watchOS Simulator (i386)
* _MAC_ - to build for macOS (x86_64)
* _MAC_ARM64_ - to build for macOS on Apple Silicon (arm64)
* _MAC_CATALYST_ - to build iOS for Mac (Catalyst, x86_64)
* _MAC_CATALYST_ARM64_ - to build iOS for Mac on Apple Silicon (Catalyst, arm64)

# Example usage 
**_NOTE_: Change the `-DPLATFORM` to an applicable value if targeting another platform.**

```bash
cd example/example-lib
mkdir build
cd build
cmake .. -G Xcode -DCMAKE_TOOLCHAIN_FILE=../../ios.toolchain.cmake -DPLATFORM=OS64
cmake --build . --config Release
```

This will build and install the library for the given PLATFORM. In this case, iOS with the arm64 architecture.

### COMBINED Options
The options called *COMBINED (OS64COMBINED, TVOSCOMBINED and WATCHOSCOMBINED) will build complete FAT-libraries for 
the given platform. These FAT-libraries include slices for both device and simulator, making the distribution and 
usage of the library much more simple!

Example:
```bash
cmake . -G Xcode -DCMAKE_TOOLCHAIN_FILE=../../ios.toolchain.cmake -DPLATFORM=OS64COMBINED
cmake --build . --config Release
cmake --install . --config Release
```

**_NOTE_: The COMBINED options _ONLY_ work with the Xcode generator (-G Xcode) on CMake versions 3.14+!**

---

### Exposed Variables
`XCODE_VERSION` - Version number (not including Build version) of Xcode detected.

`SDK_VERSION` - Version of SDK being used.

`CMAKE_OSX_ARCHITECTURES` - Architectures being compiled for (generated from PLATFORM).

`APPLE_TARGET_TRIPLE` - Used by autoconf build systems. 

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