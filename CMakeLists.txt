# CMakeLists.txt
cmake_minimum_required(VERSION 3.0)

project(test CXX)

# Download automatically, you can also just copy the conan.cmake file
if(NOT EXISTS "${CMAKE_BINARY_DIR}/conan.cmake")
   message(STATUS "Downloading conan.cmake from https://github.com/conan-io/cmake-conan")
   file(DOWNLOAD "https://github.com/conan-io/cmake-conan/raw/v0.15/conan.cmake"
                 "${CMAKE_BINARY_DIR}/conan.cmake")
endif()

include(${CMAKE_BINARY_DIR}/conan.cmake)

conan_cmake_run(REQUIRES fmt/6.2.1
                BASIC_SETUP CMAKE_TARGETS
                BUILD missing)

# find package from VCPKG
find_package(sqlite3 CONFIG REQUIRED)

add_executable(main main.cpp)
target_link_libraries(main
    PRIVATE CONAN_PKG::fmt sqlite3)