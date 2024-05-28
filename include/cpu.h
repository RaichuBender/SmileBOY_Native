#ifndef CPU_H
#define CPU_H

#include "common.h"

typedef struct cpu
{
	struct
	{
		union
		{
			u16 af;
			struct
			{
				u8 a;
				FLAGS f;
			};
		};
		union
		{
			u16 bc;
			struct
			{
				u8 b;
				u8 c;
			};
		};
		union
		{
			u16 de;
			struct
			{
				u8 d;
				u8 e;
			};
		};
		union
		{
			u16 hl;
			struct
			{
				u8 h;
				u8 l;
			};
		};
		u16 sp;
		u16 pc;
	} regs;
} CPU;

#endif /* CPU_H */
