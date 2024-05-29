ifneq ($(OS),Windows_NT)

# CC	= clang
# CXX	= clang++
# LD	= ld.lld

else

# TODO add branches for x86 and arm64
__VCVARSALL_TARGET_ARCH	= x64
__VCVARSALL_HOST_ARCH	= x64
__local_ARG_FOUND		= 1

CC	= /c/Program\ Files/Microsoft\ Visual\ Studio/2022/Community/VC/Tools/MSVC/14.39.33519/bin/HostX64/x64/cl.exe
CXX	= /c/Program\ Files/Microsoft\ Visual\ Studio/2022/Community/VC/Tools/MSVC/14.39.33519/bin/HostX64/x64/cl.exe
LD	= /c/Program\ Files/Microsoft\ Visual\ Studio/2022/Community/VC/Tools/MSVC/14.39.33519/bin/HostX64/x64/link.exe

endif
