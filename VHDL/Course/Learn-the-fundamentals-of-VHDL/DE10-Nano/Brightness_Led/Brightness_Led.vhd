-- Project : Brightness LED
-- Author  : Nguyen Thanh Tung



-- Libraries
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Entity
entity Brightness_led is
    generic(
        BITS_NUM            : integer := 8;
        INPUT_CLK           : integer := 50000000; -- 50MHz
        FREQ                : integer := 50
    );
    port(
        CLK             : in std_logic;
        Duty_Cycle      : in std_logic_vector(BITS_NUM - 1 downto 0);
        ENABLE          : in std_logic;
        PWM_OUT         : out std_logic
    );
end Brightness_Led;

-- Architecture
architecture behavior of Brightness_led is
begin
end behavior;




