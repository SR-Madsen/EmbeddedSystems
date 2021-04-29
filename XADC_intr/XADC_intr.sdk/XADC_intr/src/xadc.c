/*
 * xadc.c
 *
 *  Created on: Apr 29, 2021
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
// See header file for documentation

u8 initXAdc() {
	u8 status;

	XAdcConfigPtr = XAdcPs_LookupConfig(XADC_DEVICE_ID);
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

u8 initGicXAdc(Xil_ExceptionHandler handler) {
	u8 status = XST_SUCCESS;

	// Initialize the interrupt controller driver with configuration so that it is ready to use.
	IntcConfig = XScuGic_LookupConfig(INTC_DEVICE_ID);
	if (NULL == IntcConfig) {
		return XST_FAILURE;
	}

	status = XScuGic_CfgInitialize(&InterruptController, IntcConfig,
					IntcConfig->CpuBaseAddress);
	if (status != XST_SUCCESS) {
		return XST_FAILURE;
	}

    // Initialize the exception vector table.
	Xil_ExceptionInit();

	// Register the interrupt controller handler with the exception table.
	Xil_ExceptionRegisterHandler(IRQ_F2P,
				(Xil_ExceptionHandler) XScuGic_InterruptHandler,
				&InterruptController);

	// Connect the GIC to the interrupt handler so that it is called when an interrupt occurs.
	status = XScuGic_Connect(&InterruptController, XADC_EOS,
				(Xil_ExceptionHandler)handler,
				&XAdc);
	if (status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	// Enable interrupt for XADC End-of-Sequence signal.
	XScuGic_Enable(&InterruptController, XADC_EOS);

	// Configure interrupt to high priority, rising-edge sensitive.
	XScuGic_SetPriorityTriggerType(&InterruptController, XADC_EOS, HIGH_PRIORITY, RISING_EDGE);

	// Enable exceptions globally.
	Xil_ExceptionEnable();

	return status;
}

void getBatteryRaw(u16 *raw) {
	*raw = (XAdcPs_GetAdcData(&XAdc, XADCPS_CH_AUX_MIN + 14) >> 4);
}

void getTorqueRaw(u16 *raw) {
	*raw = (XAdcPs_GetAdcData(&XAdc, XADCPS_CH_AUX_MIN + 6) >> 4);
}

void getPhaseARaw(u16 *raw) {
	*raw = (XAdcPs_GetAdcData(&XAdc, XADCPS_CH_AUX_MIN + 7) >> 4);
}

void getPhaseBRaw(u16 *raw) {
	*raw = (XAdcPs_GetAdcData(&XAdc, XADCPS_CH_AUX_MIN + 15) >> 4);
}
