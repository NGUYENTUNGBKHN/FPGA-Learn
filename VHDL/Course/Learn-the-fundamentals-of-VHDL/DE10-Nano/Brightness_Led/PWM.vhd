-- PWM

-- Library
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.math_real.all;

-- Entity
entity PWM is
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
end PWM;

-- Architecture
architecture behavior of PWM is
-- Constant 
constant MAX_FREQ_CNT  : integer := INPUT_CLK/FREQ;
constant PWM_STEP       : integer := MAX_FREQ_CNT/(2**BIT_NUMS - 1);

-- Signal
signal pwm_val          : std_logic := '0';
signal max_duty_cycle     : integer range 0 to MAX_FREQ_CNT;
signal duty_cycle_reg     : integer range 0 to MAX_FREQ_CNT;

begin

-- Assignment
    max_duty_cycle <= to_integer(unsigned(Duty_Cycle)) * PWM_STEP;
    LED_PWM_OUT <= pwm_val;
-- Process
    pwm_proc : process(CLK)
    begin
        if (rising_edge(CLK)) then
            if ((duty_cycle_reg > MAX_FREQ_CNT) or (ENABLE = '0')) then
                duty_cycle_reg <= 0;
                pwm_val <= '0';
            else
                duty_cycle_reg <= duty_cycle_reg + 1;
                if (duty_cycle_reg < max_duty_cycle) then
                    pwm_val <= '1';
                else
                    pwm_val <= '0';
                end if;
            end if;
        end if;
    end process;

end behavior;
---

