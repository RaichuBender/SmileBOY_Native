#ifndef MEMORY_H
#define MEMORY_H

#include "common.h"

#define ROM0	0x0000	// 16 KiB ROM bank 00	From cartridge, usually a fixed bank
#define ROM0_E	0x3FFF
#define ROMx	0x4000	// 16 KiB ROM Bank 01–NN	From cartridge, switchable bank via mapper (if any)	
#define ROMx_E	0x7FFF
#define VRAM	0x8000	// 8 KiB Video RAM (VRAM)	In CGB mode, switchable bank 0/1
#define VRAM_E	0x9FFF
#define ERAM	0xA000	// 8 KiB External RAM	From cartridge, switchable bank if any
#define ERAM_E	0xBFFF
#define WRAM0	0xC000	// 4 KiB Work RAM (WRAM)	
#define WRAM0_E	0xCFFF
#define WRAMx	0xD000	// 4 KiB Work RAM (WRAM)	In CGB mode, switchable bank 1–7
#define WRAMx_E	0xDFFF
#define ECHO	0xE000	// Echo RAM (mirror of C000–DDFF)	Nintendo says use of this area is prohibited.
#define ECHO_E	0xFDFF
#define OAM		0xFE00	// Object attribute memory (OAM)	
#define OAM_E	0xFE9F
#define UNUSE	0xFEA0	// Not Usable	Nintendo says use of this area is prohibited.
#define UNUSE_E	0xFEFF
#define IO		0xFF00	// I/O Registers	
#define IO_E	0xFF7F
#define HRAM	0xFF80	// High RAM (HRAM)	
#define HRAM_E	0xFFFE
#define IE		0xFFFF	// Interrupt Enable register (IE)
#define IE_E	0xFFFF

#define IO_JOYP	0xFF00	// $FF00			DMG	Joypad input
#define IO_SIO	0xFF01	// $FF01	$FF02	DMG	Serial transfer
#define IO_TMDV	0xFF04	// $FF04	$FF07	DMG	Timer and divider
#define IO_AUD	0xFF10	// $FF10	$FF26	DMG	Audio
#define IO_WVPT	0xFF30	// $FF30	$FF3F	DMG	Wave pattern
#define IO_LCD	0xFF40	// $FF40	$FF4B	DMG	LCD Control, Status, Position, Scrolling, and Palettes
#define IO_VRMB	0xFF4F	// $FF4F			CGB	VRAM Bank Select
#define IO_BOOT	0xFF50	// $FF50			DMG	Set to non-zero to disable boot ROM
#define IO_VDMA	0xFF51	// $FF51	$FF55	CGB	VRAM DMA
#define IO_BOPL	0xFF68	// $FF51	$FF55	CGB	BG / OBJ Palettes
#define IO_WRMB	0xFF70	// $FF70			CGB	WRAM Bank Select

#endif /* MEMORY_H */
