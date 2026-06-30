
module UART_IO_SYS (
	clk_clk,
	pll_0_locked_export,
	reset_reset_n,
	pio_led_external_connection_export,
	pio_switch_external_connection_export,
	pio_btn_external_connection_export);	

	input		clk_clk;
	output		pll_0_locked_export;
	input		reset_reset_n;
	output	[7:0]	pio_led_external_connection_export;
	input	[2:0]	pio_switch_external_connection_export;
	input	[1:0]	pio_btn_external_connection_export;
endmodule
