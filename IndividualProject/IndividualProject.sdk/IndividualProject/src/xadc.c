/*
 * xadc.c
 *
 *  Created on: Apr 7, 2021
 *      Author: sebastian
 */

#include "xadc.h"

/*
 * 	Examples of use
 */

/*


*/


/*
 * 	Functions
 */

// Initialization of XADC.
u8 initXAdc(u8 deviceID) {
	u8 status;

	XAdcConfigPtr = XAdcPs_LookupConfig(deviceID);
	if (XAdcConfigPtr == (XAdcPs_Config *) NULL) {
		xil_printf("XADC Config lookup failed");
		return XST_FAILURE;
	}

	// Initialize XADC from configuration
	status = XAdcPs_CfgInitialize(&XAdc, XAdcConfigPtr, XAdcConfigPtr->BaseAddress);
	if (status != XST_SUCCESS) {
		xil_printf("XADC Initialization failed");
		return XST_FAILURE;
	}

	// Do selftest of BRAM module to check that it's functional
	status = XAdcPs_SelfTest(&XAdc);
	if (status != XST_SUCCESS) {
		xil_printf("XADC Selftest failed");
		return XST_FAILURE;
	}

	return XST_SUCCESS;
}

// Get data from auxiliary channel conversion
u16 getXAdcAuxData(u8 channel) {
	return (XAdcPs_GetAdcData(&XAdc, XADCPS_CH_AUX_MIN + channel) >> SHIFT_LOWER_TWELVE);
}
