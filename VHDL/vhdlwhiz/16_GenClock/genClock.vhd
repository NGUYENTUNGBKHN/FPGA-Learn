-- Generate Clock

-- Library
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Entity
entity genClock is 
end entity;

-- Architecture
architecture sim of genClock is
-- component
component FlipFlop is
    port(
        Clk     : in std_logic;
        nRst    : in std_logic;
        Input   : in std_logic;
        Output  : out std_logic
    );
end component;

-- Constant
constant ClockFreq : integer := 100e6;
constant ClockPeriod : time := 1000 ms / ClockFreq;
-- Signal 
signal Clk : std_logic := '1';
signal nRst : std_logic := '0';
signal Input : std_logic := '0';
signal Output : std_logic;

begin
    -- The Device Under Test (DUT)
    i_FlipFlop : FlipFlop
        port map(
            Clk => Clk,
            nRst => nRst,
            Input => Input,
            Output => Output
        );

    Clk <= not Clk after ClockPeriod / 2;

    process is
    begin
        nRst <= '1';

        wait for 20 ns;
        Input <= '1';
        wait for 22 ns;
        Input <= '0';
        wait for 6 ns;
        Input <= '1';
        wait for 20 ns;

        nRst <= '0';

        wait;
    end process;

end architecture;



