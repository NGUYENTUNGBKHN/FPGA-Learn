-- PWM

-- Library
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

-- Entity
entity PWM is
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
end entity;

-- Architecture
architecture behavior of PWM is
-- Constant
    constant MAX_FREQ : integer := INPUT_CLK/FREQ;
    constant MAX_PWM_STEP : integer := MAX_FREQ/(2**BIT_NUMS);
-- Signal
    signal pwm_value        : std_logic := '0';
    signal step_freq_cnt    : integer range 0 to MAX_FREQ := 0;
    signal max_duty_freq    : integer range 0 to MAX_FREQ := 0;
begin
    PWM_OUT <= pwm_value;

    max_duty_freq <= to_integer(unsigned(Duty_Cycle))*MAX_PWM_STEP;

    pwm_proc : process(CLK) 
    begin
        if (rising_edge(CLK)) then
            if (ENABLE = '1') then
                if (step_freq_cnt < MAX_FREQ) then
                    step_freq_cnt <= step_freq_cnt + 1;
                    if (step_freq_cnt < max_duty_freq) then
                        pwm_value <= '1';
                    else
                        pwm_value <= '0';
                    end if;
                else
                    step_freq_cnt <= 0;
                end if;
            else
                step_freq_cnt <= 0;
                pwm_value <= '0';
            end if;
        end if;
    end process;
end architecture;
