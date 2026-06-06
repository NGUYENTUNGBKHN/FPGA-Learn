-- Test bench State Machine

-- Library
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Entity
entity testBenchSM is
end entity;

-- Architecture
architecture sim of testBenchSM is
-- component
    component TrafficLights is
        generic(
        ClockFreqHz : integer
        );
        port(
            Clk : in std_logic;
            nRst : in std_logic;
            NS_Red : out std_logic;
            NS_Green : out std_logic;
            NS_Yellow : out std_logic;
            WE_Red : out std_logic;
            WE_Green : out std_logic;
            WE_Yellow : out std_logic
        );
    end component;
-- constant
    constant ClockFreqHz : integer := 100;
    constant ClockPeriod : time := 1000 ms / ClockFreqHz;
-- signal    
    signal Clk  : std_logic := '1';
    signal nRst : std_logic := '0';
    signal NS_Red      : std_logic;
    signal NS_Green        : std_logic;
    signal NS_Yellow       : std_logic;
    signal WE_Red      : std_logic;
    signal WE_Green        : std_logic;
    signal WE_Yellow       : std_logic;
begin
    i_Traffic : TrafficLights
        generic map(ClockFreqHz => ClockFreqHz)
        port map(
            Clk => Clk,
            nRst  => nRst,
            NS_Red  => NS_Red,
            NS_Green    => NS_Green,
            NS_Yellow   => NS_Yellow,
            WE_Red  => WE_Red,
            WE_Green    => WE_Green,
            WE_Yellow   => WE_Yellow
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

