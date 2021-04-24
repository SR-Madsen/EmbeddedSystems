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
#define LED_BRAM_DEVICE_ID		XPAR_BRAM_0_DEVICE_ID
#define LINUX_BRAM_DEVICE_ID	XPAR_BRAM_1_DEVICE_ID
#define XADC_DEVICE_ID			XPAR_PS7_XADC_0_DEVICE_ID
#define LED_GPIO_DEVICE_ID		XPAR_GPIO_0_DEVICE_ID // LEDS
#define GYRO_GPIO_DEVICE_ID		XPAR_GPIO_1_DEVICE_ID // Gyroscope button

#define LEDS_OUTPUT				0xF
#define GYRO_INPUT				0x0

/************************** Struct Definitions *******************************/


/************************** Variable Definitions *****************************/
u16 tick_value = 0;
u16 counter = 0;

u8 game_over = 0;
u8 victorious = 0;

// Main function for Space Invaders
int main(void)
{
	int status;

	/********************* INITIALIZATION OF MODULES *********************/
	// Initialize LED Matrix
	status = initLedMatrix(LED_BRAM_DEVICE_ID);
	if (status != XST_SUCCESS) {
		xil_printf("LED matrix initialization failed.");
		while(1);
	}

	// Initialize BRAM for communication with PS cores
	status = initStatsBram(LINUX_BRAM_DEVICE_ID);
	if (status != XST_SUCCESS) {
		xil_printf("Statistics BRAM initialization failed.");
		while(1);
	}

	// Initialize XADC
	status = initXAdc(XADC_DEVICE_ID);
	if (status != XST_SUCCESS) {
		xil_printf("XADC initialization failed.");
		while(1);
	}

	// Initialize GPIOS
	status = initGpio(LED_GPIO_DEVICE_ID);
	if (status != XST_SUCCESS) {
		xil_printf("LED GPIO initialization failed.");
		while(1);
	}

	setGpioDirection(LED_GPIO_DEVICE_ID, LEDS_OUTPUT);

	status = initGpio(GYRO_GPIO_DEVICE_ID);
	if (status != XST_SUCCESS) {
		xil_printf("Gyro GPIO initialization failed.");
		while(1);
	}

	setGpioDirection(GYRO_GPIO_DEVICE_ID, GYRO_INPUT);

	initVariables();

	/********************* RUN-TO-COMPLETE SCHEDULER *********************/
	while(1) {
		potentiometerTask();
		if (!(counter++ < tick_value)) {

			if (game_over == 0 && victorious == 0) {
				joystickTask(GYRO_GPIO_DEVICE_ID);
				backgroundTask();
				spritesTask();
				matrixTask();
				levelTask(LED_GPIO_DEVICE_ID);
			} else if (game_over == 1) {
				resetAllPixels();
				joystickTask(GYRO_GPIO_DEVICE_ID);
				gameOverTask();
			} else if (victorious == 1) {
				resetAllPixels();
				joystickTask(GYRO_GPIO_DEVICE_ID);
				victoryTask();
			}

			counter = 0;
		}
		usleep(5000);
	}

	return 0;
}
