/************ ELECTRIC GO-KART MAIN ************/
#include <stdio.h>
#include "platform.h"
#include "xparameters.h"
#include "xil_printf.h"


// User includes
#include "xadc.h"

// User defines


static void XAdcInterruptHandler(XAdcPs *XAdc);

// User structs


// User variables
u32 downscaler = 0;

int main()
{
    init_platform();

    initXAdc();

    initGicXAdc((Xil_ExceptionHandler)XAdcInterruptHandler);

	xil_printf("Now going into loop.");
	while(1);

    /************************
     * INSERT CODE HERE
     */

    cleanup_platform();
    return 0;
}

static void XAdcInterruptHandler(XAdcPs *XAdc) {
	if (downscaler++ >= 250000) {
		u16 temp_data = 0;
		getBatteryRaw(&temp_data);
		xil_printf("Battery reading is: %d\r\n", temp_data);
		getPhaseARaw(&temp_data);
		xil_printf("Phase A reading is: %d\r\n", temp_data);
		getPhaseBRaw(&temp_data);
		xil_printf("Phase B reading is: %d\r\n", temp_data);
		downscaler = 0;
		xil_printf("\r\n\r\n");
	}
}
