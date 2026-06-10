-- Brightness LED

-- Library
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

-- Entity
entity BrightnessLed is
    generic (
        INPUT_CLK : integer := 125000000;
        LED_NUMS : integer := 2
    );
    port(
        CLK : in std_logic;
        Enable : in std_logic;
        LED_PWM : out std_logic_vector(LED_NUMS - 1 downto 0)
    );
end entity;

-- Architecture
architecture behavior of BrightnessLed is
-- Component
component COUNTER is
    generic(
        MAX_VAL : integer := 2**30;
        SYNC_rst : boolean := true
    );
    port (
        CLK : in std_logic;
        Reset : in std_logic;
        Max_Count : out std_logic
    );
end component;

component PWM is
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
end component;
-- Consatant
    constant LED_MAX_COUNTER : integer := INPUT_CLK / 106;
    constant BIT_NUMS : integer := 8;
    constant MAX_LED_DUTY : integer := 255;
    constant SYNCH : boolean := TRUE;
-- Signal
    signal led_pwm_reg : std_logic := '0';
    signal max_cnt_reg : std_logic := '0';
    signal led_enable : std_logic := '0';
    signal pwm_duty : unsigned(BIT_NUMS -1 downto 0) := (others => '0');
begin

    LED_PWM <= (others => led_pwm_reg);

    led_enable <= Enable;

    i_Counter : COUNTER
        generic map(LED_MAX_COUNTER, SYNCH)
        port map(CLK => CLK, Reset => Enable, Max_Count => max_cnt_reg);

    i_PWM : PWM
        generic map(BIT_NUMS, INPUT_CLK, 50)
        port map(CLK => CLK, Duty_Cycle => std_logic_vector(pwm_duty), Enable => led_enable, PWM_OUT => led_pwm_reg);

    main_proc : process(CLK) is
    begin
       if (rising_edge(CLK)) then
            if (max_cnt_reg = '1') then
                if (pwm_duty = MAX_LED_DUTY) then
                    pwm_duty <= (others=>'0');
                else
                    pwm_duty <= pwm_duty + 51;
                end if;
            end if;
        end if;
    end process;

end architecture;

