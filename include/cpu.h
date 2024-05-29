#ifndef CPU_H
#define CPU_H

#include "common.h"

typedef struct cpu
{
	struct
	{
		union {		u16 af;		struct {  union { u8 f; FLAGS flags; };  u8 a;  };		};
		union {		u16 bc;		struct {  u8 c;  u8 b;  };		};
		union {		u16 de;		struct {  u8 e;  u8 d;  };		};
		union {		u16 hl;		struct {  u8 l;  u8 h;  };		};
		u16 sp;
		u16 pc;
	} regs;
} CPU;

#endif /* CPU_H */
