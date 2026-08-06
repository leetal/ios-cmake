# Examples

## example-lib

A small C++/Objective-C++ static (or shared) library that exercises most of what the toolchain sets up: named languages, try_compile checks, framework lookup and XCTest via `find_host_package`. This is also what the CI pipelines build for every platform.

```bash
cd example/example-lib
cmake -B build -G Xcode -DCMAKE_TOOLCHAIN_FILE=../../ios.toolchain.cmake -DPLATFORM=OS64
cmake --build build --config Release
```

For the macOS platforms (`-DPLATFORM=MAC*`) a small TestApp bundle is built and installed as well.

## example-app

An iOS app (Xcode project) that consumes the library built by example-lib. The app expects the library to be installed into `example/example-app/example-lib/` first, which is the default install prefix of example-lib:

```bash
cd example/example-lib
cmake -B build -G Xcode -DCMAKE_TOOLCHAIN_FILE=../../ios.toolchain.cmake -DPLATFORM=SIMULATORARM64 -DBUILD_SHARED=1
cmake --build build --config Release
cmake --install build --config Release
open ../example-app/example-app.xcodeproj
```

Nothing pre-built is checked in, so the app will not link until you have run the install step above.

## example-curl

Cross-compiles a real third-party library (libcurl) with the toolchain through `ExternalProject_Add`, the same way you would pull in any external CMake based dependency:

```bash
cd example/example-curl
cmake -B build -G Xcode -DCMAKE_TOOLCHAIN_FILE=../../ios.toolchain.cmake -DPLATFORM=OS64
cmake --build build --config Release
```
