/*
 * led_matrix.h
 *
 *  Created on: Mar 24, 2021
 *      Author: Sebastian
 */

#ifndef SRC_LED_MATRIX_H_
#define SRC_LED_MATRIX_H_

#include <stdio.h>
#include "platform.h"
#include "xparameters.h"
#include "xbram.h"

// Defines
#define RED 0
#define GREEN 1
#define BLUE 2

#define RED_SHIFT 16
#define GREEN_SHIFT 8

#define BYTES_PER_WORD 4

#define NUMBER_OF_COLS 8

#define PIXEL_ACTIVE 1
#define PIXEL_INACTIVE 0

// Variables
XBram Bram;
XBram_Config *BramConfigPtr;

u8 pixels[8][8][3];

// Structs
typedef struct position_t {
	u8 x;
	u8 y;
} position_t;

typedef struct color_t {
	u8 red;
	u8 green;
	u8 blue;
} color_t;

enum COLORS {
	red, yellow, purple, green, blue, teal, white, off
};

// Functions
u8 initLedMatrix(u8 deviceID);

void ledMatrixOut32(u32 data, u32 addr);

void setPixelValue(u8 x, u8 y, u8 red, u8 green, u8 blue);
void setPixel(position_t pos, color_t col);
void setPixelColor(position_t pos, enum COLORS col);
void setPixelValueColor(u8 x, u8 y, enum COLORS col);
void getPixelValue(u8 x, u8 y, u8 *red, u8 *green, u8 *blue);
void getPixel(position_t pos, color_t *col);

u8 pixelActiveValue(u8 x, u8 y);
u8 pixelActive(position_t pos);

void increasePixelValue(u8 x, u8 y, u8 red, u8 green, u8 blue);
void increasePixel(position_t pos, color_t col);
void decreasePixelValue(u8 x, u8 y, u8 red, u8 green, u8 blue);
void decreasePixel(position_t pos, color_t col);

void copyPixelValue(u8 x1, u8 y1, u8 x2, u8 y2);
void copyPixel(position_t pos1, position_t pos2);
// FUNCTIONS FOR MOVE PIXEL?

void writePixelValueToDevice(u8 x, u8 y);
void writePixelToDevice(position_t pos);
void writePixelValueDirect(u8 x, u8 y, u8 red, u8 green, u8 blue);
void writePixelDirect(position_t pos, color_t col);
void writeAllPixelsToDevice();

void resetPixel(position_t pos);
void resetPixelValue(u8 x, u8 y);
void resetAllPixels();


#endif /* SRC_LED_MATRIX_H_ */
