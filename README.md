
## setup
### build docker image and run
```
docker build . -t "vcpkg-cmake-devcontainer" -f Dockerfile
```

### use with bash
```
docker run -it --mount type=bind,source="$(pwd)",target=/project vcpkg-cmake-devcontainer bash
```
### use with vscode
**TBD**

## build project
````
cd /project
cmake -B build -S . --preset debug
cmake --build build
````

## cmake && vcpkg
- Use CMakePresets.json for vcpkg toolchain and packages integration.
  - https://github.com/microsoft/vscode-cmake-tools/blob/main/docs/cmake-presets.md
- Use vcpkg.json for vcpkg manifest mode.
  - https://learn.microsoft.com/en-us/vcpkg/concepts/manifest-mode

## VCPKG custom triplet examples
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
