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
#include "stats.h"
#include "sprites.h"

// Defines
#define NONE  0
#define SHOOT 1
#define LEFT  1
#define RIGHT 2

#define LED_1 1
#define LED_2 2
#define LED_3 4
#define LED_4 8

#define BIG_BULLET  1
#define TRI_BULLET  2
#define FREEZE		3

// Variables
extern u16 tick_value;
extern u8 game_over;

u8 player_health;
u8 level;

u8 move_direction;
u8 shot_request;

u8 power_up;
u32 small_kills;
u32 medium_kills;
u32 big_kills;

u8 valid;

// Structs
cannon_t cannon;
bullet_t bullet;
smallUFO_t smalls[10];
mediumUFO_t meds[5];
bigUFO_t bigs[3];

// Function prototypes

// Initializes the variables to be used.
void initVariables();

// Reads the potentiometer value and sets the Run-to-Complete Scheduler timing with it.
void potentiometerTask();

// Reads joystick analog value and button value and set movement and shooting with it.
void joystickTask(int GYRO_GPIO_ID);

// Sets the colors of the background depending on level
void backgroundTask();

// Handles timing and moving sprites, as well as checking for collision.
// Can be seen as main game logic task.
void spritesTask();

// Writes values to the matrix once background and sprites are set.
void matrixTask();

// Handles updating the level and player HP, as well as writing statistics.
void levelTask(int LED_GPIO_ID);

// Task that handles game over and restart
void gameOverTask();


#endif /* SRC_TASKS_H_ */
