/*
 * gpois.c
 *
 *  Created on: Apr 7, 2021
 *      Author: sebastian
 */

#include "gpios.h"

/*
 * 	Examples of use
 */

/*




*/


/*
 * 	Functions
 */

// Initialize PL GPIO
u8 initGpio(u8 deviceID) {
	u8 status;

	GpioConfigPtr[deviceID] = XGpio_LookupConfig(deviceID);
	if (GpioConfigPtr[deviceID] == (XGpio_Config *) NULL) {
		xil_printf("GPIO Config lookup failed");
		return XST_FAILURE;
	}

	// Initialize XADC from configuration
	status = XGpio_CfgInitialize(&Gpio[deviceID], GpioConfigPtr[deviceID], GpioConfigPtr[deviceID]->BaseAddress);
	if (status != XST_SUCCESS) {
		xil_printf("GPIO Initialization failed");
		return XST_FAILURE;
	}

	// Do selftest of BRAM module to check that it's functional
	status = XGpio_SelfTest(&Gpio[deviceID]);
	if (status != XST_SUCCESS) {
		xil_printf("GPIO Selftest failed");
		return XST_FAILURE;
	}

	return XST_SUCCESS;
}

// Sets the direction (input or output) of pins in the GPIO device (1 in mask = input, 0 = output)
void setGpioDirection(u8 deviceID, u32 mask) {
	XGpio_SetDataDirection(&Gpio[deviceID], 1, mask);
}

// Reads the pins in the GPIO device
u32 readGpio(u8 deviceID) {
	return XGpio_DiscreteRead(&Gpio[deviceID], 1);
}

// Writes a value to the pins in the GPIO device
void writeGpio(u8 deviceID, u32 mask) {
	XGpio_DiscreteWrite(&Gpio[deviceID], 1, mask);
}
