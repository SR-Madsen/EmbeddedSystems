/*
 * blockram.h
 *
 *  Created on: Apr 28, 2021
 *      Author: sebastian
 */

#ifndef SRC_BLOCKRAM_H_
#define SRC_BLOCKRAM_H_

// Includes
#include <stdlib.h>
#include <stdio.h>
#include <sys/mman.h>

// Defines
#define BRAM_PHYSICAL_BASEADDR 	0x40000000
#define BRAM_LENGTH				0x00002000
#define LEVEL_OFFSET			0
#define SMALL_KILLS_OFFSET		1
#define MEDIUM_KILLS_OFFSET		2
#define BIG_KILLS_OFFSET		3
#define HEALTH_OFFSET			4
#define POWER_UP_OFFSET			5


// Type Definitions
typedef long int u32;


// Variables
unsigned int bram_size;
off_t bram_pbase;
u32 *bram_vptr;


// Functions
void open_bram(int fd);

void write_bram(u32 offset, u32 data);

void read_level(u32 *level);
void read_small(u32 *small);
void read_medium(u32 *medium);
void read_big(u32 *big);
void read_health(u32 *health);
void read_pup(u32 *pup);


#endif /* SRC_BLOCKRAM_H_ */
