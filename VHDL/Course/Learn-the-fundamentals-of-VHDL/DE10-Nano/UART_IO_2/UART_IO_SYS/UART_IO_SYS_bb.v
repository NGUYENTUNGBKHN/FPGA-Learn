
module UART_IO_SYS (
	clk_clk,
	pio_btn_external_connection_export,
	pio_led_external_connection_export,
	pio_sw_external_connection_export,
	pll_0_locked_export,
	reset_reset_n);	

	input		clk_clk;
	input	[1:0]	pio_btn_external_connection_export;
	output	[7:0]	pio_led_external_connection_export;
	input	[2:0]	pio_sw_external_connection_export;
	output		pll_0_locked_export;
	input		reset_reset_n;
endmodule
