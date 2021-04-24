/*
 * gpios.h
 *
 *  Created on: Apr 7, 2021
 *      Author: sebastian
 */

#ifndef SRC_GPIOS_H_
#define SRC_GPIOS_H_

#include "platform.h"
#include "xparameters.h"
#include "xgpio.h"


// Defines


// Variables
XGpio Gpio[XPAR_XGPIO_NUM_INSTANCES];
XGpio_Config *GpioConfigPtr[XPAR_XGPIO_NUM_INSTANCES];

// Structs


// Function prototypes
u8 initGpio(u8 deviceID);

void setGpioDirection(u8 deviceID, u32 mask);
u32 readGpio(u8 deviceID);
void writeGpio(u8 deviceID, u32 mask);


#endif /* SRC_GPIOS_H_ */
