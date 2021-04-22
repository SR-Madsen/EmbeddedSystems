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
#define CANNON_SPEED	0
#define BULLET_SPEED	0
#define SMALL_SPEED		4
#define MEDIUM_SPEED	6
#define BIG_SPEED 		10
#define SMALL_HP		1
#define MEDIUM_HP		3
#define BIG_HP			5

// Variables
color_t bullet_color;
color_t cannon_color;

// Structs
typedef struct cannon_t {
	position_t core;
	position_t left_arm;
	position_t right_arm;
	position_t head;
	color_t colors;
	u8 speed_timer;
} cannon_t;

typedef struct bullet_t {
	position_t core;
	color_t colors;
	u8 active;
	u8 speed_timer;
} bullet_t;

typedef struct smallUFO_t {
	position_t left;
	position_t right;
	color_t colors;
	u8 health;
	u8 speed_timer;
	u8 active;
} smallUFO_t;

typedef struct mediumUFO_t {
	position_t core;
	position_t left;
	position_t right;
	color_t colors;
	u8 health;
	u8 speed_timer;
	u8 active;
} mediumUFO_t;

typedef struct bigUFO_t {
	position_t core;
	position_t left;
	position_t right;
	position_t core_up;
	position_t left_up;
	position_t right_up;
	color_t colors;
	u8 health;
	u8 speed_timer;
	u8 active;
} bigUFO_t;

// Function prototypes
cannon_t draw_cannon(position_t pos);
u8 move_left_cannon(cannon_t *sprite);
u8 move_right_cannon(cannon_t *sprite);
void update_cannon(cannon_t *sprite);
void color_cannon_big(cannon_t *sprite);
void color_cannon_tri(cannon_t *sprite);
void color_cannon_freeze(cannon_t *sprite);
void color_cannon_normal(cannon_t *sprite);

bullet_t draw_bullet(position_t pos);
u8 move_up_bullet(bullet_t *sprite);
u8 move_left_bullet(bullet_t *sprite);
u8 move_right_bullet(bullet_t *sprite);
void remove_bullet(bullet_t *sprite);
void update_bullet(bullet_t *sprite);
void color_bullet_big();
void color_bullet_normal();
void change_bullet_color(bullet_t *sprite);

smallUFO_t draw_small(position_t pos);
u8 move_down_small(smallUFO_t *sprite);
void remove_small(smallUFO_t *sprite);
void update_small(smallUFO_t *sprite);

mediumUFO_t draw_medium(position_t pos);
u8 move_down_medium(mediumUFO_t *sprite);
void remove_medium(mediumUFO_t *sprite);
void update_medium(mediumUFO_t *sprite);

bigUFO_t draw_big(position_t pos);
u8 move_down_big(bigUFO_t *sprite);
void remove_big(bigUFO_t *sprite);
void update_big(bigUFO_t *sprite);


#endif /* SRC_SPRITES_H_ */
