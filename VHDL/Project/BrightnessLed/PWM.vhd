-- PWM

-- Library
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

-- Entity
entity PWM is
    generic (
        BIT_NUMS : integer := 8;
        INPUT_CLK : integer := 50000000;
        FREQ        : integer := 50
    );
    port (
        CLK : in std_logic;
        Duty_Cycle : std_logic_vector(BIT_NUMS - 1 downto 0);
        Enable : in std_logic;
        PWM_OUT : out std_logic
    );
end entity;

-- Architecture
architecture behavior of PWM is
-- Component

-- Consatant
    constant MAX_FREQ : integer :=  INPUT_CLK / FREQ;
    constant MAX_PWM_STEP : integer := MAX_FREQ / (2**BIT_NUMS);
-- Signal
    signal pwm_value : std_logic := '0';
    signal freq_cnt : integer range 0 to MAX_FREQ;
    signal max_pwn_step : integer range 0 to 2**BIT_NUMS;
    signal pwm_cnt : integer range 0 to 2**BIT_NUMS;
    signal pwm_step_cnt : integer range 0 to MAX_FREQ;
begin
    max_pwn_step <= to_integer(unsigned(Duty_Cycle));
    PWM_OUT <= pwm_value;

    main_proc : process(CLK) is
    begin
        if (rising_edge(CLK)) then
            if (Enable = '1') then
                if (freq_cnt < MAX_FREQ - 1) then
                    freq_cnt <= freq_cnt + 1;
                    if (pwm_cnt < max_pwn_step) then
                        pwm_value <= '1';
                        if (pwm_step_cnt < MAX_PWM_STEP - 1) then
                            pwm_step_cnt <= pwm_step_cnt + 1;
                        else
                            pwm_step_cnt <= 0;
                            pwm_cnt <= pwm_cnt + 1;
                        end if;
                    else
                        pwm_value <= '0';
                    end if;
                else
                    freq_cnt <= 0;
                    pwm_cnt <= 0;
                end if;
            else
                pwm_value <= '0';
            end if;
        end if;
    end process;

end architecture;
