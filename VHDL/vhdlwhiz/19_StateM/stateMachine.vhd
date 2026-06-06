-- State Machine

-- Library
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Entity
entity TrafficLights is
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
end entity;


-- Architecture
architecture behavior of TrafficLights is
-- Function

-- Constant

-- Signal
    type t_State is  (
        NorthNext,
        StartNorth,
        North,
        StopNorth,
        WestNext,
        StartWest,
        West,
        StopWest
    );
    signal State : t_State;
    signal Counter : integer range 0 to ClockFreqHz * 60;
begin
    process (Clk) is
    begin
        if (rising_edge(Clk)) then
            if (nRst = '0') then
                State <= NorthNext;
                Counter <= 0;
                NS_Red      <= '1';
                NS_Green    <= '0';
                NS_Yellow   <= '0';
                WE_Red      <= '1';
                WE_Green    <= '0';
                WE_Yellow   <= '0';
            else
                NS_Red      <= '0';
                NS_Green    <= '0';
                NS_Yellow   <= '0';
                WE_Red      <= '0';
                WE_Green    <= '0';
                WE_Yellow   <= '0';

                Counter <= Counter + 1;

                case (State) is
                    when NorthNext =>
                        NS_Red <= '1';
                        WE_Red <= '1';
                        if (Counter = ClockFreqHz * 5 - 1) then
                            Counter <= 0;
                            State <= StartNorth;
                        end if;
                    when StartNorth =>
                        NS_Red <= '1';
                        NS_Yellow <= '1';
                        WE_Red <= '1';
                        if (Counter = ClockFreqHz * 5 - 1) then
                            Counter <= 0;
                            State <= North;
                        end if;
                    when North =>
                        NS_Green <= '1';
                        WE_Red <= '1';
                        if (Counter = ClockFreqHz * 60 - 1) then
                            Counter <= 0;
                            State <= StopNorth;
                        end if;
                    when StopNorth =>
                        NS_Yellow <= '1';
                        WE_Red <= '1';
                        if (Counter = ClockFreqHz * 5 - 1) then
                            Counter <= 0;
                            State <= WestNext;
                        end if;
                    when WestNext =>
                        NS_Red <= '1';
                        WE_Red <= '1';
                        if (Counter = ClockFreqHz * 5 - 1) then
                            Counter <= 0;
                            State <= StartWest;
                        end if;
                    when StartWest =>
                        NS_Red <= '1';
                        WE_Red <= '1';
                        WE_Yellow <= '1';
                        if (Counter = ClockFreqHz * 5 - 1) then
                            Counter <= 0;
                            State <= West;
                        end if;
                    when West =>
                        NS_Red <= '1';
                        WE_Green <= '1';
                        if (Counter = ClockFreqHz * 60 - 1) then
                            Counter <= 0;
                            State <= StopWest;
                        end if;
                    when StopWest =>
                        NS_Red <= '1';
                        WE_Yellow <= '1';
                        if (Counter = ClockFreqHz * 5 - 1) then
                            Counter <= 0;
                            State <= NorthNext;
                        end if;
                end case;
            end if;
        end if;
    end process;
end architecture;

