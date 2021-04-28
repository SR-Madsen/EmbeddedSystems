/*
 * blockram.c
 *
 *  Created on: Apr 28, 2021
 *      Author: sebastian
 */

#include "blockram.h"

// Functions
void open_bram(int fd) {
	bram_size = BRAM_LENGTH;
	bram_pbase = BRAM_PHYSICAL_BASEADDR;
	bram_vptr = (u32*) mmap(NULL, bram_size, PROT_READ | PROT_WRITE, MAP_SHARED, fd, bram_pbase);
}

void write_bram(u32 offset, u32 data) {
	bram_vptr[offset] = data;
}

void read_level(u32 *level) {
	*level = bram_vptr[LEVEL_OFFSET];
}

void read_small(u32 *small) {
	*small = bram_vptr[SMALL_KILLS_OFFSET];
}

void read_medium(u32 *medium) {
	*medium = bram_vptr[MEDIUM_KILLS_OFFSET];
}

void read_big(u32 *big) {
	*big = bram_vptr[BIG_KILLS_OFFSET];
}

void read_health(u32 *health) {
	*health = bram_vptr[HEALTH_OFFSET];
}

void read_pup(u32 *pup) {
	*pup = bram_vptr[POWER_UP_OFFSET];
}
