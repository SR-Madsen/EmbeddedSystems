/*
 * sprites.h
 *
 *  Created on: Apr 7, 2021
 *      Author: sebastian
 */

#ifndef SRC_SPRITES_H_
#define SRC_SPRITES_H_

#include "led_matrix.h"


// Defines


// Variables


// Structs
typedef struct cannon_t {
	position_t core;
	position_t left_arm;
	position_t right_arm;
	position_t head;
	color_t colors;
	// u8 hp;
	// u8 speed;
	// u8 other variables for defining characteristics;
} cannon_t;


// Function prototypes
cannon_t draw_cannon(position_t pos);
u8 move_left_cannon(cannon_t *sprite);
u8 move_right_cannon(cannon_t *sprite);


#endif /* SRC_SPRITES_H_ */
