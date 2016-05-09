include(CMakeForceCompiler)

set(NACL                        ON)
set(PCH_DISABLE                 ON)

if (APPLE)
    set(PLATFORM_ARCH "mac")
else (APPLE)
    if (UNIX)
        set(PLATFORM_ARCH "linux")
    else (UNIX)
        message(FATAL_ERROR "Only macosx and linux are supported")
    endif (UNIX)
endif (APPLE)

if (NOT DEFINED ENV{NACL_SDK_ROOT})
    message(FATAL_ERROR "NACL_SDK_ROOT must be set in env")
endif (NOT DEFINED ENV{NACL_SDK_ROOT})
if (NOT DEFINED ENV{QT_NACL_SDK_ROOT})
    message(FATAL_ERROR "QT_NACL_SDK_ROOT must be set in env")
endif (NOT DEFINED ENV{QT_NACL_SDK_ROOT})
add_definitions(-DNACL)
include_directories($ENV{NACL_SDK_ROOT}/include)
link_directories($ENV{NACL_SDK_ROOT}/lib/newlib_x86_64/Release)
set(LIBRARIES ppapi ppapi_cpp ppapi_gles2)
set(CMAKE_PREFIX_PATH $ENV{QT_NACL_SDK_ROOT}/lib/cmake)

set(PLATFORM_NAME               "NaCl")
set(PLATFORM_TRIPLET            "x86_64-nacl")
set(PLATFORM_PREFIX             "$ENV{NACL_SDK_ROOT}/toolchain/${PLATFORM_ARCH}_x86_newlib")
set(PLATFORM_PORTS_PREFIX       "${CMAKE_SOURCE_DIR}/ports/NaCl")
set(PLATFORM_EXE_SUFFIX         ".nexe")

set(CMAKE_SYSTEM_NAME           "Linux" CACHE STRING "Target system.")
set(CMAKE_SYSTEM_PROCESSOR      "LLVM-IR" CACHE STRING "Target processor.")
#set(CMAKE_FIND_ROOT_PATH        "${PLATFORM_PORTS_PREFIX}" "${PLATFORM_PREFIX}/le32-nacl")
set(CMAKE_C_COMPILER            "${PLATFORM_PREFIX}/bin/${PLATFORM_TRIPLET}-gcc")
set(CMAKE_CXX_COMPILER          "${PLATFORM_PREFIX}/bin/${PLATFORM_TRIPLET}-g++")
set(CMAKE_C_FLAGS               "-m64 -U__STRICT_ANSI__" CACHE STRING "")
set(CMAKE_CXX_FLAGS             "-m64 -U__STRICT_ANSI__" CACHE STRING "")
set(CMAKE_C_FLAGS_RELEASE       "-O4 -ffast-math" CACHE STRING "")
set(CMAKE_CXX_FLAGS_RELEASE     "-O4 -ffast-math" CACHE STRING "")
set(CMAKE_C_FLAGS_DEBUG         "-O0 -g" CACHE STRING "")
set(CMAKE_CXX_FLAGS_DEBUG       "-O0 -g" CACHE STRING "")

cmake_force_c_compiler(         ${CMAKE_C_COMPILER} Clang)
cmake_force_cxx_compiler(       ${CMAKE_CXX_COMPILER} Clang)

set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)

include(CMakeForceCompiler)
cmake_force_c_compiler(${CMAKE_C_COMPILER} Clang)
cmake_force_cxx_compiler(${CMAKE_CXX_COMPILER} Clang)
