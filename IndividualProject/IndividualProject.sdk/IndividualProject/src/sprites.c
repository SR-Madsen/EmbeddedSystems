/*
 * sprites.c
 *
 *  Created on: Apr 7, 2021
 *      Author: sebastian
 */

#include "sprites.h"

/*
 * 	Examples of use
 */

/*




*/


/*
 * 	Functions
 */

// Draw and initialize cannon sprite, returning a struct to it.
cannon_t draw_cannon(position_t pos) {
	cannon_t sprite;

	sprite.core.x = pos.x;
	sprite.core.y = pos.y;
	sprite.left_arm.x = pos.x-1;
	sprite.left_arm.y = pos.y;
	sprite.right_arm.x = pos.x+1;
	sprite.right_arm.y = pos.y;
	sprite.head.x = pos.x;
	sprite.head.y = pos.y+1;
	sprite.colors.red = 255;
	sprite.colors.green = 0;
	sprite.colors.blue = 0;

	writePixelDirect(sprite.core, sprite.colors);
	writePixelDirect(sprite.left_arm, sprite.colors);
	writePixelDirect(sprite.right_arm, sprite.colors);
	writePixelDirect(sprite.head, sprite.colors);

	return sprite;
}

// Move cannon sprite to the left if possible, returning 1 if possible and 0 if not.
u8 move_left_cannon(cannon_t *sprite) {
	u8 status = 0;

	if (sprite->left_arm.x > 1) {
		sprite->core.x = sprite->core.x-1;
		sprite->core.y = sprite->core.y;
		sprite->left_arm.x = sprite->left_arm.x-1;
		sprite->left_arm.y = sprite->left_arm.y;
		sprite->right_arm.x = sprite->right_arm.x-1;
		sprite->right_arm.y = sprite->right_arm.y;
		sprite->head.x = sprite->head.x-1;
		sprite->head.y = sprite->head.y;

		status = 1;
	}

	writePixelDirect(sprite->core, sprite->colors);
	writePixelDirect(sprite->left_arm, sprite->colors);
	writePixelDirect(sprite->right_arm, sprite->colors);
	writePixelDirect(sprite->head, sprite->colors);

	return status;
}

// Move cannon sprite to the right if possible, returning 1 if possible and 0 if not.
u8 move_right_cannon(cannon_t *sprite) {
	u8 status = 0;

	if (sprite->right_arm.x < 8) {
		sprite->core.x = sprite->core.x+1;
		sprite->core.y = sprite->core.y;
		sprite->left_arm.x = sprite->left_arm.x+1;
		sprite->left_arm.y = sprite->left_arm.y;
		sprite->right_arm.x = sprite->right_arm.x+1;
		sprite->right_arm.y = sprite->right_arm.y;
		sprite->head.x = sprite->head.x+1;
		sprite->head.y = sprite->head.y;

		status = 1;
	}

	writePixelDirect(sprite->core, sprite->colors);
	writePixelDirect(sprite->left_arm, sprite->colors);
	writePixelDirect(sprite->right_arm, sprite->colors);
	writePixelDirect(sprite->head, sprite->colors);

	return status;
}

// Draw and initialize cannon sprite, returning a struct to it.
smallUFO_t draw_small(position_t pos);
u8 move_down_small(smallUFO_t *sprite);

mediumUFO_t draw_medium(position_t pos);
u8 move_down_medium(mediumUFO_t *sprite);

bigUFO_t draw_big(position_t pos);
u8 move_down_big(bigUFO_t *sprite);
