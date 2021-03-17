/******************************************************************************
*
* Copyright (C) 2009 - 2014 Xilinx, Inc.  All rights reserved.
*
* Permission is hereby granted, free of charge, to any person obtaining a copy
* of this software and associated documentation files (the "Software"), to deal
* in the Software without restriction, including without limitation the rights
* to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
* copies of the Software, and to permit persons to whom the Software is
* furnished to do so, subject to the following conditions:
*
* The above copyright notice and this permission notice shall be included in
* all copies or substantial portions of the Software.
*
* Use of the Software is limited solely to applications:
* (a) running on a Xilinx device, or
* (b) that interact with a Xilinx device through a bus or interconnect.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
* XILINX  BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
* WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF
* OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
* SOFTWARE.
*
* Except as contained in this notice, the name of the Xilinx shall not be used
* in advertising or otherwise to promote the sale, use or other dealings in
* this Software without prior written authorization from Xilinx.
*
******************************************************************************/

/*
 * helloworld.c: simple test application
 *
 * This application configures UART 16550 to baud rate 9600.
 * PS7 UART (Zynq) is not initialized by this application, since
 * bootrom/bsp configures it to baud rate 115200
 *
 * ------------------------------------------------
 * | UART TYPE   BAUD RATE                        |
 * ------------------------------------------------
 *   uartns550   9600
 *   uartlite    Configurable only in HW design
 *   ps7_uart    115200 (configured by bootrom/bsp)
 */

#include <stdio.h>
#include "platform.h"
#include "xil_printf.h"
#include "xparameters.h"
#include "xbram.h"

/************************** Constant Definitions *****************************/

/*
 * The following constants map to the XPAR parameters created in the
 * xparameters.h file. They are defined here such that a user can easily
 * change all the needed parameters in one place.
 */
#define BRAM_DEVICE_ID		XPAR_BRAM_0_DEVICE_ID


/************************** Function Prototypes ******************************/


/************************** Variable Definitions *****************************/

/*
 * The following are declared globally so they are zeroed and so they are
 * easily accessible from a debugger
 */
XBram Bram;	/* The Instance of the BRAM Driver */


/****************************************************************************/
/**
*
* This function is the main function of the BRAM example.
*
* @param	None.
*
* @return
*		- XST_SUCCESS to indicate success.
*		- XST_FAILURE to indicate failure.
*
* @note		None.
*
*****************************************************************************/
int main(void)
{
	int Status;
	XBram_Config *ConfigPtr;

	u32 Data[] = {0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF};

	// Look up BRAM configuration
	ConfigPtr = XBram_LookupConfig(BRAM_DEVICE_ID);
	if (ConfigPtr == (XBram_Config *) NULL) {
		xil_printf("Config lookup failed");
		while(1);
	}

	// Initialize BRAM from configuration
	Status = XBram_CfgInitialize(&Bram, ConfigPtr, ConfigPtr->CtrlBaseAddress);
	if (Status != XST_SUCCESS) {
		xil_printf("Initialization failed");
		while(1);
	}

	// If ready for write, write some data
	if (ConfigPtr->EccPresent && ConfigPtr->EccOnOffRegister &&
		ConfigPtr->EccOnOffResetValue == 0 && ConfigPtr->WriteAccess != 0)
	{
		u16 counter = 0;
		for (u32 Addr = ConfigPtr->MemBaseAddress; Addr < ConfigPtr->MemBaseAddress+(4*4*32+1); Addr+=4)
		{
			XBram_Out32(Addr, Data[counter]);
			counter++;
		}
		XBram_WriteReg(ConfigPtr->CtrlBaseAddress, XBRAM_ECC_ON_OFF_OFFSET, 1);
	}

	// Do selftest of BRAM module to check that it's functional
	Status = XBram_SelfTest(&Bram, 0);
	if (Status != XST_SUCCESS) {
		xil_printf("Selftest failed");
		while(1);
	}

	xil_printf("Successfully ran Bram Example\r\n");
	return XST_SUCCESS;
}
