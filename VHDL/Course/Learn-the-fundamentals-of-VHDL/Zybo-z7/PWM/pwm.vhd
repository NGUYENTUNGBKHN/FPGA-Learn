-- Project : PWM
-- Author  : NGUYEN THANH TUNG


-- Libraries
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


-- Entity
entity PWM is
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
end PWM;


-- Architecture
architecture behavioral of PWM is
-- constants 
constant max_freq_count : integer := INPUT_CLK / FREQ;
constant pwm_step       : integer := max_freq_count / (2**BITS_NUM);

-- Signals
signal pwm_value        : std_logic := '0';
signal freq_count       : integer range  0 to max_freq_count := 0;
signal pwm_count        : integer range  0 to 2**BITS_NUM := 0;
signal max_pwm_count    : integer range  0 to 2**BITS_NUM := 0;
signal pwm_step_count   : integer range  0 to max_freq_count := 0;


begin
    -- Convert duty_Cycle to max_pwm_count
    max_pwm_count <= to_integer(unsigned(Duty_Cycle));
    PWM_OUT <= pwm_value;

    -- Process
    freq_counter: process(CLK)
    begin
        if (rising_edge(CLK)) then
            if (ENABLE = '0') then
                if (freq_count < max_freq_count) then
                    freq_count <= freq_count + 1;
                    if (pwm_count < max_pwm_count) then
                        pwm_value <= '1';
                        if (pwm_step_count < pwm_step) then
                            pwm_step_count <= pwm_step_count + 1;
                        else
                            pwm_step_count <= 0;
                            pwm_count <= pwm_count + 1;
                        end if;
                    else
                        pwm_value <= '0';
                    end if;
                else
                    freq_count <= 0;
                    pwm_count <= 0;
                end if;
            else
                pwm_value <= '0';
            end if;
        end if;
    end process freq_counter;

end behavioral;

