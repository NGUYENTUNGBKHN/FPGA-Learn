	UART_IO_SYS u0 (
		.clk_clk                               (<connected-to-clk_clk>),                               //                            clk.clk
		.pll_0_locked_export                   (<connected-to-pll_0_locked_export>),                   //                   pll_0_locked.export
		.reset_reset_n                         (<connected-to-reset_reset_n>),                         //                          reset.reset_n
		.pio_led_external_connection_export    (<connected-to-pio_led_external_connection_export>),    //    pio_led_external_connection.export
		.pio_switch_external_connection_export (<connected-to-pio_switch_external_connection_export>), // pio_switch_external_connection.export
		.pio_btn_external_connection_export    (<connected-to-pio_btn_external_connection_export>)     //    pio_btn_external_connection.export
	);

