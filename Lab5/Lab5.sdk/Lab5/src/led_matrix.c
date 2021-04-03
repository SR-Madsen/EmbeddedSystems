/*
 * led_matrix.c
 *
 *  Created on: Mar 24, 2021
 *      Author: Sebastian
 */

#include "led_matrix.h"


/*
 * 	Examples of use
 */

/*
	--------- Initialize the LED Matrix by connecting to BRAM
	status = initLedMatrix(BRAM_DEVICE_ID);
	if (status != XST_SUCCESS) {
		xil_printf("LED matrix initialization failed.");
		while(1);
	}


	--------- Instantly change pixel color
	writePixelValueDirect(1, 1, 255, 0, 0);  -  Make pixel at position (1,1) red.
	writePixelValueDirect(1, 8, 255, 0, 0);  -  Make pixel at position (1,8) red.


	--------- Delayed change to single pixel color
	setPixelValue(4, 4, 0, 255, 0);  -  Ready pixel at position (4,4) for green.
	setPixelValue(4, 5, 0, 255, 0);
	writePixelValueToDevice(4, 4);   -  Write color value to pixel at position (4,4).
	writePixelValueToDevice(4, 5);


	--------- Delayed change to all pixel colors
	setPixelValue(2, 4, 0, 0, 255);
	setPixelValue(2, 5, 0, 0, 255);
	setPixelValue(7, 4, 0, 0, 255);
	setPixelValue(7, 5, 0, 0, 255);
	setPixelValue(1, 4, 0, 255, 255);
	setPixelValue(1, 5, 0, 255, 255);
	setPixelValue(8, 4, 0, 255, 255);
	setPixelValue(8, 5, 0, 255, 255);
	writeAllPixelsToDevice();  -  Write color values of all pixels (updated or not).


	--------- Using structs to make delayed changes to all pixel colors
	position_t pixel = {4, 8};  			-  Select position (4,8).
	color_t pixelColor = {255, 255, 0};  	-  Select color red + green = yellow.
	setPixel(pixel, pixelColor);  			-  Ready pixel at position (4,8) for yellow.
	pixel.x++;								-  Choose next x-coordinate (5,8)
	setPixel(pixel, pixelColor);
	pixel.y = 1;							-  Change y-coordinate (5,1)
	setPixel(pixel, pixelColor);
	pixel.x--;
	setPixel(pixel,pixelColor);
	writeAllPixelsToDevice();


	--------- Using enums to make delayed changes to all pixel colors
	enum COLORS pixelTeal = teal;			-  Create a teal value
	enum COLORS pixelWhite = white;			-  Create a white value
	setPixelValueColor(4, 7, pixelTeal);	-  Select color at position (4,7) using enum
	setPixelValueColor(5, 7, pixelTeal);
	setPixelValueColor(4, 2, pixelWhite);
	setPixelValueColor(5, 2, pixelWhite);
	writeAllPixelsToDevice();

	Possible color enums:
	red, yellow, purple, green, blue, teal, white, off
*/


/*
 * 	Functions
 */

// Initialization of LED Matrix by initialization of BRAM.
u8 initLedMatrix(u8 deviceID) {
	u8 status;

	BramConfigPtr = XBram_LookupConfig(deviceID);
	if (BramConfigPtr == (XBram_Config *) NULL) {
		xil_printf("Config lookup failed");
		return XST_FAILURE;
	}

	// Initialize BRAM from configuration
	status = XBram_CfgInitialize(&Bram, BramConfigPtr, BramConfigPtr->CtrlBaseAddress);
	if (status != XST_SUCCESS) {
		xil_printf("Initialization failed");
		return XST_FAILURE;
	}

	// Do selftest of BRAM module to check that it's functional
	status = XBram_SelfTest(&Bram, 0);
	if (status != XST_SUCCESS) {
		xil_printf("Selftest failed");
		return XST_FAILURE;
	}

	return XST_SUCCESS;
}

// Write 32-bit value to LED Matrix.
void ledMatrixOut32(u32 data, u32 addr) {
	XBram_Out32(BramConfigPtr->MemBaseAddress+addr, data);
}

// Set value of pixel by using integers
void setPixelValue(u8 x, u8 y, u8 red, u8 green, u8 blue) {
	pixels[x-1][y-1][RED] = red;
	pixels[x-1][y-1][GREEN] = green;
	pixels[x-1][y-1][BLUE] = blue;
}

// Set value of pixel by using structs
void setPixel(position_t pos, color_t col) {
	pixels[pos.x-1][pos.y-1][RED] = col.red;
	pixels[pos.x-1][pos.y-1][GREEN] = col.green;
	pixels[pos.x-1][pos.y-1][BLUE] = col.blue;
}

// Set value of a pixel using enum color input and struct
void setPixelColor(position_t pos, enum COLORS col) {
	u8 red_temp, green_temp, blue_temp;

	switch (col) {
	case red:
		red_temp = 255;
		green_temp = 0;
		blue_temp = 0;
		break;
	case yellow:
		red_temp = 255;
		green_temp = 255;
		blue_temp = 0;
		break;
	case purple:
		red_temp = 255;
		green_temp = 0;
		blue_temp = 255;
		break;
	case green:
		red_temp = 0;
		green_temp = 255;
		blue_temp = 0;
		break;
	case blue:
		red_temp = 0;
		green_temp = 0;
		blue_temp = 255;
		break;
	case teal:
		red_temp = 0;
		green_temp = 255;
		blue_temp = 255;
		break;
	case white:
		red_temp = 255;
		green_temp = 255;
		blue_temp = 255;
		break;
	case off:
	default:
		red_temp = 0;
		green_temp = 0;
		blue_temp = 0;
	}

	pixels[pos.x-1][pos.y-1][RED] = red_temp;
	pixels[pos.x-1][pos.y-1][GREEN] = green_temp;
	pixels[pos.x-1][pos.y-1][BLUE] = blue_temp;
}

// Set value of a pixel using enum color input and integers
void setPixelValueColor(u8 x, u8 y, enum COLORS col) {
	u8 red_temp, green_temp, blue_temp;

	switch (col) {
	case red:
		red_temp = 255;
		green_temp = 0;
		blue_temp = 0;
		break;
	case yellow:
		red_temp = 255;
		green_temp = 255;
		blue_temp = 0;
		break;
	case purple:
		red_temp = 255;
		green_temp = 0;
		blue_temp = 255;
		break;
	case green:
		red_temp = 0;
		green_temp = 255;
		blue_temp = 0;
		break;
	case blue:
		red_temp = 0;
		green_temp = 0;
		blue_temp = 255;
		break;
	case teal:
		red_temp = 0;
		green_temp = 255;
		blue_temp = 255;
		break;
	case white:
		red_temp = 255;
		green_temp = 255;
		blue_temp = 255;
		break;
	case off:
	default:
		red_temp = 0;
		green_temp = 0;
		blue_temp = 0;
	}

	pixels[x-1][y-1][RED] = red_temp;
	pixels[x-1][y-1][GREEN] = green_temp;
	pixels[x-1][y-1][BLUE] = blue_temp;
}

// Get value of a pixel as integers
void getPixelValue(u8 x, u8 y, u8 *red, u8 *green, u8 *blue) {
	*red = pixels[x-1][y-1][RED];
	*green = pixels[x-1][y-1][GREEN];
	*blue = pixels[x-1][y-1][BLUE];
}

// Get value of a pixel as struct
void getPixel(position_t pos, color_t *col) {
	col->red = pixels[pos.x-1][pos.y-1][RED];
	col->green = pixels[pos.x-1][pos.y-1][GREEN];
	col->blue = pixels[pos.x-1][pos.y-1][BLUE];
}

// Find out whether a certain pixel is lit up at all using integers
u8 pixelActiveValue(u8 x, u8 y) {
	if (pixels[x-1][y-1][RED] != 0 || pixels[x-1][y-1][GREEN] != 0 || pixels[x-1][y-1][BLUE] != 0) {
		return PIXEL_ACTIVE;
	}
	return PIXEL_INACTIVE;
}

// Find out whether a certain pixel is lit up at all using struct
u8 pixelActive(position_t pos) {
	if (pixels[pos.x-1][pos.y-1][RED] != 0 || pixels[pos.x-1][pos.y-1][GREEN] != 0 || pixels[pos.x-1][pos.y-1][BLUE] != 0) {
		return PIXEL_ACTIVE;
	}
	return PIXEL_INACTIVE;
}

// Increase the values of a pixel's colors up to 255 by using integers
void increasePixelValue(u8 x, u8 y, u8 red, u8 green, u8 blue) {
	if (255 - pixels[x-1][y-1][RED] >= red) {
		pixels[x-1][y-1][RED] += red;
	} else {
		pixels[x-1][y-1][RED] = 255;
	}

	if (255 - pixels[x-1][y-1][GREEN] >= green) {
		pixels[x-1][y-1][GREEN] += green;
	} else {
		pixels[x-1][y-1][GREEN] = 255;
	}

	if (255 - pixels[x-1][y-1][BLUE] >= blue) {
		pixels[x-1][y-1][BLUE] += blue;
	} else {
		pixels[x-1][y-1][BLUE] = 255;
	}
}

// Increase the values of a pixel's colors up to 255 by using structs
void increasePixel(position_t pos, color_t col) {
	if (255 - pixels[pos.x-1][pos.y-1][RED] >= col.red) {
		pixels[pos.x-1][pos.y-1][RED] += col.red;
	} else {
		pixels[pos.x-1][pos.y-1][RED] = 255;
	}

	if (255 - pixels[pos.x-1][pos.y-1][GREEN] >= col.green) {
		pixels[pos.x-1][pos.y-1][GREEN] += col.green;
	} else {
		pixels[pos.x-1][pos.y-1][GREEN] = 255;
	}

	if (255 - pixels[pos.x-1][pos.y-1][BLUE] >= col.blue) {
		pixels[pos.x-1][pos.y-1][BLUE] += col.blue;
	} else {
		pixels[pos.x-1][pos.y-1][BLUE] = 255;
	}
}

// Decrease the values of a pixel's colors down to 0 by using integers
void decreasePixelValue(u8 x, u8 y, u8 red, u8 green, u8 blue) {
	if (pixels[x-1][y-1][RED] >= red) {
		pixels[x-1][y-1][RED] -= red;
	} else {
		pixels[x-1][y-1][RED] = 0;
	}

	if (pixels[x-1][y-1][GREEN] >= green) {
		pixels[x-1][y-1][GREEN] -= green;
	} else {
		pixels[x-1][y-1][GREEN] = 0;
	}

	if (pixels[x-1][y-1][BLUE] >= blue) {
		pixels[x-1][y-1][BLUE] -= blue;
	} else {
		pixels[x-1][y-1][BLUE] = 0;
	}
}

// Decrease the values of a pixel's colors down to 0 by using structs
void decreasePixel(position_t pos, color_t col) {
	if (col.red < pixels[pos.x-1][pos.y-1][RED]) {
		pixels[pos.x-1][pos.y-1][RED] -= col.red;
	} else {
		pixels[pos.x-1][pos.y-1][RED] = 0;
	}

	if (col.green < pixels[pos.x-1][pos.y-1][GREEN]) {
		pixels[pos.x-1][pos.y-1][GREEN] -= col.green;
	} else {
		pixels[pos.x-1][pos.y-1][GREEN] = 0;
	}

	if (col.blue < pixels[pos.x-1][pos.y-1][BLUE]) {
		pixels[pos.x-1][pos.y-1][BLUE] -= col.blue;
	} else {
		pixels[pos.x-1][pos.y-1][BLUE] = 0;
	}
}

// Copy a pixel's values to another pixel by using integers (copies from x1,y1 to x2,y2)
void copyPixelValue(u8 x1, u8 y1, u8 x2, u8 y2) {
	pixels[x2-1][y2-1][RED] = pixels[x1-1][y1-1][RED];
	pixels[x2-1][y2-1][GREEN] = pixels[x1-1][y1-1][GREEN];
	pixels[x2-1][y2-1][BLUE] = pixels[x1-1][y1-1][BLUE];
}

// Copy a pixel's values to another pixel by using structs (copies from pos1 to pos2)
void copyPixel(position_t pos1, position_t pos2) {
	pixels[pos2.x-1][pos2.y-1][RED] = pixels[pos1.x-1][pos1.y-1][RED];
	pixels[pos2.x-1][pos2.y-1][GREEN] = pixels[pos1.x-1][pos1.y-1][GREEN];
	pixels[pos2.x-1][pos2.y-1][BLUE] = pixels[pos1.x-1][pos1.y-1][BLUE];
}


// Write a pixel's value out to the LED Matrix using integers
void writePixelValueToDevice(u8 x, u8 y) {
	u32 data = (pixels[x-1][y-1][RED]<<RED_SHIFT) | (pixels[x-1][y-1][GREEN]<<GREEN_SHIFT) | (pixels[x-1][y-1][BLUE]);
	ledMatrixOut32(data, BYTES_PER_WORD*((x-1)+((y-1)*NUMBER_OF_COLS)));
}

// Write a pixel's value out to the LED Matrix using struct
void writePixelToDevice(position_t pos) {
	u32 data = (pixels[pos.x-1][pos.y-1][RED]<<RED_SHIFT) | (pixels[pos.x-1][pos.y-1][GREEN]<<GREEN_SHIFT) | (pixels[pos.x-1][pos.y-1][BLUE]);
	ledMatrixOut32(data, BYTES_PER_WORD*((pos.x-1)+((pos.y-1)*NUMBER_OF_COLS)));
}

// Set value of pixel and write it to the LED Matrix using integers
void writePixelValueDirect(u8 x, u8 y, u8 red, u8 green, u8 blue) {
	setPixelValue(x, y, red, green, blue);
	writePixelValueToDevice(x, y);
}

// Set value of pixel and write it to the LED Matrix using structs
void writePixelDirect(position_t pos, color_t col) {
	setPixel(pos, col);
	writePixelToDevice(pos);
}

// Write all pixel values out to the LED Matrix
void writeAllPixelsToDevice() {
	for (int i = 1; i < 9; i++) {
		for (int j = 1; j < 9; j++) {
			writePixelValueToDevice(i,j);
		}
	}
}

// Reset pixel by using struct
void resetPixel(position_t pos) {
	color_t col = {0, 0, 0};
	writePixelDirect(pos, col);
}

// Reset pixel using integers
void resetPixelValue(u8 x, u8 y) {
	writePixelValueDirect(x, y, 0, 0, 0);
}

// Reset all pixels.
void resetAllPixels() {
	for (int i = 1; i < 9; i++) {
		for (int j = 1; j < 9; j++) {
			writePixelValueDirect(i, j, 0, 0, 0);
		}
	}
}
