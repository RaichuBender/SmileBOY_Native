#ifndef FLAGS_H
#define FLAGS_H

#include "common.h"

typedef union flags
{
	u8 f;
	struct
	{
		u8 _PAD : 4;
		u8 C : 1;
		u8 H : 1;
		u8 N : 1;
		u8 Z : 1;
	};
} FLAGS;

#endif /* FLAGS_H */
