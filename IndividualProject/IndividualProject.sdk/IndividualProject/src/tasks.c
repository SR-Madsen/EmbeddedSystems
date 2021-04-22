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

// Initialization of variables
void initVariables() {
	player_health = 4;
	level = 0;
	move_direction = NONE;
	shot_request = NONE;
	power_up = NONE;
	power_up_timer = 0;
	small_kills = 0;
	medium_kills = 0;
	big_kills = 0;

	color_bullet_normal();

	smalls[0] = draw_small((position_t){2,8});
	meds[0] = draw_medium((position_t){6,8});

	cannon = draw_cannon((position_t){4,1});
	color_cannon_normal(&cannon);
}

// Reads the potentiometer value and sets the Run-to-Complete Scheduler timing with it.
void potentiometerTask() {
	u16 temp_data;
	temp_data = getXAdcAuxData(POT_CH);

	tick_value = 100 - (temp_data >> 6);
}

// Reads joystick analog value and button value and set movement and shooting with it.
void joystickTask(int GYRO_GPIO_ID) {
	u16 temp_data;
	u8 temp_btn;

	temp_data = getXAdcAuxData(GYRO_X_CH);
	temp_btn = readGpio(GYRO_GPIO_ID);

	if (temp_data > 3048) {
		move_direction = LEFT;
	} else if (temp_data < 1048) {
		move_direction = RIGHT;
	} else {
		move_direction = NONE;
	}

	shot_request = !temp_btn;
}

// Sets the colors of the background depending on level
void backgroundTask() {
	u16 color_level = 255 - level * 51;
	for (int row = 1; row < NUMBER_OF_ROWS+1; row++) {
		for (int column = 1; column < NUMBER_OF_COLS+1; column++) {
			if (row == 1 || row == 2) {
				writePixelValueDirect(column, row, 0, 255, 0);
			} else {
				setPixelValue(column, row, 0, 0, color_level);
			}
		}
	}
}

// Handles timing and moving sprites, as well as checking for collision.
// Can be seen as main game logic task.
void spritesTask() {
	// Create UFOs depending on level
	/*
	 *
	 *
	 *
	 *
	 *
	 *
	 *
	 */

	// Count down power-up timer
	if (power_up != NONE) {
		if (power_up_timer-- == 0) {
			power_up = NONE;
			color_bullet_normal();
			if (bullet.active) {
				change_bullet_color(&bullet);
			}
			color_cannon_normal(&cannon);
		}
	}

	// Move cannon if ticks are up and direction is chosen.
	if (!cannon.speed_timer--) {
		if (move_direction == RIGHT) {
			move_right_cannon(&cannon);
		} else if (move_direction == LEFT) {
			move_left_cannon(&cannon);
		} else {
			update_cannon(&cannon);
		}
		cannon.speed_timer = CANNON_SPEED;
	}

	// Move bullet if ticks are up, or fire bullet if requested and none active.
	if (!bullet.speed_timer--) {
		if (shot_request && !bullet.active && !tri_bullet[0].active && !tri_bullet[1].active) {
			if (power_up == TRI_BULLET) {
				bullet = draw_bullet((position_t){cannon.head.x, cannon.head.y+1});
				tri_bullet[0] = draw_bullet((position_t){cannon.head.x-1, cannon.head.y+1});
				tri_bullet[1] = draw_bullet((position_t){cannon.head.x+1, cannon.head.y+1});
			} else {
				bullet = draw_bullet((position_t){cannon.head.x, cannon.head.y+1});
			}
		} else if (bullet.active || tri_bullet[0].active || tri_bullet[1].active) {
			if (bullet.active) {
				move_up_bullet(&bullet);
				collisionCheckStraight();
			}

			if (tri_bullet[0].active) {
				move_left_bullet(&tri_bullet[0]);
				collisionCheckLeft();
			}

			if (tri_bullet[1].active) {
				move_right_bullet(&tri_bullet[1]);
				collisionCheckRight();
			}
		}

		bullet.speed_timer = BULLET_SPEED;
		tri_bullet[0].speed_timer = BULLET_SPEED;
		tri_bullet[1].speed_timer = BULLET_SPEED;
	}

	// Move all small UFOs
	for (int i = 0; i < sizeof(smalls)/sizeof(smalls[0]); i++) {
		if (power_up != FREEZE) {
			if (!smalls[i].speed_timer--) {
				if (smalls[i].active && !move_down_small(&smalls[i])) {
					player_health--;
				}
				smalls[i].speed_timer = SMALL_SPEED;
			}
		}
		if (smalls[i].active) {
			update_small(&smalls[i]);
		}
	}

	// Move all medium UFOs
	for (int i = 0; i < sizeof(meds)/sizeof(meds[0]); i++) {
		if (power_up != FREEZE) {
			if (!meds[i].speed_timer--) {
				if (meds[i].active && !move_down_medium(&meds[i])) {
					player_health--;
				}
				meds[i].speed_timer = MEDIUM_SPEED;
			}
		}
		if (meds[i].active) {
			update_medium(&meds[i]);
		}
	}

	// Move all big UFOs
	for (int i = 0; i < sizeof(bigs)/sizeof(bigs[0]); i++) {
		if (power_up != FREEZE) {
			if (!bigs[i].speed_timer--) {
				if (bigs[i].active && !move_down_big(&bigs[i])) {
					player_health--;
				}
				bigs[i].speed_timer = BIG_SPEED;
			}
		}
		if (bigs[i].active) {
			update_big(&bigs[i]);
		}
	}

	// Check if UFO has moved into a bullet.
	if (bullet.active || tri_bullet[0].active || tri_bullet[1].active) {
		if (bullet.active) {
			collisionCheckStraight();
		}

		if (tri_bullet[0].active) {
			collisionCheckLeft();
		}

		if (tri_bullet[1].active) {
			collisionCheckRight();
		}
	}
}

// Writes values to the matrix once background and sprites are set.
void matrixTask() {
	writeAllPixelsToDevice();
}

// Handles updating the level and player HP, as well as writing statistics.
void levelTask(int LED_GPIO_ID) {

	if (level < 5 && (small_kills+medium_kills+big_kills) > level*10) {
		level++;
	}

	if (player_health == 4) {
		writeGpio(LED_GPIO_ID, LED_1 | LED_2 | LED_3 | LED_4);
	} else if (player_health == 3) {
		writeGpio(LED_GPIO_ID, LED_1 | LED_2 | LED_3);
	} else if (player_health == 2) {
		writeGpio(LED_GPIO_ID, LED_1 | LED_2);
	} else if (player_health == 1) {
		writeGpio(LED_GPIO_ID, LED_1);
	} else {
		writeGpio(LED_GPIO_ID, 0);
		game_over = 1;
	}

	writeLevel(level);
	writeSmallKills(small_kills);
	writeMedKills(medium_kills);
	writeBigKills(big_kills);
	writeHealth(player_health);
	writePowerUp(power_up);
}

// Task that handles game over and restart
void gameOverTask(){
	gameOver();
	if (shot_request) {
		initVariables();
		game_over = 0;
	}
}

// Function to check for collision between UFOs and straight flying bullets
void collisionCheckStraight() {
	for (int i = 0; i < sizeof(smalls)/sizeof(smalls[0]); i++) {
		if (((bullet.core.x == smalls[i].left.x && bullet.core.y == smalls[i].left.y)
			|| (bullet.core.x == smalls[i].right.x && bullet.core.y == smalls[i].right.y))
			&& (smalls[i].active)) {
			if (power_up == BIG_BULLET) {
				if (smalls[i].health > 3) {
					smalls[i].health -= 3;
				} else {
					remove_small(&smalls[i]);
					small_kills++;
				}
			} else {
				smalls[i].health--;
				if (smalls[i].health == 0) {
					remove_small(&smalls[i]);
					small_kills++;
				}
			}
			remove_bullet(&bullet);
		}
	}
	for (int i = 0; i < sizeof(meds)/sizeof(meds[0]); i++) {
		if (((bullet.core.x == meds[i].left.x && bullet.core.y == meds[i].left.y)
			|| (bullet.core.x == meds[i].right.x && bullet.core.y == meds[i].right.y)
			|| (bullet.core.x == meds[i].core.x && bullet.core.y == meds[i].core.y))
			&& (meds[i].active)) {
			if (power_up == BIG_BULLET) {
				if (smalls[i].health > 3) {
					smalls[i].health -= 3;
				} else {
					remove_medium(&meds[i]);
					medium_kills++;
				}
			} else {
				meds[i].health--;
				if (meds[i].health == 0) {
					remove_medium(&meds[i]);
					medium_kills++;
					if (power_up == NONE) {
						u16 rng = rand()%20;
						if (rng == 1) {
							power_up = TRI_BULLET;
							color_cannon_tri(&cannon);
							power_up_timer = 40;
						} else if (rng == 5) {
							power_up = BIG_BULLET;
							color_cannon_big(&cannon);
							color_bullet_big();
							if (bullet.active) {
								change_bullet_color(&bullet);
							}
							power_up_timer = 40;
						} else if (rng == 10) {
							power_up = FREEZE;
							power_up_timer = 30;
							color_cannon_freeze(&cannon);
						} else if (rng == 15) {
							if (player_health < 4) {
								player_health++;
							}
						}
					}
				}
			}
			remove_bullet(&bullet);
		}
	}
	for (int i = 0; i < sizeof(bigs)/sizeof(bigs[0]); i++) {
		if (((bullet.core.x == bigs[i].left.x && bullet.core.y == bigs[i].left.y)
			|| (bullet.core.x == bigs[i].right.x && bullet.core.y == bigs[i].right.y)
			|| (bullet.core.x == bigs[i].core.x && bullet.core.y == bigs[i].core.y)
			|| (bullet.core.x == bigs[i].left_up.x && bullet.core.y == bigs[i].left_up.y)
			|| (bullet.core.x == bigs[i].right_up.x && bullet.core.y == bigs[i].right_up.y)
			|| (bullet.core.x == bigs[i].core_up.x && bullet.core.y == bigs[i].core_up.y))
			&& (bigs[i].active)) {
			if (power_up == BIG_BULLET) {
				if (bigs[i].health > 3) {
					bigs[i].health -= 3;
				} else {
					remove_big(&bigs[i]);
					big_kills++;
				}
			} else {
				bigs[i].health--;
				if (bigs[i].health == 0) {
					remove_big(&bigs[i]);
					big_kills++;
					if (power_up == NONE) {
						u16 rng = rand()%10;
						if (rng == 0) {
							power_up = TRI_BULLET;
							color_cannon_tri(&cannon);
							power_up_timer = 30;
						} else if (rng == 2) {
							power_up = BIG_BULLET;
							color_cannon_big(&cannon);
							power_up_timer = 30;
						} else if (rng == 4) {
							power_up = FREEZE;
							power_up_timer = 30;
							color_cannon_freeze(&cannon);
						} else if (rng == 6) {
							if (player_health < 4) {
								player_health++;
							}
						}
					}
				}
			}
			remove_bullet(&bullet);
		}
	}
}

// Function to check for collision between UFOs and left flying bullets
void collisionCheckLeft() {
	for (int i = 0; i < sizeof(smalls)/sizeof(smalls[0]); i++) {
		if (((tri_bullet[0].core.x == smalls[i].left.x && tri_bullet[0].core.y == smalls[i].left.y)
			|| (tri_bullet[0].core.x == smalls[i].right.x && tri_bullet[0].core.y == smalls[i].right.y))
			&& (smalls[i].active)) {
			smalls[i].health--;
			if (smalls[i].health == 0) {
				remove_small(&smalls[i]);
				small_kills++;
			}
			remove_bullet(&tri_bullet[0]);
		}
	}
	for (int i = 0; i < sizeof(meds)/sizeof(meds[0]); i++) {
		if (((tri_bullet[0].core.x == meds[i].left.x && tri_bullet[0].core.y == meds[i].left.y)
			|| (tri_bullet[0].core.x == meds[i].right.x && tri_bullet[0].core.y == meds[i].right.y)
			|| (tri_bullet[0].core.x == meds[i].core.x && tri_bullet[0].core.y == meds[i].core.y))
			&& (meds[i].active)) {
			meds[i].health--;
			if (meds[i].health == 0) {
				remove_medium(&meds[i]);
				medium_kills++;
			}
			remove_bullet(&tri_bullet[0]);
		}
	}
	for (int i = 0; i < sizeof(bigs)/sizeof(bigs[0]); i++) {
		if (((tri_bullet[0].core.x == bigs[i].left.x && tri_bullet[0].core.y == bigs[i].left.y)
			|| (tri_bullet[0].core.x == bigs[i].right.x && tri_bullet[0].core.y == bigs[i].right.y)
			|| (tri_bullet[0].core.x == bigs[i].core.x && tri_bullet[0].core.y == bigs[i].core.y)
			|| (tri_bullet[0].core.x == bigs[i].left_up.x && tri_bullet[0].core.y == bigs[i].left_up.y)
			|| (tri_bullet[0].core.x == bigs[i].right_up.x && tri_bullet[0].core.y == bigs[i].right_up.y)
			|| (tri_bullet[0].core.x == bigs[i].core_up.x && tri_bullet[0].core.y == bigs[i].core_up.y))
			&& (bigs[i].active)) {
			bigs[i].health--;
			if (bigs[i].health == 0) {
				remove_big(&bigs[i]);
				big_kills++;
			}
			remove_bullet(&tri_bullet[0]);
		}
	}
}

// Function to check for collision between UFOs and right flying bullets
void collisionCheckRight() {
	for (int i = 0; i < sizeof(smalls)/sizeof(smalls[0]); i++) {
		if (((tri_bullet[1].core.x == smalls[i].left.x && tri_bullet[1].core.y == smalls[i].left.y)
			|| (tri_bullet[1].core.x == smalls[i].right.x && tri_bullet[1].core.y == smalls[i].right.y))
			&& (smalls[i].active)) {
			smalls[i].health--;
			if (smalls[i].health == 0) {
				remove_small(&smalls[i]);
				small_kills++;
			}
			remove_bullet(&tri_bullet[1]);
		}
	}
	for (int i = 0; i < sizeof(meds)/sizeof(meds[0]); i++) {
		if (((tri_bullet[1].core.x == meds[i].left.x && tri_bullet[1].core.y == meds[i].left.y)
			|| (tri_bullet[1].core.x == meds[i].right.x && tri_bullet[1].core.y == meds[i].right.y)
			|| (tri_bullet[1].core.x == meds[i].core.x && tri_bullet[1].core.y == meds[i].core.y))
			&& (meds[i].active)) {
			meds[i].health--;
			if (meds[i].health == 0) {
				remove_medium(&meds[i]);
				medium_kills++;
			}
			remove_bullet(&tri_bullet[1]);
		}
	}
	for (int i = 0; i < sizeof(bigs)/sizeof(bigs[0]); i++) {
		if (((tri_bullet[1].core.x == bigs[i].left.x && tri_bullet[1].core.y == bigs[i].left.y)
			|| (tri_bullet[1].core.x == bigs[i].right.x && tri_bullet[1].core.y == bigs[i].right.y)
			|| (tri_bullet[1].core.x == bigs[i].core.x && tri_bullet[1].core.y == bigs[i].core.y)
			|| (tri_bullet[1].core.x == bigs[i].left_up.x && tri_bullet[1].core.y == bigs[i].left_up.y)
			|| (tri_bullet[1].core.x == bigs[i].right_up.x && tri_bullet[1].core.y == bigs[i].right_up.y)
			|| (tri_bullet[1].core.x == bigs[i].core_up.x && tri_bullet[1].core.y == bigs[i].core_up.y))
			&& (bigs[i].active)) {
			bigs[i].health--;
			if (bigs[i].health == 0) {
				remove_big(&bigs[i]);
				big_kills++;
			}
			remove_bullet(&tri_bullet[1]);
		}
	}
}
