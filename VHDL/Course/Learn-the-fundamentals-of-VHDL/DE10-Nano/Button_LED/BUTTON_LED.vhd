-- BUTTON_LED
-- Author : GENTANTUN

-- Libraries
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Entity
entity BUTTON_LED is
	generic(
		N : integer := 2		-- Number of button and led
	);
	port(
		BUTTON_IN : in std_logic_vector(N - 1 downto 0);
		LED_OUT : out std_logic_vector(N - 1 downto 0);
		ENABLE : in std_logic
	);
end BUTTON_LED;

-- Architecture
architecture behavior of BUTTON_LED is
begin
	LED_OUT <= BUTTON_IN when ENABLE = '0' else (others => '0');

end behavior;


