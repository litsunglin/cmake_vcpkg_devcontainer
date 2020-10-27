# cmake_vcpkg_conan
Basic example to build Win64 application with CMake, and VCPKG, based on
https://vcpkg.readthedocs.io/en/latest/examples/installing-and-using-packages/#cmake-toolchain-file

## VCPKG
### triplets x64-windows.cmake
````
set(VCPKG_TARGET_ARCHITECTURE x64)
set(VCPKG_CRT_LINKAGE dynamic)
set(VCPKG_LIBRARY_LINKAGE dynamic)
set(VCPKG_PLATFORM_TOOLSET v140)
````
### triplets x64-vc141-windows.cmake
````
set(VCPKG_TARGET_ARCHITECTURE x64)
set(VCPKG_CRT_LINKAGE dynamic)
set(VCPKG_LIBRARY_LINKAGE dynamic)
set(VCPKG_PLATFORM_TOOLSET v141)
````
### Install SQLite3
````
vcpkg install sqlite3:x64-windows

The package sqlite3:x64-windows provides CMake targets:
    find_package(sqlite3 CONFIG REQUIRED)
    target_link_libraries(main PRIVATE sqlite3)
````

## CONAN
### Add remote conan servers
````
conan remote add conan-center https://conan.bintray.com
conan remote add ConanServer http://192.168.1.27:8081/artifactory/api/conan/conan-local
````

## HOW TO BUILD
````
rmdir /Q /S build_msvc2015_x64
mkdir build_msvc2015_x64
cd build_msvc2015_x64
cmake .. -G "Visual Studio 14 2015 Win64" "-DCMAKE_TOOLCHAIN_FILE=W:\dev\vcpkg\scripts\buildsystems\vcpkg.cmake"
cmake --build ./
````
