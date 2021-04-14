#include <stdio.h>
#include <stdlib.h>

#include "platform.h"
#include "xparameters.h"
#include "xbram.h"
#include "xadcps.h"
#include "xgpio.h"

#include "xil_printf.h"
#include "sleep.h"

#include "led_matrix.h"
#include "sprites.h"
#include "xadc.h"
#include "gpios.h"
#include "tasks.h"

/************************** Constant Definitions *****************************/

/*
 * The following constants map to the XPAR parameters created in the
 * xparameters.h file. They are defined here such that a user can easily
 * change all the needed parameters in one place.
 */
#define BRAM_DEVICE_ID		XPAR_BRAM_0_DEVICE_ID
#define XADC_DEVICE_ID		XPAR_PS7_XADC_0_DEVICE_ID
#define GPIO0_DEVICE_ID		XPAR_GPIO_0_DEVICE_ID // LEDS
#define GPIO1_DEVICE_ID		XPAR_GPIO_1_DEVICE_ID // Gyroscope button

#define LEDS_OUTPUT			0xF
#define GYRO_INPUT			0x0
#define LED_1				1
#define LED_2				2
#define LED_3				4
#define LED_4				8

/************************** Struct Definitions *******************************/


/************************** Variable Definitions *****************************/
u8 player_health = 4;

// Main function for Space Invaders
int main(void)
{
	int status;

	// Initialize LED Matrix
	status = initLedMatrix(BRAM_DEVICE_ID);
	if (status != XST_SUCCESS) {
		xil_printf("LED matrix initialization failed.");
		while(1);
	}

	// Initialize XADC
	status = initXAdc(XADC_DEVICE_ID);
	if (status != XST_SUCCESS) {
		xil_printf("XADC initialization failed.");
		while(1);
	}

	// Initialize GPIOS
	status = initGpio(GPIO0_DEVICE_ID);
	if (status != XST_SUCCESS) {
		xil_printf("GPIO0 initialization failed.");
		while(1);
	}

	setGpioDirection(GPIO0_DEVICE_ID, LEDS_OUTPUT);

	status = initGpio(GPIO1_DEVICE_ID);
	if (status != XST_SUCCESS) {
		xil_printf("GPIO1 initialization failed.");
		while(1);
	}

	setGpioDirection(GPIO1_DEVICE_ID, GYRO_INPUT);


	// Moving sprites example
	cannon_t cannon;
	position_t pos = {4,1};

	mediumUFO_t medium;
	position_t ufo_pos = {2,8};

	u8 direction = 0;
	u8 valid_dir = 0;
	u16 adc_data = 0;
	u8 color_level = 0;

	adc_data = getXAdcAuxData(AUX15);
	color_level = (adc_data >> 4);

	for (int row = 1; row < NUMBER_OF_ROWS+1; row++) {
		for (int column = 1; column < NUMBER_OF_COLS+1; column++) {
			if (row == 1 || row == 2) {
				writePixelValueDirect(column, row, 0, color_level, 0);
			} else {
				writePixelValueDirect(column, row, 0, 0, color_level);
			}
		}
	}

	cannon = draw_cannon(pos);
	medium = draw_medium(ufo_pos);

	bullet_t bullet;
	position_t bullet_pos = {cannon.head.x, cannon.head.y+1};

	bullet = draw_bullet(bullet_pos);

	while(1) {
		usleep(250000);
		adc_data = getXAdcAuxData(AUX15);
		color_level = (adc_data >> 4);
		xil_printf("adc_data is: %d\n\r", adc_data);
		xil_printf("color_level is: %d\n\r", color_level);

		for (int row = 1; row < NUMBER_OF_ROWS+1; row++) {
			for (int column = 1; column < NUMBER_OF_COLS+1; column++) {
				if (row == 1 || row == 2) {
					writePixelValueDirect(column, row, 0, color_level, 0);
				} else {
					writePixelValueDirect(column, row, 0, 0, color_level);
				}
			}
		}

		if (direction == 0) {
			valid_dir = move_left_cannon(&cannon);
			if (valid_dir != 1) {
				direction = 1;
			}
		} else {
			valid_dir = move_right_cannon(&cannon);
			if (valid_dir != 1) {
				direction = 0;
			}
		}


		if (medium.health > 0) {
			valid_dir = move_down_medium(&medium);
			if (valid_dir != 1) {
				player_health -= 1;
				medium = draw_medium(ufo_pos);
			}
		}

		if (bullet.active == 1) {
			valid_dir = move_up_bullet(&bullet);
			if (valid_dir != 1) {
				bullet_pos.x = cannon.head.x;
				bullet_pos.y = cannon.head.y+1;
				bullet = draw_bullet(bullet_pos);
			}
		}

		if (player_health == 4) {
			writeGpio(GPIO0_DEVICE_ID, LED_1 | LED_2 | LED_3 | LED_4);
		} else if (player_health == 3) {
			writeGpio(GPIO0_DEVICE_ID, LED_1 | LED_2 | LED_3);
		} else if (player_health == 2) {
			writeGpio(GPIO0_DEVICE_ID, LED_1 | LED_2);
		} else if (player_health == 1) {
			writeGpio(GPIO0_DEVICE_ID, LED_1);
		} else {
			writeGpio(GPIO0_DEVICE_ID, 0);
		}
	}

	xil_printf("Successfully ran code.\r\n");
	while(1);
	return XST_SUCCESS;
}
