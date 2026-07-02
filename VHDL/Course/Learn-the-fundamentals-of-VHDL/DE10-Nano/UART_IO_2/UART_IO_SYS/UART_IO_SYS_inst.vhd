	component UART_IO_SYS is
		port (
			clk_clk                            : in  std_logic                    := 'X';             -- clk
			pio_btn_external_connection_export : in  std_logic_vector(1 downto 0) := (others => 'X'); -- export
			pio_led_external_connection_export : out std_logic_vector(7 downto 0);                    -- export
			pio_sw_external_connection_export  : in  std_logic_vector(2 downto 0) := (others => 'X'); -- export
			pll_0_locked_export                : out std_logic;                                       -- export
			reset_reset_n                      : in  std_logic                    := 'X'              -- reset_n
		);
	end component UART_IO_SYS;

	u0 : component UART_IO_SYS
		port map (
			clk_clk                            => CONNECTED_TO_clk_clk,                            --                         clk.clk
			pio_btn_external_connection_export => CONNECTED_TO_pio_btn_external_connection_export, -- pio_btn_external_connection.export
			pio_led_external_connection_export => CONNECTED_TO_pio_led_external_connection_export, -- pio_led_external_connection.export
			pio_sw_external_connection_export  => CONNECTED_TO_pio_sw_external_connection_export,  --  pio_sw_external_connection.export
			pll_0_locked_export                => CONNECTED_TO_pll_0_locked_export,                --                pll_0_locked.export
			reset_reset_n                      => CONNECTED_TO_reset_reset_n                       --                       reset.reset_n
		);

