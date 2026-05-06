-- Project : Brightness LED
-- Author  : Nguyen Thanh Tung



-- Libraries
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Entity
entity Brightness_led is
    generic(
        LED_NUMS    : integer := 8;
        INPUT_CLK   : integer := 50000000
    );
    port(
        LED_OUT     : out std_logic_vector(LED_NUMS - 1 downto 0);
        CLK         : in std_logic;
        ENABLE      : in std_logic
    );
end Brightness_Led;

-- Architecture
architecture behavior of Brightness_led is

-- Component
component PWM is
    generic(
        BIT_NUMS    : integer := 8;
        INPUT_CLK   : integer := 50000000;
        FREQ        : integer := 50
    );
    port(
        LED_PWM_OUT : out std_logic;
        Duty_Cycle  : in std_logic_vector(BIT_NUMS - 1 downto 0);
        CLK         : in std_logic;
        ENABLE      : in std_logic
    );
end component PWM;

component COUNTER is
    generic(
        MAX_VAL     : integer := 2**30;
        SYNCH_FLAG  : boolean := true
    );
    port(
        Max_Count_Flag  : out std_logic;
        CLK             : in std_logic;
        Reset           : in std_logic 
    );
end component COUNTER;

-- Constatnt
constant LED_MAX_COUNTER : integer := INPUT_CLK/85;
constant MAX_DUTY           : integer := 256;
constant SYNCH : boolean := TRUE;
-- Signal
signal led_pwm_reg : std_logic := '0';

signal counter_flag_max : std_logic := '0';
signal led_duty_cycle : unsigned(7 downto 0) := (others => '0');

begin
    -- Assignment
    LED_OUT <= (others => led_pwm_reg);
    -- Mapping

    LED_COUNTER: COUNTER
        generic map(LED_MAX_COUNTER, SYNCH)
        port map(counter_flag_max, CLK, ENABLE);

    LED_PWM : PWM
        generic map(8, INPUT_CLK, 50)
        port map(led_pwm_reg, std_logic_vector(led_duty_cycle), CLK, ENABLE);
    -- process
    LED_CNT_PROC : process(CLK)
    begin
        if (rising_edge(CLK)) then
            if (led_duty_cycle = MAX_DUTY) then
                led_duty_cycle <= (others => '0');
            elsif (counter_flag_max = '1') then
                led_duty_cycle <= led_duty_cycle + 1;
            end if;
        end if ;
    end process;

end behavior;




