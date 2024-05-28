#include "common.h"
#include "version.h"
#include <stdio.h>

#define BYTE_TO_BINARY_PATTERN "%c%c%c%c%c%c%c%c"
#define BYTE_TO_BINARY(byte)         \
	((byte) & 0x80 ? '1' : '0'),     \
		((byte) & 0x40 ? '1' : '0'), \
		((byte) & 0x20 ? '1' : '0'), \
		((byte) & 0x10 ? '1' : '0'), \
		((byte) & 0x08 ? '1' : '0'), \
		((byte) & 0x04 ? '1' : '0'), \
		((byte) & 0x02 ? '1' : '0'), \
		((byte) & 0x01 ? '1' : '0')

void gb_reset(CPU *);

CPU sm83;
u8 mem[0x10000];

int main(int argc, char const *argv[])
{
	puts("SmileBOY");
	printf("Version %d.%02d\n\nMade by Thomas Gijsbers (RaichuBender)\n\n", version_major, version_minor);

	gb_reset(&sm83);

	sm83.regs.a = 0x5a;

	sm83.regs.flags._PAD = 0b0101;
	sm83.regs.flags.C = 0;
	sm83.regs.flags.H = 1;
	sm83.regs.flags.N = 0;
	sm83.regs.flags.Z = 1;

	printf("AF <:: 0x%02x (0b" BYTE_TO_BINARY_PATTERN " 0b" BYTE_TO_BINARY_PATTERN ")\n", sm83.regs.af, BYTE_TO_BINARY(sm83.regs.a), BYTE_TO_BINARY(sm83.regs.f));

	return 0;
}
