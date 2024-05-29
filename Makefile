include options.mk

EXE		= smileboy

CFILES	+= $(shell find src -regex '.*\.c$$')
OFILES	+= $(CFILES:%.c=%.o)

LIBS	+=
LIBDIRS	+=
INCDIRS	+= include

LIBRARY	+= $(LIBDIRS:%=-L%) $(LIBS:%=-l%)
INCL	+= $(INCDIRS:%=-I%)

WARN	= -Wall
OPT		= -O0 -g

DEFINE	+=

LFLAGS	= $(LIBRARY) $(WARN)
CFLAGS	= $(INCL) $(DEFINE) $(OPT) $(WARN)

endif
################################################################

ifneq ($(OS),Windows_NT)

$(EXE):	$(OFILES)
	$(CC) $^ $(LFLAGS) -o $@

src/version.o:	CFLAGS += -D_VERSION_MAJOR=0 -D_VERSION_MINOR=1

%.o:	%.c
	$(CC) $^ $(CFLAGS) -c -o $@

else

$(EXE):	$(OFILES)
	$(LD) $^ -LIBPATH:C:\\Program\ Files\\Microsoft\ Visual\ Studio\\2022\\Community\\VC\\Tools\\MSVC\\14.39.33519\\ATLMFC\\lib\\x64 -LIBPATH:C:\\Program\ Files\\Microsoft\ Visual\ Studio\\2022\\Community\\VC\\Tools\\MSVC\\14.39.33519\\lib\\x64 -LIBPATH:C:\\Program\ Files\\Microsoft\ Visual\ Studio\\2022\\Community\\VC\\Tools\\MSVC\\14.39.33519\\lib\\x86\\store\\references -LIBPATH:C:\\Program\ Files\ \(x86\)\\Windows\ Kits\\10\\UnionMetadata\\10.0.22621.0 -LIBPATH:C:\\Program\ Files\ \(x86\)\\Windows\ Kits\\10\\References\\10.0.22621.0 -LIBPATH:C:\\WINDOWS\\Microsoft.NET\\Framework64\\v4.0.30319 -LIBPATH:C:\\Program\ Files\ \(x86\)\\Windows\ Kits\\10\\lib\\10.0.22621.0\\ucrt\\x64 -LIBPATH:C:\\Program\ Files\ \(x86\)\\Windows\ Kits\\10\\\\lib\\10.0.22621.0\\\\um\\x64 -DEBUG:FULL -OUT:$@

version.obj:	DEFINE += -D_VERSION_MAJOR=0 -D_VERSION_MINOR=1

%.obj:	src/%.c
	$(CC) -I/c/Program\ Files/Microsoft\ Visual\ Studio/2022/Community/VC/Tools/MSVC/14.39.33519/include -I/c/Program\ Files/Microsoft\ Visual\ Studio/2022/Community/VC/Tools/MSVC/14.39.33519/ATLMFC/include -I/c/Program\ Files/Microsoft\ Visual\ Studio/2022/Community/VC/Auxiliary/VS/include -I/c/Program\ Files\ \(x86\)/Windows\ Kits/10/include/10.0.22621.0/ucrt -I/c/Program\ Files\ \(x86\)/Windows\ Kits/10/include/10.0.22621.0/um -I/c/Program\ Files\ \(x86\)/Windows\ Kits/10/include/10.0.22621.0/shared -I/c/Program\ Files\ \(x86\)/Windows\ Kits/10/include/10.0.22621.0/winrt -I/c/Program\ Files\ \(x86\)/Windows\ Kits/10/include/10.0.22621.0/cppwinrt -Iinclude $^ -Zi $(DEFINE) -c -o$@

%.obj:	src/cpu/%.c
	$(CC) -I/c/Program\ Files/Microsoft\ Visual\ Studio/2022/Community/VC/Tools/MSVC/14.39.33519/include -I/c/Program\ Files/Microsoft\ Visual\ Studio/2022/Community/VC/Tools/MSVC/14.39.33519/ATLMFC/include -I/c/Program\ Files/Microsoft\ Visual\ Studio/2022/Community/VC/Auxiliary/VS/include -I/c/Program\ Files\ \(x86\)/Windows\ Kits/10/include/10.0.22621.0/ucrt -I/c/Program\ Files\ \(x86\)/Windows\ Kits/10/include/10.0.22621.0/um -I/c/Program\ Files\ \(x86\)/Windows\ Kits/10/include/10.0.22621.0/shared -I/c/Program\ Files\ \(x86\)/Windows\ Kits/10/include/10.0.22621.0/winrt -I/c/Program\ Files\ \(x86\)/Windows\ Kits/10/include/10.0.22621.0/cppwinrt -Iinclude $^ -Zi $(DEFINE) -c -o$@

endif

.PHONY:	clean
clean:
	-rm -vf $(OFILES) $(EXE)
