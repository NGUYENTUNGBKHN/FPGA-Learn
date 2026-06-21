	component UART_DEMO is
		port (
			clk_clk             : in  std_logic := 'X'; -- clk
			reset_reset_n       : in  std_logic := 'X'; -- reset_n
			pll_0_locked_export : out std_logic         -- export
		);
	end component UART_DEMO;

	u0 : component UART_DEMO
		port map (
			clk_clk             => CONNECTED_TO_clk_clk,             --          clk.clk
			reset_reset_n       => CONNECTED_TO_reset_reset_n,       --        reset.reset_n
			pll_0_locked_export => CONNECTED_TO_pll_0_locked_export  -- pll_0_locked.export
		);

