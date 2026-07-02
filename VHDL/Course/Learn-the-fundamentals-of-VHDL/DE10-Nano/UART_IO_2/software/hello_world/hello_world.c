/*
 * "Hello World" example.
 *
 * This example prints 'Hello from Nios II' to the STDOUT stream. It runs on
 * the Nios II 'standard', 'full_featured', 'fast', and 'low_cost' example
 * designs. It runs with or without the MicroC/OS-II RTOS and requires a STDOUT
 * device in your system's hardware.
 * The memory footprint of this hosted application is ~69 kbytes by default
 * using the standard reference design.
 *
 * For a reduced footprint version of this template, and an explanation of how
 * to reduce the memory footprint for a given application, see the
 * "small_hello_world" template.
 *
 */

#include <stdio.h>
#include <string.h>
#include "system.h"
#include "io.h"

int main()
{
	// Parameters
	int done = 0;
	int byte_count = 0;
	int execute_cmd;
	char command[7];
	char led_cmd[4];
	char led_num[4];
	unsigned char tmp_rx_buf;
	unsigned char rx_buf[40];
	unsigned int button_data = 0;
	unsigned int switch_data = 0;
	unsigned int led_data = 0;
	unsigned int mask = 0x00000003;

	// Ask Users to Enter a Command
	printf("---Enter a command---\n\r");

	// Loop until users enter finish command
	while (done == 0)
	{
		execute_cmd = 0;
		memset(rx_buf, '\0', sizeof(rx_buf));
		byte_count = 0;

		// Build up UART Message
		while (execute_cmd == 0)
		{
			// Read UART Data
			tmp_rx_buf = getchar();
			//while ((tmp_rx_buf = getchar()) != EOF);

			rx_buf[byte_count] = tmp_rx_buf;

			if (rx_buf[byte_count] == '\n')
				execute_cmd = 1;

			byte_count++;
		}

		// Build of the command arrays
		memcpy(command, &rx_buf[0], 6);
		memcpy(led_cmd, &rx_buf[0], 3);
		memcpy(led_num, &rx_buf[4], 3);

		// Null terminate all strings
		command[6] = '\0';
		led_cmd[3] = '\0';
		led_num[3] = '\0';

		// Read in the Button & Switch Data
		button_data = IORD(PIO_BTN_BASE, 0);
		switch_data = IORD(PIO_SW_BASE, 0);

		// Button is pulled high, so flip 2 lsb bits
		button_data ^= mask;

		// Execute received command
		if (strcmp(led_cmd, "led") == 0)
		{
			led_data = led_num[2] - 48;

			if ((led_num[1] - 48) >= 1)
				led_data += ((led_num[1] - 48) * 10);

			if ((led_num[0] - 48) >= 1)
				led_data += ((led_num[0] - 48) * 100);

			// Write LED value to output LEDs
			IOWR(PIO_LED_BASE, 0, led_data);
		}
		else if (strcmp(command, "button") == 0)
			printf("Button Status: %u\n\r", button_data);
		else if (strcmp(command, "switch") == 0)
			printf("Switch Status: %u\n\r", switch_data);
		else if (strcmp(command, "finish") == 0)
			done = 1;
		else
			printf("Command is invalid, re-enter below:\n\r");

		//printf("Your Command was: %s\n\r", command);
	}

	printf("---Exiting main---\n\r");
	return 0;
}
