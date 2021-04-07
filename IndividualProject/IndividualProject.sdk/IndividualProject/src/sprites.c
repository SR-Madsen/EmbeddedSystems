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

/********************* CANNON SPRITE *********************/
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
	sprite.speed_timer = CANNON_SPEED;

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
		sprite->core.x -= 1;
		sprite->left_arm.x -= 1;
		sprite->right_arm.x -= 1;
		sprite->head.x -= 1;

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
		sprite->core.x += 1;
		sprite->left_arm.x += 1;
		sprite->right_arm.x += 1;
		sprite->head.x += 1;

		status = 1;
	}

	writePixelDirect(sprite->core, sprite->colors);
	writePixelDirect(sprite->left_arm, sprite->colors);
	writePixelDirect(sprite->right_arm, sprite->colors);
	writePixelDirect(sprite->head, sprite->colors);

	return status;
}

/********************* BULLET SPRITE *********************/
// Draw and initialize bullet sprite, returning a struct to it.
bullet_t draw_bullet(position_t pos) {
	bullet_t sprite;

	sprite.core = pos;
	sprite.active = 1;
	sprite.colors.red = 255;
	sprite.colors.green = 0;
	sprite.colors.blue = 0;
	sprite.speed_timer = BULLET_SPEED;

	writePixelDirect(sprite.core, sprite.colors);

	return sprite;
}

// Move bullet sprite upwards if possible, returning 1 if possible and 0 if not.
// Checks for collision with UFOs. Removes if out of bounds.
u8 move_up_bullet(bullet_t *sprite) {
	u8 status = 0;

	if (sprite->core.y < 8) {
		sprite->core.y += 1;

		status = 1;

		writePixelDirect(sprite->core, sprite->colors);
	} else {
		sprite->active = 0;
		remove_bullet(sprite);
	}

	return status;
}

// Move bullet sprite to the left if possible, returning 1 if possible and 0 if not.
// Checks for collision with UFOs. Removes if out of bounds.
u8 move_left_bullet(bullet_t *sprite) {
	u8 status = 0;

	if (sprite->core.y < 8 && sprite->core.x > 1) {
		sprite->core.x -= 1;
		sprite->core.y += 1;

		status = 1;

		writePixelDirect(sprite->core, sprite->colors);
	} else {
		sprite->active = 0;
		remove_bullet(sprite);
	}

	return status;
}

// Move bullet sprite to the right if possible, returning 1 if possible and 0 if not.
// Checks for collision with UFOs. Removes if out of bounds.
u8 move_right_bullet(bullet_t *sprite) {
	u8 status = 0;

	if (sprite->core.y < 8 && sprite->core.x > 1) {
		sprite->core.x += 1;
		sprite->core.y += 1;

		status = 1;

		writePixelDirect(sprite->core, sprite->colors);
	} else {
		sprite->active = 0;
		remove_bullet(sprite);
	}

	return status;
}

// Removes pixels for sprite.
void remove_bullet(bullet_t *sprite) {
	color_t colors = {0, 0, 255};
	writePixelDirect(sprite->core, colors);
}

/********************* SMALL UFO SPRITE *********************/
// Draw and initialize UFO sprite, returning a struct to it.
smallUFO_t draw_small(position_t pos) {
	smallUFO_t sprite;

	sprite.left.x = pos.x;
	sprite.left.y = pos.y;
	sprite.right.x = pos.x+1;
	sprite.right.y = pos.y;
	sprite.colors.red = 255;
	sprite.colors.green = 0;
	sprite.colors.blue = 0;
	sprite.health = SMALL_HP;
	sprite.speed_timer = SMALL_SPEED;

	writePixelDirect(sprite.left, sprite.colors);
	writePixelDirect(sprite.right, sprite.colors);

	return sprite;
}

// Move UFO sprite downwards if possible, returning 1 if possible and 0 if not.
// If 0, it must have landed and is to be removed and dock a life.
u8 move_down_small(smallUFO_t *sprite) {
	u8 status = 0;

	if (sprite->left.y > 3) {
		sprite->left.y -= 1;
		sprite->right.y -= 1;

		status = 1;

		writePixelDirect(sprite->left, sprite->colors);
		writePixelDirect(sprite->right, sprite->colors);
	} else {
		sprite->health = 0;
		remove_small(sprite);
	}

	return status;
}

// Removes pixels for sprite.
void remove_small(smallUFO_t *sprite) {
	color_t colors = {0, 0, 255};
	writePixelDirect(sprite->left, colors);
	writePixelDirect(sprite->right, colors);
}

/********************* MEDIUM UFO SPRITE *********************/
// Draw and initialize UFO sprite, returning a struct to it.
mediumUFO_t draw_medium(position_t pos) {
	mediumUFO_t sprite;

	sprite.left.x = pos.x-1;
	sprite.left.y = pos.y;
	sprite.core.x = pos.x;
	sprite.core.y = pos.y;
	sprite.right.x = pos.x+1;
	sprite.right.y = pos.y;
	sprite.colors.red = 255;
	sprite.colors.green = 255;
	sprite.colors.blue = 0;
	sprite.health = MEDIUM_HP;
	sprite.speed_timer = MEDIUM_SPEED;

	writePixelDirect(sprite.core, sprite.colors);
	writePixelDirect(sprite.left, sprite.colors);
	writePixelDirect(sprite.right, sprite.colors);

	return sprite;
}

// Move UFO sprite downwards if possible, returning 1 if possible and 0 if not.
// If 0, it must have landed and is to be removed and dock a life.
u8 move_down_medium(mediumUFO_t *sprite) {
	u8 status = 0;

	if (sprite->core.y > 3) {
		sprite->core.y -= 1;
		sprite->left.y -= 1;
		sprite->right.y -= 1;

		status = 1;

		writePixelDirect(sprite->core, sprite->colors);
		writePixelDirect(sprite->left, sprite->colors);
		writePixelDirect(sprite->right, sprite->colors);
	} else {
		sprite->health = 0;
		remove_medium(sprite);
	}

	return status;
}

// Removes pixels for sprite.
void remove_medium(mediumUFO_t *sprite) {
	color_t colors = {0, 0, 255};
	writePixelDirect(sprite->core, colors);
	writePixelDirect(sprite->left, colors);
	writePixelDirect(sprite->right, colors);
}

/********************* BIG UFO SPRITE *********************/
// Draw and initialize UFO sprite, returning a struct to it.
bigUFO_t draw_big(position_t pos) {
	bigUFO_t sprite;

	sprite.left.x = pos.x-1;
	sprite.left.y = pos.y;
	sprite.core.x = pos.x;
	sprite.core.y = pos.y;
	sprite.right.x = pos.x+1;
	sprite.right.y = pos.y;
	sprite.core_up.x = pos.x;
	sprite.core_up.y = pos.y+1;
	sprite.left_up.x = pos.x-1;
	sprite.left_up.y = pos.y+1;
	sprite.right_up.x = pos.x+1;
	sprite.right_up.y = pos.y+1;
	sprite.colors.red = 0;
	sprite.colors.green = 255;
	sprite.colors.blue = 255;
	sprite.health = BIG_HP;
	sprite.speed_timer = BIG_SPEED;

	writePixelDirect(sprite.core, sprite.colors);
	writePixelDirect(sprite.left, sprite.colors);
	writePixelDirect(sprite.right, sprite.colors);
	writePixelDirect(sprite.core_up, sprite.colors);
	writePixelDirect(sprite.left_up, sprite.colors);
	writePixelDirect(sprite.right_up, sprite.colors);


	return sprite;
}

// Move UFO sprite downwards if possible, returning 1 if possible and 0 if not.
// If 0, it must have landed and is to be removed and dock a life.
u8 move_down_big(bigUFO_t *sprite) {
	u8 status = 0;

	if (sprite->core.y > 3) {
		sprite->core.y -= 1;
		sprite->left.y -= 1;
		sprite->right.y -= 1;
		sprite->core_up.y -= 1;
		sprite->left_up.y -= 1;
		sprite->right_up.y -= 1;

		status = 1;

		writePixelDirect(sprite->core, sprite->colors);
		writePixelDirect(sprite->left, sprite->colors);
		writePixelDirect(sprite->right, sprite->colors);
		writePixelDirect(sprite->core_up, sprite->colors);
		writePixelDirect(sprite->left_up, sprite->colors);
		writePixelDirect(sprite->right_up, sprite->colors);
	} else {
		sprite->health = 0;
		remove_big(sprite);
	}

	return status;
}

// Removes pixels for sprite.
void remove_big(bigUFO_t *sprite) {
	color_t colors = {0, 0, 255};
	writePixelDirect(sprite->core, colors);
	writePixelDirect(sprite->left, colors);
	writePixelDirect(sprite->right, colors);
	writePixelDirect(sprite->core_up, colors);
	writePixelDirect(sprite->left_up, colors);
	writePixelDirect(sprite->right_up, colors);
}
