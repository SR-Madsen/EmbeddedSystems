/*
 * tasks.h
 *
 *  Created on: Apr 14, 2021
 *      Author: sebastian
 */

#ifndef SRC_TASKS_H_
#define SRC_TASKS_H_

#include <stdio.h>
#include "platform.h"
#include "xparameters.h"
#include "led_matrix.h"
#include "xadc.h"
#include "gpios.h"

// Defines


// Variables
extern u16 tick_value;

// Structs


// Function prototypes
// Reads the potentiometer value and sets the Run-to-Complete Scheduler timing with it.
void potentiometerTask();

// Reads joystick analog value and button value and set movement and shooting with it.
void joystickTask();

// Sets the colors of the background depending on level
void backgroundTask();

// Handles timing and moving sprites, as well as checking for collision.
// Can be seen as main game logic task.
void spritesTask();

// Writes values to the matrix once background and sprites are set.
void matrixTask();

// Handles updating the level and player HP, as well as writing statistics.
void levelTask();

// Writes statistics to the BRAM to be read by Embedded Linux
void BRAMTask();


#endif /* SRC_TASKS_H_ */
