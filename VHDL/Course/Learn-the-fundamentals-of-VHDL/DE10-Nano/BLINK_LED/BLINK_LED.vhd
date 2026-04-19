---------------------------------------------------------------------------------------------
-- Project : BLINK LED                                                                     --
-- Author  : Nguyen Thanh Tung                                                             --
---------------------------------------------------------------------------------------------

-- Define library
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.math_real.all;
use IEEE.numeric_std.all;


-- Entity
entity BLINK_LED is
    generic(
        NUMBER_LED      : integer := 8;               -- 8 led
        CLK_RATE        : integer := 50000000;        -- 50MHz
        BLINK_RATE      : integer := 2
    );
    port(
        LED_OUT         : out std_logic_vector(NUMBER_LED - 1 downto 0);
        RESET           : in std_logic;
        CLK             : in std_logic
    );
end BLINK_LED;


-- Architecture
architecture behavior of BLINK_LED is

-- Assign variable 
constant  MAX       : integer := CLK_RATE/BLINK_RATE;               -- MAX time 
constant  BITS_NUM  : integer := integer(ceil(log2(real(MAX))));   -- get number bits of MAX
-- Assign internal register
signal led_reg      : std_logic_vector(NUMBER_LED - 1 downto 0) := (others=>'0');
signal count_reg    : unsigned(BITS_NUM - 1 downto 0) := (others=>'0');

begin
    LED_OUT <= led_reg;
    -- Counter process function
    count_proc: process(CLK) 
    begin
        if (rising_edge(CLK)) then
            if ((RESET = '0') or (count_reg = MAX)) then
                count_reg <= (others => '0');
            else
                count_reg <= count_reg + 1;
            end if;
        end if;
    end process count_proc;

    -- LED output process function
    ledout_proc: process(CLK)
    begin
        if (rising_edge(CLK)) then
            if ((count_reg = MAX)) then
                led_reg <= not led_reg;
            end if;
        end if;
    end process ledout_proc;
end behavior;


