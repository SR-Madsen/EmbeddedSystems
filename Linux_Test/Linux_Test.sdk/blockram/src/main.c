/*
 * Copyright (c) 2012 Xilinx, Inc.  All rights reserved.
 *
 * Xilinx, Inc.
 * XILINX IS PROVIDING THIS DESIGN, CODE, OR INFORMATION "AS IS" AS A
 * COURTESY TO YOU.  BY PROVIDING THIS DESIGN, CODE, OR INFORMATION AS
 * ONE POSSIBLE   IMPLEMENTATION OF THIS FEATURE, APPLICATION OR
 * STANDARD, XILINX IS MAKING NO REPRESENTATION THAT THIS IMPLEMENTATION
 * IS FREE FROM ANY CLAIMS OF INFRINGEMENT, AND YOU ARE RESPONSIBLE
 * FOR OBTAINING ANY RIGHTS YOU MAY REQUIRE FOR YOUR IMPLEMENTATION.
 * XILINX EXPRESSLY DISCLAIMS ANY WARRANTY WHATSOEVER WITH RESPECT TO
 * THE ADEQUACY OF THE IMPLEMENTATION, INCLUDING BUT NOT LIMITED TO
 * ANY WARRANTIES OR REPRESENTATIONS THAT THIS IMPLEMENTATION IS FREE
 * FROM CLAIMS OF INFRINGEMENT, IMPLIED WARRANTIES OF MERCHANTABILITY
 * AND FITNESS FOR A PARTICULAR PURPOSE.
 *
 */

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>
#include "blockram.h"

// Make UART debug output work
#define printf(...) \
	fprintf(stdout, __VA_ARGS__); \
	fflush(stdout);

typedef long int u32;

int main()
{
    int file;
    u32 data[6];

    // Map the BRAM physical address into user space by getting a virtual address
    if ((file = open ("/dev/mem", O_RDWR | O_SYNC)) != -1) {
    	open_bram(file);

    	// Read values from Block RAM.
    	read_level(&data[0]);
    	read_small(&data[1]);
    	read_medium(&data[2]);
    	read_big(&data[3]);
    	read_health(&data[4]);
    	read_pup(&data[5]);

    	printf("Level read: %d\r\n", data[0]);
    	printf("Small read: %d\r\n", data[1]);
    	printf("Medium read: %d\r\n", data[2]);
    	printf("Big read: %d\r\n", data[3]);
    	printf("Health read: %d\r\n", data[4]);
    	printf("Power-up read: %d\r\n", data[5]);

    	printf("Finished reads from memory.\r\n");
    	close(file);
    } else {
    	printf("Failed at getting virtual address.");
    }

    return 0;
}
