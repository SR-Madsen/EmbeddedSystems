#include <stdio.h>
#include <stdlib.h>
#include "platform.h"
#include "xil_printf.h"
#include "xparameters.h"
#include "xbram.h"
#include "led_matrix.h"
#include "sleep.h"

/************************** Constant Definitions *****************************/

/*
 * The following constants map to the XPAR parameters created in the
 * xparameters.h file. They are defined here such that a user can easily
 * change all the needed parameters in one place.
 */
#define BRAM_DEVICE_ID		XPAR_BRAM_0_DEVICE_ID


/************************** Function Prototypes ******************************/


/************************** Variable Definitions *****************************/


// Main function for LED matrix
int main(void)
{
	int status;

	status = initLedMatrix(BRAM_DEVICE_ID);
	if (status != XST_SUCCESS) {
		xil_printf("LED matrix initialization failed.");
		while(1);
	}

	// Running LED example
	/*
	while(1) {
		for (int i = 1; i < 9; i++) {
			for (int j = 1; j < 9; j++) {
				if (j > 1) { resetPixelValue(j-1, i); }
				else if (j == 1 && i > 1) { resetPixelValue(8,i-1); }
				writePixelValueDirect(j, i, 255, 0, 0);
				usleep(100000);
			}
		}
		resetPixelValue(8,8);
	}
	*/

	// Fading dots example
	/*
	u8 iterations = 0;
	while(1) {
		for (int i = 1; i < 9; i++) {
			for (int j = 1; j < 9; j++) {
				u8 curr_red, curr_green, curr_blue;
				getPixelValue(i, j, &curr_red, &curr_green, &curr_blue);
				if (curr_red > 9 && curr_green > 9 && curr_blue > 9) {
					setPixelValue(i, j, curr_red-3, curr_green-3, curr_blue-3);
				} else if (curr_red > 9 && curr_green > 9) {
					setPixelValue(i, j, curr_red-3, curr_green-3, 0);
				} else if (curr_red > 9 && curr_blue > 9) {
					setPixelValue(i, j, curr_red-3, 0, curr_blue-3);
				} else if (curr_red > 9) {
					setPixelValue(i, j, curr_red-3, 0, 0);
				} else if (curr_green > 9 && curr_blue > 9) {
					setPixelValue(i, j, 0, curr_green-3, curr_blue-3);
				} else if (curr_green > 9) {
					setPixelValue(i, j, 0, curr_green-3, 0);
				} else if (curr_blue > 9) {
					setPixelValue(i, j, 0, 0, curr_blue-3);
				} else {
					setPixelValue(i, j, 0, 0, 0);
				}
			}
		}

		if (iterations++ == 20) {
			u8 i = rand()%8 + 1;
			u8 j = rand()%8 + 1;
			u8 rand_red = rand()%255 + 1;
			u8 rand_green = rand()%255 + 1;
			u8 rand_blue = rand()%255 + 1;
			setPixelValue(i, j, rand_red, rand_green, rand_blue);
			iterations = 0;
		}

		writeAllPixelsToDevice();
		usleep(25000);
	}
	*/

	// Falling lights example

	while (1) {
		u8 random_column = rand()%8 + 1;
		u8 red = 0, green = 0, blue = 0;
		while (red == 0 && green == 0 && blue == 0) {
			red = rand()%2;
			green = rand()%2;
			blue = rand()%2;
		}
		writePixelValueDirect(random_column, 1, 22*red, 22*green, 22*blue);

		for (int row = 2; row < 10; row++) {
			usleep(50000);
			for (int column = 1; column < 9; column++) {
				if (row == 9) {
					writePixelValueDirect(column, row-1, 0, 0, 0);
				} else {
					if (pixelActiveValue(column, row-1)) {
						copyPixelValue(column, row-1, column, row);
						decreasePixelValue(column, row, 3, 3, 3);
						writePixelValueToDevice(column, row);
						writePixelValueDirect(column, row-1, 0, 0, 0);
					}
				}
			}
		}
	}


	xil_printf("Successfully ran code.\r\n");
	while(1);
	return XST_SUCCESS;
}
