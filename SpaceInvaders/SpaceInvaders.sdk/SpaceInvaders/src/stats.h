/*
 * stats.h
 *
 *  Created on: Apr 20, 2021
 *      Author: sebastian
 */

#ifndef SRC_STATS_H_
#define SRC_STATS_H_

#include <stdio.h>
#include "platform.h"
#include "xparameters.h"
#include "xbram.h"

// Defines
#define BYTES_PER_WORD 	4
#define LEVEL_ADDR 		BYTES_PER_WORD * 0
#define SMALL_ADDR 		BYTES_PER_WORD * 1
#define MED_ADDR   		BYTES_PER_WORD * 2
#define BIG_ADDR   		BYTES_PER_WORD * 3
#define HP_ADDR	   		BYTES_PER_WORD * 4
#define PUP_ADDR   		BYTES_PER_WORD * 5

// Variables
XBram StatsBram;
XBram_Config *StatsBramConfigPtr;

// Structs


// Function prototypes
u8 initStatsBram(u8 deviceID);

void writeLevel(u8 level);
void writeSmallKills(u32 kills);
void writeMedKills(u32 kills);
void writeBigKills(u32 kills);
void writeHealth(u8 health);
void writePowerUp(u8 power_up);

#endif /* SRC_STATS_H_ */
