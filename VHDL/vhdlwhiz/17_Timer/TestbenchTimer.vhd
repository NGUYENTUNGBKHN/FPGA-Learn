-- Create test bench Timer

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity TestbenchTimer is
end entity;

-- architecture
architecture sim of TestbenchTimer is

-- component
component Timer is
    generic(
        ClockFreqHz : integer
    );
    port(
        Clk : in std_logic;
        nRst : in std_logic;
        Seconds : inout integer;
        Minutes : inout integer;
        Hours   : inout integer
    );
end component;
-- Constant 
constant ClockFreq : integer := 10;
constant ClockPeriod : time := 1000 ms /ClockFreq;

-- Signal 
signal Clk : std_logic := '1';
signal nRst : std_logic := '0';
signal Seconds : integer;
signal Minutes : integer;
signal Hours : integer;

begin
    i_Timer : Timer
        generic map(ClockFreqHz => ClockFreq)
        port map(
            Clk => Clk,
            nRst => nRst,
            Seconds => Seconds,
            Minutes => Minutes,
            Hours => Hours
        );

    Clk <= not Clk after ClockPeriod / 2;

    process is
    begin
        wait until rising_edge(Clk);
        wait until rising_edge(Clk);

        nRst <= '1';

        wait;
    end process;

end architecture;

