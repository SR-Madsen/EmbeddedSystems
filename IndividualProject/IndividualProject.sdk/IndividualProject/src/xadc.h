/*
 * xadc.h
 *
 *  Created on: Apr 7, 2021
 *      Author: sebastian
 */

#ifndef SRC_XADC_H_
#define SRC_XADC_H_

#include <stdio.h>
#include "platform.h"
#include "xparameters.h"
#include "xadcps.h"


// Defines
#define AUX6  6
#define AUX7  7
#define AUX15 15

#define SHIFT_LOWER_TWELVE 4

// Variables
XAdcPs XAdc;
XAdcPs_Config *XAdcConfigPtr;

// Structs


// Function prototypes
u8 initXAdc(u8 deviceID);

u16 getXAdcAuxData(u8 channel);


#endif /* SRC_XADC_H_ */
