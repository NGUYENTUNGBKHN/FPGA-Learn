-- Timer module using a procedure

-- library
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Entity
entity TimerPro is 
    generic(
        TimerFreHz : integer
    );
    port (
        Clk : in std_logic;
        nRst : in std_logic;
        Second : inout integer;
        Minutes : inout integer;
        Hour : inout integer
    );
end entity;

-- Architecture
architecture behavior of TimerPro is
-- component

-- constant

-- signal
    signal TICK : integer := 0;
-- Procedure
    procedure IncrementWrap( signal Counter : inout integer;
                            constant WrapValue : in integer;
                            constant Enable : in boolean;
                            variable Wrapped : out boolean
                        ) is    
    begin
        Wrapped := false;
        if (Enable) then
            if (Counter = WrapValue - 1) then
                Wrapped := true;
                Counter <= 0;
            else
                Counter <= Counter + 1;
            end if;
        end if;
    end procedure;

begin
    process(Clk) is
        variable Wrap : boolean;
    begin
        if (rising_edge(Clk)) then
            -- Second
            if (nRst = '0') then
                TICK <= 0;
                Second <= 0;
                Minutes <= 0;
                Hour <=  0;
            else
                IncrementWrap(TICK, TimerFreHz, true, Wrap);
                IncrementWrap(Second, 60, Wrap, Wrap);
                IncrementWrap(Minutes, 60, Wrap, Wrap);
                IncrementWrap(Hour, 24, Wrap, Wrap);
            end if;
        end if;
    end process;
end architecture;

