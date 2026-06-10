-- PWM

-- Library
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Entity
entity PWM is
    generic (
        INPUT_CLK : integer := 50000000;
        BIT_NUMS : integer := 8;
        FREQ : integer := 50
    );
    port (
        CLK : in std_logic;
        Duty_Cycle : in std_logic_vector(BIT_NUMS - 1 downto 0);
        Enable : in std_logic;
        PWM_OUT : out std_logic
    );
end entity;

-- Architecture
architecture behavior of PWM is
-- constant
    constant MAX_FREQ       : integer := INPUT_CLK/FREQ;
    constant MAX_PWM_STEP   : integer := MAX_FREQ/(2**BIT_NUMS - 1);
-- Signal
    signal pwm_value : std_logic := '0';
    signal freq_cnt : integer range 0 to MAX_FREQ := 0;
    signal duty_cnt : integer range 0 to 2**BIT_NUMS := 0;
    signal max_duty_cnt : integer range 0 to 2**BIT_NUMS := 0;
    signal pwm_step_cnt : integer range 0 to MAX_FREQ := 0;
begin

    max_duty_cnt <= to_integer(unsigned(Duty_Cycle));
    PWM_OUT <= pwm_value;

    pwm_proc : process(CLK)
    begin
        if (rising_edge(CLK)) then
            if (Enable = '0') then
                if (freq_cnt < MAX_FREQ) then
                    freq_cnt <= freq_cnt + 1;
                    if (duty_cnt < max_duty_cnt) then
                        pwm_value <= '1';
                        if (pwm_step_cnt < MAX_PWM_STEP) then
                            pwm_step_cnt <= pwm_step_cnt + 1;
                        else
                            pwm_step_cnt <= 0;
                            duty_cnt <= duty_cnt + 1;
                        end if;
                    else
                        pwm_value <= '0';
                    end if;
                else
                    duty_cnt <= 0;
                    freq_cnt <= 0;
                end if;
            else
                pwm_value <= '0';
            end if;
        end if;
    end process;
    
end architecture;

