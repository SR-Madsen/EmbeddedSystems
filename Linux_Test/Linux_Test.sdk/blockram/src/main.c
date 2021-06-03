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
    int mem_file;
    FILE *html_file;
    u32 data[6];

    // Map the BRAM physical address into user space by getting a virtual address
    if ((mem_file = open("/dev/mem", O_RDWR | O_SYNC)) != -1) {
    	open_bram(mem_file);

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
    	close(mem_file);
    } else {
    	printf("Failed at getting virtual address.");
    }

    // Write values to BusyBox HTML file
    html_file = fopen("/www/stats.html", "w+");

    fputs("<html><head><title>Statistics</title>\n", html_file);
    fputs("<style>table{border-collapse: collapse; width: 25%;}\n", html_file);
    fputs("td, th { border: 1px solid #000000; text-align: left; padding: 8px; }\n", html_file);
    fputs("tr:nth-child(even) { background-color: #dddddd; } </style> </head>\n", html_file);
    fputs("<body><h1>Statistics for Current Game</h1>\n", html_file);
    fputs("<h5><a href=\"frontpage.html\">Front Page</a> &nbsp; - &nbsp;\n", html_file);
    fputs("<a href=\"stats.html\">Statistics</a> &nbsp; - &nbsp;\n", html_file);
    fputs("<a href=\"tutorial.html\">Tutorial</a> &nbsp; - &nbsp;\n", html_file);
    fputs("<a href=\"enemies.html\">Enemies</a> &nbsp; - &nbsp;\n", html_file);
    fputs("<a href=\"powerups.html\">Power-Ups</a></h5><hr>\n", html_file);
    fputs("<p><br>The statistics shown here have been collected during the current game by the MicroBlaze and communicated to the Zynq cores through BRAM.<br><br>\n", html_file);

    fputs("<table> <tr> <th>Statistic</th><th>Value</th></tr>\n", html_file);
    fprintf(html_file, "<tr><td>Level</td><td>%d</td></tr>\n", data[0]);
    fprintf(html_file, "<tr><td>Scout kills</td><td>%d</td></tr>\n", data[1]);
    fprintf(html_file, "<tr><td>Fighter kills</td><td>%d</td></tr>\n", data[2]);
    fprintf(html_file, "<tr><td>Mothership kills</td><td>%d</td></tr>\n", data[3]);
    fprintf(html_file, "<tr><td>Remaining health</td><td>%d</td></tr>\n", data[4]);
    fprintf(html_file, "<tr><td>Active Power-Up</td><td>%d</td></tr>\n", data[5]);

    fclose(html_file);
    printf("Finished writing stats.html");

    return 0;
}
