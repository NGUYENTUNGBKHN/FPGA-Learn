-- Test brench for PWM

-- Library 
library ieee;
use ieee.STD_LOGIC_1164.all;
use ieee.numeric_std.all;

-- entity 
entity test_PWM is
end test_PWM;

-- architecture
architecture behavioral of test_PWM is

-- Declaration component PWM
component PWM
    generic(
        BITS_NUM    : integer := 8;
        INPUT_CLK   : integer := 50000000;
        FREQ        : integer := 50
    );
    port(
        CLK         : in std_logic;
        Duty_Cycle  : in std_logic_vector(BITS_NUM - 1 downto 0);
        ENABLE      : in std_logic;
        PWM_OUT     : out std_logic
    );
end component;

-- Define signal
signal CLK      : std_logic := '0';
signal ENABLE   : std_logic := '0';
signal Duty_Cycle : std_logic_vector := "0000";
signal PWM_OUT : std_logic;  

begin

    

end behavioral;

