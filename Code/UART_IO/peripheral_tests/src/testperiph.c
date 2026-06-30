#include "xil_cache.h"
#include "xparameters.h"
#include <stdio.h>
#include <string.h>


#define __MICROBLAZE__
#include "xiomodule.h"
#define XPAR_IOMODULE_0_DEVICE_ID 0


int main() 
{
   int done = 0;
   int byte_count = 0;
   int execute_cmd;
   char command[6];
   char led_cmd[3];
   char led_num[2];
   u8 tmp_rx_buf;
   u8 rx_buf[40];
   u32 button_data = 0;
   u32 switch_data = 0;
   u32 led_data = 0;
   u32 data;
   XIOModule iomodule;
    print("---Enter a command---\n\r");
   Xil_ICacheEnable();
   Xil_DCacheEnable();
    print("---Enter a command---\n\r");
   // Initialize module
   data = XIOModule_Initialize(&iomodule, XPAR_IOMODULE_0_DEVICE_ID);
   data = XIOModule_Start(&iomodule);
   data = XIOModule_CfgInitialize(&iomodule, NULL, 1);
   xil_printf("CFInitialize returned (0 = success) %d\n\r", data);

   print("---Enter a command---\n\r");

   // While loop until user enters "finish" command
   while(done == 0)
   {
	   execute_cmd = 0;
	   memset(rx_buf, 0, sizeof(rx_buf));
	   byte_count = 0;

	   // Build up message from UART Terminal
	   while (execute_cmd == 0)
	   {
		   // Read UART data
		   while ((data = XIOModule_Recv(&iomodule, &tmp_rx_buf, 1)) == 0);

		   rx_buf[byte_count] = tmp_rx_buf;

		   if (rx_buf[byte_count] == '\n')
			   execute_cmd = 1;

		   byte_count++;
	   }

	   // Build the command arrays
	   memcpy(command, &rx_buf[0], 6);
	   memcpy(led_cmd, &rx_buf[0], 3);
	   memcpy(led_num, &rx_buf[4], 2);

	   // Read the button & switch status
	   button_data = XIOModule_DiscreteRead(&iomodule, 1);
	   switch_data = XIOModule_DiscreteRead(&iomodule, 2);

	   // Execute the received command
	   if (strcmp(led_cmd, "led") == 0)
	   {
		   led_data = led_num[1] - 48;

		   if ((led_num[0] - 48) == 1)
			   led_data += 10;

		   XIOModule_DiscreteWrite(&iomodule, 1, led_data);
	   }
	   else if (strcmp(command, "button") == 0)
		   xil_printf("Button Status: %d\n\r", button_data);
	   else if (strcmp(command, "switch") == 0)
		   xil_printf("Switch Status: %d\n\r", switch_data);
	   else if (strcmp(command, "finish") == 0)
		   done = 1;
	   else
		   print("Command is invalid, re-enter below:\n\r");

// Debugging print outs below
//	   print("Command: ");
//	   print(command);
//	   print("\n\r");
//
//	   print("LED_cmd: ");
//	   print(led_cmd);
//	   print("\n\r");
//
//	   print("LED_num: ");
//	   print(led_num);
//	   print("\n\r");

   }

   print("---Exiting main---\n\r");
   Xil_DCacheDisable();
   Xil_ICacheDisable();
   return 0;
}

