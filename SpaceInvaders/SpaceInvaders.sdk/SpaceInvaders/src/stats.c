/*
 * stats.c
 *
 *  Created on: Apr 20, 2021
 *      Author: sebastian
 */

#include "stats.h"

/*
 * 	Examples of use
 */

/*




*/


/*
 * 	Functions
 */

// Initialization of LED Matrix by initialization of BRAM.
u8 initStatsBram(u8 deviceID) {
		u8 status;

		StatsBramConfigPtr = XBram_LookupConfig(deviceID);
		if (StatsBramConfigPtr == (XBram_Config *) NULL) {
			xil_printf("BRAM Config lookup failed");
			return XST_FAILURE;
		}

		// Initialize BRAM from configuration
		status = XBram_CfgInitialize(&StatsBram, StatsBramConfigPtr, StatsBramConfigPtr->CtrlBaseAddress);
		if (status != XST_SUCCESS) {
			xil_printf("BRAM Initialization failed");
			return XST_FAILURE;
		}

		// Do selftest of BRAM module to check that it's functional
		status = XBram_SelfTest(&StatsBram, 0);
		if (status != XST_SUCCESS) {
			xil_printf("BRAM Selftest failed");
			return XST_FAILURE;
		}

		return XST_SUCCESS;
}

// Write the current level to BRAM memory for communication with Embedded Linux
void writeLevel(u8 level) {
	XBram_Out32(StatsBramConfigPtr->MemBaseAddress+LEVEL_ADDR, level);
}

// Write the current small UFO kills to BRAM memory for communication with Embedded Linux
void writeSmallKills(u32 kills) {
	XBram_Out32(StatsBramConfigPtr->MemBaseAddress+SMALL_ADDR, kills);
}

// Write the current medium UFO kills to BRAM memory for communication with Embedded Linux
void writeMedKills(u32 kills) {
	XBram_Out32(StatsBramConfigPtr->MemBaseAddress+MED_ADDR, kills);
}

// Write the current big UFO kills to BRAM memory for communication with Embedded Linux
void writeBigKills(u32 kills) {
	XBram_Out32(StatsBramConfigPtr->MemBaseAddress+BIG_ADDR, kills);
}

// Write the current health to BRAM memory for communication with Embedded Linux
void writeHealth(u8 health) {
	XBram_Out32(StatsBramConfigPtr->MemBaseAddress+HP_ADDR, health);
}

// Write the current power-up to BRAM memory for communication with Embedded Linux
void writePowerUp(u8 power_up) {
	XBram_Out32(StatsBramConfigPtr->MemBaseAddress+PUP_ADDR, power_up);
}
