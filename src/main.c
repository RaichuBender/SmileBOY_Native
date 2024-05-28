#include "common.h"
#include "version.h"
#include <stdio.h>

void gb_reset(CPU *);

CPU sm83;
u8 mem[0x10000];

int main(int argc, char const *argv[])
{
	puts("SmileBOY");
	printf("Version %d.%02d\n\nMade by Thomas Gijsbers (RaichuBender)\n\n", version_major, version_minor);

	gb_reset(&sm83);

	return 0;
}
