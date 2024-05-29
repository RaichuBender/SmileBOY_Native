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

################################################################

$(EXE):	$(OFILES)
	$(CC) $^ $(LFLAGS) -o $@

src/version.o:	CFLAGS += -D_VERSION_MAJOR=0 -D_VERSION_MINOR=1

%.o:	%.c
	$(CC) $^ $(CFLAGS) -c -o $@

################################################################

.PHONY:	clean
clean:
	-rm -vf $(OFILES) $(EXE)
