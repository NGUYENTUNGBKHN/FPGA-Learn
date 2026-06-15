-- PWM

-- Library
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Entity
entity TestBench is
end entity;

-- Architecture
architecture behavior of TestBench is
-- component
component PWM is
    generic (
        INPUT_CLK   : integer := 50000000;
        BIT_NUMS    : integer := 8;
        FREQ        : integer := 50
    );
    port (
        CLK         : in std_logic;
        Duty_Cycle  : in std_logic_vector(BIT_NUMS - 1 downto 0);
        ENABLE      : in std_logic;
        PWM_OUT     : out std_logic
    );
end component; 
-- constant
    constant INPUT_CLK : integer := 40000;
    constant CLOCK_FREQ : time := 25 us;
    constant BIT_NUMS : integer := 8;
    constant FREQ : integer := 4;
-- Signal
    signal CLK : std_logic := '0';

    signal enable : std_logic := '0';
    signal duty_cycle : unsigned(BIT_NUMS - 1 downto 0) := (others => '0');
    signal pwm_out_reg : std_logic := '0';
begin

    CLK <= NOT CLK after CLOCK_FREQ/2;

    pwm_proc : PWM
        generic map(INPUT_CLK, BIT_NUMS, FREQ)
        port map(CLK, std_logic_vector(duty_cycle), enable, pwm_out_reg);

    process is
    begin
        wait until rising_edge(CLK);
        wait until rising_edge(CLK);
        -- Test case 1: 50% duty cycle
        duty_cycle <= to_unsigned(128, 8);
        enable <= '1';
        wait for 10 ms;
        
        wait;
    end process; 

end architecture;
