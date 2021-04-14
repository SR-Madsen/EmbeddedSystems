/*
 * tasks.c
 *
 *  Created on: Apr 14, 2021
 *      Author: sebastian
 */

#include "tasks.h"

/*
 * 	Examples of use
 */

/*




*/


/*
 * 	Functions
 */

// Reads the potentiometer value and sets the Run-to-Complete Scheduler timing with it.
void potentiometerTask() {
	u16 temp_data;
	temp_data = getXAdcAuxData(POT_CH);

	tick_value = 40 + (temp_data << 4);
}

// Reads joystick analog value and button value and set movement and shooting with it.
void joystickTask() {
	u16 temp_data;
	u8 temp_btn;

	temp_data = getXAdcAuxData(GYRO_X_CH);
	temp_btn = readGpio(GPIO1_DEVICE_ID);
}

// Sets the colors of the background depending on level
void backgroundTask() {
	// READ LEVEL VALUE AND SET COLOR DEPENDING ON IT
	// color_level = 255 - level*63 - 1*level for example, only changing 0,0,255 (not 0,255,0)
	for (int row = 1; row < NUMBER_OF_ROWS+1; row++) {
		for (int column = 1; column < NUMBER_OF_COLS+1; column++) {
			if (row == 1 || row == 2) {
				setPixelValue(column, row, 0, 255, 0);
			} else {
				setPixelValue(column, row, 0, 0, 255);
			}
		}
	}
}

// Handles timing and moving sprites, as well as checking for collision.
// Can be seen as main game logic task.
void spritesTask() {

}

// Writes values to the matrix once background and sprites are set.
void matrixTask() {
	void writeAllPixelsToDevice();
}

// Handles updating the level and player HP, as well as writing statistics.
void levelTask() {

}

// Writes statistics to the BRAM to be read by Embedded Linux
void BRAMTask() {
	// Create BRAM driver from led_matrix driver
}
